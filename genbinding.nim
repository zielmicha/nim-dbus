import docopt
import dbus
import dbus/introspect
import dbus/gennim
import os

let data = readFile(paramStr(1)).parseXml
let name = getInterfaceName(data)
let methods = getMethods(data)

echo genIface(name)

for def in methods:
  echo genMethodWrapper(name, def)
