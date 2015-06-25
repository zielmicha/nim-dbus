import dbus
import unsigned

let bus = getBus(dbus.DBUS_BUS_SESSION)
var msg = makeCall("org.freedesktop.Notifications",
             "/org/freedesktop/Notifications",
             "org.freedesktop.Notifications",
             "SystemNoteDialog")

msg.append("hello")
msg.append(uint32(1))
msg.append("")

bus.sendMessage(msg)
bus.flush()
