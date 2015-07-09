import tables

type
  FD* = cint

  DbusValue* = ref object
    case kind: DbusTypeChar:
      of dtArray:
        arrayValueType: DbusType
        arrayValue: seq[DbusValue]
      of dtBool:
        boolValue: bool
      of dtDouble:
        doubleValue: float64
      of dtSignature:
        signatureValue: Signature
      of dtUnixFd:
        fdValue: FD
      of dtInt32:
        int32Value: int32
      of dtInt16:
        int16Value: int16
      of dtObjectPath:
        objectPathValue: ObjectPath
      of dtUint16:
        uint16Value: uint16
      of dtStruct:
        structValue: TableRef[DbusValue, DbusValue]
      of dtString:
        stringValue: string
      of dtUint64:
        uint64Value: uint64
      of dtUint32:
        uint32Value: uint32
      of dtInt64:
        int64Value: int64
      of dtByte:
        byteValue: uint8
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

proc getString(val: DbusValue): string =
  case val.kind:
    of dtString:
      return val.stringValue
    of dtSignature:
      return val.signatureValue.string
    of dtObjectPath:
      return val.objectPathValue.string
    else:
      raise newException(ValueError, "value is not string")

proc asDbusValue*(val: bool): DbusValue =
  new(result)
  result.kind = dtBool
  result.boolValue = val

proc asDbusValue*(val: float64): DbusValue =
  new(result)
  result.kind = dtDouble
  result.doubleValue = val

proc asDbusValue*(val: int16): DbusValue =
  new(result)
  result.kind = dtInt16
  result.int16Value = val

proc asDbusValue*(val: int32): DbusValue =
  new(result)
  result.kind = dtInt32
  result.int32Value = val

proc asDbusValue*(val: int64): DbusValue =
  new(result)
  result.kind = dtInt64
  result.int64Value = val

proc asDbusValue*(val: uint16): DbusValue =
  new(result)
  result.kind = dtUint16
  result.uint16Value = val

proc asDbusValue*(val: uint32): DbusValue =
  new(result)
  result.kind = dtUint32
  result.uint32Value = val

proc asDbusValue*(val: uint64): DbusValue =
  new(result)
  result.kind = dtUint64
  result.uint64Value = val

proc asDbusValue*(val: uint8): DbusValue =
  new(result)
  result.kind = dtByte
  result.byteValue = val

proc asDbusValue*(val: string): DbusValue =
  new(result)
  result.kind = dtString
  result.stringValue = val

proc asDbusValue*(val: ObjectPath): DbusValue =
  new(result)
  result.kind = dtString
  result.objectPathValue = val

proc asDbusValue*(val: Signature): DbusValue =
  new(result)
  result.kind = dtSignature
  result.signatureValue = val

proc asDbusValue*[T](val: seq[T]): DbusValue =
  new(result)
  result.kind = dtArray
  result.arrayValue = @[]
  result.arrayValueType = getDbusType(T)
  for x in val:
    result.arrayValue.add x.asDbusValue
