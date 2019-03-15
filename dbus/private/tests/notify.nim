import tables
import dbus

let bus = getBus(DBUS_BUS_SESSION)
var msg = makeCall("org.freedesktop.Notifications",
             ObjectPath("/org/freedesktop/Notifications"),
             "org.freedesktop.Notifications",
             "Notify")

msg.append("nim-dbus")
msg.append(0'u32)
msg.append("dialog-information")
msg.append("Test notification")
msg.append("Test notification body")
msg.append(newSeq[string]())
msg.append({"urgency": newVariant(1'u8)}.toTable)
msg.append(-1'i32)

let pending = bus.sendMessage(msg)
