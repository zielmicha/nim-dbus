import dbus, dbus/lowlevel, selectors, tables, posix

type
  MainLoop* = object
    conn: ptr DbusConnection
    selector: Selector

  PackedWatch = ref object of RootObj
    dbusWatch: ptr DbusWatch

proc addWatch(watch: ptr DBusWatch, loopPtr: pointer): dbus_bool_t {.cdecl.} =
  let loop = cast[ptr MainLoop](loopPtr)
  let fd = dbus_watch_get_fd(watch).SocketHandle
  let flags = dbus_watch_get_flags(watch)
  var events: set[Event] = {EvError}

  if (flags or DBUS_WATCH_READABLE.cuint) != 0:
    events.incl EvRead

  if (flags or DBUS_WATCH_WRITABLE.cuint) != 0:
    events.incl EvWrite

  var packedWatch: PackedWatch
  new(packedWatch)
  packedWatch.dbusWatch = watch

  loop.selector.register(fd, events, packedWatch)

proc removeWatch(watch: ptr DBusWatch, loopPtr: pointer) {.cdecl.} =
  let loop = cast[ptr MainLoop](loopPtr)
  loop.selector.unregister(dbus_watch_get_fd(watch).SocketHandle)

proc toggleWatch(watch: ptr DBusWatch, loopPtr: pointer) {.cdecl.} =
  discard

proc create*(cls: typedesc[MainLoop], bus: Bus): ptr MainLoop =
  result = create(MainLoop)
  result.selector = newSelector()
  result.conn = bus.conn
  let ok = dbus_connection_set_watch_functions(result.conn,
                                               add_function=DBusAddWatchFunction(addWatch),
                                               remove_function=DBusRemoveWatchFunction(removeWatch),
                                               toggled_function=DBusWatchToggledFunction(toggleWatch),
                                               data=result.pointer,
                                               free_data_function=nil)
  assert ok == 0
  dbus_bus_add_match(result.conn, "type='signal'", nil)
  dbus_bus_add_match(result.conn, "type='method_call'", nil)

proc tick*(self: ptr MainLoop) =
  let readyInfos = self.selector.select(-1)
  for info in readyInfos:
    let watch = info.key.data.PackedWatch.dbusWatch
    var flags: cuint = 0

    if EvRead in info.events:
      flags = flags or DBUS_WATCH_READABLE.cuint
    if EvWrite in info.events:
      flags = flags or DBUS_WATCH_WRITABLE.cuint
    if EvError in info.events:
      flags = flags or DBUS_WATCH_ERROR.cuint

    if dbus_watch_handle(watch, flags) == 0:
      raise newException(DbusException, "dbus_watch_handle")

    discard dbus_connection_ref(self.conn)

    while dbus_connection_dispatch(self.conn) == DBUS_DISPATCH_DATA_REMAINS:
      discard

    dbus_connection_unref(self.conn)
