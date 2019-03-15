import 
  dbus/private/findlib

# Copyright (C) 1991-2015 Free Software Foundation, Inc.
#   This file is part of the GNU C Library.
#
#   The GNU C Library is free software; you can redistribute it and/or
#   modify it under the terms of the GNU Lesser General Public
#   License as published by the Free Software Foundation; either
#   version 2.1 of the License, or (at your option) any later version.
#
#   The GNU C Library is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#   Lesser General Public License for more details.
#
#   You should have received a copy of the GNU Lesser General Public
#   License along with the GNU C Library; if not, see
#   <http://www.gnu.org/licenses/>.  
# This header is separate from features.h so that the compiler can
#   include it implicitly at the start of every compilation.  It must
#   not itself include <features.h> or any other header that includes
#   <features.h> because the implicit include comes before any feature
#   test macros that may be defined in a source file before it first
#   explicitly includes a system header.  GCC knows the name of this
#   header in order to preinclude it.  
# glibc's intent is to support the IEC 559 math functionality, real
#   and complex.  If the GCC (4.9 and later) predefined macros
#   specifying compiler intent are available, use them to determine
#   whether the overall intent is to support these features; otherwise,
#   presume an older compiler has intent to support these features and
#   define these macros by default.  

# wchar_t uses ISO/IEC 10646 (2nd ed., published 2011-03-15) /
#   Unicode 6.0.  
# We do not support C11 <threads.h>.  

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus.h  Convenience header including all other headers
# 
#  Copyright (C) 2002, 2003  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu" -*- 
# dbus-arch-deps.h Header with architecture/compiler specific information, installed to libdir
# 
#  Copyright (C) 2003 Red Hat, Inc.
# 
#  Licensed under the Academic Free License version 2.0
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-macros.h  generic macros
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

#* @def _DBUS_GNUC_PRINTF
#  used to tell gcc about printf format strings
# 
#* @def _DBUS_GNUC_NORETURN
#  used to tell gcc about functions that never return, such as _dbus_abort()
# 
# Normally docs are in .c files, but there isn't a .c file for this. 
#*
#  @defgroup DBusMacros Utility macros
#  @ingroup  DBus
#  @brief #TRUE, #FALSE, #NULL, and so on
# 
#  Utility macros.
# 
#  @{
# 
#*
#  @def DBUS_BEGIN_DECLS
# 
#  Macro used prior to declaring functions in the D-Bus header
#  files. Expands to "extern "C"" when using a C++ compiler,
#  and expands to nothing when using a C compiler.
# 
#  Please don't use this in your own code, consider it
#  D-Bus internal.
# 
#*
#  @def DBUS_END_DECLS
# 
#  Macro used after declaring functions in the D-Bus header
#  files. Expands to "}" when using a C++ compiler,
#  and expands to nothing when using a C compiler.
# 
#  Please don't use this in your own code, consider it
#  D-Bus internal.
# 
#*
#  @def TRUE
# 
#  Expands to "1"
# 
#*
#  @def FALSE
# 
#  Expands to "0"
# 
#*
#  @def NULL
# 
#  A null pointer, defined appropriately for C or C++.
# 
#*
#  @def DBUS_DEPRECATED
# 
#  Tells the compiler to warn about a function or type if it's used.
#  Code marked in this way should also be enclosed in
#  @code
#  #ifndef DBUS_DISABLE_DEPRECATED
#   deprecated stuff here
#  #endif
#  @endcode
# 
#  Please don't use this in your own code, consider it
#  D-Bus internal.
# 
#*
#  @def _DBUS_GNUC_EXTENSION
# 
#  Tells gcc not to warn about extensions to the C standard in the
#  following expression, even if compiling with -pedantic. Do not use
#  this macro in your own code; please consider it to be internal to libdbus.
# 
#
#  @def DBUS_EXPORT
# 
#  Declare the following symbol as public.  This is currently a noop on
#  platforms other than Windows.
# 

#* @} 

type 
  dbus_int64_t* = clong
  dbus_uint64_t* = culong
  dbus_int32_t* = cint
  dbus_uint32_t* = cuint
  dbus_int16_t* = cshort
  dbus_uint16_t* = cushort

# This is not really arch-dependent, but it's not worth
#  creating an additional generated header just for this
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-address.h  Server address parser.
# 
#  Copyright (C) 2003  CodeFactory AB
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-types.h  types such as dbus_bool_t
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 
##include <stddef.h>

# -*- mode: C; c-file-style: "gnu" -*- 
# dbus-arch-deps.h Header with architecture/compiler specific information, installed to libdir
# 
#  Copyright (C) 2003 Red Hat, Inc.
# 
#  Licensed under the Academic Free License version 2.0
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

type 
  dbus_unichar_t* = dbus_uint32_t

# boolean size must be fixed at 4 bytes due to wire protocol! 

type 
  dbus_bool_t* = dbus_uint32_t

# Normally docs are in .c files, but there isn't a .c file for this. 
#*
#  @defgroup DBusTypes Basic types
#  @ingroup  DBus
#  @brief dbus_bool_t, dbus_int32_t, etc.
# 
#  Typedefs for common primitive types.
# 
#  @{
# 
#*
#  @typedef dbus_bool_t
# 
#  A boolean, valid values are #TRUE and #FALSE.
# 
#*
#  @typedef dbus_uint32_t
# 
#  A 32-bit unsigned integer on all platforms.
# 
#*
#  @typedef dbus_int32_t
# 
#  A 32-bit signed integer on all platforms.
# 
#*
#  @typedef dbus_uint16_t
# 
#  A 16-bit unsigned integer on all platforms.
# 
#*
#  @typedef dbus_int16_t
# 
#  A 16-bit signed integer on all platforms.
# 
#*
#  @typedef dbus_uint64_t
# 
#  A 64-bit unsigned integer on all platforms that support it.
#  If supported, #DBUS_HAVE_INT64 will be defined.
# 
#  C99 requires a 64-bit type and most likely all interesting
#  compilers support one. GLib for example flat-out requires
#  a 64-bit type.
# 
#  You probably want to just assume #DBUS_HAVE_INT64 is always defined.
# 
#*
#  @typedef dbus_int64_t
# 
#  A 64-bit signed integer on all platforms that support it.
#  If supported, #DBUS_HAVE_INT64 will be defined.
# 
#  C99 requires a 64-bit type and most likely all interesting
#  compilers support one. GLib for example flat-out requires
#  a 64-bit type.
# 
#  You probably want to just assume #DBUS_HAVE_INT64 is always defined.
# 
#*
#  @def DBUS_HAVE_INT64
# 
#  Defined if 64-bit integers are available. Will be defined
#  on any platform you care about, unless you care about
#  some truly ancient UNIX, or some bizarre embedded platform.
# 
#  C99 requires a 64-bit type and most likely all interesting
#  compilers support one. GLib for example flat-out requires
#  a 64-bit type.
# 
#  You should feel comfortable ignoring this macro and just using
#  int64 unconditionally.
# 
# 
#*
#  @def DBUS_INT64_CONSTANT
# 
#  Declare a 64-bit signed integer constant. The macro
#  adds the necessary "LL" or whatever after the integer,
#  giving a literal such as "325145246765LL"
# 
#*
#  @def DBUS_UINT64_CONSTANT
# 
#  Declare a 64-bit unsigned integer constant. The macro
#  adds the necessary "ULL" or whatever after the integer,
#  giving a literal such as "325145246765ULL"
# 
#*
#  An 8-byte struct you could use to access int64 without having
#  int64 support
# 

type 
  DBus8ByteStruct* = object 
    first32*: dbus_uint32_t   #*< first 32 bits in the 8 bytes (beware endian issues) 
    second32*: dbus_uint32_t  #*< second 32 bits in the 8 bytes (beware endian issues) 
  

#*
#  A simple value union that lets you access bytes as if they
#  were various types; useful when dealing with basic types via
#  void pointers and varargs.
# 
#  This union also contains a pointer member (which can be used
#  to retrieve a string from dbus_message_iter_get_basic(), for
#  instance), so on future platforms it could conceivably be larger
#  than 8 bytes.
# 

type 
  DBusBasicValue* {.union.} = object
    bytes*: array[8, cuchar]  #*< as 8 individual bytes 
    i16*: dbus_int16_t        #*< as int16 
    u16*: dbus_uint16_t       #*< as int16 
    i32*: dbus_int32_t        #*< as int32 
    u32*: dbus_uint32_t       #*< as int32 
    bool_val*: dbus_bool_t    #*< as boolean 
    i64*: dbus_int64_t        #*< as int64 
    u64*: dbus_uint64_t       #*< as int64 
    eight*: DBus8ByteStruct   #*< as 8-byte struct 
    dbl*: cdouble             #*< as double 
    byt*: cuchar              #*< as byte 
    str*: cstring             #*< as char* (string, object path or signature) 
    fd*: cint                 #*< as Unix file descriptor 
  

#* @} 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-errors.h Error reporting
# 
#  Copyright (C) 2002  Red Hat Inc.
#  Copyright (C) 2003  CodeFactory AB
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-macros.h  generic macros
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-types.h  types such as dbus_bool_t
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-protocol.h  D-Bus protocol constants
# 
#  Copyright (C) 2002, 2003  CodeFactory AB
#  Copyright (C) 2004, 2005 Red Hat, Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 
# Don't include anything in here from anywhere else. It's
#  intended for use by any random library.
# 

