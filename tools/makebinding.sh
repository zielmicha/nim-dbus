#!/bin/sh
set -e

(cat dbus/lowlevel_start.h &&
    cd include &&
    cpp -C -I. dbus/dbus.h) > dbus/lowlevel.h

c2nim --cdecl --concat --dynlib:'libdbus' dbus/lowlevel.h
