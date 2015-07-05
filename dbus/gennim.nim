import dbus
import dbus/introspect

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
      "DbusObject"
    of dtInt64:
      "int64"
    of dtByte:
      "byte"
