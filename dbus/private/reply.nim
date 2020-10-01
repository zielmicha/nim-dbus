
type Reply* = object
  msg: ptr DBusMessage

type ReplyType* = enum
  rtInvalid = 0, rtMethodCall = 1, rtMethodReturn = 2,
  rtError = 3, rtSignal = 4

proc replyFromMessage*(msg: ptr DbusMessage): Reply =
  result.msg = msg

proc type*(reply: Reply): ReplyType =
  return dbus_message_get_type(reply.msg).ReplyType

proc errorName*(reply: Reply): string =
  return $dbus_message_get_error_name(reply.msg)

proc errorMessage*(reply: Reply): string =
  var error: DBusError
  doAssert(dbus_set_error_from_message(addr error, reply.msg))
  defer: dbus_error_free(addr error)
  return $error.message

proc raiseIfError*(reply: Reply) =
  if reply.type == rtError:
    raise newException(DbusRemoteException, reply.errorName & ": " & reply.errorMessage)

proc waitForReply*(call: PendingCall): Reply =
  call.bus.flush()
  dbus_pending_callblock(call.call)
  result.msg = dbus_pending_call_steal_reply(call.call)

  defer: dbus_pending_call_unref(call.call)

  if result.msg == nil:
    raise newException(DbusException, "dbus_pending_call_steal_reply")

proc close*(reply: Reply) =
  dbus_message_unref(reply.msg)

type InputIter* = object
  iter: DbusMessageIter

proc iterate*(reply: Reply): InputIter =
  if dbus_message_iter_init(reply.msg, addr result.iter) == 0:
    raise newException(DbusException, "dbus_message_iter_init")

proc advanceIter*(iter: var InputIter) =
  if dbus_message_iter_next(addr iter.iter) == 0:
    raise newException(DbusException, "cannot advance iterator")

proc ensureEnd*(iter: var InputIter) =
  if dbus_message_iter_next(addr iter.iter) != 0:
    raise newException(DbusException, "got more arguments than expected")

proc subIterate*(iter: var InputIter): InputIter =
  # from https://leonardoce.wordpress.com/2015/03/17/dbus-tutorial-part-3/
  dbus_message_iter_recurse(addr iter.iter, addr result.iter)

proc unpackCurrent*(iter: var InputIter, native: typedesc[DbusValue]): DbusValue =
  let kind = dbus_message_iter_get_arg_type(addr iter.iter).DbusTypeChar
  case kind:
  of dtNull:
    return DbusValue(kind: dtNull)
  of dbusScalarTypes:
    let (value, scalarPtr) = createScalarDbusValue(kind)
    dbus_message_iter_get_basic(addr iter.iter, scalarPtr)
    return value
  of dbusStringTypes:
    var s: cstring
    dbus_message_iter_get_basic(addr iter.iter, addr s)
    return createStringDbusValue(kind, $s)
  of dtVariant:
    var subiter = iter.subIterate()
    let subvalue = subiter.unpackCurrent(native)
    return DbusValue(kind: dtVariant, variantType: subvalue.kind, variantValue: subvalue)
  of dtDictEntry:
    var subiter = iter.subIterate()
    let key = subiter.unpackCurrent(DbusValue)
    subiter.advanceIter()
    let val = subiter.unpackCurrent(DbusValue)
    subiter.ensureEnd()
    return DbusValue(kind: dtDictEntry, dictKey: key, dictValue: val)
  of dtArray:
    var subiter = iter.subIterate()
    var values: seq[DbusValue]
    var subkind: DbusType
    while true:
      let subkindInt = dbus_message_iter_get_arg_type(addr subiter.iter)
      subkind = subkindInt.DbusTypeChar
      if subkind.kind == dtNull:
        break
      values.add(subiter.unpackCurrent(native))
      if dbus_message_iter_has_next(addr subiter.iter) == 0:
        break
      subiter.advanceIter()
    if values.len > 0 and subkind.kind == dtDictEntry:
      # Hard to get these when there are no values in the current system
      subkind.keyType = values[0].dictKey.kind
      subkind.valueType = values[0].dictValue.kind
    return DbusValue(kind: dtArray, arrayValueType: subkind, arrayValue: values)
  of dtStruct:
    var subiter = iter.subIterate()
    var values:seq[DbusValue]
    while true:
      values.add(subiter.unpackCurrent(DbusValue))
      if dbus_message_iter_has_next(addr subiter.iter) == 0:
        break
      subiter.advanceIter()
    return DbusValue(kind: dtStruct, structValues: values)
  else:
    raise newException(DbusException, "nim-dbus does not support unpacking " & $kind)

proc unpackCurrent*[T](iter: var InputIter, native: typedesc[T]): T =
  unpackCurrent(iter, DbusValue).asNative(native)