# Normally docs are in .c files, but there isn't a .c file for this. 
#*
#  @defgroup DBusProtocol Protocol constants
#  @ingroup  DBus
# 
#  @brief Defines constants which are part of the D-Bus protocol
# 
#  This header is intended for use by any library, not only libdbus.
# 
#  @{
# 
# Message byte order 
#* Protocol version. 
#* Type code that is never equal to a legitimate type code 
#* #DBUS_TYPE_INVALID as a string literal instead of a int literal 
# Primitive types 
#* Type code marking an 8-bit unsigned integer 
#* #DBUS_TYPE_BYTE as a string literal instead of a int literal 
#* Type code marking a boolean 
#* #DBUS_TYPE_BOOLEAN as a string literal instead of a int literal 
#* Type code marking a 16-bit signed integer 
#* #DBUS_TYPE_INT16 as a string literal instead of a int literal 
#* Type code marking a 16-bit unsigned integer 
#* #DBUS_TYPE_UINT16 as a string literal instead of a int literal 
#* Type code marking a 32-bit signed integer 
#* #DBUS_TYPE_INT32 as a string literal instead of a int literal 
#* Type code marking a 32-bit unsigned integer 
#* #DBUS_TYPE_UINT32 as a string literal instead of a int literal 
#* Type code marking a 64-bit signed integer 
#* #DBUS_TYPE_INT64 as a string literal instead of a int literal 
#* Type code marking a 64-bit unsigned integer 
#* #DBUS_TYPE_UINT64 as a string literal instead of a int literal 
#* Type code marking an 8-byte double in IEEE 754 format 
#* #DBUS_TYPE_DOUBLE as a string literal instead of a int literal 
#* Type code marking a UTF-8 encoded, nul-terminated Unicode string 
#* #DBUS_TYPE_STRING as a string literal instead of a int literal 
#* Type code marking a D-Bus object path 
#* #DBUS_TYPE_OBJECT_PATH as a string literal instead of a int literal 
#* Type code marking a D-Bus type signature 
#* #DBUS_TYPE_SIGNATURE as a string literal instead of a int literal 
#* Type code marking a unix file descriptor 
#* #DBUS_TYPE_UNIX_FD as a string literal instead of a int literal 
# Compound types 
#* Type code marking a D-Bus array type 
#* #DBUS_TYPE_ARRAY as a string literal instead of a int literal 
#* Type code marking a D-Bus variant type 
#* #DBUS_TYPE_VARIANT as a string literal instead of a int literal 
#* STRUCT and DICT_ENTRY are sort of special since their codes can't
#  appear in a type string, instead
#  DBUS_STRUCT_BEGIN_CHAR/DBUS_DICT_ENTRY_BEGIN_CHAR have to appear
# 
#* Type code used to represent a struct; however, this type code does not appear
#  in type signatures, instead #DBUS_STRUCT_BEGIN_CHAR and #DBUS_STRUCT_END_CHAR will
#  appear in a signature.
# 
#* #DBUS_TYPE_STRUCT as a string literal instead of a int literal 
#* Type code used to represent a dict entry; however, this type code does not appear
#  in type signatures, instead #DBUS_DICT_ENTRY_BEGIN_CHAR and #DBUS_DICT_ENTRY_END_CHAR will
#  appear in a signature.
# 
#* #DBUS_TYPE_DICT_ENTRY as a string literal instead of a int literal 
#* Does not include #DBUS_TYPE_INVALID, #DBUS_STRUCT_BEGIN_CHAR, #DBUS_STRUCT_END_CHAR,
#  #DBUS_DICT_ENTRY_BEGIN_CHAR, or #DBUS_DICT_ENTRY_END_CHAR - i.e. it is the number of
#  valid types, not the number of distinct characters that may appear in a type signature.
# 
# characters other than typecodes that appear in type signatures 
#* Code marking the start of a struct type in a type signature 
#* #DBUS_STRUCT_BEGIN_CHAR as a string literal instead of a int literal 
#* Code marking the end of a struct type in a type signature 
#* #DBUS_STRUCT_END_CHAR a string literal instead of a int literal 
#* Code marking the start of a dict entry type in a type signature 
#* #DBUS_DICT_ENTRY_BEGIN_CHAR as a string literal instead of a int literal 
#* Code marking the end of a dict entry type in a type signature 
#* #DBUS_DICT_ENTRY_END_CHAR as a string literal instead of a int literal 
#* Max length in bytes of a bus name, interface, or member (not object
#  path, paths are unlimited). This is limited because lots of stuff
#  is O(n) in this number, plus it would be obnoxious to type in a
#  paragraph-long method name so most likely something like that would
#  be an exploit.
# 
#* This one is 255 so it fits in a byte 
#* Max length of a match rule string; to keep people from hosing the
#  daemon with some huge rule
# 
#* Max arg number you can match on in a match rule, e.g.
#  arg0='hello' is OK, arg3489720987='hello' is not
# 
#* Max length of a marshaled array in bytes (64M, 2^26) We use signed
#  int for lengths so must be INT_MAX or less.  We need something a
#  bit smaller than INT_MAX because the array is inside a message with
#  header info, etc.  so an INT_MAX array wouldn't allow the message
#  overhead.  The 64M number is an attempt at a larger number than
#  we'd reasonably ever use, but small enough that your bus would chew
#  through it fairly quickly without locking up forever. If you have
#  data that's likely to be larger than this, you should probably be
#  sending it in multiple incremental messages anyhow.
# 
#* Number of bits you need in an unsigned to store the max array size 
#* The maximum total message size including header and body; similar
#  rationale to max array size.
# 
#* Number of bits you need in an unsigned to store the max message size 
#* The maximum total number of unix fds in a message. Similar
#  rationale as DBUS_MAXIMUM_MESSAGE_LENGTH. However we divide by four
#  given that one fd is an int and hence at least 32 bits.
# 
#* Number of bits you need in an unsigned to store the max message unix fds 
#* Depth of recursion in the type tree. This is automatically limited
#  to DBUS_MAXIMUM_SIGNATURE_LENGTH since you could only have an array
#  of array of array of ... that fit in the max signature.  But that's
#  probably a bit too large.
# 
# Types of message 
#* This value is never a valid message type, see dbus_message_get_type() 
#* Message type of a method call message, see dbus_message_get_type() 
#* Message type of a method return message, see dbus_message_get_type() 
#* Message type of an error reply message, see dbus_message_get_type() 
#* Message type of a signal message, see dbus_message_get_type() 
# Header flags 
#* If set, this flag means that the sender of a message does not care about getting
#  a reply, so the recipient need not send one. See dbus_message_set_no_reply().
# 
#*
#  If set, this flag means that even if the message bus knows how to start an owner for
#  the destination bus name (see dbus_message_set_destination()), it should not
#  do so. If this flag is not set, the bus may launch a program to process the
#  message.
# 
# Header fields 
#* Not equal to any valid header field code 
#* Header field code for the path - the path is the object emitting a signal or the object receiving a method call.
#  See dbus_message_set_path().
# 
#* Header field code for the interface containing a member (method or signal).
#  See dbus_message_set_interface().
# 
#* Header field code for a member (method or signal). See dbus_message_set_member(). 
#* Header field code for an error name (found in #DBUS_MESSAGE_TYPE_ERROR messages).
#  See dbus_message_set_error_name().
# 
#* Header field code for a reply serial, used to match a #DBUS_MESSAGE_TYPE_METHOD_RETURN message with the
#  message that it's a reply to. See dbus_message_set_reply_serial().
# 
#*
#  Header field code for the destination bus name of a message. See dbus_message_set_destination().
# 
#*
#  Header field code for the sender of a message; usually initialized by the message bus.
#  See dbus_message_set_sender().
# 
#*
#  Header field code for the type signature of a message.
# 
#*
#  Header field code for the number of unix file descriptors associated
#  with this message.
# 
#*
#  Value of the highest-numbered header field code, can be used to determine
#  the size of an array indexed by header field code. Remember though
#  that unknown codes must be ignored, so check for that before
#  indexing the array.
# 
#* Header format is defined as a signature:
#    byte                            byte order
#    byte                            message type ID
#    byte                            flags
#    byte                            protocol version
#    uint32                          body length
#    uint32                          serial
#    array of struct (byte,variant)  (field name, value)
# 
#  The length of the header can be computed as the
#  fixed size of the initial data, plus the length of
#  the array at the end, plus padding to an 8-boundary.
# 

#*
#  The smallest header size that can occur.  (It won't be valid due to
#  missing required header fields.) This is 4 bytes, two uint32, an
#  array length. This isn't any kind of resource limit, just the
#  necessary/logical outcome of the header signature.
# 
# Errors 
# WARNING these get autoconverted to an enum in dbus-glib.h. Thus,
#  if you change the order it breaks the ABI. Keep them in order.
#  Also, don't change the formatting since that will break the sed
#  script.
# 
#* A generic error; "something went wrong" - see the error message for more. 
#* There was not enough memory to complete an operation. 
#* The bus doesn't know how to launch a service to supply the bus name you wanted. 
#* The bus name you referenced doesn't exist (i.e. no application owns it). 
#* No reply to a message expecting one, usually means a timeout occurred. 
#* Something went wrong reading or writing to a socket, for example. 
#* A D-Bus bus address was malformed. 
#* Requested operation isn't supported (like ENOSYS on UNIX). 
#* Some limited resource is exhausted. 
#* Security restrictions don't allow doing what you're trying to do. 
#* Authentication didn't work. 
#* Unable to connect to server (probably caused by ECONNREFUSED on a socket). 
#* Certain timeout errors, possibly ETIMEDOUT on a socket.
#  Note that #DBUS_ERROR_NO_REPLY is used for message reply timeouts.
#  @warning this is confusingly-named given that #DBUS_ERROR_TIMED_OUT also exists. We can't fix
#  it for compatibility reasons so just be careful.
# 
#* No network access (probably ENETUNREACH on a socket). 
#* Can't bind a socket since its address is in use (i.e. EADDRINUSE). 
#* The connection is disconnected and you're trying to use it. 
#* Invalid arguments passed to a method call. 
#* Missing file. 
#* Existing file and the operation you're using does not silently overwrite. 
#* Method name you invoked isn't known by the object you invoked it on. 
#* Object you invoked a method on isn't known. 
#* Interface you invoked a method on isn't known by the object. 
#* Property you tried to access isn't known by the object. 
#* Property you tried to set is read-only. 
#* Certain timeout errors, e.g. while starting a service.
#  @warning this is confusingly-named given that #DBUS_ERROR_TIMEOUT also exists. We can't fix
#  it for compatibility reasons so just be careful.
# 
#* Tried to remove or modify a match rule that didn't exist. 
#* The match rule isn't syntactically valid. 
#* While starting a new process, the exec() call failed. 
#* While starting a new process, the fork() call failed. 
#* While starting a new process, the child exited with a status code. 
#* While starting a new process, the child exited on a signal. 
#* While starting a new process, something went wrong. 
#* We failed to setup the environment correctly. 
#* We failed to setup the config parser correctly. 
#* Bus name was not valid. 
#* Service file not found in system-services directory. 
#* Permissions are incorrect on the setuid helper. 
#* Service file invalid (Name, User or Exec missing). 
#* Tried to get a UNIX process ID and it wasn't available. 
#* Tried to get a UNIX process ID and it wasn't available. 
#* A type signature is not valid. 
#* A file contains invalid syntax or is otherwise broken. 
#* Asked for SELinux security context and it wasn't available. 
#* Asked for AppArmor security context and it wasn't available. 
#* Asked for ADT audit data and it wasn't available. 
#* There's already an object with the requested object path. 
#* The message meta data does not match the payload. e.g. expected
#    number of file descriptors were not sent over the socket this message was received on. 
# XML introspection format 
#* XML namespace of the introspection format version 1.0 
#* XML public identifier of the introspection format version 1.0 
#* XML system identifier of the introspection format version 1.0 
#* XML document type declaration of the introspection format version 1.0 
#* @} 

#*
#  @addtogroup DBusErrors
#  @{
# 
#* Mostly-opaque type representing an error that occurred 


#*
#  Object representing an exception.
# 

type 
  DBusError* = object 
    name*: cstring            #*< public error name field 
    message*: cstring         #*< public error message field 
    dummy5bits*: cuint        #*< placeholder 
    padding1*: pointer        #*< placeholder 
  

proc dbus_error_init*(error: ptr DBusError) {.cdecl, importc: "dbus_error_init", 
    dynlib: libdbus.}
proc dbus_error_free*(error: ptr DBusError) {.cdecl, importc: "dbus_error_free", 
    dynlib: libdbus.}
proc dbus_set_error*(error: ptr DBusError; name: cstring; message: cstring) {.
    varargs, cdecl, importc: "dbus_set_error", dynlib: libdbus.}
proc dbus_set_error_const*(error: ptr DBusError; name: cstring; message: cstring) {.
    cdecl, importc: "dbus_set_error_const", dynlib: libdbus.}
proc dbus_move_error*(src: ptr DBusError; dest: ptr DBusError) {.cdecl, 
    importc: "dbus_move_error", dynlib: libdbus.}
proc dbus_error_has_name*(error: ptr DBusError; name: cstring): dbus_bool_t {.
    cdecl, importc: "dbus_error_has_name", dynlib: libdbus.}
proc dbus_error_is_set*(error: ptr DBusError): dbus_bool_t {.cdecl, 
    importc: "dbus_error_is_set", dynlib: libdbus.}
#* @} 

#*
#  @addtogroup DBusAddress
#  @{
# 
#* Opaque type representing one of the semicolon-separated items in an address 

type 
  DBusAddressEntry* = object 
  

proc dbus_parse_address*(address: cstring; entry: ptr ptr ptr DBusAddressEntry; 
                         array_len: ptr cint; error: ptr DBusError): dbus_bool_t {.
    cdecl, importc: "dbus_parse_address", dynlib: libdbus.}
proc dbus_address_entry_get_value*(entry: ptr DBusAddressEntry; key: cstring): cstring {.
    cdecl, importc: "dbus_address_entry_get_value", dynlib: libdbus.}
proc dbus_address_entry_get_method*(entry: ptr DBusAddressEntry): cstring {.
    cdecl, importc: "dbus_address_entry_get_method", dynlib: libdbus.}
proc dbus_address_entries_free*(entries: ptr ptr DBusAddressEntry) {.cdecl, 
    importc: "dbus_address_entries_free", dynlib: libdbus.}
proc dbus_address_escape_value*(value: cstring): cstring {.cdecl, 
    importc: "dbus_address_escape_value", dynlib: libdbus.}
proc dbus_address_unescape_value*(value: cstring; error: ptr DBusError): cstring {.
    cdecl, importc: "dbus_address_unescape_value", dynlib: libdbus.}
