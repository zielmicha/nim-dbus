import dbus.listener

dbusInterface "com.zielmicha.Greetable":
  proc Hello(id: uint32_t): string
  proc GetName(): string

type Greeter = ref object
  name: string

proc newGreeter(): Greeter =
  new(result)
  result.name = "World"

proc SetName(g: Greeter, name: string) {.dbuscall.} =
  g.name = name

proc Hello(g: Greeter, id: uint32_t): string {.dbuscall.} =
  "hello $1 $2" % [id, g.name]

proc GetName(g: Greeter): string # not included in com.zielmicha.Greeter (missing dbuscall)
  g.name

dbusConcreteInterface "com.zielmicha.Greeter", Greeter

when isMainModule:
  var listener: DBusListener = initListener()
  var bus = listener.addUniqueBusName(DBUS_SESSION_BUS, "com.zielmicha.Greeting")
  var greeter = newGreeter()
  # hm...
  var obj = bus.addObject[Greeter]("/com/zielmicha/Greeter/0", greeter)
  # obj is ListeningObject[Greeter]
  obj.addInterface("com.zielmicha.Greeter")
  obj.addInterface("com.zielmicha.Greetable")
