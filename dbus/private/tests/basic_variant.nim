import dbus

let bus = getBus(dbus.DBUS_BUS_SESSION)
var msg = makeCall("com.zielmicha.test",
             ObjectPath("/com/zielmicha/test"),
             "com.zielmicha.test",
             "hello")

msg.append(newVariant("hi"))

let pending = bus.sendMessageWithReply(msg)
let reply = pending.waitForReply()
reply.raiseIfError()

var it = reply.iterate
let v = it.unpackCurrent(DbusValue)
assert v.asNative(string) == "Hello, world!"
it.advanceIter
let val = it.unpackCurrent(DbusValue)
assert val.kind == dtString
assert val.asNative(string) == "hi"


