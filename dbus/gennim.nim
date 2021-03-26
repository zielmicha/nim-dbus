import dbus
import dbus/introspect
import strutils, sequtils, future

proc genType*(kind: DbusType): string =
  case kind.kind:
    of dtArray:
      return "seq[" & genType(kind.itemType) & "]"
    of dtStruct:
      return "TableRef[" & genType(kind.keyType) & ", " & genType(kind.valueType) & "]"
    of dtBool:
      return "bool"
    of dtDouble:
      return "float64"
    of dtSignature:
      return "DbusSignature"
    of dtUnixFd:
      return "FdPass"
    of dtInt32:
      return "int32"
    of dtInt16:
      return "int16"
    of dtObjectPath:
      return "ObjectPath"
    of dtUint16:
      return "uint16"
    of dtString:
      return "string"
    of dtUint64:
      return "uint64"
    of dtUint32:
      return "uint32"
    of dtVariant:
      return "DbusValue"
    of dtInt64:
      return "int64"
    of dtByte:
      return "byte"
    else:
      raise newException(DbusException, "unsupported type")

proc genRetType*(args: seq[ArgDef]): string =
  if args.len == 0:
    return "void"
  elif args.len == 1:
    return genType(args[0].kind)
  else:
    var params: seq[string] = @[]
    for arg in args:
      params.add(arg.name & ": " & genType(arg.kind))
    result = "tuple[$1]" % params.join(", ")

proc quotePath(name: string): string =
  let base = name.replace('/', '_').replace('.', '_').replace("__", "")
  var ret: seq[string] = @[]
  for segment in base.split('_'):
    ret.add segment.capitalizeAscii
  ret.join("")

proc ifaceTypeName(name: string): string =
  quotePath(name) & "Remote"

proc genIface*(ifaceName: string): string =
  let ifaceType = ifaceTypeName(ifaceName)
  result = "type $1* = object of DbusIfaceWrapper\n\n" % ifaceType
  result.add "proc get*(wrapperType: typedesc[$1], uniqueBus: UniqueBus, path: ObjectPath): $1 =\n" % [ifaceType]
  result.add "  result.uniqueBus = uniqueBus\n"
  result.add "  result.path = path\n"

proc genMethodWrapper*(ifaceName: string, def: MethodDef): string =
  # async version
  var args: seq[string] = @[]
  args.add "dbusIface: " & ifaceTypeName(ifaceName)
  for arg in def.inargs:
    args.add "$1: $2" % [arg.name, genType(arg.kind)]
  result = "\nproc $1Async*($2): PendingCall =\n" % [
    def.name, args.join(", ")]
  result.add(("  let msg = makeCall(dbusIface.uniqueBus.uniqueName, " &
             "dbusIface.path, \"$1\", \"$2\")\n") % [ifaceName, def.name])
  for arg in def.inargs:
    result.add("  msg.append($1)\n" % arg.name)

  result.add "  return dbusIface.uniqueBus.bus.sendMessageWithReply(msg)\n\n"

  # return value
  let retType = genRetType(def.outargs)

  result.add "proc $1GetReply*(reply: Reply): $2 =\n" % [def.name, retType]
  result.add "  reply.raiseIfError\n"
  if def.outargs.len != 0:
    result.add "  var iter = reply.iterate\n"
  if def.outargs.len == 1:
    result.add "  result = iter.unpackNext($1)\n" % retType
  else:
    for i, arg in def.outargs:
      result.add "  result.$1 = iter.unpackCurrent($2)\n" % [arg.name, genType(arg.kind)]
      if i == def.outargs.len - 1:
        result.add "  iter.ensureEnd\n"
      else:
        result.add "  iter.advanceIter\n"
  result.add "\n"

  # sync version
  result.add "proc $1*($2): $3 =\n" % [
    def.name, args.join(", "), retType]

  let argNames = def.inargs.map((arg: ArgDef) => arg.name)

  result.add "  let reply = $1Async(dbusIface, $2).waitForReply()\n" % [
    def.name, argNames.join(", "), retType]
  result.add "  defer: reply.close()\n"
  result.add "  "
  if def.outargs.len != 0:
    result.add "return "
  result.add "$1GetReply(reply)\n" % [def.name]
