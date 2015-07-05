import docopt
import dbus
import dbus/introspect

let data = readFile("interfaces/fi.w1.wpa_supplicant1.xml").parseXml
let methods = getMethods(data)
echo methods.repr
