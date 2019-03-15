
type DbusIfaceWrapper* {.inheritable.} = object
  uniqueBus*: UniqueBus
  path*: ObjectPath
