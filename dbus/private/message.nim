
type Message* = object
  msg: ptr DBusMessage

proc makeSignal*(path: string, iface: string, name: string): Message =
  result.msg = dbus_message_new_signal(path, iface, name)

proc makeCall*(uniqueName: string, path: ObjectPath, iface: string, name: string): Message =
  result.msg = dbus_message_new_method_call(uniqueName, path.string, iface, name)

proc sendMessage*(conn: Bus, msg: var Message): dbus_uint32_t {.discardable.} =
  var serial: dbus_uint32_t
  let ret = dbus_connection_send(conn.conn, msg.msg, addr serial)
  dbus_message_unref(msg.msg)
  msg.msg = nil
  if not bool(ret):
      raise newException(DbusException, "dbus_connection_send")
  return serial

type PendingCall* = object
  call: ptr DBusPendingCall
  bus: Bus

proc sendMessageWithReply*(bus: Bus, msg: Message): PendingCall =
  result.bus = bus
  let ret = dbus_connection_send_with_reply(bus.conn, msg.msg, addr result.call, -1)
  dbus_message_unref(msg.msg)
  if not bool(ret):
    raise newException(DbusException, "dbus_connection_send_with_reply")
  if result.call == nil:
    raise newException(DbusException, "pending call still nil")

# Serialization

proc append*(iter: ptr DbusMessageIter, x: DbusValue)
proc append*[T](iter: ptr DbusMessageIter, x: T)

proc initIter*(msg: Message): DbusMessageIter =
  dbus_message_iter_init_append(msg.msg, addr result)

proc appendPtr(iter: ptr DbusMessageIter, typecode: DbusType, data: pointer) =
  if dbus_message_iter_append_basic(iter, typecode.kind.char.cint, data) == 0:
      raise newException(DbusException, "append_basic")

proc appendArray(iter: ptr DbusMessageIter, sig: string, arr: openarray[DbusValue]) =
  var subIter: DBusMessageIter
  var subIterPtr = addr subIter
  if dbus_message_iter_open_container(iter, cint(dtArray), cstring(sig), subIterPtr) == 0:
    raise newException(DbusException, "open_container")
  for item in arr:
    subIterPtr.append(item)
  if dbus_message_iter_close_container(iter, subIterPtr) == 0:
    raise newException(DbusException, "close_container")

proc appendDictEntry(iter: ptr DbusMessageIter, key, val: DbusValue) =
  var subIter: DbusMessageIter
  var subIterPtr = addr subIter
  if dbus_message_iter_open_container(iter, cint(dtDictEntry), nil, subIterPtr) == 0:
    raise newException(DbusException, "open_container")
  subIterPtr.append(key)
  subIterPtr.append(val)
  if dbus_message_iter_close_container(iter, subIterPtr) == 0:
    raise newException(DbusException, "close_container")

proc appendVariant(iter: ptr DbusMessageIter, sig: string, val: DbusValue) =
  var subIter: DbusMessageIter
  var subIterPtr = addr subIter
  if dbus_message_iter_open_container(iter, cint(dtVariant), sig, subIterPtr) == 0:
    raise newException(DbusException, "open_container")
  subIterPtr.append(val)
  if dbus_message_iter_close_container(iter, subIterPtr) == 0:
    raise newException(DbusException, "close_container")

proc appendStruct(iter: ptr DbusMessageIter, arr: openarray[DbusValue]) =
  var subIter: DbusMessageIter
  var subIterPtr = addr subIter
  if dbus_message_iter_open_container(iter, cint(dtStruct), nil, subIterPtr) == 0:
    raise newException(DbusException, "open_container")
  for item in arr:
    subIterPtr.append(item)
  if dbus_message_iter_close_container(iter, subIterPtr) == 0:
    raise newException(DbusException, "close_container")

proc append*(iter: ptr DbusMessageIter, x: DbusValue) =
  case x.kind:
    of dtBool:
      let val = x.boolValue.uint32
      iter.appendPtr(x.kind, addr val)
    of dbusScalarTypes - {dtBool}:
      iter.appendPtr(x.kind, x.getPrimitive)
    of dbusStringTypes:
      # dbus_message_iter_append_basic copies its argument, so this is safe
      var str = x.getString.cstring
      iter.appendPtr(x.kind, addr str)
    of dtArray:
      iter.appendArray(x.arrayValueType.makeDbusSignature, x.arrayValue)
    of dtDictEntry:
      iter.appendDictEntry(x.dictKey, x.dictValue)
    of dtVariant:
      iter.appendVariant(x.variantType.makeDbusSignature, x.variantValue)
    of dtStruct:
      iter.appendStruct(x.structValues)
    else:
      raise newException(ValueError, "not serializable")

# anything convertible to DbusValue
proc append*[T](iter: ptr DbusMessageIter, x: T) =
  iter.append(x.asDbusValue)

proc append*[T](msg: Message, x: T) =
  var iter = initIter(msg)
  append(addr iter, x)