#* @} 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-bus.h  Convenience functions for communicating with the bus.
# 
#  Copyright (C) 2003  CodeFactory AB
# 
#  Licensed under the Academic Free License version 2.1
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-connection.h DBusConnection object
# 
#  Copyright (C) 2002, 2003  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-errors.h Error reporting
# 
#  Copyright (C) 2002  Red Hat Inc.
#  Copyright (C) 2003  CodeFactory AB
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-memory.h  D-Bus memory handling
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-macros.h  generic macros
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

##include <stddef.h>
#*
#  @addtogroup DBusMemory
#  @{
# 

proc dbus_malloc*(bytes: csize): pointer {.cdecl, importc: "dbus_malloc", 
    dynlib: libdbus.}
proc dbus_malloc0*(bytes: csize): pointer {.cdecl, importc: "dbus_malloc0", 
    dynlib: libdbus.}
proc dbus_realloc*(memory: pointer; bytes: csize): pointer {.cdecl, 
    importc: "dbus_realloc", dynlib: libdbus.}
proc dbus_free*(memory: pointer) {.cdecl, importc: "dbus_free", dynlib: libdbus.}
proc dbus_free_string_array*(str_array: cstringArray) {.cdecl, 
    importc: "dbus_free_string_array", dynlib: libdbus.}
type 
  DBusFreeFunction* = proc (memory: pointer) {.cdecl.}

proc dbus_shutdown*() {.cdecl, importc: "dbus_shutdown", dynlib: libdbus.}
#* @} 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-message.h DBusMessage object
# 
#  Copyright (C) 2002, 2003, 2005 Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-macros.h  generic macros
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-types.h  types such as dbus_bool_t
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu" -*- 
# dbus-arch-deps.h Header with architecture/compiler specific information, installed to libdir
# 
#  Copyright (C) 2003 Red Hat, Inc.
# 
#  Licensed under the Academic Free License version 2.0
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-memory.h  D-Bus memory handling
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-errors.h Error reporting
# 
#  Copyright (C) 2002  Red Hat Inc.
#  Copyright (C) 2003  CodeFactory AB
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

##include <stdarg.h>
#*
#  @addtogroup DBusMessage
#  @{
# 

type 
  DBusMessage* = object 
  

#* Opaque type representing a message iterator. Can be copied by value, and contains no allocated memory so never needs to be freed and can be allocated on the stack. 

#*
#  DBusMessageIter struct; contains no public fields.
# 

type 
  DBusMessageIter* = object 
    dummy1*: pointer          #*< Don't use this 
    dummy2*: pointer          #*< Don't use this 
    dummy3*: dbus_uint32_t    #*< Don't use this 
    dummy4*: cint             #*< Don't use this 
    dummy5*: cint             #*< Don't use this 
    dummy6*: cint             #*< Don't use this 
    dummy7*: cint             #*< Don't use this 
    dummy8*: cint             #*< Don't use this 
    dummy9*: cint             #*< Don't use this 
    dummy10*: cint            #*< Don't use this 
    dummy11*: cint            #*< Don't use this 
    pad1*: cint               #*< Don't use this 
    pad2*: cint               #*< Don't use this 
    pad3*: pointer            #*< Don't use this 
  

proc dbus_message_new*(message_type: cint): ptr DBusMessage {.cdecl, 
    importc: "dbus_message_new", dynlib: libdbus.}
proc dbus_message_new_method_call*(bus_name: cstring; path: cstring; 
                                   iface: cstring; `method`: cstring): ptr DBusMessage {.
    cdecl, importc: "dbus_message_new_method_call", dynlib: libdbus.}
proc dbus_message_new_method_return*(method_call: ptr DBusMessage): ptr DBusMessage {.
    cdecl, importc: "dbus_message_new_method_return", dynlib: libdbus.}
proc dbus_message_new_signal*(path: cstring; iface: cstring; name: cstring): ptr DBusMessage {.
    cdecl, importc: "dbus_message_new_signal", dynlib: libdbus.}
proc dbus_message_new_error*(reply_to: ptr DBusMessage; error_name: cstring; 
                             error_message: cstring): ptr DBusMessage {.cdecl, 
    importc: "dbus_message_new_error", dynlib: libdbus.}
proc dbus_message_new_error_printf*(reply_to: ptr DBusMessage; 
                                    error_name: cstring; error_format: cstring): ptr DBusMessage {.
    varargs, cdecl, importc: "dbus_message_new_error_printf", dynlib: libdbus.}
proc dbus_message_copy*(message: ptr DBusMessage): ptr DBusMessage {.cdecl, 
    importc: "dbus_message_copy", dynlib: libdbus.}
proc dbus_message_ref*(message: ptr DBusMessage): ptr DBusMessage {.cdecl, 
    importc: "dbus_message_ref", dynlib: libdbus.}
proc dbus_message_unref*(message: ptr DBusMessage) {.cdecl, 
    importc: "dbus_message_unref", dynlib: libdbus.}
proc dbus_message_get_type*(message: ptr DBusMessage): cint {.cdecl, 
    importc: "dbus_message_get_type", dynlib: libdbus.}
proc dbus_message_set_path*(message: ptr DBusMessage; object_path: cstring): dbus_bool_t {.
    cdecl, importc: "dbus_message_set_path", dynlib: libdbus.}
proc dbus_message_get_path*(message: ptr DBusMessage): cstring {.cdecl, 
    importc: "dbus_message_get_path", dynlib: libdbus.}
proc dbus_message_has_path*(message: ptr DBusMessage; object_path: cstring): dbus_bool_t {.
    cdecl, importc: "dbus_message_has_path", dynlib: libdbus.}
proc dbus_message_set_interface*(message: ptr DBusMessage; iface: cstring): dbus_bool_t {.
    cdecl, importc: "dbus_message_set_interface", dynlib: libdbus.}
proc dbus_message_get_interface*(message: ptr DBusMessage): cstring {.cdecl, 
    importc: "dbus_message_get_interface", dynlib: libdbus.}
proc dbus_message_has_interface*(message: ptr DBusMessage; iface: cstring): dbus_bool_t {.
    cdecl, importc: "dbus_message_has_interface", dynlib: libdbus.}
proc dbus_message_set_member*(message: ptr DBusMessage; member: cstring): dbus_bool_t {.
    cdecl, importc: "dbus_message_set_member", dynlib: libdbus.}
proc dbus_message_get_member*(message: ptr DBusMessage): cstring {.cdecl, 
    importc: "dbus_message_get_member", dynlib: libdbus.}
proc dbus_message_has_member*(message: ptr DBusMessage; member: cstring): dbus_bool_t {.
    cdecl, importc: "dbus_message_has_member", dynlib: libdbus.}
proc dbus_message_set_error_name*(message: ptr DBusMessage; name: cstring): dbus_bool_t {.
    cdecl, importc: "dbus_message_set_error_name", dynlib: libdbus.}
proc dbus_message_get_error_name*(message: ptr DBusMessage): cstring {.cdecl, 
    importc: "dbus_message_get_error_name", dynlib: libdbus.}
proc dbus_message_set_destination*(message: ptr DBusMessage; 
                                   destination: cstring): dbus_bool_t {.cdecl, 
    importc: "dbus_message_set_destination", dynlib: libdbus.}
proc dbus_message_get_destination*(message: ptr DBusMessage): cstring {.cdecl, 
    importc: "dbus_message_get_destination", dynlib: libdbus.}
proc dbus_message_set_sender*(message: ptr DBusMessage; sender: cstring): dbus_bool_t {.
    cdecl, importc: "dbus_message_set_sender", dynlib: libdbus.}
proc dbus_message_get_sender*(message: ptr DBusMessage): cstring {.cdecl, 
    importc: "dbus_message_get_sender", dynlib: libdbus.}
proc dbus_message_get_signature*(message: ptr DBusMessage): cstring {.cdecl, 
    importc: "dbus_message_get_signature", dynlib: libdbus.}
proc dbus_message_set_no_reply*(message: ptr DBusMessage; no_reply: dbus_bool_t) {.
    cdecl, importc: "dbus_message_set_no_reply", dynlib: libdbus.}
proc dbus_message_get_no_reply*(message: ptr DBusMessage): dbus_bool_t {.cdecl, 
    importc: "dbus_message_get_no_reply", dynlib: libdbus.}
proc dbus_message_is_method_call*(message: ptr DBusMessage; iface: cstring; 
                                  `method`: cstring): dbus_bool_t {.cdecl, 
    importc: "dbus_message_is_method_call", dynlib: libdbus.}
proc dbus_message_is_signal*(message: ptr DBusMessage; iface: cstring; 
                             signal_name: cstring): dbus_bool_t {.cdecl, 
    importc: "dbus_message_is_signal", dynlib: libdbus.}
proc dbus_message_is_error*(message: ptr DBusMessage; error_name: cstring): dbus_bool_t {.
    cdecl, importc: "dbus_message_is_error", dynlib: libdbus.}
proc dbus_message_has_destination*(message: ptr DBusMessage; bus_name: cstring): dbus_bool_t {.
    cdecl, importc: "dbus_message_has_destination", dynlib: libdbus.}
proc dbus_message_has_sender*(message: ptr DBusMessage; unique_bus_name: cstring): dbus_bool_t {.
    cdecl, importc: "dbus_message_has_sender", dynlib: libdbus.}
proc dbus_message_has_signature*(message: ptr DBusMessage; signature: cstring): dbus_bool_t {.
    cdecl, importc: "dbus_message_has_signature", dynlib: libdbus.}
proc dbus_message_get_serial*(message: ptr DBusMessage): dbus_uint32_t {.cdecl, 
    importc: "dbus_message_get_serial", dynlib: libdbus.}
proc dbus_message_set_serial*(message: ptr DBusMessage; serial: dbus_uint32_t) {.
    cdecl, importc: "dbus_message_set_serial", dynlib: libdbus.}
proc dbus_message_set_reply_serial*(message: ptr DBusMessage; 
                                    reply_serial: dbus_uint32_t): dbus_bool_t {.
    cdecl, importc: "dbus_message_set_reply_serial", dynlib: libdbus.}
proc dbus_message_get_reply_serial*(message: ptr DBusMessage): dbus_uint32_t {.
    cdecl, importc: "dbus_message_get_reply_serial", dynlib: libdbus.}
proc dbus_message_set_auto_start*(message: ptr DBusMessage; 
                                  auto_start: dbus_bool_t) {.cdecl, 
    importc: "dbus_message_set_auto_start", dynlib: libdbus.}
proc dbus_message_get_auto_start*(message: ptr DBusMessage): dbus_bool_t {.
    cdecl, importc: "dbus_message_get_auto_start", dynlib: libdbus.}
proc dbus_message_get_path_decomposed*(message: ptr DBusMessage; 
                                       path: ptr cstringArray): dbus_bool_t {.
    cdecl, importc: "dbus_message_get_path_decomposed", dynlib: libdbus.}
proc dbus_message_append_args*(message: ptr DBusMessage; first_arg_type: cint): dbus_bool_t {.
    varargs, cdecl, importc: "dbus_message_append_args", dynlib: libdbus.}
#DBUS_EXPORT
#dbus_bool_t dbus_message_append_args_valist   (DBusMessage     *message,
#					       int              first_arg_type,
#					       va_list          var_args);

proc dbus_message_get_args*(message: ptr DBusMessage; error: ptr DBusError; 
                            first_arg_type: cint): dbus_bool_t {.varargs, cdecl, 
    importc: "dbus_message_get_args", dynlib: libdbus.}
#DBUS_EXPORT
#dbus_bool_t dbus_message_get_args_valist      (DBusMessage     *message,
#					       DBusError       *error,
#					       int              first_arg_type,
#					       va_list          var_args);

proc dbus_message_contains_unix_fds*(message: ptr DBusMessage): dbus_bool_t {.
    cdecl, importc: "dbus_message_contains_unix_fds", dynlib: libdbus.}
proc dbus_message_iter_init*(message: ptr DBusMessage; iter: ptr DBusMessageIter): dbus_bool_t {.
    cdecl, importc: "dbus_message_iter_init", dynlib: libdbus.}
proc dbus_message_iter_has_next*(iter: ptr DBusMessageIter): dbus_bool_t {.
    cdecl, importc: "dbus_message_iter_has_next", dynlib: libdbus.}
