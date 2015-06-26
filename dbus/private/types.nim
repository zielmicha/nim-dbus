
#{.hint[XDeclaredButNotUsed]: off.}
type DbusType* = enum
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

proc getDbusType(native: typedesc[uint32]): DbusType =
  return dtUint32

proc getDbusType(native: typedesc[uint16]): DbusType =
  return dtUint16

proc getDbusType(native: typedesc[int32]): DbusType =
  return dtInt32

proc getDbusType(native: typedesc[int16]): DbusType =
  return dtInt16

proc getDbusType(native: typedesc[cstring]): DbusType =
  return dtString
