
export MethodDef, ArgDef

type
  CallableMethod[T] = tuple[def: MethodDef, call: (proc(obj: T, args: seq[DbusValue]): seq[DbusValue])]

  InterfaceDef*[T] = ref object
    funcs: Table[string, CallableMethod[T]]

proc newInterfaceDef*[T](t: typedesc[T]): InterfaceDef[T] =
  new(result)
  result.funcs = initTable[string, CallableMethod[T]]()

proc addMethodRaw*[T](self: InterfaceDef[T], def: MethodDef, call: (proc(obj: T, args: seq[DbusValue]): seq[DbusValue])) =
  self.funcs[def.name] = (def, call)

proc makeCallback[T](bus: Bus, def: InterfaceDef[T], obj: T): MessageCallback =
  proc callback(kind: IncomingMessageType, incomingMessage: IncomingMessage): bool =
    if kind != mtCall:
      return false

    if not def.funcs.hasKey(incomingMessage.name):
      return false

    let callable = def.funcs[incomingMessage.name].call

    let args = incomingMessage.unpackValueSeq()
    let ret = callable(obj, args)
    sendReply(bus, incomingMessage, ret)

  return callback

proc addInterface*[T](obj: DbusObjectImpl, name: string, def: InterfaceDef[T], val: T) =
  let node = newXmlTree("interface", @[], {"name": name}.newStringTable)
  addInterface(obj, name, makeCallback(obj.bus, def, val), node)
