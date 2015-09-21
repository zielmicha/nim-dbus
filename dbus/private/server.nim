# RAW

proc requestName*(bus: Bus, name: string) =
  var err: DBusError
  dbus_error_init(addr err)

  let ret = dbus_bus_request_name(bus.conn, name, 0, addr err)

  if ret < 0:
    defer: dbus_error_free(addr err)
    raise newException(DbusException, $err.message)

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

  if ok == 0:
    defer: dbus_error_free(addr err)
    raise newException(DbusException, $err.message)

# TYPES

type
  IncomingMessageType* = enum
    mtCall
    mtSignal

  MessageCallback* = proc(kind: IncomingMessageType, incomingMessage: IncomingMessage): bool

  IncomingMessage* = object
    msg: ptr DBusMessage

  PackedMessageCallback = ref object
    callback: MessageCallback

proc name*(incoming: IncomingMessage): string =
  $dbus_message_get_member(incoming.msg)

proc interfaceName*(incoming: IncomingMessage): string =
  $dbus_message_get_interface(incoming.msg)

proc iterate*(incoming: IncomingMessage): InputIter =
  if dbus_message_iter_init(incoming.msg, addr result.iter) == 0:
    raise newException(DbusException, "dbus_message_iter_init")

proc unpackValueSeq*(incoming: IncomingMessage): seq[DbusValue] =
  var iter: InputIter
  if dbus_message_iter_init(incoming.msg, addr iter.iter) == 0:
    return @[]

  result = @[]
  while true:
    result.add iter.unpackCurrent(DbusValue)
    if dbus_message_iter_next(addr iter.iter) == 0:
      break

proc sendReplyTail(bus: Bus, replyMsg: ptr DbusMessage) =
  let ret = dbus_connection_send(bus.conn, replyMsg, nil)
  if not bool(ret):
    raise newException(DbusException, "dbus_connection_send")

  dbus_message_unref(replyMsg)
  bus.flush()

proc sendErrorReply*(bus: Bus, incoming: IncomingMessage, message: string) =
  let replyMsg = dbus_message_new_error(incoming.msg, "org.freedesktop.DBus.Error.Failed", message)
  assert replyMsg != nil
  sendReplyTail(bus, replyMsg)

proc sendReply*(bus: Bus, incoming: IncomingMessage, args: seq[DbusValue]) =
  let replyMsg = dbus_message_new_method_return(incoming.msg)
  assert replyMsg != nil
  var iter: DbusMessageIter
  dbus_message_iter_init_append(replyMsg, addr iter)

  for arg in args:
    (addr iter).append(arg)

  sendReplyTail(bus, replyMsg)

# VTABLE

const
  DBUS_MESSAGE_TYPE_METHOD_CALL = 1
  DBUS_MESSAGE_TYPE_SIGNAL = 4

proc messageFunc(connection: ptr DBusConnection, message: ptr DBusMessage, user_data: pointer): DBusHandlerResult {.cdecl.} =
  let rawType = dbus_message_get_type(message)
  var kind: IncomingMessageType
  if rawType == DBUS_MESSAGE_TYPE_METHOD_CALL:
    kind = mtCall
  elif rawType == DBUS_MESSAGE_TYPE_SIGNAL:
    kind = mtSignal
  else:
    echo "unknown message ", rawType
    return

  let callback = cast[PackedMessageCallback](userData).callback
  let ok = callback(kind, IncomingMessage(msg: message))
  if ok:
    return DBUS_HANDLER_RESULT_HANDLED
  else:
    return DBUS_HANDLER_RESULT_NOT_YET_HANDLED

proc unregisterFunc(connection: ptr DBusConnection, userData: pointer) {.cdecl.} =
  GC_unref cast[PackedMessageCallback](userData)

proc registerObject*(bus: Bus, path: ObjectPath, callback: MessageCallback) =
  var packed: PackedMessageCallback
  new(packed)
  packed.callback = callback
  GC_ref packed

  registerObject(bus, path, messageFunc.DBusObjectPathMessageFunction, unregisterFunc, cast[pointer](packed))
