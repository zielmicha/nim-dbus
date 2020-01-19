import dbus
import ./basic_wrapper

let bus = getUniqueBus(dbus.DBUS_BUS_SESSION, "com.zielmicha.test")
let testRemote = ComZielmichaTestRemote.get(bus, ObjectPath("/com/zielmicha/test"))
echo testRemote.hello(5, "foo")
