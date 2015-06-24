#!/bin/sh
set -e

(cd include &&
    cpp -C -I. dbus/dbus.h > ../dbus/lowlevel.h)

c2nim --header dbus/lowlevel.h
