import unittest

import tables
import dbus

const
  TEST_BUSNAME = "com.zielmicha.test"
  TEST_OBJECTPATH = ObjectPath("/com/zielmicha/test")
  TEST_INTERFACE = "com.zielmicha.test"
  TEST_METHOD = "hello"

proc testEcho[T](val: T): DbusValue =
  ## Test helper proc that sends a value to the test echo Dbus
  ## service and returns the echoed value.  Useful for testing
  ## that values can be sent and retrieved through the bus
  let bus = getBus(dbus.DBUS_BUS_SESSION)
  var msg = makeCall(TEST_BUSNAME,
              TEST_OBJECTPATH,
              TEST_INTERFACE,
              TEST_METHOD)

  msg.append(val)

  let pending = bus.sendMessageWithReply(msg)
  let reply = pending.waitForReply()
  reply.raiseIfError()

  var it = reply.iterate
  # let v = it.unpackCurrent(DbusValue)
  # assert v.asNative(string) == "Hello, world!"
  it.advanceIter
  return it.unpackCurrent(DbusValue)


test "basic":
  let bus = getBus(dbus.DBUS_BUS_SESSION)
  var msg = makeCall(TEST_BUSNAME,
              TEST_OBJECTPATH,
              TEST_INTERFACE,
              TEST_METHOD)
  
  msg.append(uint32(6))
  msg.append("hello")
  msg.append(1'i32)
  msg.append("hello".asDbusValue)
  msg.append(@["a", "b"])
  msg.append({"a": "b"}.toTable)
  msg.append(ObjectPath("/a"))
  msg.append(@[ObjectPath("/b")])
  
  let pending = bus.sendMessageWithReply(msg)
  let reply = pending.waitForReply()
  reply.raiseIfError()
  
  var it = reply.iterate
  let v = it.unpackCurrent(DbusValue)
  assert v.asNative(string) == "Hello, world!"
  it.advanceIter
  assert it.unpackCurrent(uint32) == 6

test "int":
  let val = testEcho(uint32(6))
  assert val.kind == dtUint32
  assert val.asNative(uint32) == 6

test "arrays":
  let val = testEcho(@["a", "b"])
  assert val.kind == dtArray
  assert val.arrayValue[0].asNative(string) == "a"
  assert val.arrayValue[1].asNative(string) == "b"

test "variant":
  let val = testEcho(newVariant("hi"))
  assert val.kind == dtString
  assert val.asNative(string) == "hi"

test "struct":
  let val = testEcho(DbusValue(kind: dtStruct, structValues: @[
    "hi".asDbusValue(),
    uint32(2).asDbusValue(),
  ]))
  assert val.kind == dtStruct
  assert val.structValues.len == 2
  assert val.structValues[0].asNative(string) == "hi"
  assert val.structValues[1].asNative(uint32) == 2

test "tables":
  let val = testEcho({"a":"b"}.toTable())
  assert val.kind == dtArray
  assert val.arrayValueType.kind == dtDictEntry
  # assert val.arrayValueType.keyType.kind == dtString
  # assert val.arrayValueType.valueType.kind == dtString
  assert val.arrayValue[0].dictKey.asNative(string) == "a"
  assert val.arrayValue[0].dictValue.asNative(string) == "b"

test "notify":
  let bus = getBus(DBUS_BUS_SESSION)
  var msg = makeCall("org.freedesktop.Notifications",
              ObjectPath("/org/freedesktop/Notifications"),
              "org.freedesktop.Notifications",
              "Notify")

  msg.append("nim-dbus")
  msg.append(0'u32)
  msg.append("dialog-information")
  msg.append("Test notification")
  msg.append("Test notification body")
  msg.append(newSeq[string]())
  msg.append({"urgency": newVariant(1'u8)}.toTable)
  msg.append(-1'i32)

  let pending = bus.sendMessage(msg)

