import json

type MatrixError* {.pure.} = ref object of CatchableError
  errcode*: string
  error*: string

proc buildMxError*(body: string): MatrixError =
  var data = parseJson(body)
  var message = data["error"].getStr()
  var code = data["errcode"].getStr()
  return MatrixError(errcode: code, error: message)
