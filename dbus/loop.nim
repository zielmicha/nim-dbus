import dbus, dbus/lowlevel, tables, posix, os

type
  MainLoop* = object
    conn: ptr DbusConnection
    watches: seq[ptr DbusWatch]

  PackedWatch = ref object of RootObj
    dbusWatch: ptr DbusWatch

proc addWatch(watch: ptr DBusWatch, loopPtr: pointer): dbus_bool_t {.cdecl.} =
  let loop = cast[ptr MainLoop](loopPtr)
  echo "addWatch ", dbus_watch_get_fd(watch)
  loop.watches.add watch
  return 1

proc removeWatch(watch: ptr DBusWatch, loopPtr: pointer) {.cdecl.} =
  let loop = cast[ptr MainLoop](loopPtr)
  echo "removeWatch"
  loop.watches.del loop.watches.find(watch)

proc toggleWatch(watch: ptr DBusWatch, loopPtr: pointer) {.cdecl.} =
  discard

proc freeLoop(loopPtr: pointer) {.cdecl.} =
  discard

proc create*(cls: typedesc[MainLoop], bus: Bus): ptr MainLoop =
  result = create(MainLoop)
  result.conn = bus.conn
  result.watches = @[]
  let ok = dbus_connection_set_watch_functions(result.conn,
                                               add_function=DBusAddWatchFunction(addWatch),
                                               remove_function=DBusRemoveWatchFunction(removeWatch),
                                               toggled_function=DBusWatchToggledFunction(toggleWatch),
                                               data=result.pointer,
                                               free_data_function=freeLoop)
  assert ok != 0
  dbus_bus_add_match(result.conn, "type='signal'", nil)
  dbus_bus_add_match(result.conn, "type='method_call'", nil)

const maxWatches = 128

proc tick*(self: ptr MainLoop) =
  if self.watches.len >= maxWatches:
    raise newException(ValueError, "too many watches")

  var fds: array[maxWatches, TPollfd]
  var activeWatches: seq[ptr DbusWatch] = @[]
  var nfds: int = 0

  for i, watch in self.watches:
    if dbus_watch_get_enabled(watch) == 0:
      continue

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
