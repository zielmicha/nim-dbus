{.passl: "-ldbus-1".}
import dbus/lowlevel
import unsigned

export lowlevel.DBUS_BUS_SESSION

converter toBool(x: dbus_bool_t): bool = x != 0

type DbusException* = object of Exception

type DbusRemoteException* = object of DbusException

type Connection* = object
  conn*: ptr DBusConnection

proc getBus*(busType: DBusBusType): Connection =
  var err: DBusError
  dbus_error_init(addr err)
  result.conn = dbus_bus_get(busType, addr err);
  if dbus_error_is_set(addr err):
      defer: dbus_error_free(addr err)
      raise newException(DbusException, $err.message)

  assert result.conn != nil

proc flush*(conn: Connection) =
  dbus_connection_flush(conn.conn)
