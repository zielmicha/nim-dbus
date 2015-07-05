import strutils, tables

type ObjectPath = distinct string
type Signature = distinct string

type DbusTypeChar* = enum
  dtArray = 'a',
  dtBool = 'b',
  dtDouble = 'd',
  dtSignature = 'g',
  dtUnixFd = 'h'
  dtInt32 = 'i',
  dtInt16 = 'n',
  dtObjectPath = 'o',
  dtUint16 = 'q',
  dtStruct = 'r',
  dtString = 's',
  dtUint64 = 't',
  dtUint32 = 'u',
  dtVariant = 'v'
  dtInt64 = 'x',
  dtByte = 'y'

type DbusType* = ref object
  case kind*: DbusTypeChar
  of dtArray:
    itemType*: DbusType
  of dtStruct:
    keyType*: DbusType
    valueType*: DbusType
  else:
    discard

converter fromScalar*(ch: DbusTypeChar): DbusType =
  new(result)
  assert ch notin {dtArray, dtStruct}
  result.kind = ch

proc initArrayType*(itemType: DbusType): DbusType =
  new(result)
  result.kind = dtArray
  result.itemType = itemType

proc initStructType*(keyType: DbusType, valueType: DbusType): DbusType =
  new(result)
  result.kind = dtStruct
  result.keyType = keyType
  result.valueType = valueType

proc parseDbusFragment(signature: string): tuple[kind: DbusType, rest: string] =
  case signature[0]:
    of 'a':
      let ret = parseDbusFragment(signature[1..^1])
      return (initArrayType(ret.kind), ret.rest)
    of '{':
      let keyRet = parseDbusFragment(signature[1..^1])
      let valueRet = parseDbusFragment(keyRet.rest)
      assert valueRet.rest[0] == "}"[0]
      return (initStructType(keyRet.kind, valueRet.kind), valueRet.rest[1..^1])
    else:
      let kind = signature[0].DbusTypeChar
      return (fromScalar(kind), signature[1..^1])

proc parseDbusType*(signature: string): DbusType =
  let ret = parseDbusFragment(signature)
  if ret.rest != "":
    raise newException(Exception, "leftover data in signature: $1" % signature)
  return ret.kind

proc makeDbusSignature*(kind: DbusType): string =
  case kind.kind:
    of dtArray:
      "a" & makeDbusSignature(kind.itemType)
    of dtStruct:
      "{" & makeDbusSignature(kind.keyType) & makeDbusSignature(kind.valueType) & "}"
    else:
      $(kind.kind.char)

proc getDbusType[T](native: typedesc[seq[T]]): DbusType =
  initArrayType(getDbusType(T))

proc getDbusType[K, V](native: typedesc[TableRef[K, V]]): DbusType =
  initStructType(getDbusType(K), getDbusType(V))

proc getDbusType(native: typedesc[uint32]): DbusType =
  dtUint32

proc getDbusType(native: typedesc[uint16]): DbusType =
  dtUint16

proc getDbusType(native: typedesc[int32]): DbusType =
  dtInt32

proc getDbusType(native: typedesc[int16]): DbusType =
  dtInt16

proc getDbusType(native: typedesc[cstring]): DbusType =
  dtString