proc dbus_message_iter_next*(iter: ptr DBusMessageIter): dbus_bool_t {.cdecl, 
    importc: "dbus_message_iter_next", dynlib: libdbus.}
proc dbus_message_iter_get_signature*(iter: ptr DBusMessageIter): cstring {.
    cdecl, importc: "dbus_message_iter_get_signature", dynlib: libdbus.}
proc dbus_message_iter_get_arg_type*(iter: ptr DBusMessageIter): cint {.cdecl, 
    importc: "dbus_message_iter_get_arg_type", dynlib: libdbus.}
proc dbus_message_iter_get_element_type*(iter: ptr DBusMessageIter): cint {.
    cdecl, importc: "dbus_message_iter_get_element_type", dynlib: libdbus.}
proc dbus_message_iter_recurse*(iter: ptr DBusMessageIter; 
                                sub: ptr DBusMessageIter) {.cdecl, 
    importc: "dbus_message_iter_recurse", dynlib: libdbus.}
proc dbus_message_iter_get_basic*(iter: ptr DBusMessageIter; value: pointer) {.
    cdecl, importc: "dbus_message_iter_get_basic", dynlib: libdbus.}
# This function returns the wire protocol size of the array in bytes,
#  you do not want to know that probably
# 

proc dbus_message_iter_get_array_len*(iter: ptr DBusMessageIter): cint {.cdecl, 
    importc: "dbus_message_iter_get_array_len", dynlib: libdbus.}
proc dbus_message_iter_get_fixed_array*(iter: ptr DBusMessageIter; 
                                        value: pointer; n_elements: ptr cint) {.
    cdecl, importc: "dbus_message_iter_get_fixed_array", dynlib: libdbus.}
proc dbus_message_iter_init_append*(message: ptr DBusMessage; 
                                    iter: ptr DBusMessageIter) {.cdecl, 
    importc: "dbus_message_iter_init_append", dynlib: libdbus.}
proc dbus_message_iter_append_basic*(iter: ptr DBusMessageIter; `type`: cint; 
                                     value: pointer): dbus_bool_t {.cdecl, 
    importc: "dbus_message_iter_append_basic", dynlib: libdbus.}
proc dbus_message_iter_append_fixed_array*(iter: ptr DBusMessageIter; 
    element_type: cint; value: pointer; n_elements: cint): dbus_bool_t {.cdecl, 
    importc: "dbus_message_iter_append_fixed_array", dynlib: libdbus.}
proc dbus_message_iter_open_container*(iter: ptr DBusMessageIter; `type`: cint; 
                                       contained_signature: cstring; 
                                       sub: ptr DBusMessageIter): dbus_bool_t {.
    cdecl, importc: "dbus_message_iter_open_container", dynlib: libdbus.}
proc dbus_message_iter_close_container*(iter: ptr DBusMessageIter; 
                                        sub: ptr DBusMessageIter): dbus_bool_t {.
    cdecl, importc: "dbus_message_iter_close_container", dynlib: libdbus.}
proc dbus_message_iter_abandon_container*(iter: ptr DBusMessageIter; 
    sub: ptr DBusMessageIter) {.cdecl, 
                                importc: "dbus_message_iter_abandon_container", 
                                dynlib: libdbus.}
proc dbus_message_lock*(message: ptr DBusMessage) {.cdecl, 
    importc: "dbus_message_lock", dynlib: libdbus.}
proc dbus_set_error_from_message*(error: ptr DBusError; message: ptr DBusMessage): dbus_bool_t {.
    cdecl, importc: "dbus_set_error_from_message", dynlib: libdbus.}
proc dbus_message_allocate_data_slot*(slot_p: ptr dbus_int32_t): dbus_bool_t {.
    cdecl, importc: "dbus_message_allocate_data_slot", dynlib: libdbus.}
proc dbus_message_free_data_slot*(slot_p: ptr dbus_int32_t) {.cdecl, 
    importc: "dbus_message_free_data_slot", dynlib: libdbus.}
proc dbus_message_set_data*(message: ptr DBusMessage; slot: dbus_int32_t; 
                            data: pointer; free_data_func: DBusFreeFunction): dbus_bool_t {.
    cdecl, importc: "dbus_message_set_data", dynlib: libdbus.}
proc dbus_message_get_data*(message: ptr DBusMessage; slot: dbus_int32_t): pointer {.
    cdecl, importc: "dbus_message_get_data", dynlib: libdbus.}
proc dbus_message_type_from_string*(type_str: cstring): cint {.cdecl, 
    importc: "dbus_message_type_from_string", dynlib: libdbus.}
proc dbus_message_type_to_string*(`type`: cint): cstring {.cdecl, 
    importc: "dbus_message_type_to_string", dynlib: libdbus.}
proc dbus_message_marshal*(msg: ptr DBusMessage; 
                           marshalled_data_p: cstringArray; len_p: ptr cint): dbus_bool_t {.
    cdecl, importc: "dbus_message_marshal", dynlib: libdbus.}
proc dbus_message_demarshal*(str: cstring; len: cint; error: ptr DBusError): ptr DBusMessage {.
    cdecl, importc: "dbus_message_demarshal", dynlib: libdbus.}
proc dbus_message_demarshal_bytes_needed*(str: cstring; len: cint): cint {.
    cdecl, importc: "dbus_message_demarshal_bytes_needed", dynlib: libdbus.}
#* @} 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-shared.h  Stuff used by both dbus/dbus.h low-level and C/C++ binding APIs
# 
#  Copyright (C) 2004 Red Hat, Inc.
# 
#  Licensed under the Academic Free License version 2.1
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 
# Don't include anything in here from anywhere else. It's
#  intended for use by any random library.
# 

# Normally docs are in .c files, but there isn't a .c file for this. 
#*
#  @defgroup DBusShared Shared constants 
#  @ingroup  DBus
# 
#  @brief Shared header included by both libdbus and C/C++ bindings such as the GLib bindings.
# 
#  Usually a C/C++ binding such as the GLib or Qt binding won't want to include dbus.h in its
#  public headers. However, a few constants and macros may be useful to include; those are
#  found here and in dbus-protocol.h
# 
#  @{
# 
#*
#  Well-known bus types. See dbus_bus_get().
# 

type 
  DBusBusType* {.size: sizeof(cint).} = enum 
    DBUS_BUS_SESSION,         #*< The login session bus 
    DBUS_BUS_SYSTEM,          #*< The systemwide bus 
    DBUS_BUS_STARTER          #*< The bus that started us, if any 


#*
#  Results that a message handler can return.
# 

type 
  DBusHandlerResult* {.size: sizeof(cint).} = enum 
    DBUS_HANDLER_RESULT_HANDLED, #*< Message has had its effect - no need to run more handlers. 
    DBUS_HANDLER_RESULT_NOT_YET_HANDLED, #*< Message has not had any effect - see if other handlers want it. 
    DBUS_HANDLER_RESULT_NEED_MEMORY #*< Need more memory in order to return #DBUS_HANDLER_RESULT_HANDLED or #DBUS_HANDLER_RESULT_NOT_YET_HANDLED. Please try again later with more memory. 


# Bus names 
#* The bus name used to talk to the bus itself. 
# Paths 
#* The object path used to talk to the bus itself. 
#* The object path used in local/in-process-generated messages. 
# Interfaces, these #define don't do much other than
#  catch typos at compile time
# 
#* The interface exported by the object with #DBUS_SERVICE_DBUS and #DBUS_PATH_DBUS 
#* The interface supported by introspectable objects 
#* The interface supported by objects with properties 
#* The interface supported by most dbus peers 
#* This is a special interface whose methods can only be invoked
#  by the local implementation (messages from remote apps aren't
#  allowed to specify this interface).
# 
# Owner flags 
# Replies to request for a name 
# Replies to releasing a name 
# Replies to service starts 
#* @} 

#*
#  @addtogroup DBusConnection
#  @{
# 
# documented in dbus-watch.c 

type 
  DBusWatch* = object 
  

# documented in dbus-timeout.c 

type 
  DBusTimeout* = object 
  

#* Opaque type representing preallocated resources so a message can be sent without further memory allocation. 

type 
  DBusPreallocatedSend* = object 
  

#* Opaque type representing a method call that has not yet received a reply. 

type 
  DBusPendingCall* = object 
  

#* Opaque type representing a connection to a remote application and associated incoming/outgoing message queues. 

type 
  DBusConnection* = object 
  

#* Set of functions that must be implemented to handle messages sent to a particular object path. 


#*
#  Indicates the status of a #DBusWatch.
# 

type 
  DBusWatchFlags* {.size: sizeof(cint).} = enum 
    DBUS_WATCH_READABLE = 1 shl 0, #*< As in POLLIN 
    DBUS_WATCH_WRITABLE = 1 shl 1, #*< As in POLLOUT 
    DBUS_WATCH_ERROR = 1 shl 2, #*< As in POLLERR (can't watch for
                                #                                    this, but can be present in
                                #                                    current state passed to
                                #                                    dbus_watch_handle()).
                                #                                 
    DBUS_WATCH_HANGUP = 1 shl 3


#*
#  Indicates the status of incoming data on a #DBusConnection. This determines whether
#  dbus_connection_dispatch() needs to be called.
# 

type 
  DBusDispatchStatus* {.size: sizeof(cint).} = enum 
    DBUS_DISPATCH_DATA_REMAINS, #*< There is more data to potentially convert to messages. 
    DBUS_DISPATCH_COMPLETE,   #*< All currently available data has been processed. 
    DBUS_DISPATCH_NEED_MEMORY #*< More memory is needed to continue. 


#* Called when libdbus needs a new watch to be monitored by the main
#  loop. Returns #FALSE if it lacks enough memory to add the
#  watch. Set by dbus_connection_set_watch_functions() or
#  dbus_server_set_watch_functions().
# 

type 
  DBusAddWatchFunction* = proc (watch: ptr DBusWatch; data: pointer): dbus_bool_t {.
      cdecl.}

#* Called when dbus_watch_get_enabled() may return a different value
#   than it did before.  Set by dbus_connection_set_watch_functions()
#   or dbus_server_set_watch_functions().
# 

type 
  DBusWatchToggledFunction* = proc (watch: ptr DBusWatch; data: pointer) {.cdecl.}

#* Called when libdbus no longer needs a watch to be monitored by the
#  main loop. Set by dbus_connection_set_watch_functions() or
#  dbus_server_set_watch_functions().
# 

type 
  DBusRemoveWatchFunction* = proc (watch: ptr DBusWatch; data: pointer) {.cdecl.}

#* Called when libdbus needs a new timeout to be monitored by the main
#  loop. Returns #FALSE if it lacks enough memory to add the
#  watch. Set by dbus_connection_set_timeout_functions() or
#  dbus_server_set_timeout_functions().
# 

type 
  DBusAddTimeoutFunction* = proc (timeout: ptr DBusTimeout; data: pointer): dbus_bool_t {.
      cdecl.}

#* Called when dbus_timeout_get_enabled() may return a different
#  value than it did before.
#  Set by dbus_connection_set_timeout_functions() or
#  dbus_server_set_timeout_functions().
# 

type 
  DBusTimeoutToggledFunction* = proc (timeout: ptr DBusTimeout; data: pointer) {.
      cdecl.}

#* Called when libdbus no longer needs a timeout to be monitored by the
#  main loop. Set by dbus_connection_set_timeout_functions() or
#  dbus_server_set_timeout_functions().
# 

type 
  DBusRemoveTimeoutFunction* = proc (timeout: ptr DBusTimeout; data: pointer) {.
      cdecl.}

#* Called when the return value of dbus_connection_get_dispatch_status()
#  may have changed. Set with dbus_connection_set_dispatch_status_function().
# 

type 
  DBusDispatchStatusFunction* = proc (connection: ptr DBusConnection; 
                                      new_status: DBusDispatchStatus; 
                                      data: pointer) {.cdecl.}

#*
#  Called when the main loop's thread should be notified that there's now work
#  to do. Set with dbus_connection_set_wakeup_main_function().
# 

type 
  DBusWakeupMainFunction* = proc (data: pointer) {.cdecl.}

