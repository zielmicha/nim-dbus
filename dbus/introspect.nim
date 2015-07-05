import xmltree, xmlparser, streams, strtabs
import dbus

proc parseXml*(content: string): XmlNode =
  xmlparser.parseXml(streams.newStringStream(content))

type ArgDef* = tuple[name: string, kind: DbusType]

type MethodDef* = object
  name*: string
  inargs*: seq[ArgDef]
  outargs*: seq[ArgDef]

proc parseMethod(item: XmlNode): MethodDef =
  result.name = item.attrs["name"]
  result.inargs = @[]
  result.outargs = @[]
  for attr in item.items:
    if attr.tag == "arg":
      let direction = attr.attrs["direction"]
      let kind = parseDbusType(attr.attrs["type"])
      let name = attr.attrs["name"]
      let def: ArgDef = (name: name, kind: kind)
      if direction == "in" or direction == nil:
        result.inargs.add(def)
      else:
        result.outargs.add(def)

proc getMethods*(xml: XmlNode): seq[MethodDef] =
  result = @[]
  for item in xml.items:
    if item.tag == "method":
      result.add parseMethod(item)

proc getInterfaceName*(xml: XmlNode): string =
  xml.attrs["name"]
