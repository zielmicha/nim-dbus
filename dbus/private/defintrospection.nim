import sequtils

proc Introspect(obj: DbusObjectImpl): string =
  "<!-- nim-dbus -->" & $newXmlTree("node", map(obj.interfaceDefs, proc(a: auto): XmlNode = a()))

let introspectableDef = newInterfaceDef(DbusObjectImpl)
introspectableDef.addMethod(Introspect,
                            [], [("xml_data", string)])

proc enableIntrospection*(obj: DbusObjectImpl) =
  let introspectImpl = newObjectImpl(obj.bus)
  obj.addInterface("org.freedesktop.DBus.Introspectable", introspectableDef, obj)