#*
#  Called during authentication to check whether the given UNIX user
#  ID is allowed to connect, if the client tried to auth as a UNIX
#  user ID. Normally on Windows this would never happen. Set with
#  dbus_connection_set_unix_user_function().
# 

type 
  DBusAllowUnixUserFunction* = proc (connection: ptr DBusConnection; 
                                     uid: culong; data: pointer): dbus_bool_t {.
      cdecl.}

#*
#  Called during authentication to check whether the given Windows user
#  ID is allowed to connect, if the client tried to auth as a Windows
#  user ID. Normally on UNIX this would never happen. Set with
#  dbus_connection_set_windows_user_function().
# 

type 
  DBusAllowWindowsUserFunction* = proc (connection: ptr DBusConnection; 
                                        user_sid: cstring; data: pointer): dbus_bool_t {.
      cdecl.}

#*
#  Called when a pending call now has a reply available. Set with
#  dbus_pending_call_set_notify().
# 

type 
  DBusPendingCallNotifyFunction* = proc (pending: ptr DBusPendingCall; 
      user_data: pointer) {.cdecl.}

#*
#  Called when a message needs to be handled. The result indicates whether or
#  not more handlers should be run. Set with dbus_connection_add_filter().
# 

type 
  DBusHandleMessageFunction* = proc (connection: ptr DBusConnection; 
                                     message: ptr DBusMessage; 
                                     user_data: pointer): DBusHandlerResult {.
      cdecl.}

proc dbus_connection_open*(address: cstring; error: ptr DBusError): ptr DBusConnection {.
    cdecl, importc: "dbus_connection_open", dynlib: libdbus.}
proc dbus_connection_open_private*(address: cstring; error: ptr DBusError): ptr DBusConnection {.
    cdecl, importc: "dbus_connection_open_private", dynlib: libdbus.}
proc dbus_connection_ref*(connection: ptr DBusConnection): ptr DBusConnection {.
    cdecl, importc: "dbus_connection_ref", dynlib: libdbus.}
proc dbus_connection_unref*(connection: ptr DBusConnection) {.cdecl, 
    importc: "dbus_connection_unref", dynlib: libdbus.}
proc dbus_connection_close*(connection: ptr DBusConnection) {.cdecl, 
    importc: "dbus_connection_close", dynlib: libdbus.}
proc dbus_connection_get_is_connected*(connection: ptr DBusConnection): dbus_bool_t {.
    cdecl, importc: "dbus_connection_get_is_connected", dynlib: libdbus.}
proc dbus_connection_get_is_authenticated*(connection: ptr DBusConnection): dbus_bool_t {.
    cdecl, importc: "dbus_connection_get_is_authenticated", dynlib: libdbus.}
proc dbus_connection_get_is_anonymous*(connection: ptr DBusConnection): dbus_bool_t {.
    cdecl, importc: "dbus_connection_get_is_anonymous", dynlib: libdbus.}
proc dbus_connection_get_server_id*(connection: ptr DBusConnection): cstring {.
    cdecl, importc: "dbus_connection_get_server_id", dynlib: libdbus.}
proc dbus_connection_can_send_type*(connection: ptr DBusConnection; `type`: cint): dbus_bool_t {.
    cdecl, importc: "dbus_connection_can_send_type", dynlib: libdbus.}
proc dbus_connection_set_exit_on_disconnect*(connection: ptr DBusConnection; 
    exit_on_disconnect: dbus_bool_t) {.cdecl, importc: "dbus_connection_set_exit_on_disconnect", 
                                       dynlib: libdbus.}
proc dbus_connection_flush*(connection: ptr DBusConnection) {.cdecl, 
    importc: "dbus_connection_flush", dynlib: libdbus.}
proc dbus_connection_read_write_dispatch*(connection: ptr DBusConnection; 
    timeout_milliseconds: cint): dbus_bool_t {.cdecl, 
    importc: "dbus_connection_read_write_dispatch", dynlib: libdbus.}
proc dbus_connection_read_write*(connection: ptr DBusConnection; 
                                 timeout_milliseconds: cint): dbus_bool_t {.
    cdecl, importc: "dbus_connection_read_write", dynlib: libdbus.}
proc dbus_connection_borrow_message*(connection: ptr DBusConnection): ptr DBusMessage {.
    cdecl, importc: "dbus_connection_borrow_message", dynlib: libdbus.}
proc dbus_connection_return_message*(connection: ptr DBusConnection; 
                                     message: ptr DBusMessage) {.cdecl, 
    importc: "dbus_connection_return_message", dynlib: libdbus.}
proc dbus_connection_steal_borrowed_message*(connection: ptr DBusConnection; 
    message: ptr DBusMessage) {.cdecl, importc: "dbus_connection_steal_borrowed_message", 
                                dynlib: libdbus.}
proc dbus_connection_pop_message*(connection: ptr DBusConnection): ptr DBusMessage {.
    cdecl, importc: "dbus_connection_pop_message", dynlib: libdbus.}
proc dbus_connection_get_dispatch_status*(connection: ptr DBusConnection): DBusDispatchStatus {.
    cdecl, importc: "dbus_connection_get_dispatch_status", dynlib: libdbus.}
proc dbus_connection_dispatch*(connection: ptr DBusConnection): DBusDispatchStatus {.
    cdecl, importc: "dbus_connection_dispatch", dynlib: libdbus.}
proc dbus_connection_has_messages_to_send*(connection: ptr DBusConnection): dbus_bool_t {.
    cdecl, importc: "dbus_connection_has_messages_to_send", dynlib: libdbus.}
proc dbus_connection_send*(connection: ptr DBusConnection; 
                           message: ptr DBusMessage; 
                           client_serial: ptr dbus_uint32_t): dbus_bool_t {.
    cdecl, importc: "dbus_connection_send", dynlib: libdbus.}
proc dbus_connection_send_with_reply*(connection: ptr DBusConnection; 
                                      message: ptr DBusMessage; 
                                      pending_return: ptr ptr DBusPendingCall; 
                                      timeout_milliseconds: cint): dbus_bool_t {.
    cdecl, importc: "dbus_connection_send_with_reply", dynlib: libdbus.}
proc dbus_connection_send_with_reply_and_block*(connection: ptr DBusConnection; 
    message: ptr DBusMessage; timeout_milliseconds: cint; error: ptr DBusError): ptr DBusMessage {.
    cdecl, importc: "dbus_connection_send_with_reply_and_block", dynlib: libdbus.}
proc dbus_connection_set_watch_functions*(connection: ptr DBusConnection; 
    add_function: DBusAddWatchFunction; 
    remove_function: DBusRemoveWatchFunction; 
    toggled_function: DBusWatchToggledFunction; data: pointer; 
    free_data_function: DBusFreeFunction): dbus_bool_t {.cdecl, 
    importc: "dbus_connection_set_watch_functions", dynlib: libdbus.}
proc dbus_connection_set_timeout_functions*(connection: ptr DBusConnection; 
    add_function: DBusAddTimeoutFunction; 
    remove_function: DBusRemoveTimeoutFunction; 
    toggled_function: DBusTimeoutToggledFunction; data: pointer; 
    free_data_function: DBusFreeFunction): dbus_bool_t {.cdecl, 
    importc: "dbus_connection_set_timeout_functions", dynlib: libdbus.}
proc dbus_connection_set_wakeup_main_function*(connection: ptr DBusConnection; 
    wakeup_main_function: DBusWakeupMainFunction; data: pointer; 
    free_data_function: DBusFreeFunction) {.cdecl, 
    importc: "dbus_connection_set_wakeup_main_function", dynlib: libdbus.}
proc dbus_connection_set_dispatch_status_function*(
    connection: ptr DBusConnection; function: DBusDispatchStatusFunction; 
    data: pointer; free_data_function: DBusFreeFunction) {.cdecl, 
    importc: "dbus_connection_set_dispatch_status_function", dynlib: libdbus.}
proc dbus_connection_get_unix_user*(connection: ptr DBusConnection; 
                                    uid: ptr culong): dbus_bool_t {.cdecl, 
    importc: "dbus_connection_get_unix_user", dynlib: libdbus.}
proc dbus_connection_get_unix_process_id*(connection: ptr DBusConnection; 
    pid: ptr culong): dbus_bool_t {.cdecl, importc: "dbus_connection_get_unix_process_id", 
                                    dynlib: libdbus.}
proc dbus_connection_get_adt_audit_session_data*(connection: ptr DBusConnection; 
    data: ptr pointer; data_size: ptr dbus_int32_t): dbus_bool_t {.cdecl, 
    importc: "dbus_connection_get_adt_audit_session_data", dynlib: libdbus.}
proc dbus_connection_set_unix_user_function*(connection: ptr DBusConnection; 
    function: DBusAllowUnixUserFunction; data: pointer; 
    free_data_function: DBusFreeFunction) {.cdecl, 
    importc: "dbus_connection_set_unix_user_function", dynlib: libdbus.}
proc dbus_connection_get_windows_user*(connection: ptr DBusConnection; 
                                       windows_sid_p: cstringArray): dbus_bool_t {.
    cdecl, importc: "dbus_connection_get_windows_user", dynlib: libdbus.}
proc dbus_connection_set_windows_user_function*(connection: ptr DBusConnection; 
    function: DBusAllowWindowsUserFunction; data: pointer; 
    free_data_function: DBusFreeFunction) {.cdecl, 
    importc: "dbus_connection_set_windows_user_function", dynlib: libdbus.}
proc dbus_connection_set_allow_anonymous*(connection: ptr DBusConnection; 
    value: dbus_bool_t) {.cdecl, importc: "dbus_connection_set_allow_anonymous", 
                          dynlib: libdbus.}
proc dbus_connection_set_route_peer_messages*(connection: ptr DBusConnection; 
    value: dbus_bool_t) {.cdecl, 
                          importc: "dbus_connection_set_route_peer_messages", 
                          dynlib: libdbus.}
# Filters 

proc dbus_connection_add_filter*(connection: ptr DBusConnection; 
                                 function: DBusHandleMessageFunction; 
                                 user_data: pointer; 
                                 free_data_function: DBusFreeFunction): dbus_bool_t {.
    cdecl, importc: "dbus_connection_add_filter", dynlib: libdbus.}
proc dbus_connection_remove_filter*(connection: ptr DBusConnection; 
                                    function: DBusHandleMessageFunction; 
                                    user_data: pointer) {.cdecl, 
    importc: "dbus_connection_remove_filter", dynlib: libdbus.}
# Other 

proc dbus_connection_allocate_data_slot*(slot_p: ptr dbus_int32_t): dbus_bool_t {.
    cdecl, importc: "dbus_connection_allocate_data_slot", dynlib: libdbus.}
proc dbus_connection_free_data_slot*(slot_p: ptr dbus_int32_t) {.cdecl, 
    importc: "dbus_connection_free_data_slot", dynlib: libdbus.}
proc dbus_connection_set_data*(connection: ptr DBusConnection; 
                               slot: dbus_int32_t; data: pointer; 
                               free_data_func: DBusFreeFunction): dbus_bool_t {.
    cdecl, importc: "dbus_connection_set_data", dynlib: libdbus.}
proc dbus_connection_get_data*(connection: ptr DBusConnection; 
                               slot: dbus_int32_t): pointer {.cdecl, 
    importc: "dbus_connection_get_data", dynlib: libdbus.}
proc dbus_connection_set_change_sigpipe*(will_modify_sigpipe: dbus_bool_t) {.
    cdecl, importc: "dbus_connection_set_change_sigpipe", dynlib: libdbus.}
proc dbus_connection_set_max_message_size*(connection: ptr DBusConnection; 
    size: clong) {.cdecl, importc: "dbus_connection_set_max_message_size", 
                   dynlib: libdbus.}
proc dbus_connection_get_max_message_size*(connection: ptr DBusConnection): clong {.
    cdecl, importc: "dbus_connection_get_max_message_size", dynlib: libdbus.}
proc dbus_connection_set_max_received_size*(connection: ptr DBusConnection; 
    size: clong) {.cdecl, importc: "dbus_connection_set_max_received_size", 
                   dynlib: libdbus.}
