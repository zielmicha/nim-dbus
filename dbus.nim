{.passl: "-ldbus-1".}
import dbus/lowlevel
import unsigned

export dbus.lowlevel.DBUS_BUS_SESSION

converter toBool(x: dbus_bool_t): bool = x != 0

type DbusException = object of Exception

type Connection* = object
  conn: ptr DBusConnection

proc getBus*(busType: DBusBusType): Connection =
  var err: DBusError
  dbus_error_init(addr err)
  result.conn = dbus_bus_get(busType, addr err);
  if dbus_error_is_set(addr err):
      defer: dbus_error_free(addr err)
      raise newException(DbusException, $err.message)

  assert result.conn != nil

type Message* = object
  msg: ptr DBusMessage

proc makeSignal*(path: string, iface: string, name: string): Message =
  result.msg = dbus_message_new_signal(path, iface, name)

proc makeCall*(dest: string, path: string, iface: string, name: string): Message =
  result.msg = dbus_message_new_method_call(dest, path, iface, name)

proc append(msg: Message, typecode: char, data: pointer) =
  var args: DBusMessageIter
  dbus_message_iter_init_append(msg.msg, addr args);
  if dbus_message_iter_append_basic(addr args, cint(typecode), data) == 0:
      raise newException(DbusException, "append_basic")

proc append*(msg: Message, x: cstring) =
  var y: cstring = x
  msg.append('s', addr y)

proc append*(msg: Message, x: uint32) =
  var y: uint32 = x
  msg.append('u', addr y)

proc sendMessage*(conn: Connection, msg: var Message): dbus_uint32_t {.discardable.} =
  var serial: dbus_uint32_t
  let ret = dbus_connection_send(conn.conn, msg.msg, addr serial)
  dbus_message_unref(msg.msg)
  msg.msg = nil
  if not bool(ret):
      raise newException(DbusException, "dbus_connection_send")
  return serial

proc flush*(conn: Connection) =
  dbus_connection_flush(conn.conn)
