import strutils, tables

type ObjectPath* = distinct string
type Signature* = distinct string

type Variant[T] = object
  value: T

proc newVariant*[T](val: T): Variant[T] = Variant[T](value: val)

type DbusTypeChar* = enum
  dtNull = '\0', # workaround for Nim bug #3096
  dtArray = 'a',
  dtBool = 'b',
  dtDouble = 'd',
  dtDictEntry = 'e',
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
  dtDict = '{'

const dbusScalarTypes = {dtBool, dtDouble, dtInt32, dtInt16, dtUint16, dtUint64, dtUint32, dtInt64, dtByte}
const dbusStringTypes = {dtString, dtObjectPath, dtSignature}
const dbusContainerTypes = {dtArray, dtStruct, dtDict, dtDictEntry, dtVariant}

type DbusType* = ref object
  case kind*: DbusTypeChar
  of dtArray:
    itemType*: DbusType
  of dtDictEntry:
    keyType*: DbusType
    valueType*: DbusType
  of dtStruct:
    itemTypes*: seq[DbusType]
  of dtVariant:
    variantType*: DbusType
  else:
    discard

converter fromScalar*(ch: DbusTypeChar): DbusType =
  # assert ch notin dbusContainerTypes
  DbusType(kind: ch)

proc initArrayType*(itemType: DbusType): DbusType =
  DbusType(kind: dtArray, itemType: itemType)

proc initDictEntryType*(keyType: DbusType, valueType: DbusType): DbusType =
  doAssert keyType.kind in dbusContainerTypes
  DbusType(kind: dtDictEntry, keyType: keyType, valueType: valueType)

proc initStructType*(itemTypes: seq[DbusType]): DbusType =
  DbusType(kind: dtStruct, itemTypes: itemTypes)

proc initVariantType*(variantType: DbusType): DbusType =
  DbusType(kind: dtVariant, variantType: variantType)

proc parseDbusFragment(signature: string): tuple[kind: DbusType, rest: string] =
  case signature[0]:
    of 'a':
      let ret = parseDbusFragment(signature[1..^1])
      return (initArrayType(ret.kind), ret.rest)
    of '{':
      let keyRet = parseDbusFragment(signature[1..^1])
      let valueRet = parseDbusFragment(keyRet.rest)
      assert valueRet.rest[0] == "}"[0]
      return (initDictEntryType(keyRet.kind, valueRet.kind), valueRet.rest[1..^1])
    of '(':
      var left = signature[1..^1]
      var types: seq[DbusType] = @[]
      while left[0] != ')':
        let ret = parseDbusFragment(left)
        left = ret.rest
        types.add ret.kind
      return (initStructType(types), left[1..^1])
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
      result = "a" & makeDbusSignature(kind.itemType)
    of dtDictEntry:
      result = "{" & makeDbusSignature(kind.keyType) & makeDbusSignature(kind.valueType) & "}"
    else:
      result = $(kind.kind.char)

proc getDbusType(native: typedesc[uint32]): DbusType =
  dtUint32

proc getDbusType(native: typedesc[uint16]): DbusType =
  dtUint16

proc getDbusType(native: typedesc[uint8]): DbusType =
  dtByte

proc getDbusType(native: typedesc[int32]): DbusType =
  dtInt32

proc getDbusType(native: typedesc[int16]): DbusType =
  dtInt16

proc getDbusType(native: typedesc[cstring]): DbusType =
  dtString

proc getDbusType(native: typedesc[ObjectPath]): DbusType =
  dtObjectPath

proc getDbusType[T](native: typedesc[Variant[T]]): DbusType =
  initVariantType(getDbusType(T))

proc getAnyDbusType*[T](native: typedesc[T]): DbusType =
  getDbusType(native)

proc getAnyDbusType*(native: typedesc[string]): DbusType =
  getDbusType(cstring)

proc getAnyDbusType*(native: typedesc[ObjectPath]): DbusType =
  getDbusType(ObjectPath)

proc getAnyDbusType*[T](native: typedesc[seq[T]]): DbusType =
  initArrayType(getDbusType(T))

proc getAnyDbusType*[K, V](native: typedesc[TableRef[K, V]]): DbusType =
  initStructType(getDbusType(K), getDbusType(V))