proc dbus_connection_get_max_received_size*(connection: ptr DBusConnection): clong {.
    cdecl, importc: "dbus_connection_get_max_received_size", dynlib: libdbus.}
proc dbus_connection_set_max_message_unix_fds*(connection: ptr DBusConnection; 
    n: clong) {.cdecl, importc: "dbus_connection_set_max_message_unix_fds", 
                dynlib: libdbus.}
proc dbus_connection_get_max_message_unix_fds*(connection: ptr DBusConnection): clong {.
    cdecl, importc: "dbus_connection_get_max_message_unix_fds", dynlib: libdbus.}
proc dbus_connection_set_max_received_unix_fds*(connection: ptr DBusConnection; 
    n: clong) {.cdecl, importc: "dbus_connection_set_max_received_unix_fds", 
                dynlib: libdbus.}
proc dbus_connection_get_max_received_unix_fds*(connection: ptr DBusConnection): clong {.
    cdecl, importc: "dbus_connection_get_max_received_unix_fds", dynlib: libdbus.}
proc dbus_connection_get_outgoing_size*(connection: ptr DBusConnection): clong {.
    cdecl, importc: "dbus_connection_get_outgoing_size", dynlib: libdbus.}
proc dbus_connection_get_outgoing_unix_fds*(connection: ptr DBusConnection): clong {.
    cdecl, importc: "dbus_connection_get_outgoing_unix_fds", dynlib: libdbus.}
proc dbus_connection_preallocate_send*(connection: ptr DBusConnection): ptr DBusPreallocatedSend {.
    cdecl, importc: "dbus_connection_preallocate_send", dynlib: libdbus.}
proc dbus_connection_free_preallocated_send*(connection: ptr DBusConnection; 
    preallocated: ptr DBusPreallocatedSend) {.cdecl, 
    importc: "dbus_connection_free_preallocated_send", dynlib: libdbus.}
proc dbus_connection_send_preallocated*(connection: ptr DBusConnection; 
                                        preallocated: ptr DBusPreallocatedSend; 
                                        message: ptr DBusMessage; 
                                        client_serial: ptr dbus_uint32_t) {.
    cdecl, importc: "dbus_connection_send_preallocated", dynlib: libdbus.}
# Object tree functionality 
#*
#  Called when a #DBusObjectPathVTable is unregistered (or its connection is freed).
#  Found in #DBusObjectPathVTable.
# 

type 
  DBusObjectPathUnregisterFunction* = proc (connection: ptr DBusConnection; 
      user_data: pointer) {.cdecl.}

#*
#  Called when a message is sent to a registered object path. Found in
#  #DBusObjectPathVTable which is registered with dbus_connection_register_object_path()
#  or dbus_connection_register_fallback().
# 

type 
  DBusObjectPathMessageFunction* = proc (connection: ptr DBusConnection; 
      message: ptr DBusMessage; user_data: pointer): DBusHandlerResult {.cdecl.}

#*
#  Virtual table that must be implemented to handle a portion of the
#  object path hierarchy. Attach the vtable to a particular path using
#  dbus_connection_register_object_path() or
#  dbus_connection_register_fallback().
# 

type 
  DBusObjectPathVTable* = object 
    unregister_function*: DBusObjectPathUnregisterFunction #*< Function to unregister this handler 
    message_function*: DBusObjectPathMessageFunction #*< Function to handle messages 
    dbus_internal_pad1*: proc (a2: pointer) {.cdecl.} #*< Reserved for future expansion 
    dbus_internal_pad2*: proc (a2: pointer) {.cdecl.} #*< Reserved for future expansion 
    dbus_internal_pad3*: proc (a2: pointer) {.cdecl.} #*< Reserved for future expansion 
    dbus_internal_pad4*: proc (a2: pointer) {.cdecl.} #*< Reserved for future expansion 
  

proc dbus_connection_try_register_object_path*(connection: ptr DBusConnection; 
    path: cstring; vtable: ptr DBusObjectPathVTable; user_data: pointer; 
    error: ptr DBusError): dbus_bool_t {.cdecl, 
    importc: "dbus_connection_try_register_object_path", dynlib: libdbus.}
proc dbus_connection_register_object_path*(connection: ptr DBusConnection; 
    path: cstring; vtable: ptr DBusObjectPathVTable; user_data: pointer): dbus_bool_t {.
    cdecl, importc: "dbus_connection_register_object_path", dynlib: libdbus.}
proc dbus_connection_try_register_fallback*(connection: ptr DBusConnection; 
    path: cstring; vtable: ptr DBusObjectPathVTable; user_data: pointer; 
    error: ptr DBusError): dbus_bool_t {.cdecl, 
    importc: "dbus_connection_try_register_fallback", dynlib: libdbus.}
proc dbus_connection_register_fallback*(connection: ptr DBusConnection; 
                                        path: cstring; 
                                        vtable: ptr DBusObjectPathVTable; 
                                        user_data: pointer): dbus_bool_t {.
    cdecl, importc: "dbus_connection_register_fallback", dynlib: libdbus.}
proc dbus_connection_unregister_object_path*(connection: ptr DBusConnection; 
    path: cstring): dbus_bool_t {.cdecl, importc: "dbus_connection_unregister_object_path", 
                                  dynlib: libdbus.}
proc dbus_connection_get_object_path_data*(connection: ptr DBusConnection; 
    path: cstring; data_p: ptr pointer): dbus_bool_t {.cdecl, 
    importc: "dbus_connection_get_object_path_data", dynlib: libdbus.}
proc dbus_connection_list_registered*(connection: ptr DBusConnection; 
                                      parent_path: cstring; 
                                      child_entries: ptr cstringArray): dbus_bool_t {.
    cdecl, importc: "dbus_connection_list_registered", dynlib: libdbus.}
proc dbus_connection_get_unix_fd*(connection: ptr DBusConnection; fd: ptr cint): dbus_bool_t {.
    cdecl, importc: "dbus_connection_get_unix_fd", dynlib: libdbus.}
proc dbus_connection_get_socket*(connection: ptr DBusConnection; fd: ptr cint): dbus_bool_t {.
    cdecl, importc: "dbus_connection_get_socket", dynlib: libdbus.}
#* @} 
#*
#  @addtogroup DBusWatch
#  @{
# 

proc dbus_watch_get_fd*(watch: ptr DBusWatch): cint {.cdecl, 
    importc: "dbus_watch_get_fd", dynlib: libdbus.}
proc dbus_watch_get_unix_fd*(watch: ptr DBusWatch): cint {.cdecl, 
    importc: "dbus_watch_get_unix_fd", dynlib: libdbus.}
proc dbus_watch_get_socket*(watch: ptr DBusWatch): cint {.cdecl, 
    importc: "dbus_watch_get_socket", dynlib: libdbus.}
proc dbus_watch_get_flags*(watch: ptr DBusWatch): cuint {.cdecl, 
    importc: "dbus_watch_get_flags", dynlib: libdbus.}
proc dbus_watch_get_data*(watch: ptr DBusWatch): pointer {.cdecl, 
    importc: "dbus_watch_get_data", dynlib: libdbus.}
proc dbus_watch_set_data*(watch: ptr DBusWatch; data: pointer; 
                          free_data_function: DBusFreeFunction) {.cdecl, 
    importc: "dbus_watch_set_data", dynlib: libdbus.}
proc dbus_watch_handle*(watch: ptr DBusWatch; flags: cuint): dbus_bool_t {.
    cdecl, importc: "dbus_watch_handle", dynlib: libdbus.}
proc dbus_watch_get_enabled*(watch: ptr DBusWatch): dbus_bool_t {.cdecl, 
    importc: "dbus_watch_get_enabled", dynlib: libdbus.}
#* @} 
#*
#  @addtogroup DBusTimeout
#  @{
# 

proc dbus_timeout_get_interval*(timeout: ptr DBusTimeout): cint {.cdecl, 
    importc: "dbus_timeout_get_interval", dynlib: libdbus.}
proc dbus_timeout_get_data*(timeout: ptr DBusTimeout): pointer {.cdecl, 
    importc: "dbus_timeout_get_data", dynlib: libdbus.}
proc dbus_timeout_set_data*(timeout: ptr DBusTimeout; data: pointer; 
                            free_data_function: DBusFreeFunction) {.cdecl, 
    importc: "dbus_timeout_set_data", dynlib: libdbus.}
proc dbus_timeout_handle*(timeout: ptr DBusTimeout): dbus_bool_t {.cdecl, 
    importc: "dbus_timeout_handle", dynlib: libdbus.}
proc dbus_timeout_get_enabled*(timeout: ptr DBusTimeout): dbus_bool_t {.cdecl, 
    importc: "dbus_timeout_get_enabled", dynlib: libdbus.}
#* @} 

#*
#  @addtogroup DBusBus
#  @{
# 

proc dbus_bus_get*(`type`: DBusBusType; error: ptr DBusError): ptr DBusConnection {.
    cdecl, importc: "dbus_bus_get", dynlib: libdbus.}
proc dbus_bus_get_private*(`type`: DBusBusType; error: ptr DBusError): ptr DBusConnection {.
    cdecl, importc: "dbus_bus_get_private", dynlib: libdbus.}
proc dbus_bus_register*(connection: ptr DBusConnection; error: ptr DBusError): dbus_bool_t {.
    cdecl, importc: "dbus_bus_register", dynlib: libdbus.}
proc dbus_bus_set_unique_name*(connection: ptr DBusConnection; 
                               unique_name: cstring): dbus_bool_t {.cdecl, 
    importc: "dbus_bus_set_unique_name", dynlib: libdbus.}
proc dbus_bus_get_unique_name*(connection: ptr DBusConnection): cstring {.cdecl, 
    importc: "dbus_bus_get_unique_name", dynlib: libdbus.}
proc dbus_bus_get_unix_user*(connection: ptr DBusConnection; name: cstring; 
                             error: ptr DBusError): culong {.cdecl, 
    importc: "dbus_bus_get_unix_user", dynlib: libdbus.}
proc dbus_bus_get_id*(connection: ptr DBusConnection; error: ptr DBusError): cstring {.
    cdecl, importc: "dbus_bus_get_id", dynlib: libdbus.}
proc dbus_bus_request_name*(connection: ptr DBusConnection; name: cstring; 
                            flags: cuint; error: ptr DBusError): cint {.cdecl, 
    importc: "dbus_bus_request_name", dynlib: libdbus.}
proc dbus_bus_release_name*(connection: ptr DBusConnection; name: cstring; 
                            error: ptr DBusError): cint {.cdecl, 
    importc: "dbus_bus_release_name", dynlib: libdbus.}
proc dbus_bus_name_has_owner*(connection: ptr DBusConnection; name: cstring; 
                              error: ptr DBusError): dbus_bool_t {.cdecl, 
    importc: "dbus_bus_name_has_owner", dynlib: libdbus.}
proc dbus_bus_start_service_by_name*(connection: ptr DBusConnection; 
                                     name: cstring; flags: dbus_uint32_t; 
                                     reply: ptr dbus_uint32_t; 
                                     error: ptr DBusError): dbus_bool_t {.cdecl, 
    importc: "dbus_bus_start_service_by_name", dynlib: libdbus.}
proc dbus_bus_add_match*(connection: ptr DBusConnection; rule: cstring; 
                         error: ptr DBusError) {.cdecl, 
    importc: "dbus_bus_add_match", dynlib: libdbus.}
proc dbus_bus_remove_match*(connection: ptr DBusConnection; rule: cstring; 
                            error: ptr DBusError) {.cdecl, 
    importc: "dbus_bus_remove_match", dynlib: libdbus.}
#* @} 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-connection.h DBusConnection object
# 
#  Copyright (C) 2002, 2003  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-errors.h Error reporting
# 
#  Copyright (C) 2002  Red Hat Inc.
#  Copyright (C) 2003  CodeFactory AB
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-message.h DBusMessage object
# 
#  Copyright (C) 2002, 2003, 2005 Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-misc.h  A few assorted public functions that don't fit elsewhere
# 
#  Copyright (C) 2006 Red Hat, Inc.
# 
#  Licensed under the Academic Free License version 2.1
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-types.h  types such as dbus_bool_t
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-errors.h Error reporting
# 
#  Copyright (C) 2002  Red Hat Inc.
#  Copyright (C) 2003  CodeFactory AB
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

