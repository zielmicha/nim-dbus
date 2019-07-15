import tables

type
  FD* = cint

  DbusValue* = ref object
    case kind: DbusTypeChar:
      of dtArray:
        arrayValueType*: DbusType
        arrayValue*: seq[DbusValue]
      of dtBool:
        boolValue*: bool
      of dtDictEntry:
        dictKey*, dictValue*: DbusValue
      of dtDouble:
        doubleValue*: float64
      of dtSignature:
        signatureValue*: Signature
      of dtUnixFd:
        fdValue*: FD
      of dtInt32:
        int32Value*: int32
      of dtInt16:
        int16Value*: int16
      of dtObjectPath:
        objectPathValue*: ObjectPath
      of dtUint16:
        uint16Value*: uint16
      of dtString:
        stringValue*: string
      of dtStruct:
        structValues*: seq[DbusValue]
      of dtUint64:
        uint64Value*: uint64
      of dtUint32:
        uint32Value*: uint32
      of dtInt64:
        int64Value*: int64
      of dtByte:
        byteValue*: uint8
      of dtVariant:
        variantType*: DbusType
        variantValue*: DbusValue
      else:
        discard

type DbusNativePrimitive = bool | float64 | int32 | int16 | uint16 | uint64 | uint32 | int64 | uint8

proc getPrimitive(val: var DbusValue): pointer =
  case val.kind:
    of dtBool:
      return addr val.boolValue
    of dtDouble:
      return addr val.doubleValue
    of dtInt32:
      return addr val.int32Value
    of dtInt16:
      return addr val.int16Value
    of dtUint16:
      return addr val.uint16Value
    of dtUint64:
      return addr val.uint64Value
    of dtUint32:
      return addr val.uint32Value
    of dtInt64:
      return addr val.int64Value
    of dtByte:
      return addr val.byteValue
    else:
      raise newException(ValueError, "value is not primitive")

proc getString(val: DbusValue): var string =
  case val.kind:
    of dtString:
      return val.stringValue
    of dtSignature:
      return val.signatureValue.string
    of dtObjectPath:
      return val.objectPathValue.string
    else:
      raise newException(ValueError, "value is not string")

proc createStringDbusValue(kind: DbusTypeChar, val: string): DbusValue =
  result = DbusValue(kind: kind)
  getString(result) = val

proc createScalarDbusValue(kind: DbusTypeChar): tuple[value: DbusValue, scalarPtr: pointer] =
  var value = DBusValue(kind: kind)
  result = (value, getPrimitive(value))

proc createDictEntryDbusValue(key, val: DbusValue): DbusValue =
  result = DbusValue(kind: dtDictEntry, dictKey: key, dictValue: val)

proc asDbusValue*(val: bool): DbusValue =
  result = DbusValue(kind: dtBool, boolValue: val)

proc asDbusValue*(val: float64): DbusValue =
  result = DbusValue(kind: dtDouble, doubleValue: val)

proc asDbusValue*(val: int16): DbusValue =
  result = DbusValue(kind: dtInt16, int16Value: val)

proc asDbusValue*(val: int32): DbusValue =
  result = DbusValue(kind: dtInt32, int32Value: val)

proc asDbusValue*(val: int64): DbusValue =
  result = DbusValue(kind: dtInt64, int64Value: val)

proc asDbusValue*(val: uint16): DbusValue =
  result = DbusValue(kind: dtUint16, uint16Value: val)

proc asDbusValue*(val: uint32): DbusValue =
  result = DbusValue(kind: dtUint32, uint32Value: val)

proc asDbusValue*(val: uint64): DbusValue =
  result = DbusValue(kind: dtUint64, uint64Value: val)

proc asDbusValue*(val: uint8): DbusValue =
  result = DbusValue(kind: dtByte, byteValue: val)

proc asDbusValue*(val: string): DbusValue =
  result = DbusValue(kind: dtString, stringValue: val)

proc asDbusValue*(val: ObjectPath): DbusValue =
  result = DbusValue(kind: dtObjectPath, objectPathValue: val)

proc asDbusValue*(val: Signature): DbusValue =
  result = DbusValue(kind: dtSignature, signatureValue: val)

proc asDbusValue*[T](val: seq[T]): DbusValue =
  result = DbusValue(kind: dtArray, arrayValue: @[])
  result.arrayValueType = getDbusType(T)
  for x in val:
    result.arrayValue.add x.asDbusValue

proc asDbusValue*[K, V](val: Table[K, V]): DbusValue =
  result = DbusValue(kind: dtArray, arrayValue: @[])
  result.arrayValueType = DbusType(kind: dtDictEntry,
                                   keyType: getAnyDbusType(K),
                                   valueType: getAnyDbusType(V))
  for k, v in val:
    result.arrayValue.add(
      createDictEntryDbusValue(asDbusValue(k), asDbusValue(v)))

proc asDbusValue*[T](val: Variant[T]): DbusValue =
  result = DbusValue(kind: dtVariant,
    variantType: getDbusType(T), variantValue: asDbusValue(val.value))

proc asNative*(value: DbusValue, native: typedesc[bool]): bool =
  value.boolValue

proc asNative*(value: DbusValue, native: typedesc[float64]): float64 =
  value.doubleValue

proc asNative*(value: DbusValue, native: typedesc[int16]): int16 =
  value.int16Value

proc asNative*(value: DbusValue, native: typedesc[int32]): int32 =
  value.int32Value

proc asNative*(value: DbusValue, native: typedesc[int64]): int64 =
  value.int64Value

proc asNative*(value: DbusValue, native: typedesc[uint16]): uint16 =
  value.uint16Value

proc asNative*(value: DbusValue, native: typedesc[uint32]): uint32 =
  value.uint32Value

proc asNative*(value: DbusValue, native: typedesc[uint64]): uint64 =
  value.uint64Value

proc asNative*(value: DbusValue, native: typedesc[uint8]): uint8 =
  value.byteValue

proc asNative*(value: DbusValue, native: typedesc[string]): string =
  value.stringValue

proc asNative*(value: DbusValue, native: typedesc[ObjectPath]): ObjectPath =
  value.objectPathValue

proc asNative*(value: DbusValue, native: typedesc[Signature]): Signature =
  value.signatureValue
