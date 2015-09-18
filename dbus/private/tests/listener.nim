import dbus, dbus/loop

type Greeter = ref object
  name: string

proc newGreeter(): Greeter =
  new(result)
  result.name = "World"

proc SetName(g: Greeter, name: string) =
  g.name = name

proc Hello(g: Greeter, id: uint32_t): string =
  "hello $1 $2" % [id, g.name]

proc GetName(g: Greeter): string
  g.name

let greeterDef = dbus.newInterfaceDef(Greeter)
greeterDef.addMethod(SetName, @[("name", string)])
# greeterDef.addMethodRaw("SetName", @[("name", "s")], "", proc(obj: Greeter, args: seq[DbusValue]): DbusValue = ...)
greeterDef.addMethod(Hello, @[("id", uint32_t)], string)
greeterDef.addMethod(GetName, @[])

when isMainModule:
  let bus = getBus(dbus.DBUS_BUS_SESSION)
  let mainLoop = MainLoop.create(bus)

  let greeter = new(Greeter)
  let greeterObj = dbus.newObjectImpl()
  greeterObj.addInterface("com.zielmicha.Greeter", greeterDef, greeter)

  bus.requestName("net.networkos.dbustest")
  bus.registerObject("/net/networkos/dbustest".ObjectPath, greeterObj)