#*
#  @addtogroup DBusMisc
#  @{
# 

proc dbus_get_local_machine_id*(): cstring {.cdecl, 
    importc: "dbus_get_local_machine_id", dynlib: libdbus.}
proc dbus_get_version*(major_version_p: ptr cint; minor_version_p: ptr cint; 
                       micro_version_p: ptr cint) {.cdecl, 
    importc: "dbus_get_version", dynlib: libdbus.}
#* @} 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-pending-call.h Object representing a call in progress.
# 
#  Copyright (C) 2002, 2003 Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-macros.h  generic macros
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-types.h  types such as dbus_bool_t
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-connection.h DBusConnection object
# 
#  Copyright (C) 2002, 2003  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

#*
#  @addtogroup DBusPendingCall
#  @{
# 

proc dbus_pending_call_ref*(pending: ptr DBusPendingCall): ptr DBusPendingCall {.
    cdecl, importc: "dbus_pending_call_ref", dynlib: libdbus.}
proc dbus_pending_call_unref*(pending: ptr DBusPendingCall) {.cdecl, 
    importc: "dbus_pending_call_unref", dynlib: libdbus.}
proc dbus_pending_call_set_notify*(pending: ptr DBusPendingCall; 
                                   function: DBusPendingCallNotifyFunction; 
                                   user_data: pointer; 
                                   free_user_data: DBusFreeFunction): dbus_bool_t {.
    cdecl, importc: "dbus_pending_call_set_notify", dynlib: libdbus.}
proc dbus_pending_call_cancel*(pending: ptr DBusPendingCall) {.cdecl, 
    importc: "dbus_pending_call_cancel", dynlib: libdbus.}
proc dbus_pending_call_get_completed*(pending: ptr DBusPendingCall): dbus_bool_t {.
    cdecl, importc: "dbus_pending_call_get_completed", dynlib: libdbus.}
proc dbus_pending_call_steal_reply*(pending: ptr DBusPendingCall): ptr DBusMessage {.
    cdecl, importc: "dbus_pending_call_steal_reply", dynlib: libdbus.}
proc dbus_pending_call_block*(pending: ptr DBusPendingCall) {.cdecl, 
    importc: "dbus_pending_call_block", dynlib: libdbus.}
proc dbus_pending_call_allocate_data_slot*(slot_p: ptr dbus_int32_t): dbus_bool_t {.
    cdecl, importc: "dbus_pending_call_allocate_data_slot", dynlib: libdbus.}
proc dbus_pending_call_free_data_slot*(slot_p: ptr dbus_int32_t) {.cdecl, 
    importc: "dbus_pending_call_free_data_slot", dynlib: libdbus.}
proc dbus_pending_call_set_data*(pending: ptr DBusPendingCall; 
                                 slot: dbus_int32_t; data: pointer; 
                                 free_data_func: DBusFreeFunction): dbus_bool_t {.
    cdecl, importc: "dbus_pending_call_set_data", dynlib: libdbus.}
proc dbus_pending_call_get_data*(pending: ptr DBusPendingCall; 
                                 slot: dbus_int32_t): pointer {.cdecl, 
    importc: "dbus_pending_call_get_data", dynlib: libdbus.}
#* @} 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-protocol.h  D-Bus protocol constants
# 
#  Copyright (C) 2002, 2003  CodeFactory AB
#  Copyright (C) 2004, 2005 Red Hat, Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-server.h DBusServer object
# 
#  Copyright (C) 2002, 2003  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-errors.h Error reporting
# 
#  Copyright (C) 2002  Red Hat Inc.
#  Copyright (C) 2003  CodeFactory AB
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-message.h DBusMessage object
# 
#  Copyright (C) 2002, 2003, 2005 Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-connection.h DBusConnection object
# 
#  Copyright (C) 2002, 2003  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-protocol.h  D-Bus protocol constants
# 
#  Copyright (C) 2002, 2003  CodeFactory AB
#  Copyright (C) 2004, 2005 Red Hat, Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

#*
#  @addtogroup DBusServer
#  @{
# 

type 
  DBusServer* = object 
  

#* Called when a new connection to the server is available. Must reference and save the new
#  connection, or close the new connection. Set with dbus_server_set_new_connection_function().
# 

type 
  DBusNewConnectionFunction* = proc (server: ptr DBusServer; 
                                     new_connection: ptr DBusConnection; 
                                     data: pointer) {.cdecl.}

proc dbus_server_listen*(address: cstring; error: ptr DBusError): ptr DBusServer {.
    cdecl, importc: "dbus_server_listen", dynlib: libdbus.}
proc dbus_server_ref*(server: ptr DBusServer): ptr DBusServer {.cdecl, 
    importc: "dbus_server_ref", dynlib: libdbus.}
proc dbus_server_unref*(server: ptr DBusServer) {.cdecl, 
    importc: "dbus_server_unref", dynlib: libdbus.}
proc dbus_server_disconnect*(server: ptr DBusServer) {.cdecl, 
    importc: "dbus_server_disconnect", dynlib: libdbus.}
proc dbus_server_get_is_connected*(server: ptr DBusServer): dbus_bool_t {.cdecl, 
    importc: "dbus_server_get_is_connected", dynlib: libdbus.}
proc dbus_server_get_address*(server: ptr DBusServer): cstring {.cdecl, 
    importc: "dbus_server_get_address", dynlib: libdbus.}
proc dbus_server_get_id*(server: ptr DBusServer): cstring {.cdecl, 
    importc: "dbus_server_get_id", dynlib: libdbus.}
proc dbus_server_set_new_connection_function*(server: ptr DBusServer; 
    function: DBusNewConnectionFunction; data: pointer; 
    free_data_function: DBusFreeFunction) {.cdecl, 
    importc: "dbus_server_set_new_connection_function", dynlib: libdbus.}
proc dbus_server_set_watch_functions*(server: ptr DBusServer; 
                                      add_function: DBusAddWatchFunction; 
                                      remove_function: DBusRemoveWatchFunction; 
    toggled_function: DBusWatchToggledFunction; data: pointer; 
                                      free_data_function: DBusFreeFunction): dbus_bool_t {.
    cdecl, importc: "dbus_server_set_watch_functions", dynlib: libdbus.}
proc dbus_server_set_timeout_functions*(server: ptr DBusServer; 
                                        add_function: DBusAddTimeoutFunction; 
    remove_function: DBusRemoveTimeoutFunction; toggled_function: DBusTimeoutToggledFunction; 
                                        data: pointer; 
                                        free_data_function: DBusFreeFunction): dbus_bool_t {.
    cdecl, importc: "dbus_server_set_timeout_functions", dynlib: libdbus.}
proc dbus_server_set_auth_mechanisms*(server: ptr DBusServer; 
                                      mechanisms: cstringArray): dbus_bool_t {.
    cdecl, importc: "dbus_server_set_auth_mechanisms", dynlib: libdbus.}
proc dbus_server_allocate_data_slot*(slot_p: ptr dbus_int32_t): dbus_bool_t {.
    cdecl, importc: "dbus_server_allocate_data_slot", dynlib: libdbus.}
proc dbus_server_free_data_slot*(slot_p: ptr dbus_int32_t) {.cdecl, 
    importc: "dbus_server_free_data_slot", dynlib: libdbus.}
proc dbus_server_set_data*(server: ptr DBusServer; slot: cint; data: pointer; 
                           free_data_func: DBusFreeFunction): dbus_bool_t {.
    cdecl, importc: "dbus_server_set_data", dynlib: libdbus.}
proc dbus_server_get_data*(server: ptr DBusServer; slot: cint): pointer {.cdecl, 
    importc: "dbus_server_get_data", dynlib: libdbus.}
#* @} 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-shared.h  Stuff used by both dbus/dbus.h low-level and C/C++ binding APIs
# 
#  Copyright (C) 2004 Red Hat, Inc.
# 
#  Licensed under the Academic Free License version 2.1
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-signatures.h utility functions for D-Bus types
# 
#  Copyright (C) 2005 Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-macros.h  generic macros
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-types.h  types such as dbus_bool_t
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-errors.h Error reporting
# 
#  Copyright (C) 2002  Red Hat Inc.
#  Copyright (C) 2003  CodeFactory AB
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

#*
#  @addtogroup DBusSignature
#  @{
# 
#*
#  DBusSignatureIter struct; contains no public fields 
# 

type 
  DBusSignatureIter* = object 
    dummy1*: pointer          #*< Don't use this 
    dummy2*: pointer          #*< Don't use this 
    dummy8*: dbus_uint32_t    #*< Don't use this 
    dummy12*: cint            #*< Don't use this 
    dummy17*: cint            #*< Don't use this 
  

proc dbus_signature_iter_init*(iter: ptr DBusSignatureIter; signature: cstring) {.
    cdecl, importc: "dbus_signature_iter_init", dynlib: libdbus.}
proc dbus_signature_iter_get_current_type*(iter: ptr DBusSignatureIter): cint {.
    cdecl, importc: "dbus_signature_iter_get_current_type", dynlib: libdbus.}
proc dbus_signature_iter_get_signature*(iter: ptr DBusSignatureIter): cstring {.
    cdecl, importc: "dbus_signature_iter_get_signature", dynlib: libdbus.}
proc dbus_signature_iter_get_element_type*(iter: ptr DBusSignatureIter): cint {.
    cdecl, importc: "dbus_signature_iter_get_element_type", dynlib: libdbus.}
proc dbus_signature_iter_next*(iter: ptr DBusSignatureIter): dbus_bool_t {.
    cdecl, importc: "dbus_signature_iter_next", dynlib: libdbus.}
proc dbus_signature_iter_recurse*(iter: ptr DBusSignatureIter; 
                                  subiter: ptr DBusSignatureIter) {.cdecl, 
    importc: "dbus_signature_iter_recurse", dynlib: libdbus.}
proc dbus_signature_validate*(signature: cstring; error: ptr DBusError): dbus_bool_t {.
    cdecl, importc: "dbus_signature_validate", dynlib: libdbus.}
proc dbus_signature_validate_single*(signature: cstring; error: ptr DBusError): dbus_bool_t {.
    cdecl, importc: "dbus_signature_validate_single", dynlib: libdbus.}
proc dbus_type_is_valid*(typecode: cint): dbus_bool_t {.cdecl, 
    importc: "dbus_type_is_valid", dynlib: libdbus.}
proc dbus_type_is_basic*(typecode: cint): dbus_bool_t {.cdecl, 
    importc: "dbus_type_is_basic", dynlib: libdbus.}
proc dbus_type_is_container*(typecode: cint): dbus_bool_t {.cdecl, 
    importc: "dbus_type_is_container", dynlib: libdbus.}
proc dbus_type_is_fixed*(typecode: cint): dbus_bool_t {.cdecl, 
    importc: "dbus_type_is_fixed", dynlib: libdbus.}
#* @} 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-syntax.h - utility functions for strings with special syntax
# 
#  Author: Simon McVittie <simon.mcvittie@collabora.co.uk>
#  Copyright © 2011 Nokia Corporation
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-macros.h  generic macros
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-types.h  types such as dbus_bool_t
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-errors.h Error reporting
# 
#  Copyright (C) 2002  Red Hat Inc.
#  Copyright (C) 2003  CodeFactory AB
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

proc dbus_validate_path*(path: cstring; error: ptr DBusError): dbus_bool_t {.
    cdecl, importc: "dbus_validate_path", dynlib: libdbus.}
proc dbus_validate_interface*(name: cstring; error: ptr DBusError): dbus_bool_t {.
    cdecl, importc: "dbus_validate_interface", dynlib: libdbus.}
proc dbus_validate_member*(name: cstring; error: ptr DBusError): dbus_bool_t {.
    cdecl, importc: "dbus_validate_member", dynlib: libdbus.}
proc dbus_validate_error_name*(name: cstring; error: ptr DBusError): dbus_bool_t {.
    cdecl, importc: "dbus_validate_error_name", dynlib: libdbus.}
