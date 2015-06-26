import dbus.bus
import dbus.message
import dbus.reply
import unsigned

let mybus = getBus(bus.DBUS_BUS_SESSION)
var msg = makeCall("com.zielmicha.test",
             "/com/zielmicha/test",
             "com.zielmicha.test",
             "hello")

#msg.append("hello")
#msg.append(uint32(1))
#msg.append("")

let pending = mybus.sendMessageWithReply(msg)
mybus.flush()

let myreply = pending.waitForReply()
myreply.raiseIfError()
