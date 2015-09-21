
type
  DbusObjectImpl* = ref object
    interfaceTable: Table[string, MessageCallback]
    interfaceDefs: seq[proc(): XmlNode]
    bus*: Bus

proc newObjectImpl*(bus: Bus): DbusObjectImpl =
  new(result)
  result.bus = bus
  result.interfaceTable = initTable[string, MessageCallback]()
  result.interfaceDefs = @[]

proc registerObject*(bus: Bus, path: ObjectPath, obj: DbusObjectImpl) =
  proc call(kind: IncomingMessageType, incomingMessage: IncomingMessage): bool =
    let function = obj.interfaceTable[incomingMessage.interfaceName]
    echo "call ", incomingMessage.name, " ", incomingMessage.interfaceName
    if function == nil:
      echo "no such interface"
      return false
    else:
      return function(kind, incomingMessage)

  registerObject(bus, path, call)

proc addInterface*(obj: DbusObjectImpl, name: string,
                   callback: MessageCallback, xmlDef: (proc(): XmlNode)) =
  obj.interfaceTable[name] = callback
  obj.interfaceDefs.add xmlDef
