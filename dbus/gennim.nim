import dbus
import dbus/introspect
import strutils

proc genType*(kind: DbusType): string =
  case kind.kind:
    of dtArray:
      "seq[" & genType(kind.itemType) & "]"
    of dtStruct:
      "TableRef[" & genType(kind.keyType) & ", " & genType(kind.valueType) & "]"
    of dtBool:
      "bool"
    of dtDouble:
      "float64"
    of dtSignature:
      "DbusSignature"
    of dtUnixFd:
      "FdPass"
    of dtInt32:
      "int32"
    of dtInt16:
      "int16"
    of dtObjectPath:
      "ObjectPath"
    of dtUint16:
      "uint16"
    of dtString:
      "string"
    of dtUint64:
      "uint64"
    of dtUint32:
      "uint32"
    of dtVariant:
      "DbusValue"
    of dtInt64:
      "int64"
    of dtByte:
      "byte"

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
    ret.add segment.capitalize
  ret.join("")

proc ifaceTypeName(name: string): string =
  quotePath(name) & "Remote"

proc genIface*(ifaceName: string): string =
  let ifaceType = ifaceTypeName(ifaceName)
  result = "type %1 = distinct DbusIfaceWrapper" % ifaceType

proc genMethodWrapper*(ifaceName: string, def: MethodDef): string =
  var args: seq[string] = @[]
  args.add "dbusIface: " & ifaceTypeName(ifaceName)
  for arg in def.inargs:
    args.add "$1: $2" % [arg.name, genType(arg.kind)]
  result = "proc $1($2): $3 =\n" % [
    def.name, args.join(", "), genRetType(def.outargs)]
  result.add(("  let msg = makeCall(dbusIface.uniqueBus.uniqueName, " &
             "dbusIface.path, \"$1\")\n") % [ifaceName])
  for arg in def.inargs:
    result.add("  msg.append($1)\n" % arg.name)
