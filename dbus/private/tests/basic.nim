import tables
import dbus

let bus = getBus(dbus.DBUS_BUS_SESSION)
var msg = makeCall("com.zielmicha.test",
             ObjectPath("/com/zielmicha/test"),
             "com.zielmicha.test",
             "hello")

msg.append(uint32(6))
msg.append("hello")
msg.append(1'i32)
msg.append("hello".asDbusValue)
msg.append(@["a", "b"])
msg.append({"a": "b"}.toTable)
msg.append(ObjectPath("/a"))
msg.append(@[ObjectPath("/b")])

let pending = bus.sendMessageWithReply(msg)

let reply = pending.waitForReply()
reply.raiseIfError()

var it = reply.iterate
let v = it.unpackCurrent(DbusValue)
assert v.asNative(string) == "Hello, world!"
it.advanceIter
assert it.unpackCurrent(uint32) == 6
