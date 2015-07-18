import dbus, tables
type ComZielmichaTestRemote* = object of DbusIfaceWrapper

proc get*(wrapperType: typedesc[ComZielmichaTestRemote], uniqueBus: UniqueBus, path: ObjectPath): ComZielmichaTestRemote =
  result.uniqueBus = uniqueBus
  result.path = path


proc helloAsync*(dbusIface: ComZielmichaTestRemote, num: uint32, sss: string): PendingCall =
  let msg = makeCall(dbusIface.uniqueBus.uniqueName, dbusIface.path, "com.zielmicha.test", "hello")
  msg.append(num)
  msg.append(sss)
  return dbusIface.uniqueBus.bus.sendMessageWithReply(msg)

proc helloGetReply*(reply: Reply): tuple[salutation: string, retnum: uint32] =
  reply.raiseIfError
  var iter = reply.iterate
  result.salutation = iter.unpackCurrent(string)
  iter.advanceIter
  result.retnum = iter.unpackCurrent(uint32)
  iter.ensureEnd

proc hello*(dbusIface: ComZielmichaTestRemote, num: uint32, sss: string): tuple[salutation: string, retnum: uint32] =
  let reply = helloAsync(dbusIface, num, sss).waitForReply()
  defer: reply.close()
  return helloGetReply(reply)