proc dbus_validate_bus_name*(name: cstring; error: ptr DBusError): dbus_bool_t {.
    cdecl, importc: "dbus_validate_bus_name", dynlib: libdbus.}
proc dbus_validate_utf8*(alleged_utf8: cstring; error: ptr DBusError): dbus_bool_t {.
    cdecl, importc: "dbus_validate_utf8", dynlib: libdbus.}
# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-threads.h  D-Bus threads handling
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-macros.h  generic macros
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-types.h  types such as dbus_bool_t
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

#*
#  @addtogroup DBusThreads
#  @{
# 
#* An opaque mutex type provided by the #DBusThreadFunctions implementation installed by dbus_threads_init(). 

type 
  DBusMutex* = object 
  

#* An opaque condition variable type provided by the #DBusThreadFunctions implementation installed by dbus_threads_init(). 

type 
  DBusCondVar* = object 
  

#* Deprecated, provide DBusRecursiveMutexNewFunction instead. 

type 
  DBusMutexNewFunction* = proc (): ptr DBusMutex {.cdecl.}

#* Deprecated, provide DBusRecursiveMutexFreeFunction instead. 

type 
  DBusMutexFreeFunction* = proc (mutex: ptr DBusMutex) {.cdecl.}

#* Deprecated, provide DBusRecursiveMutexLockFunction instead. Return value is lock success, but gets ignored in practice. 

type 
  DBusMutexLockFunction* = proc (mutex: ptr DBusMutex): dbus_bool_t {.cdecl.}

#* Deprecated, provide DBusRecursiveMutexUnlockFunction instead. Return value is unlock success, but gets ignored in practice. 

type 
  DBusMutexUnlockFunction* = proc (mutex: ptr DBusMutex): dbus_bool_t {.cdecl.}

#* Creates a new recursively-lockable mutex, or returns #NULL if not
#  enough memory.  Can only fail due to lack of memory.  Found in
#  #DBusThreadFunctions. Do not just use PTHREAD_MUTEX_RECURSIVE for
#  this, because it does not save/restore the recursion count when
#  waiting on a condition. libdbus requires the Java-style behavior
#  where the mutex is fully unlocked to wait on a condition.
# 

type 
  DBusRecursiveMutexNewFunction* = proc (): ptr DBusMutex {.cdecl.}

#* Frees a recursively-lockable mutex.  Found in #DBusThreadFunctions.
# 

type 
  DBusRecursiveMutexFreeFunction* = proc (mutex: ptr DBusMutex) {.cdecl.}

#* Locks a recursively-lockable mutex.  Found in #DBusThreadFunctions.
#  Can only fail due to lack of memory.
# 

type 
  DBusRecursiveMutexLockFunction* = proc (mutex: ptr DBusMutex) {.cdecl.}

#* Unlocks a recursively-lockable mutex.  Found in #DBusThreadFunctions.
#  Can only fail due to lack of memory.
# 

type 
  DBusRecursiveMutexUnlockFunction* = proc (mutex: ptr DBusMutex) {.cdecl.}

#* Creates a new condition variable.  Found in #DBusThreadFunctions.
#  Can only fail (returning #NULL) due to lack of memory.
# 

type 
  DBusCondVarNewFunction* = proc (): ptr DBusCondVar {.cdecl.}

#* Frees a condition variable.  Found in #DBusThreadFunctions.
# 

type 
  DBusCondVarFreeFunction* = proc (cond: ptr DBusCondVar) {.cdecl.}

#* Waits on a condition variable.  Found in
#  #DBusThreadFunctions. Must work with either a recursive or
#  nonrecursive mutex, whichever the thread implementation
#  provides. Note that PTHREAD_MUTEX_RECURSIVE does not work with
#  condition variables (does not save/restore the recursion count) so
#  don't try using simply pthread_cond_wait() and a
#  PTHREAD_MUTEX_RECURSIVE to implement this, it won't work right.
# 
#  Has no error conditions. Must succeed if it returns.
# 

type 
  DBusCondVarWaitFunction* = proc (cond: ptr DBusCondVar; mutex: ptr DBusMutex) {.
      cdecl.}

#* Waits on a condition variable with a timeout.  Found in
#   #DBusThreadFunctions. Returns #TRUE if the wait did not
#   time out, and #FALSE if it did.
# 
#  Has no error conditions. Must succeed if it returns.
# 

type 
  DBusCondVarWaitTimeoutFunction* = proc (cond: ptr DBusCondVar; 
      mutex: ptr DBusMutex; timeout_milliseconds: cint): dbus_bool_t {.cdecl.}

#* Wakes one waiting thread on a condition variable.  Found in #DBusThreadFunctions.
# 
#  Has no error conditions. Must succeed if it returns.
# 

type 
  DBusCondVarWakeOneFunction* = proc (cond: ptr DBusCondVar) {.cdecl.}

#* Wakes all waiting threads on a condition variable.  Found in #DBusThreadFunctions.
# 
#  Has no error conditions. Must succeed if it returns.
# 

type 
  DBusCondVarWakeAllFunction* = proc (cond: ptr DBusCondVar) {.cdecl.}

#*
#  Flags indicating which functions are present in #DBusThreadFunctions. Used to allow
#  the library to detect older callers of dbus_threads_init() if new possible functions
#  are added to #DBusThreadFunctions.
# 

type 
  DBusThreadFunctionsMask* {.size: sizeof(cint).} = enum 
    DBUS_THREAD_FUNCTIONS_MUTEX_NEW_MASK = 1 shl 0, 
    DBUS_THREAD_FUNCTIONS_MUTEX_FREE_MASK = 1 shl 1, 
    DBUS_THREAD_FUNCTIONS_MUTEX_LOCK_MASK = 1 shl 2, 
    DBUS_THREAD_FUNCTIONS_MUTEX_UNLOCK_MASK = 1 shl 3, 
    DBUS_THREAD_FUNCTIONS_CONDVAR_NEW_MASK = 1 shl 4, 
    DBUS_THREAD_FUNCTIONS_CONDVAR_FREE_MASK = 1 shl 5, 
    DBUS_THREAD_FUNCTIONS_CONDVAR_WAIT_MASK = 1 shl 6, 
    DBUS_THREAD_FUNCTIONS_CONDVAR_WAIT_TIMEOUT_MASK = 1 shl 7, 
    DBUS_THREAD_FUNCTIONS_CONDVAR_WAKE_ONE_MASK = 1 shl 8, 
    DBUS_THREAD_FUNCTIONS_CONDVAR_WAKE_ALL_MASK = 1 shl 9, 
    DBUS_THREAD_FUNCTIONS_RECURSIVE_MUTEX_NEW_MASK = 1 shl 10, 
    DBUS_THREAD_FUNCTIONS_RECURSIVE_MUTEX_FREE_MASK = 1 shl 11, 
    DBUS_THREAD_FUNCTIONS_RECURSIVE_MUTEX_LOCK_MASK = 1 shl 12, 
    DBUS_THREAD_FUNCTIONS_RECURSIVE_MUTEX_UNLOCK_MASK = 1 shl 13, 
    DBUS_THREAD_FUNCTIONS_ALL_MASK = (1 shl 14) - 1


#*
#  Functions that must be implemented to make the D-Bus library
#  thread-aware.
# 
#  If you supply both recursive and non-recursive mutexes,
#  libdbus will use the non-recursive version for condition variables,
#  and the recursive version in other contexts.
# 
#  The condition variable functions have to work with nonrecursive
#  mutexes if you provide those, or with recursive mutexes if you
#  don't.
# 

type 
  DBusThreadFunctions* = object 
    mask*: cuint              #*< Mask indicating which functions are present. 
    mutex_new*: DBusMutexNewFunction #*< Function to create a mutex; optional and deprecated. 
    mutex_free*: DBusMutexFreeFunction #*< Function to free a mutex; optional and deprecated. 
    mutex_lock*: DBusMutexLockFunction #*< Function to lock a mutex; optional and deprecated. 
    mutex_unlock*: DBusMutexUnlockFunction #*< Function to unlock a mutex; optional and deprecated. 
    condvar_new*: DBusCondVarNewFunction #*< Function to create a condition variable 
    condvar_free*: DBusCondVarFreeFunction #*< Function to free a condition variable 
    condvar_wait*: DBusCondVarWaitFunction #*< Function to wait on a condition 
    condvar_wait_timeout*: DBusCondVarWaitTimeoutFunction #*< Function to wait on a condition with a timeout 
    condvar_wake_one*: DBusCondVarWakeOneFunction #*< Function to wake one thread waiting on the condition 
    condvar_wake_all*: DBusCondVarWakeAllFunction #*< Function to wake all threads waiting on the condition 
    recursive_mutex_new*: DBusRecursiveMutexNewFunction #*< Function to create a recursive mutex 
    recursive_mutex_free*: DBusRecursiveMutexFreeFunction #*< Function to free a recursive mutex 
    recursive_mutex_lock*: DBusRecursiveMutexLockFunction #*< Function to lock a recursive mutex 
    recursive_mutex_unlock*: DBusRecursiveMutexUnlockFunction #*< Function to unlock a recursive mutex 
    padding1*: proc () {.cdecl.} #*< Reserved for future expansion 
    padding2*: proc () {.cdecl.} #*< Reserved for future expansion 
    padding3*: proc () {.cdecl.} #*< Reserved for future expansion 
    padding4*: proc () {.cdecl.} #*< Reserved for future expansion 
  

proc dbus_threads_init*(functions: ptr DBusThreadFunctions): dbus_bool_t {.
    cdecl, importc: "dbus_threads_init", dynlib: libdbus.}
proc dbus_threads_init_default*(): dbus_bool_t {.cdecl, 
    importc: "dbus_threads_init_default", dynlib: libdbus.}
#* @} 

# -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- 
# dbus-types.h  types such as dbus_bool_t
# 
#  Copyright (C) 2002  Red Hat Inc.
# 
#  Licensed under the Academic Free License version 2.1
# 
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
# 
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
# 
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
# 
# 

#*
#  @defgroup DBus D-Bus low-level public API
#  @brief The low-level public API of the D-Bus library
# 
#  libdbus provides a low-level C API intended primarily for use by
#  bindings to specific object systems and languages.  D-Bus is most
#  convenient when used with the GLib bindings, Python bindings, Qt
#  bindings, Mono bindings, and so forth.  This low-level API has a
#  lot of complexity useful only for bindings.
# 
#  @{
# 
#* @} 
#*
#  @mainpage
# 
#  This manual documents the <em>low-level</em> D-Bus C API. <b>If you use
#  this low-level API directly, you're signing up for some pain.</b>
# 
#  Caveats aside, you might get started learning the low-level API by reading
#  about @ref DBusConnection and @ref DBusMessage.
# 
#  There are several other places to look for D-Bus information, such
#  as the tutorial and the specification; those can be found at <a
#  href="http://www.freedesktop.org/wiki/Software/dbus">the D-Bus
#  website</a>. If you're interested in a sysadmin or package
#  maintainer's perspective on the dbus-daemon itself and its
#  configuration, be sure to check out the man pages as well.
# 
#  The low-level API documented in this manual deliberately lacks
#  most convenience functions - those are left up to higher-level libraries
#  based on frameworks such as GLib, Qt, Python, Mono, Java,
#  etc. These higher-level libraries (often called "D-Bus bindings")
#  have features such as object systems and main loops that allow a
#  <em>much</em> more convenient API.
# 
#  The low-level API also contains plenty of clutter to support
#  integration with arbitrary object systems, languages, main loops,
#  and so forth. These features add a lot of noise to the API that you
#  probably don't care about unless you're coding a binding.
# 
#  This manual also contains docs for @ref DBusInternals "D-Bus internals",
#  so you can use it to get oriented to the D-Bus source code if you're
#  interested in patching the code. You should also read the
#  file HACKING which comes with the source code if you plan to contribute to
#  D-Bus.
# 
#  As you read the code, you can identify internal D-Bus functions
#  because they start with an underscore ('_') character. Also, any
#  identifier or macro that lacks a DBus, dbus_, or DBUS_ namepace
#  prefix is internal, with a couple of exceptions such as #NULL,
#  #TRUE, and #FALSE.
# 
