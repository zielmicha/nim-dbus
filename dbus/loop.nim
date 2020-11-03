import dbus, dbus/lowlevel, posix, os

const maxWatches = 128

type
  MainLoop* = object
    conn: ptr DbusConnection
    watchesCount: int
    watches: array[maxWatches, ptr DbusWatch]

proc addWatch(newWatch: ptr DBusWatch, loopPtr: pointer): dbus_bool_t {.cdecl.} =
  let loop = cast[ptr MainLoop](loopPtr)
  #echo "addWatch ", dbus_watch_get_fd(watch)
  if loop.watchesCount == maxWatches:
    raise newException(ValueError, "too many watches")
  for watch in loop.watches.mitems:
    if watch == nil:
      watch = newWatch
      break
  inc loop.watchesCount
  return 1

proc removeWatch(oldWatch: ptr DBusWatch, loopPtr: pointer) {.cdecl.} =
  let loop = cast[ptr MainLoop](loopPtr)
  #echo "removeWatch"
  for watch in loop.watches.mitems:
    if watch == oldWatch:
      watch = nil
      break
  dec loop.watchesCount

proc toggleWatch(watch: ptr DBusWatch, loopPtr: pointer) {.cdecl.} =
  discard

proc freeLoop(loopPtr: pointer) {.cdecl.} =
  discard

proc create*(cls: typedesc[MainLoop], bus: Bus): ptr MainLoop =
  ## This creates a new main loop, the returned pointer must be manually free'd
  result = create(MainLoop)
  result.conn = bus.conn
  let ok = dbus_connection_set_watch_functions(result.conn,
                                               add_function=DBusAddWatchFunction(addWatch),
                                               remove_function=DBusRemoveWatchFunction(removeWatch),
                                               toggled_function=DBusWatchToggledFunction(toggleWatch),
                                               data=result.pointer,
                                               free_data_function=freeLoop)
  assert ok != 0
  dbus_bus_add_match(result.conn, "type='signal'", nil)
  dbus_bus_add_match(result.conn, "type='method_call'", nil)

proc tick*(self: ptr MainLoop) =
  var
    fds: array[maxWatches, TPollfd]
    activeWatches: seq[ptr DbusWatch] = @[]
    nfds: int = 0
    checkedWatches = 0

  for i, watch in self.watches:
    if checkedWatches == self.watchesCount: break
    if watch.isNil: continue
    inc checkedWatches
    if dbus_watch_get_enabled(watch) == 0: continue

    var cond: int16 = POLLHUP or POLLERR
    let fd = dbus_watch_get_fd(watch)
    let flags = dbus_watch_get_flags(watch)

    if (flags and DBUS_WATCH_READABLE.cuint) != 0:
      cond = cond or POLLIN;
    if (flags and DBUS_WATCH_WRITABLE.cuint) != 0:
      cond = cond or POLLOUT;

    fds[nfds].fd = fd
    fds[nfds].events = cond
    fds[nfds].revents = 0
    activeWatches.add watch
    nfds += 1

  if poll(cast[ptr TPollfd](addr fds), Tnfds(nfds), -1) <= 0:
    raiseOSError(osLastError())

  for i in 0..<nfds:
    let events = fds[i].revents
    let watch = activeWatches[i]

    var flags: cuint = 0;

    if (events and POLLIN) != 0:
      flags = flags or DBUS_WATCH_READABLE.cuint
    if (events and POLLOUT) != 0:
      flags = flags or DBUS_WATCH_WRITABLE.cuint
    if (events and POLLHUP) != 0:
      flags = flags or DBUS_WATCH_HANGUP.cuint
    if (events and POLLERR) != 0:
      flags = flags or DBUS_WATCH_ERROR.cuint

    let ok = dbus_watch_handle(watch, flags)
    assert ok != 0

    discard dbus_connection_ref(self.conn)
    while dbus_connection_dispatch(self.conn) == DBUS_DISPATCH_DATA_REMAINS:
      discard
    dbus_connection_unref(self.conn)

proc runForever*(self: ptr MainLoop) =
  while true:
    self.tick()
