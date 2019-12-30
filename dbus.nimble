# Package

version       = "0.0.1"
author        = "Michał Zieliński <michal@zielinscy.org.pl>"
description   = "dbus bindings for Nim"
license       = "MIT"

# Dependecies

requires "nim >= 0.19.0"
requires "c2nim"


task test, "Run integration tests":
  exec "nim c --path:. -r dbus/private/tests/basic.nim"
  exec "nim c --path:. -r dbus/private/tests/basic_use_wrapper.nim"
  exec "nim c --path:. -r dbus/private/tests/basic_variant.nim"
  exec "nim c --path:. -r dbus/private/tests/basic_wrapper.nim"
  exec "nim c --path:. -r dbus/private/tests/notify.nim"
