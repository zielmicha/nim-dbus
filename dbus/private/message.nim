
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

type PendingCall* = object
  call*: ptr DBusPendingCall

proc sendMessageWithReply*(conn: Connection, msg: var Message): PendingCall =
  let ret = dbus_connection_send_with_reply(conn.conn, msg.msg, addr result.call, -1)
  dbus_message_unref(msg.msg)
  msg.msg = nil
  if not bool(ret):
    raise newException(DbusException, "dbus_connection_send_with_reply")
  if result.call == nil:
    raise newException(DbusException, "pending call still nil")
