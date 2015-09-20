import macros

proc generateArgsDesc(args: NimNode): NimNode {.compileTime.} =
  let body = newNimNode(nnkBracket)
  assert args.kind == nnkBracket
  for arg in args.children:
    assert arg.kind == nnkPar
    assert arg.len == 2
    let argName = arg[0]
    let argType = arg[1]
    let infoTuple = newNimNode(nnkPar)
    infoTuple.add arg[0]
    infoTuple.add newCall(newIdentNode("getAnyDbusType"), arg[1])
    body.add infoTuple
  result = newNimNode(nnkPrefix)
  result.add(newIdentNode(!"@"))
  result.add(body)

proc newBracketExpr(arr: NimNode, index: NimNode): NimNode {.compileTime.} =
  result = newNimNode(nnkBracketExpr)
  result.add(arr)
  result.add(index)

macro addMethod*(ifaceDef, funcName, inargs, outargs): stmt =
  echo "addMethod:"

  let methodDef = parseExpr("MethodDef(name: nil, inargs: nil, outargs: nil)")
  methodDef[1][1] = newStrLitNode($funcName)
  methodDef[2][1] = generateArgsDesc(inargs)
  methodDef[3][1] = generateArgsDesc(outargs)

  let wrapperBody = newStmtList()

  proc newAssertEquals(a: NimNode, b: NimNode): NimNode =
    return newCall(newIdentNode("assert"),
                  infix(a, "==", b))

  wrapperBody.add(newAssertEquals(
                                      newCall(newIdentNode("len"), newIdentNode("args")),
                                      newIntLitNode(inargs.len)))

  dumpTree:
    let a = 5

  let call = newCall(funcName, newIdentNode("obj"))

  for i in 0..<inargs.len:
    let argVal = newCall(newIdentNode("asNative"),
                         newBracketExpr(newIdentNode("args"), newIntLitNode(i)),
                         inargs[i][1])
    call.add(argVal)

  if outargs.len != 0:
    let letSection = newNimNode(nnkLetSection)
    let letDefs = newNimNode(nnkIdentDefs)
    letDefs.add newIdentNode("ret"), newEmptyNode(), call
    letSection.add letDefs

    wrapperBody.add letSection
  else:
    wrapperBody.add call

  let returnList = newNimNode(nnkBracket)

  for i in 0..<outargs.len:
    var val: NimNode
    if outargs.len == 1:
      val = newIdentNode("ret")
    else:
      val = newBracketExpr(newIdentNode("ret"), newIntLitNode(i))

    returnList.add newCall(newIdentNode("asDbusValue"), val)

  let returnExpr = newNimNode(nnkPrefix)
  returnExpr.add newIdentNode(!"@")
  returnExpr.add returnList

  let returnStmt = newNimNode(nnkReturnStmt)
  returnStmt.add returnExpr

  wrapperBody.add returnStmt

  let wrapper = parseExpr("(proc(obj: auto, args: seq[DbusValue]): seq[DbusValue] = nil)")
  wrapper[0][^1] = wrapperBody

  result = newCall(newIdentNode("addMethodRaw"),
                                ifaceDef, methodDef, wrapper)
  result.repr.echo
