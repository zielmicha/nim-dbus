#!/bin/sh
set -e

cpp -C -I. dbus/dbus.h > dbus_lowlevel.h
c2nim --header dbus_lowlevel.h
nim c dbus_lowlevel.nim
