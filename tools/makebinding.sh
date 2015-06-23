#!/bin/sh
set -e

(cd include &&
    cpp -C -I. dbus/dbus.h > lowlevel.h)

(cd dbus && c2nim --header ../include/lowlevel.h)
