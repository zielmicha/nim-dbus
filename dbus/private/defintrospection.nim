
proc Introspect(obj: DbusObjectImpl): string =
  return $newXmlTree("node", obj.interfaceDefs)

let introspectableDef = newInterfaceDef(DbusObjectImpl)
introspectableDef.addMethod(Introspect,
                            [], [("xml_data", string)])

proc enableIntrospection*(obj: DbusObjectImpl) =
  let introspectImpl = newObjectImpl(obj.bus)
  obj.addInterface("org.freedesktop.DBus.Introspectable", introspectableDef, obj)
