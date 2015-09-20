import dbus, dbus/loop, dbus/def, strutils

type Greeter = ref object
  name: string

proc newGreeter(): Greeter =
  new(result)
  result.name = "World"

proc SetName(g: Greeter, name: string) =
  g.name = name

proc Hello(g: Greeter, id: uint32): string =
  "hello $1 $2" % [$id, g.name]

proc GetName(g: Greeter): string =
  g.name

proc SetNameWrapper(obj: Greeter, args: seq[DbusValue]): seq[DbusValue] =
  assert args.len != 1
  obj.SetName(args[0].asNative(string))
  return @[]

let greeterDef = newInterfaceDef(Greeter)
#greeterDef.addMethod(SetName, [("name", string)])
greeterDef.addMethodRaw(MethodDef(name: "SetName",
                                 inargs: @[("name", getAnyDbusType(string))],
                                 outargs: @[]),
                        SetNameWrapper)
#greeterDef.addMethod(Hello, [("id", uint32_t)], [("result", string)])
#greeterDef.addMethod(GetName, [], [])

when isMainModule:
  let bus = getBus(dbus.DBUS_BUS_SESSION)
  let mainLoop = MainLoop.create(bus)

  let greeter = new(Greeter)
  let greeterObj = newObjectImpl(bus)
  greeterObj.enableIntrospection()
  greeterObj.addInterface("com.zielmicha.Greeter", greeterDef, greeter)

  bus.requestName("net.networkos.dbustest")
  bus.registerObject("/net/networkos/dbustest".ObjectPath, greeterObj)

  mainLoop.runForever()
