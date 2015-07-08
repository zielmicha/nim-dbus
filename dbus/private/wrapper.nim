
type DbusIfaceWrapper* = object {.inheritable.}
  uniqueBus*: UniqueBus
  path*: ObjectPath
