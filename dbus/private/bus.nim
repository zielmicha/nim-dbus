export dbus.lowlevel.DBUS_BUS_SESSION
export dbus.lowlevel.DBUS_BUS_SYSTEM

converter toBool(x: dbus_bool_t): bool = x != 0

type DbusException* = object of Exception

type DbusRemoteException* = object of DbusException

type Bus* = ref object
  conn*: ptr DBusConnection

type UniqueBus* = object
  bus*: Bus
  uniqueName*: string

# we don't destroy the connection as dbus_bus_get returns shared pointer
proc destroyConnection(bus: Bus) =
  dbus_connection_close(bus.conn)

proc getBus*(busType: DBusBusType): Bus =
  let ok = dbus_threads_init_default() # enable threads
  assert ok
  new(result)
  var err: DBusError
  dbus_error_init(addr err)
  result.conn = dbus_bus_get(busType, addr err);
  if dbus_error_is_set(addr err):
      defer: dbus_error_free(addr err)
      raise newException(DbusException, $err.message)

  assert result.conn != nil

proc getUniqueBus*(bus: Bus, uniqueName: string): UniqueBus =
  result.bus = bus
  result.uniqueName = uniqueName

proc getUniqueBus*(busType: DBusBusType, uniqueName: string): UniqueBus =
  getUniqueBus(getBus(busType), uniqueName)

proc flush*(conn: Bus) =
  dbus_connection_flush(conn.conn)
