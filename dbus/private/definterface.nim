
export MethodDef, ArgDef

type
  CallableMethod[T] = tuple[def: MethodDef, call: (proc(obj: T, args: seq[DbusValue]): seq[DbusValue])]

  InterfaceDef*[T] = ref object
    funcs: Table[string, CallableMethod[T]]

proc newInterfaceDef*[T](t: typedesc[T]): InterfaceDef[T] =
  new(result)
  result.funcs = initTable[string, CallableMethod[T]]()

proc addMethodRaw*[T](self: InterfaceDef[T], def: MethodDef, call: (proc(obj: T, args: seq[DbusValue]): seq[DbusValue])) =
  let m: CallableMethod[T] = (def, call)
  `[]=`(self.funcs, def.name, m)

proc makeCallback[T](bus: Bus, def: InterfaceDef[T], obj: T): MessageCallback =
  proc callback(kind: IncomingMessageType, incomingMessage: IncomingMessage): bool =
    if kind != mtCall:
      #echo "is a signal"
      return false

    if not def.funcs.hasKey(incomingMessage.name):
      #echo "no such method"
      return false

    let callable = `[]`(def.funcs, incomingMessage.name).call

    var ret: seq[DbusValue]

    try:
      let args = incomingMessage.unpackValueSeq()
      ret = callable(obj, args)
    except Exception as exc:
      #echo "Exception: ", exc.msg
      #echo getStackTrace(exc)
      sendErrorReply(bus, incomingMessage, $exc.name & ": " & exc.msg)
      return

    sendReply(bus, incomingMessage, ret)

  return callback

proc makeIntrospection(obj: InterfaceDef, name: string): XmlNode =
  result = newXmlTree("interface", @[], {"name": name}.newStringTable)
  for callableMethod in obj.funcs.values:
    result.add callableMethod.def.toXml

proc addInterface*[T](obj: DbusObjectImpl, name: string, def: InterfaceDef[T], val: T) =
  addInterface(obj, name, makeCallback(obj.bus, def, val), proc(): XmlNode = makeIntrospection(def, name))
