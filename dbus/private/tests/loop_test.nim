import dbus, dbus/loop, dbus/lowlevel

when isMainModule:
  let bus = getBus(dbus.DBUS_BUS_SESSION)
  let mainLoop = MainLoop.create(bus)

  proc callback(kind: IncomingMessageType, messsage: IncomingMessage): bool =
    echo kind, messsage.name, messsage.interfaceName
    return false

  bus.requestName("net.networkos.dbustest")
  bus.registerObject("/net/networkos/dbustest".ObjectPath, callback)

  while true:
    echo "tick"
    mainLoop.tick()
