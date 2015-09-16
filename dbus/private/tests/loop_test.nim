import dbus, dbus/loop

when isMainModule:
  let mainLoop = MainLoop.create(getBus(dbus.DBUS_BUS_SESSION))
  while true:
    echo "tick"
    mainLoop.tick()
