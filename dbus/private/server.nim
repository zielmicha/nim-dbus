
type DbusVTable = ref object

proc registerObject(bus: Bus, path: ObjectPath,
                    messageFunc: DBusObjectPathMessageFunction,
                    unregisterFunc: DBusObjectPathUnregisterFunction,
                    userData: pointer) =
  var err: DBusError
  dbus_error_init(addr err)

  var vtable: DBusObjectPathVTable
  reset(vtable)
  vtable.message_function = messageFunc
  vtable.unregister_function = unregisterFunc

  let ok = dbus_connection_try_register_object_path(bus.conn, path.string, addr vtable, userData, addr err)

  if ok != 0:
    defer: dbus_error_free(addr err)
    raise newException(DbusException, $err.message)
