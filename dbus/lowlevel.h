#include "dbus/private/findlib.nim"
# 1 "dbus/dbus.h"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
/* Copyright (C) 1991-2015 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <http://www.gnu.org/licenses/>.  */




/* This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it.  */

/* glibc's intent is to support the IEC 559 math functionality, real
   and complex.  If the GCC (4.9 and later) predefined macros
   specifying compiler intent are available, use them to determine
   whether the overall intent is to support these features; otherwise,
   presume an older compiler has intent to support these features and
   define these macros by default.  */
# 52 "/usr/include/stdc-predef.h" 3 4
/* wchar_t uses ISO/IEC 10646 (2nd ed., published 2011-03-15) /
   Unicode 6.0.  */


/* We do not support C11 <threads.h>.  */
# 1 "<command-line>" 2
# 1 "dbus/dbus.h"
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus.h  Convenience header including all other headers
 *
 * Copyright (C) 2002, 2003  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */






# 1 "./dbus/dbus-arch-deps.h" 1
/* -*- mode: C; c-file-style: "gnu" -*- */
/* dbus-arch-deps.h Header with architecture/compiler specific information, installed to libdir
 *
 * Copyright (C) 2003 Red Hat, Inc.
 *
 * Licensed under the Academic Free License version 2.0
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */







# 1 "./dbus/dbus-macros.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-macros.h  generic macros
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 94 "./dbus/dbus-macros.h"
/** @def _DBUS_GNUC_PRINTF
 * used to tell gcc about printf format strings
 */
/** @def _DBUS_GNUC_NORETURN
 * used to tell gcc about functions that never return, such as _dbus_abort()
 */


/* Normally docs are in .c files, but there isn't a .c file for this. */
/**
 * @defgroup DBusMacros Utility macros
 * @ingroup  DBus
 * @brief #TRUE, #FALSE, #NULL, and so on
 *
 * Utility macros.
 *
 * @{
 */

/**
 * @def DBUS_BEGIN_DECLS
 *
 * Macro used prior to declaring functions in the D-Bus header
 * files. Expands to "extern "C"" when using a C++ compiler,
 * and expands to nothing when using a C compiler.
 *
 * Please don't use this in your own code, consider it
 * D-Bus internal.
 */
/**
 * @def DBUS_END_DECLS
 *
 * Macro used after declaring functions in the D-Bus header
 * files. Expands to "}" when using a C++ compiler,
 * and expands to nothing when using a C compiler.
 *
 * Please don't use this in your own code, consider it
 * D-Bus internal.
 */
/**
 * @def TRUE
 *
 * Expands to "1"
 */
/**
 * @def FALSE
 *
 * Expands to "0"
 */
/**
 * @def NULL
 *
 * A null pointer, defined appropriately for C or C++.
 */
/**
 * @def DBUS_DEPRECATED
 *
 * Tells the compiler to warn about a function or type if it's used.
 * Code marked in this way should also be enclosed in
 * @code
 * #ifndef DBUS_DISABLE_DEPRECATED
 *  deprecated stuff here
 * #endif
 * @endcode
 *
 * Please don't use this in your own code, consider it
 * D-Bus internal.
 */
/**
 * @def _DBUS_GNUC_EXTENSION
 *
 * Tells gcc not to warn about extensions to the C standard in the
 * following expression, even if compiling with -pedantic. Do not use
 * this macro in your own code; please consider it to be internal to libdbus.
 */

/*
 * @def DBUS_EXPORT
 *
 * Declare the following symbol as public.  This is currently a noop on
 * platforms other than Windows.
 */
# 189 "./dbus/dbus-macros.h"
/** @} */
# 31 "./dbus/dbus-arch-deps.h" 2





 typedef long dbus_int64_t;
 typedef unsigned long dbus_uint64_t;
# 48 "./dbus/dbus-arch-deps.h"
typedef int dbus_int32_t;
typedef unsigned int dbus_uint32_t;

typedef short dbus_int16_t;
typedef unsigned short dbus_uint16_t;

/* This is not really arch-dependent, but it's not worth
 * creating an additional generated header just for this
 */
# 65 "./dbus/dbus-arch-deps.h"

# 30 "dbus/dbus.h" 2
# 1 "./dbus/dbus-address.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-address.h  Server address parser.
 *
 * Copyright (C) 2003  CodeFactory AB
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */







# 1 "./dbus/dbus-types.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-types.h  types such as dbus_bool_t
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */







//#include <stddef.h>
# 1 "./dbus/dbus-arch-deps.h" 1
/* -*- mode: C; c-file-style: "gnu" -*- */
/* dbus-arch-deps.h Header with architecture/compiler specific information, installed to libdir
 *
 * Copyright (C) 2003 Red Hat, Inc.
 *
 * Licensed under the Academic Free License version 2.0
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 32 "./dbus/dbus-types.h" 2

typedef dbus_uint32_t dbus_unichar_t;
/* boolean size must be fixed at 4 bytes due to wire protocol! */
typedef dbus_uint32_t dbus_bool_t;

/* Normally docs are in .c files, but there isn't a .c file for this. */
/**
 * @defgroup DBusTypes Basic types
 * @ingroup  DBus
 * @brief dbus_bool_t, dbus_int32_t, etc.
 *
 * Typedefs for common primitive types.
 *
 * @{
 */

/**
 * @typedef dbus_bool_t
 *
 * A boolean, valid values are #TRUE and #FALSE.
 */

/**
 * @typedef dbus_uint32_t
 *
 * A 32-bit unsigned integer on all platforms.
 */

/**
 * @typedef dbus_int32_t
 *
 * A 32-bit signed integer on all platforms.
 */

/**
 * @typedef dbus_uint16_t
 *
 * A 16-bit unsigned integer on all platforms.
 */

/**
 * @typedef dbus_int16_t
 *
 * A 16-bit signed integer on all platforms.
 */


/**
 * @typedef dbus_uint64_t
 *
 * A 64-bit unsigned integer on all platforms that support it.
 * If supported, #DBUS_HAVE_INT64 will be defined.
 *
 * C99 requires a 64-bit type and most likely all interesting
 * compilers support one. GLib for example flat-out requires
 * a 64-bit type.
 *
 * You probably want to just assume #DBUS_HAVE_INT64 is always defined.
 */

/**
 * @typedef dbus_int64_t
 *
 * A 64-bit signed integer on all platforms that support it.
 * If supported, #DBUS_HAVE_INT64 will be defined.
 *
 * C99 requires a 64-bit type and most likely all interesting
 * compilers support one. GLib for example flat-out requires
 * a 64-bit type.
 *
 * You probably want to just assume #DBUS_HAVE_INT64 is always defined.
 */

/**
 * @def DBUS_HAVE_INT64
 *
 * Defined if 64-bit integers are available. Will be defined
 * on any platform you care about, unless you care about
 * some truly ancient UNIX, or some bizarre embedded platform.
 *
 * C99 requires a 64-bit type and most likely all interesting
 * compilers support one. GLib for example flat-out requires
 * a 64-bit type.
 *
 * You should feel comfortable ignoring this macro and just using
 * int64 unconditionally.
 *
 */

/**
 * @def DBUS_INT64_CONSTANT
 *
 * Declare a 64-bit signed integer constant. The macro
 * adds the necessary "LL" or whatever after the integer,
 * giving a literal such as "325145246765LL"
 */

/**
 * @def DBUS_UINT64_CONSTANT
 *
 * Declare a 64-bit unsigned integer constant. The macro
 * adds the necessary "ULL" or whatever after the integer,
 * giving a literal such as "325145246765ULL"
 */

/**
 * An 8-byte struct you could use to access int64 without having
 * int64 support
 */
typedef struct
{
  dbus_uint32_t first32; /**< first 32 bits in the 8 bytes (beware endian issues) */
  dbus_uint32_t second32; /**< second 32 bits in the 8 bytes (beware endian issues) */
} DBus8ByteStruct;

/**
 * A simple value union that lets you access bytes as if they
 * were various types; useful when dealing with basic types via
 * void pointers and varargs.
 *
 * This union also contains a pointer member (which can be used
 * to retrieve a string from dbus_message_iter_get_basic(), for
 * instance), so on future platforms it could conceivably be larger
 * than 8 bytes.
 */
typedef union
{
  unsigned char bytes[8]; /**< as 8 individual bytes */
  dbus_int16_t i16; /**< as int16 */
  dbus_uint16_t u16; /**< as int16 */
  dbus_int32_t i32; /**< as int32 */
  dbus_uint32_t u32; /**< as int32 */
  dbus_bool_t bool_val; /**< as boolean */

  dbus_int64_t i64; /**< as int64 */
  dbus_uint64_t u64; /**< as int64 */

  DBus8ByteStruct eight; /**< as 8-byte struct */
  double dbl; /**< as double */
  unsigned char byt; /**< as byte */
  char *str; /**< as char* (string, object path or signature) */
  int fd; /**< as Unix file descriptor */
} DBusBasicValue;

/** @} */
# 31 "./dbus/dbus-address.h" 2
# 1 "./dbus/dbus-errors.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-errors.h Error reporting
 *
 * Copyright (C) 2002  Red Hat Inc.
 * Copyright (C) 2003  CodeFactory AB
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */







# 1 "./dbus/dbus-macros.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-macros.h  generic macros
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 32 "./dbus/dbus-errors.h" 2
# 1 "./dbus/dbus-types.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-types.h  types such as dbus_bool_t
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 33 "./dbus/dbus-errors.h" 2
# 1 "./dbus/dbus-protocol.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-protocol.h  D-Bus protocol constants
 *
 * Copyright (C) 2002, 2003  CodeFactory AB
 * Copyright (C) 2004, 2005 Red Hat, Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */




/* Don't include anything in here from anywhere else. It's
 * intended for use by any random library.
 */
# 39 "./dbus/dbus-protocol.h"
/* Normally docs are in .c files, but there isn't a .c file for this. */
/**
 * @defgroup DBusProtocol Protocol constants
 * @ingroup  DBus
 *
 * @brief Defines constants which are part of the D-Bus protocol
 *
 * This header is intended for use by any library, not only libdbus.
 *
 * @{
 */


/* Message byte order */



/** Protocol version. */


/** Type code that is never equal to a legitimate type code */

/** #DBUS_TYPE_INVALID as a string literal instead of a int literal */


/* Primitive types */
/** Type code marking an 8-bit unsigned integer */

/** #DBUS_TYPE_BYTE as a string literal instead of a int literal */

/** Type code marking a boolean */

/** #DBUS_TYPE_BOOLEAN as a string literal instead of a int literal */

/** Type code marking a 16-bit signed integer */

/** #DBUS_TYPE_INT16 as a string literal instead of a int literal */

/** Type code marking a 16-bit unsigned integer */

/** #DBUS_TYPE_UINT16 as a string literal instead of a int literal */

/** Type code marking a 32-bit signed integer */

/** #DBUS_TYPE_INT32 as a string literal instead of a int literal */

/** Type code marking a 32-bit unsigned integer */

/** #DBUS_TYPE_UINT32 as a string literal instead of a int literal */

/** Type code marking a 64-bit signed integer */

/** #DBUS_TYPE_INT64 as a string literal instead of a int literal */

/** Type code marking a 64-bit unsigned integer */

/** #DBUS_TYPE_UINT64 as a string literal instead of a int literal */

/** Type code marking an 8-byte double in IEEE 754 format */

/** #DBUS_TYPE_DOUBLE as a string literal instead of a int literal */

/** Type code marking a UTF-8 encoded, nul-terminated Unicode string */

/** #DBUS_TYPE_STRING as a string literal instead of a int literal */

/** Type code marking a D-Bus object path */

/** #DBUS_TYPE_OBJECT_PATH as a string literal instead of a int literal */

/** Type code marking a D-Bus type signature */

/** #DBUS_TYPE_SIGNATURE as a string literal instead of a int literal */

/** Type code marking a unix file descriptor */

/** #DBUS_TYPE_UNIX_FD as a string literal instead of a int literal */


/* Compound types */
/** Type code marking a D-Bus array type */

/** #DBUS_TYPE_ARRAY as a string literal instead of a int literal */

/** Type code marking a D-Bus variant type */

/** #DBUS_TYPE_VARIANT as a string literal instead of a int literal */


/** STRUCT and DICT_ENTRY are sort of special since their codes can't
 * appear in a type string, instead
 * DBUS_STRUCT_BEGIN_CHAR/DBUS_DICT_ENTRY_BEGIN_CHAR have to appear
 */
/** Type code used to represent a struct; however, this type code does not appear
 * in type signatures, instead #DBUS_STRUCT_BEGIN_CHAR and #DBUS_STRUCT_END_CHAR will
 * appear in a signature.
 */

/** #DBUS_TYPE_STRUCT as a string literal instead of a int literal */

/** Type code used to represent a dict entry; however, this type code does not appear
 * in type signatures, instead #DBUS_DICT_ENTRY_BEGIN_CHAR and #DBUS_DICT_ENTRY_END_CHAR will
 * appear in a signature.
 */

/** #DBUS_TYPE_DICT_ENTRY as a string literal instead of a int literal */


/** Does not include #DBUS_TYPE_INVALID, #DBUS_STRUCT_BEGIN_CHAR, #DBUS_STRUCT_END_CHAR,
 * #DBUS_DICT_ENTRY_BEGIN_CHAR, or #DBUS_DICT_ENTRY_END_CHAR - i.e. it is the number of
 * valid types, not the number of distinct characters that may appear in a type signature.
 */


/* characters other than typecodes that appear in type signatures */

/** Code marking the start of a struct type in a type signature */

/** #DBUS_STRUCT_BEGIN_CHAR as a string literal instead of a int literal */

/** Code marking the end of a struct type in a type signature */

/** #DBUS_STRUCT_END_CHAR a string literal instead of a int literal */

/** Code marking the start of a dict entry type in a type signature */

/** #DBUS_DICT_ENTRY_BEGIN_CHAR as a string literal instead of a int literal */

/** Code marking the end of a dict entry type in a type signature */

/** #DBUS_DICT_ENTRY_END_CHAR as a string literal instead of a int literal */


/** Max length in bytes of a bus name, interface, or member (not object
 * path, paths are unlimited). This is limited because lots of stuff
 * is O(n) in this number, plus it would be obnoxious to type in a
 * paragraph-long method name so most likely something like that would
 * be an exploit.
 */


/** This one is 255 so it fits in a byte */


/** Max length of a match rule string; to keep people from hosing the
 * daemon with some huge rule
 */


/** Max arg number you can match on in a match rule, e.g.
 * arg0='hello' is OK, arg3489720987='hello' is not
 */


/** Max length of a marshaled array in bytes (64M, 2^26) We use signed
 * int for lengths so must be INT_MAX or less.  We need something a
 * bit smaller than INT_MAX because the array is inside a message with
 * header info, etc.  so an INT_MAX array wouldn't allow the message
 * overhead.  The 64M number is an attempt at a larger number than
 * we'd reasonably ever use, but small enough that your bus would chew
 * through it fairly quickly without locking up forever. If you have
 * data that's likely to be larger than this, you should probably be
 * sending it in multiple incremental messages anyhow.
 */

/** Number of bits you need in an unsigned to store the max array size */


/** The maximum total message size including header and body; similar
 * rationale to max array size.
 */

/** Number of bits you need in an unsigned to store the max message size */


/** The maximum total number of unix fds in a message. Similar
 * rationale as DBUS_MAXIMUM_MESSAGE_LENGTH. However we divide by four
 * given that one fd is an int and hence at least 32 bits.
 */

/** Number of bits you need in an unsigned to store the max message unix fds */


/** Depth of recursion in the type tree. This is automatically limited
 * to DBUS_MAXIMUM_SIGNATURE_LENGTH since you could only have an array
 * of array of array of ... that fit in the max signature.  But that's
 * probably a bit too large.
 */


/* Types of message */

/** This value is never a valid message type, see dbus_message_get_type() */

/** Message type of a method call message, see dbus_message_get_type() */

/** Message type of a method return message, see dbus_message_get_type() */

/** Message type of an error reply message, see dbus_message_get_type() */

/** Message type of a signal message, see dbus_message_get_type() */




/* Header flags */

/** If set, this flag means that the sender of a message does not care about getting
 * a reply, so the recipient need not send one. See dbus_message_set_no_reply().
 */

/**
 * If set, this flag means that even if the message bus knows how to start an owner for
 * the destination bus name (see dbus_message_set_destination()), it should not
 * do so. If this flag is not set, the bus may launch a program to process the
 * message.
 */


/* Header fields */

/** Not equal to any valid header field code */

/** Header field code for the path - the path is the object emitting a signal or the object receiving a method call.
 * See dbus_message_set_path().
 */

/** Header field code for the interface containing a member (method or signal).
 * See dbus_message_set_interface().
 */

/** Header field code for a member (method or signal). See dbus_message_set_member(). */

/** Header field code for an error name (found in #DBUS_MESSAGE_TYPE_ERROR messages).
 * See dbus_message_set_error_name().
 */

/** Header field code for a reply serial, used to match a #DBUS_MESSAGE_TYPE_METHOD_RETURN message with the
 * message that it's a reply to. See dbus_message_set_reply_serial().
 */

/**
 * Header field code for the destination bus name of a message. See dbus_message_set_destination().
 */

/**
 * Header field code for the sender of a message; usually initialized by the message bus.
 * See dbus_message_set_sender().
 */

/**
 * Header field code for the type signature of a message.
 */

/**
 * Header field code for the number of unix file descriptors associated
 * with this message.
 */



/**
 * Value of the highest-numbered header field code, can be used to determine
 * the size of an array indexed by header field code. Remember though
 * that unknown codes must be ignored, so check for that before
 * indexing the array.
 */


/** Header format is defined as a signature:
 *   byte                            byte order
 *   byte                            message type ID
 *   byte                            flags
 *   byte                            protocol version
 *   uint32                          body length
 *   uint32                          serial
 *   array of struct (byte,variant)  (field name, value)
 *
 * The length of the header can be computed as the
 * fixed size of the initial data, plus the length of
 * the array at the end, plus padding to an 8-boundary.
 */
# 335 "./dbus/dbus-protocol.h"
/**
 * The smallest header size that can occur.  (It won't be valid due to
 * missing required header fields.) This is 4 bytes, two uint32, an
 * array length. This isn't any kind of resource limit, just the
 * necessary/logical outcome of the header signature.
 */


/* Errors */
/* WARNING these get autoconverted to an enum in dbus-glib.h. Thus,
 * if you change the order it breaks the ABI. Keep them in order.
 * Also, don't change the formatting since that will break the sed
 * script.
 */
/** A generic error; "something went wrong" - see the error message for more. */

/** There was not enough memory to complete an operation. */

/** The bus doesn't know how to launch a service to supply the bus name you wanted. */

/** The bus name you referenced doesn't exist (i.e. no application owns it). */

/** No reply to a message expecting one, usually means a timeout occurred. */

/** Something went wrong reading or writing to a socket, for example. */

/** A D-Bus bus address was malformed. */

/** Requested operation isn't supported (like ENOSYS on UNIX). */

/** Some limited resource is exhausted. */

/** Security restrictions don't allow doing what you're trying to do. */

/** Authentication didn't work. */

/** Unable to connect to server (probably caused by ECONNREFUSED on a socket). */

/** Certain timeout errors, possibly ETIMEDOUT on a socket.
 * Note that #DBUS_ERROR_NO_REPLY is used for message reply timeouts.
 * @warning this is confusingly-named given that #DBUS_ERROR_TIMED_OUT also exists. We can't fix
 * it for compatibility reasons so just be careful.
 */

/** No network access (probably ENETUNREACH on a socket). */

/** Can't bind a socket since its address is in use (i.e. EADDRINUSE). */

/** The connection is disconnected and you're trying to use it. */

/** Invalid arguments passed to a method call. */

/** Missing file. */

/** Existing file and the operation you're using does not silently overwrite. */

/** Method name you invoked isn't known by the object you invoked it on. */

/** Object you invoked a method on isn't known. */

/** Interface you invoked a method on isn't known by the object. */

/** Property you tried to access isn't known by the object. */

/** Property you tried to set is read-only. */

/** Certain timeout errors, e.g. while starting a service.
 * @warning this is confusingly-named given that #DBUS_ERROR_TIMEOUT also exists. We can't fix
 * it for compatibility reasons so just be careful.
 */

/** Tried to remove or modify a match rule that didn't exist. */

/** The match rule isn't syntactically valid. */

/** While starting a new process, the exec() call failed. */

/** While starting a new process, the fork() call failed. */

/** While starting a new process, the child exited with a status code. */

/** While starting a new process, the child exited on a signal. */

/** While starting a new process, something went wrong. */

/** We failed to setup the environment correctly. */

/** We failed to setup the config parser correctly. */

/** Bus name was not valid. */

/** Service file not found in system-services directory. */

/** Permissions are incorrect on the setuid helper. */

/** Service file invalid (Name, User or Exec missing). */

/** Tried to get a UNIX process ID and it wasn't available. */

/** Tried to get a UNIX process ID and it wasn't available. */

/** A type signature is not valid. */

/** A file contains invalid syntax or is otherwise broken. */

/** Asked for SELinux security context and it wasn't available. */

/** Asked for AppArmor security context and it wasn't available. */

/** Asked for ADT audit data and it wasn't available. */

/** There's already an object with the requested object path. */

/** The message meta data does not match the payload. e.g. expected
    number of file descriptors were not sent over the socket this message was received on. */


/* XML introspection format */

/** XML namespace of the introspection format version 1.0 */

/** XML public identifier of the introspection format version 1.0 */

/** XML system identifier of the introspection format version 1.0 */

/** XML document type declaration of the introspection format version 1.0 */


/** @} */
# 34 "./dbus/dbus-errors.h" 2



/**
 * @addtogroup DBusErrors
 * @{
 */

/** Mostly-opaque type representing an error that occurred */
typedef struct DBusError DBusError;

/**
 * Object representing an exception.
 */
struct DBusError
{
  const char *name; /**< public error name field */
  const char *message; /**< public error message field */

  unsigned int dummy5bits; /**< placeholder */

  void *padding1; /**< placeholder */
};




void dbus_error_init (DBusError *error);

void dbus_error_free (DBusError *error);

void dbus_set_error (DBusError *error,
                                  const char *name,
                                  const char *message,
                                  ...);

void dbus_set_error_const (DBusError *error,
                                  const char *name,
                                  const char *message);

void dbus_move_error (DBusError *src,
                                  DBusError *dest);

dbus_bool_t dbus_error_has_name (const DBusError *error,
                                  const char *name);

dbus_bool_t dbus_error_is_set (const DBusError *error);

/** @} */


# 32 "./dbus/dbus-address.h" 2



/**
 * @addtogroup DBusAddress
 * @{
 */

/** Opaque type representing one of the semicolon-separated items in an address */
struct DBusAddressEntry;
typedef struct DBusAddressEntry DBusAddressEntry;


dbus_bool_t dbus_parse_address (const char *address,
        DBusAddressEntry ***entry,
        int *array_len,
        DBusError *error);

const char *dbus_address_entry_get_value (DBusAddressEntry *entry,
        const char *key);

const char *dbus_address_entry_get_method (DBusAddressEntry *entry);

void dbus_address_entries_free (DBusAddressEntry **entries);


char* dbus_address_escape_value (const char *value);

char* dbus_address_unescape_value (const char *value,
                                   DBusError *error);

/** @} */


# 31 "dbus/dbus.h" 2
# 1 "./dbus/dbus-bus.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-bus.h  Convenience functions for communicating with the bus.
 *
 * Copyright (C) 2003  CodeFactory AB
 *
 * Licensed under the Academic Free License version 2.1
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */







# 1 "./dbus/dbus-connection.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-connection.h DBusConnection object
 *
 * Copyright (C) 2002, 2003  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */







# 1 "./dbus/dbus-errors.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-errors.h Error reporting
 *
 * Copyright (C) 2002  Red Hat Inc.
 * Copyright (C) 2003  CodeFactory AB
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 31 "./dbus/dbus-connection.h" 2
# 1 "./dbus/dbus-memory.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-memory.h  D-Bus memory handling
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */







# 1 "./dbus/dbus-macros.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-macros.h  generic macros
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 31 "./dbus/dbus-memory.h" 2
//#include <stddef.h>



/**
 * @addtogroup DBusMemory
 * @{
 */




void* dbus_malloc (size_t bytes);




void* dbus_malloc0 (size_t bytes);




void* dbus_realloc (void *memory,
                          size_t bytes);

void dbus_free (void *memory);





void dbus_free_string_array (char **str_array);

typedef void (* DBusFreeFunction) (void *memory);


void dbus_shutdown (void);

/** @} */


# 32 "./dbus/dbus-connection.h" 2
# 1 "./dbus/dbus-message.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-message.h DBusMessage object
 *
 * Copyright (C) 2002, 2003, 2005 Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */







# 1 "./dbus/dbus-macros.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-macros.h  generic macros
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 31 "./dbus/dbus-message.h" 2
# 1 "./dbus/dbus-types.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-types.h  types such as dbus_bool_t
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 32 "./dbus/dbus-message.h" 2
# 1 "./dbus/dbus-arch-deps.h" 1
/* -*- mode: C; c-file-style: "gnu" -*- */
/* dbus-arch-deps.h Header with architecture/compiler specific information, installed to libdir
 *
 * Copyright (C) 2003 Red Hat, Inc.
 *
 * Licensed under the Academic Free License version 2.0
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 33 "./dbus/dbus-message.h" 2
# 1 "./dbus/dbus-memory.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-memory.h  D-Bus memory handling
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 34 "./dbus/dbus-message.h" 2
# 1 "./dbus/dbus-errors.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-errors.h Error reporting
 *
 * Copyright (C) 2002  Red Hat Inc.
 * Copyright (C) 2003  CodeFactory AB
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 35 "./dbus/dbus-message.h" 2
//#include <stdarg.h>



/**
 * @addtogroup DBusMessage
 * @{
 */

struct DBusMessage;
typedef struct DBusMessage DBusMessage;
/** Opaque type representing a message iterator. Can be copied by value, and contains no allocated memory so never needs to be freed and can be allocated on the stack. */;
typedef struct DBusMessageIter DBusMessageIter;

/**
 * DBusMessageIter struct; contains no public fields.
 */
struct DBusMessageIter
{
  void *dummy1; /**< Don't use this */
  void *dummy2; /**< Don't use this */
  dbus_uint32_t dummy3; /**< Don't use this */
  int dummy4; /**< Don't use this */
  int dummy5; /**< Don't use this */
  int dummy6; /**< Don't use this */
  int dummy7; /**< Don't use this */
  int dummy8; /**< Don't use this */
  int dummy9; /**< Don't use this */
  int dummy10; /**< Don't use this */
  int dummy11; /**< Don't use this */
  int pad1; /**< Don't use this */
  int pad2; /**< Don't use this */
  void *pad3; /**< Don't use this */
};


DBusMessage* dbus_message_new (int message_type);

DBusMessage* dbus_message_new_method_call (const char *bus_name,
                                             const char *path,
                                             const char *iface,
                                             const char *method);

DBusMessage* dbus_message_new_method_return (DBusMessage *method_call);

DBusMessage* dbus_message_new_signal (const char *path,
                                             const char *iface,
                                             const char *name);

DBusMessage* dbus_message_new_error (DBusMessage *reply_to,
                                             const char *error_name,
                                             const char *error_message);

DBusMessage* dbus_message_new_error_printf (DBusMessage *reply_to,
                                             const char *error_name,
                                             const char *error_format,
          ...);


DBusMessage* dbus_message_copy (const DBusMessage *message);


DBusMessage* dbus_message_ref (DBusMessage *message);

void dbus_message_unref (DBusMessage *message);

int dbus_message_get_type (DBusMessage *message);

dbus_bool_t dbus_message_set_path (DBusMessage *message,
                                             const char *object_path);

const char* dbus_message_get_path (DBusMessage *message);

dbus_bool_t dbus_message_has_path (DBusMessage *message,
                                             const char *object_path);

dbus_bool_t dbus_message_set_interface (DBusMessage *message,
                                             const char *iface);

const char* dbus_message_get_interface (DBusMessage *message);

dbus_bool_t dbus_message_has_interface (DBusMessage *message,
                                             const char *iface);

dbus_bool_t dbus_message_set_member (DBusMessage *message,
                                             const char *member);

const char* dbus_message_get_member (DBusMessage *message);

dbus_bool_t dbus_message_has_member (DBusMessage *message,
                                             const char *member);

dbus_bool_t dbus_message_set_error_name (DBusMessage *message,
                                             const char *name);

const char* dbus_message_get_error_name (DBusMessage *message);

dbus_bool_t dbus_message_set_destination (DBusMessage *message,
                                             const char *destination);

const char* dbus_message_get_destination (DBusMessage *message);

dbus_bool_t dbus_message_set_sender (DBusMessage *message,
                                             const char *sender);

const char* dbus_message_get_sender (DBusMessage *message);

const char* dbus_message_get_signature (DBusMessage *message);

void dbus_message_set_no_reply (DBusMessage *message,
                                             dbus_bool_t no_reply);

dbus_bool_t dbus_message_get_no_reply (DBusMessage *message);

dbus_bool_t dbus_message_is_method_call (DBusMessage *message,
                                             const char *iface,
                                             const char *method);

dbus_bool_t dbus_message_is_signal (DBusMessage *message,
                                             const char *iface,
                                             const char *signal_name);

dbus_bool_t dbus_message_is_error (DBusMessage *message,
                                             const char *error_name);

dbus_bool_t dbus_message_has_destination (DBusMessage *message,
                                             const char *bus_name);

dbus_bool_t dbus_message_has_sender (DBusMessage *message,
                                             const char *unique_bus_name);

dbus_bool_t dbus_message_has_signature (DBusMessage *message,
                                             const char *signature);

dbus_uint32_t dbus_message_get_serial (DBusMessage *message);

void dbus_message_set_serial (DBusMessage *message,
                                             dbus_uint32_t serial);

dbus_bool_t dbus_message_set_reply_serial (DBusMessage *message,
                                             dbus_uint32_t reply_serial);

dbus_uint32_t dbus_message_get_reply_serial (DBusMessage *message);


void dbus_message_set_auto_start (DBusMessage *message,
                                             dbus_bool_t auto_start);

dbus_bool_t dbus_message_get_auto_start (DBusMessage *message);


dbus_bool_t dbus_message_get_path_decomposed (DBusMessage *message,
                                                char ***path);


dbus_bool_t dbus_message_append_args (DBusMessage *message,
            int first_arg_type,
            ...);
//DBUS_EXPORT
//dbus_bool_t dbus_message_append_args_valist   (DBusMessage     *message,
//					       int              first_arg_type,
//					       va_list          var_args);

dbus_bool_t dbus_message_get_args (DBusMessage *message,
            DBusError *error,
            int first_arg_type,
            ...);
//DBUS_EXPORT
//dbus_bool_t dbus_message_get_args_valist      (DBusMessage     *message,
//					       DBusError       *error,
//					       int              first_arg_type,
//					       va_list          var_args);


dbus_bool_t dbus_message_contains_unix_fds (DBusMessage *message);


dbus_bool_t dbus_message_iter_init (DBusMessage *message,
                                                DBusMessageIter *iter);

dbus_bool_t dbus_message_iter_has_next (DBusMessageIter *iter);

dbus_bool_t dbus_message_iter_next (DBusMessageIter *iter);

char* dbus_message_iter_get_signature (DBusMessageIter *iter);

int dbus_message_iter_get_arg_type (DBusMessageIter *iter);

int dbus_message_iter_get_element_type (DBusMessageIter *iter);

void dbus_message_iter_recurse (DBusMessageIter *iter,
                                                DBusMessageIter *sub);

void dbus_message_iter_get_basic (DBusMessageIter *iter,
                                                void *value);

/* This function returns the wire protocol size of the array in bytes,
 * you do not want to know that probably
 */

 int dbus_message_iter_get_array_len (DBusMessageIter *iter);


void dbus_message_iter_get_fixed_array (DBusMessageIter *iter,
                                                void *value,
                                                int *n_elements);



void dbus_message_iter_init_append (DBusMessage *message,
                                                  DBusMessageIter *iter);

dbus_bool_t dbus_message_iter_append_basic (DBusMessageIter *iter,
                                                  int type,
                                                  const void *value);

dbus_bool_t dbus_message_iter_append_fixed_array (DBusMessageIter *iter,
                                                  int element_type,
                                                  const void *value,
                                                  int n_elements);

dbus_bool_t dbus_message_iter_open_container (DBusMessageIter *iter,
                                                  int type,
                                                  const char *contained_signature,
                                                  DBusMessageIter *sub);

dbus_bool_t dbus_message_iter_close_container (DBusMessageIter *iter,
                                                  DBusMessageIter *sub);

void dbus_message_iter_abandon_container (DBusMessageIter *iter,
                                                  DBusMessageIter *sub);


void dbus_message_lock (DBusMessage *message);


dbus_bool_t dbus_set_error_from_message (DBusError *error,
                                           DBusMessage *message);



dbus_bool_t dbus_message_allocate_data_slot (dbus_int32_t *slot_p);

void dbus_message_free_data_slot (dbus_int32_t *slot_p);

dbus_bool_t dbus_message_set_data (DBusMessage *message,
                                             dbus_int32_t slot,
                                             void *data,
                                             DBusFreeFunction free_data_func);

void* dbus_message_get_data (DBusMessage *message,
                                             dbus_int32_t slot);


int dbus_message_type_from_string (const char *type_str);

const char* dbus_message_type_to_string (int type);


dbus_bool_t dbus_message_marshal (DBusMessage *msg,
                                     char **marshalled_data_p,
                                     int *len_p);

DBusMessage* dbus_message_demarshal (const char *str,
                                     int len,
                                     DBusError *error);


int dbus_message_demarshal_bytes_needed (const char *str,
                                                  int len);

/** @} */


# 33 "./dbus/dbus-connection.h" 2
# 1 "./dbus/dbus-shared.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-shared.h  Stuff used by both dbus/dbus.h low-level and C/C++ binding APIs
 *
 * Copyright (C) 2004 Red Hat, Inc.
 *
 * Licensed under the Academic Free License version 2.1
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */




/* Don't include anything in here from anywhere else. It's
 * intended for use by any random library.
 */
# 38 "./dbus/dbus-shared.h"
/* Normally docs are in .c files, but there isn't a .c file for this. */
/**
 * @defgroup DBusShared Shared constants 
 * @ingroup  DBus
 *
 * @brief Shared header included by both libdbus and C/C++ bindings such as the GLib bindings.
 *
 * Usually a C/C++ binding such as the GLib or Qt binding won't want to include dbus.h in its
 * public headers. However, a few constants and macros may be useful to include; those are
 * found here and in dbus-protocol.h
 *
 * @{
 */


/**
 * Well-known bus types. See dbus_bus_get().
 */
typedef enum
{
  DBUS_BUS_SESSION, /**< The login session bus */
  DBUS_BUS_SYSTEM, /**< The systemwide bus */
  DBUS_BUS_STARTER /**< The bus that started us, if any */
} DBusBusType;

/**
 * Results that a message handler can return.
 */
typedef enum
{
  DBUS_HANDLER_RESULT_HANDLED, /**< Message has had its effect - no need to run more handlers. */
  DBUS_HANDLER_RESULT_NOT_YET_HANDLED, /**< Message has not had any effect - see if other handlers want it. */
  DBUS_HANDLER_RESULT_NEED_MEMORY /**< Need more memory in order to return #DBUS_HANDLER_RESULT_HANDLED or #DBUS_HANDLER_RESULT_NOT_YET_HANDLED. Please try again later with more memory. */
} DBusHandlerResult;

/* Bus names */

/** The bus name used to talk to the bus itself. */


/* Paths */
/** The object path used to talk to the bus itself. */

/** The object path used in local/in-process-generated messages. */


/* Interfaces, these #define don't do much other than
 * catch typos at compile time
 */
/** The interface exported by the object with #DBUS_SERVICE_DBUS and #DBUS_PATH_DBUS */

/** The interface supported by introspectable objects */

/** The interface supported by objects with properties */

/** The interface supported by most dbus peers */


/** This is a special interface whose methods can only be invoked
 * by the local implementation (messages from remote apps aren't
 * allowed to specify this interface).
 */


/* Owner flags */




/* Replies to request for a name */





/* Replies to releasing a name */




/* Replies to service starts */



/** @} */
# 34 "./dbus/dbus-connection.h" 2



/**
 * @addtogroup DBusConnection
 * @{
 */

/* documented in dbus-watch.c */
struct DBusWatch;
typedef struct DBusWatch DBusWatch;
/* documented in dbus-timeout.c */
struct DBusTimeout;
typedef struct DBusTimeout DBusTimeout;
/** Opaque type representing preallocated resources so a message can be sent without further memory allocation. */
struct DBusPreallocatedSend;
typedef struct DBusPreallocatedSend DBusPreallocatedSend;
/** Opaque type representing a method call that has not yet received a reply. */
struct DBusPendingCall;
typedef struct DBusPendingCall DBusPendingCall;
/** Opaque type representing a connection to a remote application and associated incoming/outgoing message queues. */
struct DBusConnection;
typedef struct DBusConnection DBusConnection;
/** Set of functions that must be implemented to handle messages sent to a particular object path. */
typedef struct DBusObjectPathVTable DBusObjectPathVTable;

/**
 * Indicates the status of a #DBusWatch.
 */
typedef enum
{
  DBUS_WATCH_READABLE = 1 << 0, /**< As in POLLIN */
  DBUS_WATCH_WRITABLE = 1 << 1, /**< As in POLLOUT */
  DBUS_WATCH_ERROR = 1 << 2, /**< As in POLLERR (can't watch for
                                 *   this, but can be present in
                                 *   current state passed to
                                 *   dbus_watch_handle()).
                                 */
  DBUS_WATCH_HANGUP = 1 << 3 /**< As in POLLHUP (can't watch for
                                 *   it, but can be present in current
                                 *   state passed to
                                 *   dbus_watch_handle()).
                                 */
  /* Internal to libdbus, there is also _DBUS_WATCH_NVAL in dbus-watch.h */
} DBusWatchFlags;

/**
 * Indicates the status of incoming data on a #DBusConnection. This determines whether
 * dbus_connection_dispatch() needs to be called.
 */
typedef enum
{
  DBUS_DISPATCH_DATA_REMAINS, /**< There is more data to potentially convert to messages. */
  DBUS_DISPATCH_COMPLETE, /**< All currently available data has been processed. */
  DBUS_DISPATCH_NEED_MEMORY /**< More memory is needed to continue. */
} DBusDispatchStatus;

/** Called when libdbus needs a new watch to be monitored by the main
 * loop. Returns #FALSE if it lacks enough memory to add the
 * watch. Set by dbus_connection_set_watch_functions() or
 * dbus_server_set_watch_functions().
 */
typedef dbus_bool_t (* DBusAddWatchFunction) (DBusWatch *watch,
                                                    void *data);
/** Called when dbus_watch_get_enabled() may return a different value
 *  than it did before.  Set by dbus_connection_set_watch_functions()
 *  or dbus_server_set_watch_functions().
 */
typedef void (* DBusWatchToggledFunction) (DBusWatch *watch,
                                                    void *data);
/** Called when libdbus no longer needs a watch to be monitored by the
 * main loop. Set by dbus_connection_set_watch_functions() or
 * dbus_server_set_watch_functions().
 */
typedef void (* DBusRemoveWatchFunction) (DBusWatch *watch,
                                                    void *data);
/** Called when libdbus needs a new timeout to be monitored by the main
 * loop. Returns #FALSE if it lacks enough memory to add the
 * watch. Set by dbus_connection_set_timeout_functions() or
 * dbus_server_set_timeout_functions().
 */
typedef dbus_bool_t (* DBusAddTimeoutFunction) (DBusTimeout *timeout,
                                                    void *data);
/** Called when dbus_timeout_get_enabled() may return a different
 * value than it did before.
 * Set by dbus_connection_set_timeout_functions() or
 * dbus_server_set_timeout_functions().
 */
typedef void (* DBusTimeoutToggledFunction) (DBusTimeout *timeout,
                                                    void *data);
/** Called when libdbus no longer needs a timeout to be monitored by the
 * main loop. Set by dbus_connection_set_timeout_functions() or
 * dbus_server_set_timeout_functions().
 */
typedef void (* DBusRemoveTimeoutFunction) (DBusTimeout *timeout,
                                                    void *data);
/** Called when the return value of dbus_connection_get_dispatch_status()
 * may have changed. Set with dbus_connection_set_dispatch_status_function().
 */
typedef void (* DBusDispatchStatusFunction) (DBusConnection *connection,
                                                    DBusDispatchStatus new_status,
                                                    void *data);
/**
 * Called when the main loop's thread should be notified that there's now work
 * to do. Set with dbus_connection_set_wakeup_main_function().
 */
typedef void (* DBusWakeupMainFunction) (void *data);

/**
 * Called during authentication to check whether the given UNIX user
 * ID is allowed to connect, if the client tried to auth as a UNIX
 * user ID. Normally on Windows this would never happen. Set with
 * dbus_connection_set_unix_user_function().
 */
typedef dbus_bool_t (* DBusAllowUnixUserFunction) (DBusConnection *connection,
                                                    unsigned long uid,
                                                    void *data);

/**
 * Called during authentication to check whether the given Windows user
 * ID is allowed to connect, if the client tried to auth as a Windows
 * user ID. Normally on UNIX this would never happen. Set with
 * dbus_connection_set_windows_user_function().
 */
typedef dbus_bool_t (* DBusAllowWindowsUserFunction) (DBusConnection *connection,
                                                       const char *user_sid,
                                                       void *data);


/**
 * Called when a pending call now has a reply available. Set with
 * dbus_pending_call_set_notify().
 */
typedef void (* DBusPendingCallNotifyFunction) (DBusPendingCall *pending,
                                                void *user_data);

/**
 * Called when a message needs to be handled. The result indicates whether or
 * not more handlers should be run. Set with dbus_connection_add_filter().
 */
typedef DBusHandlerResult (* DBusHandleMessageFunction) (DBusConnection *connection,
                                                         DBusMessage *message,
                                                         void *user_data);

DBusConnection* dbus_connection_open (const char *address,
                                                                 DBusError *error);

DBusConnection* dbus_connection_open_private (const char *address,
                                                                 DBusError *error);

DBusConnection* dbus_connection_ref (DBusConnection *connection);

void dbus_connection_unref (DBusConnection *connection);

void dbus_connection_close (DBusConnection *connection);

dbus_bool_t dbus_connection_get_is_connected (DBusConnection *connection);

dbus_bool_t dbus_connection_get_is_authenticated (DBusConnection *connection);

dbus_bool_t dbus_connection_get_is_anonymous (DBusConnection *connection);

char* dbus_connection_get_server_id (DBusConnection *connection);

dbus_bool_t dbus_connection_can_send_type (DBusConnection *connection,
                                                                 int type);


void dbus_connection_set_exit_on_disconnect (DBusConnection *connection,
                                                                 dbus_bool_t exit_on_disconnect);

void dbus_connection_flush (DBusConnection *connection);

dbus_bool_t dbus_connection_read_write_dispatch (DBusConnection *connection,
                                                                 int timeout_milliseconds);

dbus_bool_t dbus_connection_read_write (DBusConnection *connection,
                                                                 int timeout_milliseconds);

DBusMessage* dbus_connection_borrow_message (DBusConnection *connection);

void dbus_connection_return_message (DBusConnection *connection,
                                                                 DBusMessage *message);

void dbus_connection_steal_borrowed_message (DBusConnection *connection,
                                                                 DBusMessage *message);

DBusMessage* dbus_connection_pop_message (DBusConnection *connection);

DBusDispatchStatus dbus_connection_get_dispatch_status (DBusConnection *connection);

DBusDispatchStatus dbus_connection_dispatch (DBusConnection *connection);

dbus_bool_t dbus_connection_has_messages_to_send (DBusConnection *connection);

dbus_bool_t dbus_connection_send (DBusConnection *connection,
                                                                 DBusMessage *message,
                                                                 dbus_uint32_t *client_serial);

dbus_bool_t dbus_connection_send_with_reply (DBusConnection *connection,
                                                                 DBusMessage *message,
                                                                 DBusPendingCall **pending_return,
                                                                 int timeout_milliseconds);

DBusMessage * dbus_connection_send_with_reply_and_block (DBusConnection *connection,
                                                                 DBusMessage *message,
                                                                 int timeout_milliseconds,
                                                                 DBusError *error);

dbus_bool_t dbus_connection_set_watch_functions (DBusConnection *connection,
                                                                 DBusAddWatchFunction add_function,
                                                                 DBusRemoveWatchFunction remove_function,
                                                                 DBusWatchToggledFunction toggled_function,
                                                                 void *data,
                                                                 DBusFreeFunction free_data_function);

dbus_bool_t dbus_connection_set_timeout_functions (DBusConnection *connection,
                                                                 DBusAddTimeoutFunction add_function,
                                                                 DBusRemoveTimeoutFunction remove_function,
                                                                 DBusTimeoutToggledFunction toggled_function,
                                                                 void *data,
                                                                 DBusFreeFunction free_data_function);

void dbus_connection_set_wakeup_main_function (DBusConnection *connection,
                                                                 DBusWakeupMainFunction wakeup_main_function,
                                                                 void *data,
                                                                 DBusFreeFunction free_data_function);

void dbus_connection_set_dispatch_status_function (DBusConnection *connection,
                                                                 DBusDispatchStatusFunction function,
                                                                 void *data,
                                                                 DBusFreeFunction free_data_function);

dbus_bool_t dbus_connection_get_unix_user (DBusConnection *connection,
                                                                 unsigned long *uid);

dbus_bool_t dbus_connection_get_unix_process_id (DBusConnection *connection,
                                                                 unsigned long *pid);

dbus_bool_t dbus_connection_get_adt_audit_session_data (DBusConnection *connection,
                                                                 void **data,
                                                                 dbus_int32_t *data_size);

void dbus_connection_set_unix_user_function (DBusConnection *connection,
                                                                 DBusAllowUnixUserFunction function,
                                                                 void *data,
                                                                 DBusFreeFunction free_data_function);

dbus_bool_t dbus_connection_get_windows_user (DBusConnection *connection,
                                                                 char **windows_sid_p);

void dbus_connection_set_windows_user_function (DBusConnection *connection,
                                                                 DBusAllowWindowsUserFunction function,
                                                                 void *data,
                                                                 DBusFreeFunction free_data_function);

void dbus_connection_set_allow_anonymous (DBusConnection *connection,
                                                                 dbus_bool_t value);

void dbus_connection_set_route_peer_messages (DBusConnection *connection,
                                                                 dbus_bool_t value);


/* Filters */


dbus_bool_t dbus_connection_add_filter (DBusConnection *connection,
                                           DBusHandleMessageFunction function,
                                           void *user_data,
                                           DBusFreeFunction free_data_function);

void dbus_connection_remove_filter (DBusConnection *connection,
                                           DBusHandleMessageFunction function,
                                           void *user_data);


/* Other */

dbus_bool_t dbus_connection_allocate_data_slot (dbus_int32_t *slot_p);

void dbus_connection_free_data_slot (dbus_int32_t *slot_p);

dbus_bool_t dbus_connection_set_data (DBusConnection *connection,
                                                dbus_int32_t slot,
                                                void *data,
                                                DBusFreeFunction free_data_func);

void* dbus_connection_get_data (DBusConnection *connection,
                                                dbus_int32_t slot);


void dbus_connection_set_change_sigpipe (dbus_bool_t will_modify_sigpipe);


void dbus_connection_set_max_message_size (DBusConnection *connection,
                                            long size);

long dbus_connection_get_max_message_size (DBusConnection *connection);

void dbus_connection_set_max_received_size (DBusConnection *connection,
                                            long size);

long dbus_connection_get_max_received_size (DBusConnection *connection);


void dbus_connection_set_max_message_unix_fds (DBusConnection *connection,
                                               long n);

long dbus_connection_get_max_message_unix_fds (DBusConnection *connection);

void dbus_connection_set_max_received_unix_fds(DBusConnection *connection,
                                               long n);

long dbus_connection_get_max_received_unix_fds(DBusConnection *connection);


long dbus_connection_get_outgoing_size (DBusConnection *connection);

long dbus_connection_get_outgoing_unix_fds (DBusConnection *connection);


DBusPreallocatedSend* dbus_connection_preallocate_send (DBusConnection *connection);

void dbus_connection_free_preallocated_send (DBusConnection *connection,
                                                              DBusPreallocatedSend *preallocated);

void dbus_connection_send_preallocated (DBusConnection *connection,
                                                              DBusPreallocatedSend *preallocated,
                                                              DBusMessage *message,
                                                              dbus_uint32_t *client_serial);


/* Object tree functionality */

/**
 * Called when a #DBusObjectPathVTable is unregistered (or its connection is freed).
 * Found in #DBusObjectPathVTable.
 */
typedef void (* DBusObjectPathUnregisterFunction) (DBusConnection *connection,
                                                                void *user_data);
/**
 * Called when a message is sent to a registered object path. Found in
 * #DBusObjectPathVTable which is registered with dbus_connection_register_object_path()
 * or dbus_connection_register_fallback().
 */
typedef DBusHandlerResult (* DBusObjectPathMessageFunction) (DBusConnection *connection,
                                                                DBusMessage *message,
                                                                void *user_data);

/**
 * Virtual table that must be implemented to handle a portion of the
 * object path hierarchy. Attach the vtable to a particular path using
 * dbus_connection_register_object_path() or
 * dbus_connection_register_fallback().
 */
struct DBusObjectPathVTable
{
  DBusObjectPathUnregisterFunction unregister_function; /**< Function to unregister this handler */
  DBusObjectPathMessageFunction message_function; /**< Function to handle messages */

  void (* dbus_internal_pad1) (void *); /**< Reserved for future expansion */
  void (* dbus_internal_pad2) (void *); /**< Reserved for future expansion */
  void (* dbus_internal_pad3) (void *); /**< Reserved for future expansion */
  void (* dbus_internal_pad4) (void *); /**< Reserved for future expansion */
};


dbus_bool_t dbus_connection_try_register_object_path (DBusConnection *connection,
                                                      const char *path,
                                                      const DBusObjectPathVTable *vtable,
                                                      void *user_data,
                                                      DBusError *error);


dbus_bool_t dbus_connection_register_object_path (DBusConnection *connection,
                                                    const char *path,
                                                    const DBusObjectPathVTable *vtable,
                                                    void *user_data);


dbus_bool_t dbus_connection_try_register_fallback (DBusConnection *connection,
                                                   const char *path,
                                                   const DBusObjectPathVTable *vtable,
                                                   void *user_data,
                                                   DBusError *error);


dbus_bool_t dbus_connection_register_fallback (DBusConnection *connection,
                                                    const char *path,
                                                    const DBusObjectPathVTable *vtable,
                                                    void *user_data);

dbus_bool_t dbus_connection_unregister_object_path (DBusConnection *connection,
                                                    const char *path);


dbus_bool_t dbus_connection_get_object_path_data (DBusConnection *connection,
                                                    const char *path,
                                                    void **data_p);


dbus_bool_t dbus_connection_list_registered (DBusConnection *connection,
                                                    const char *parent_path,
                                                    char ***child_entries);


dbus_bool_t dbus_connection_get_unix_fd (DBusConnection *connection,
                                                    int *fd);

dbus_bool_t dbus_connection_get_socket (DBusConnection *connection,
                                                    int *fd);

/** @} */


/**
 * @addtogroup DBusWatch
 * @{
 */



 int dbus_watch_get_fd (DBusWatch *watch);



int dbus_watch_get_unix_fd (DBusWatch *watch);

int dbus_watch_get_socket (DBusWatch *watch);

unsigned int dbus_watch_get_flags (DBusWatch *watch);

void* dbus_watch_get_data (DBusWatch *watch);

void dbus_watch_set_data (DBusWatch *watch,
                                     void *data,
                                     DBusFreeFunction free_data_function);

dbus_bool_t dbus_watch_handle (DBusWatch *watch,
                                     unsigned int flags);

dbus_bool_t dbus_watch_get_enabled (DBusWatch *watch);

/** @} */

/**
 * @addtogroup DBusTimeout
 * @{
 */


int dbus_timeout_get_interval (DBusTimeout *timeout);

void* dbus_timeout_get_data (DBusTimeout *timeout);

void dbus_timeout_set_data (DBusTimeout *timeout,
                                       void *data,
                                       DBusFreeFunction free_data_function);

dbus_bool_t dbus_timeout_handle (DBusTimeout *timeout);

dbus_bool_t dbus_timeout_get_enabled (DBusTimeout *timeout);

/** @} */


# 31 "./dbus/dbus-bus.h" 2



/**
 * @addtogroup DBusBus
 * @{
 */


DBusConnection *dbus_bus_get (DBusBusType type,
        DBusError *error);

DBusConnection *dbus_bus_get_private (DBusBusType type,
        DBusError *error);


dbus_bool_t dbus_bus_register (DBusConnection *connection,
        DBusError *error);

dbus_bool_t dbus_bus_set_unique_name (DBusConnection *connection,
        const char *unique_name);

const char* dbus_bus_get_unique_name (DBusConnection *connection);

unsigned long dbus_bus_get_unix_user (DBusConnection *connection,
                      const char *name,
                                           DBusError *error);

char* dbus_bus_get_id (DBusConnection *connection,
                                           DBusError *error);

int dbus_bus_request_name (DBusConnection *connection,
        const char *name,
        unsigned int flags,
        DBusError *error);

int dbus_bus_release_name (DBusConnection *connection,
        const char *name,
        DBusError *error);

dbus_bool_t dbus_bus_name_has_owner (DBusConnection *connection,
        const char *name,
        DBusError *error);


dbus_bool_t dbus_bus_start_service_by_name (DBusConnection *connection,
                                                const char *name,
                                                dbus_uint32_t flags,
                                                dbus_uint32_t *reply,
                                                DBusError *error);


void dbus_bus_add_match (DBusConnection *connection,
                                           const char *rule,
                                           DBusError *error);

void dbus_bus_remove_match (DBusConnection *connection,
                                           const char *rule,
                                           DBusError *error);

/** @} */


# 32 "dbus/dbus.h" 2
# 1 "./dbus/dbus-connection.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-connection.h DBusConnection object
 *
 * Copyright (C) 2002, 2003  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 33 "dbus/dbus.h" 2
# 1 "./dbus/dbus-errors.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-errors.h Error reporting
 *
 * Copyright (C) 2002  Red Hat Inc.
 * Copyright (C) 2003  CodeFactory AB
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 34 "dbus/dbus.h" 2
# 1 "./dbus/dbus-message.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-message.h DBusMessage object
 *
 * Copyright (C) 2002, 2003, 2005 Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 35 "dbus/dbus.h" 2
# 1 "./dbus/dbus-misc.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-misc.h  A few assorted public functions that don't fit elsewhere
 *
 * Copyright (C) 2006 Red Hat, Inc.
 *
 * Licensed under the Academic Free License version 2.1
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */







# 1 "./dbus/dbus-types.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-types.h  types such as dbus_bool_t
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 31 "./dbus/dbus-misc.h" 2
# 1 "./dbus/dbus-errors.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-errors.h Error reporting
 *
 * Copyright (C) 2002  Red Hat Inc.
 * Copyright (C) 2003  CodeFactory AB
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 32 "./dbus/dbus-misc.h" 2



/**
 * @addtogroup DBusMisc
 * @{
 */

char* dbus_get_local_machine_id (void);


void dbus_get_version (int *major_version_p,
                                        int *minor_version_p,
                                        int *micro_version_p);

/** @} */


# 36 "dbus/dbus.h" 2
# 1 "./dbus/dbus-pending-call.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-pending-call.h Object representing a call in progress.
 *
 * Copyright (C) 2002, 2003 Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */







# 1 "./dbus/dbus-macros.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-macros.h  generic macros
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 31 "./dbus/dbus-pending-call.h" 2
# 1 "./dbus/dbus-types.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-types.h  types such as dbus_bool_t
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 32 "./dbus/dbus-pending-call.h" 2
# 1 "./dbus/dbus-connection.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-connection.h DBusConnection object
 *
 * Copyright (C) 2002, 2003  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 33 "./dbus/dbus-pending-call.h" 2



/**
 * @addtogroup DBusPendingCall
 * @{
 */





DBusPendingCall* dbus_pending_call_ref (DBusPendingCall *pending);

void dbus_pending_call_unref (DBusPendingCall *pending);

dbus_bool_t dbus_pending_call_set_notify (DBusPendingCall *pending,
                                              DBusPendingCallNotifyFunction function,
                                              void *user_data,
                                              DBusFreeFunction free_user_data);

void dbus_pending_call_cancel (DBusPendingCall *pending);

dbus_bool_t dbus_pending_call_get_completed (DBusPendingCall *pending);

DBusMessage* dbus_pending_call_steal_reply (DBusPendingCall *pending);

void dbus_pending_call_block (DBusPendingCall *pending);


dbus_bool_t dbus_pending_call_allocate_data_slot (dbus_int32_t *slot_p);

void dbus_pending_call_free_data_slot (dbus_int32_t *slot_p);

dbus_bool_t dbus_pending_call_set_data (DBusPendingCall *pending,
                                                  dbus_int32_t slot,
                                                  void *data,
                                                  DBusFreeFunction free_data_func);

void* dbus_pending_call_get_data (DBusPendingCall *pending,
                                                  dbus_int32_t slot);

/** @} */


# 37 "dbus/dbus.h" 2
# 1 "./dbus/dbus-protocol.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-protocol.h  D-Bus protocol constants
 *
 * Copyright (C) 2002, 2003  CodeFactory AB
 * Copyright (C) 2004, 2005 Red Hat, Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 38 "dbus/dbus.h" 2
# 1 "./dbus/dbus-server.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-server.h DBusServer object
 *
 * Copyright (C) 2002, 2003  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */







# 1 "./dbus/dbus-errors.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-errors.h Error reporting
 *
 * Copyright (C) 2002  Red Hat Inc.
 * Copyright (C) 2003  CodeFactory AB
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 31 "./dbus/dbus-server.h" 2
# 1 "./dbus/dbus-message.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-message.h DBusMessage object
 *
 * Copyright (C) 2002, 2003, 2005 Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 32 "./dbus/dbus-server.h" 2
# 1 "./dbus/dbus-connection.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-connection.h DBusConnection object
 *
 * Copyright (C) 2002, 2003  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 33 "./dbus/dbus-server.h" 2
# 1 "./dbus/dbus-protocol.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-protocol.h  D-Bus protocol constants
 *
 * Copyright (C) 2002, 2003  CodeFactory AB
 * Copyright (C) 2004, 2005 Red Hat, Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 34 "./dbus/dbus-server.h" 2



/**
 * @addtogroup DBusServer
 * @{
 */

struct DBusServer;
typedef struct DBusServer DBusServer;

/** Called when a new connection to the server is available. Must reference and save the new
 * connection, or close the new connection. Set with dbus_server_set_new_connection_function().
 */
typedef void (* DBusNewConnectionFunction) (DBusServer *server,
                                            DBusConnection *new_connection,
                                            void *data);


DBusServer* dbus_server_listen (const char *address,
                                          DBusError *error);

DBusServer* dbus_server_ref (DBusServer *server);

void dbus_server_unref (DBusServer *server);

void dbus_server_disconnect (DBusServer *server);

dbus_bool_t dbus_server_get_is_connected (DBusServer *server);

char* dbus_server_get_address (DBusServer *server);

char* dbus_server_get_id (DBusServer *server);

void dbus_server_set_new_connection_function (DBusServer *server,
                                                     DBusNewConnectionFunction function,
                                                     void *data,
                                                     DBusFreeFunction free_data_function);

dbus_bool_t dbus_server_set_watch_functions (DBusServer *server,
                                                     DBusAddWatchFunction add_function,
                                                     DBusRemoveWatchFunction remove_function,
                                                     DBusWatchToggledFunction toggled_function,
                                                     void *data,
                                                     DBusFreeFunction free_data_function);

dbus_bool_t dbus_server_set_timeout_functions (DBusServer *server,
                                                     DBusAddTimeoutFunction add_function,
                                                     DBusRemoveTimeoutFunction remove_function,
                                                     DBusTimeoutToggledFunction toggled_function,
                                                     void *data,
                                                     DBusFreeFunction free_data_function);

dbus_bool_t dbus_server_set_auth_mechanisms (DBusServer *server,
                                                     const char **mechanisms);


dbus_bool_t dbus_server_allocate_data_slot (dbus_int32_t *slot_p);

void dbus_server_free_data_slot (dbus_int32_t *slot_p);

dbus_bool_t dbus_server_set_data (DBusServer *server,
                                            int slot,
                                            void *data,
                                            DBusFreeFunction free_data_func);

void* dbus_server_get_data (DBusServer *server,
                                            int slot);

/** @} */


# 39 "dbus/dbus.h" 2
# 1 "./dbus/dbus-shared.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-shared.h  Stuff used by both dbus/dbus.h low-level and C/C++ binding APIs
 *
 * Copyright (C) 2004 Red Hat, Inc.
 *
 * Licensed under the Academic Free License version 2.1
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 40 "dbus/dbus.h" 2
# 1 "./dbus/dbus-signature.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-signatures.h utility functions for D-Bus types
 *
 * Copyright (C) 2005 Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */







# 1 "./dbus/dbus-macros.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-macros.h  generic macros
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 31 "./dbus/dbus-signature.h" 2
# 1 "./dbus/dbus-types.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-types.h  types such as dbus_bool_t
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 32 "./dbus/dbus-signature.h" 2
# 1 "./dbus/dbus-errors.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-errors.h Error reporting
 *
 * Copyright (C) 2002  Red Hat Inc.
 * Copyright (C) 2003  CodeFactory AB
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 33 "./dbus/dbus-signature.h" 2



/**
 * @addtogroup DBusSignature
 * @{
 */

/**
 * DBusSignatureIter struct; contains no public fields 
 */
typedef struct
{
  void *dummy1; /**< Don't use this */
  void *dummy2; /**< Don't use this */
  dbus_uint32_t dummy8; /**< Don't use this */
  int dummy12; /**< Don't use this */
  int dummy17; /**< Don't use this */
} DBusSignatureIter;


void dbus_signature_iter_init (DBusSignatureIter *iter,
            const char *signature);


int dbus_signature_iter_get_current_type (const DBusSignatureIter *iter);


char * dbus_signature_iter_get_signature (const DBusSignatureIter *iter);


int dbus_signature_iter_get_element_type (const DBusSignatureIter *iter);


dbus_bool_t dbus_signature_iter_next (DBusSignatureIter *iter);


void dbus_signature_iter_recurse (const DBusSignatureIter *iter,
            DBusSignatureIter *subiter);


dbus_bool_t dbus_signature_validate (const char *signature,
            DBusError *error);


dbus_bool_t dbus_signature_validate_single (const char *signature,
            DBusError *error);


dbus_bool_t dbus_type_is_valid (int typecode);


dbus_bool_t dbus_type_is_basic (int typecode);

dbus_bool_t dbus_type_is_container (int typecode);

dbus_bool_t dbus_type_is_fixed (int typecode);

/** @} */


# 41 "dbus/dbus.h" 2
# 1 "./dbus/dbus-syntax.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-syntax.h - utility functions for strings with special syntax
 *
 * Author: Simon McVittie <simon.mcvittie@collabora.co.uk>
 * Copyright © 2011 Nokia Corporation
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */







# 1 "./dbus/dbus-macros.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-macros.h  generic macros
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 32 "./dbus/dbus-syntax.h" 2
# 1 "./dbus/dbus-types.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-types.h  types such as dbus_bool_t
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 33 "./dbus/dbus-syntax.h" 2
# 1 "./dbus/dbus-errors.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-errors.h Error reporting
 *
 * Copyright (C) 2002  Red Hat Inc.
 * Copyright (C) 2003  CodeFactory AB
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 34 "./dbus/dbus-syntax.h" 2




dbus_bool_t dbus_validate_path (const char *path,
                                                      DBusError *error);

dbus_bool_t dbus_validate_interface (const char *name,
                                                      DBusError *error);

dbus_bool_t dbus_validate_member (const char *name,
                                                      DBusError *error);

dbus_bool_t dbus_validate_error_name (const char *name,
                                                      DBusError *error);

dbus_bool_t dbus_validate_bus_name (const char *name,
                                                      DBusError *error);

dbus_bool_t dbus_validate_utf8 (const char *alleged_utf8,
                                                      DBusError *error);


# 42 "dbus/dbus.h" 2
# 1 "./dbus/dbus-threads.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-threads.h  D-Bus threads handling
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */







# 1 "./dbus/dbus-macros.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-macros.h  generic macros
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 31 "./dbus/dbus-threads.h" 2
# 1 "./dbus/dbus-types.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-types.h  types such as dbus_bool_t
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 32 "./dbus/dbus-threads.h" 2



/**
 * @addtogroup DBusThreads
 * @{
 */

/** An opaque mutex type provided by the #DBusThreadFunctions implementation installed by dbus_threads_init(). */
struct DBusMutex;
typedef struct DBusMutex DBusMutex;
/** An opaque condition variable type provided by the #DBusThreadFunctions implementation installed by dbus_threads_init(). */
struct DBusCondVar;
typedef struct DBusCondVar DBusCondVar;

/** Deprecated, provide DBusRecursiveMutexNewFunction instead. */
typedef DBusMutex* (* DBusMutexNewFunction) (void);
/** Deprecated, provide DBusRecursiveMutexFreeFunction instead. */
typedef void (* DBusMutexFreeFunction) (DBusMutex *mutex);
/** Deprecated, provide DBusRecursiveMutexLockFunction instead. Return value is lock success, but gets ignored in practice. */
typedef dbus_bool_t (* DBusMutexLockFunction) (DBusMutex *mutex);
/** Deprecated, provide DBusRecursiveMutexUnlockFunction instead. Return value is unlock success, but gets ignored in practice. */
typedef dbus_bool_t (* DBusMutexUnlockFunction) (DBusMutex *mutex);

/** Creates a new recursively-lockable mutex, or returns #NULL if not
 * enough memory.  Can only fail due to lack of memory.  Found in
 * #DBusThreadFunctions. Do not just use PTHREAD_MUTEX_RECURSIVE for
 * this, because it does not save/restore the recursion count when
 * waiting on a condition. libdbus requires the Java-style behavior
 * where the mutex is fully unlocked to wait on a condition.
 */
typedef DBusMutex* (* DBusRecursiveMutexNewFunction) (void);
/** Frees a recursively-lockable mutex.  Found in #DBusThreadFunctions.
 */
typedef void (* DBusRecursiveMutexFreeFunction) (DBusMutex *mutex);
/** Locks a recursively-lockable mutex.  Found in #DBusThreadFunctions.
 * Can only fail due to lack of memory.
 */
typedef void (* DBusRecursiveMutexLockFunction) (DBusMutex *mutex);
/** Unlocks a recursively-lockable mutex.  Found in #DBusThreadFunctions.
 * Can only fail due to lack of memory.
 */
typedef void (* DBusRecursiveMutexUnlockFunction) (DBusMutex *mutex);

/** Creates a new condition variable.  Found in #DBusThreadFunctions.
 * Can only fail (returning #NULL) due to lack of memory.
 */
typedef DBusCondVar* (* DBusCondVarNewFunction) (void);
/** Frees a condition variable.  Found in #DBusThreadFunctions.
 */
typedef void (* DBusCondVarFreeFunction) (DBusCondVar *cond);

/** Waits on a condition variable.  Found in
 * #DBusThreadFunctions. Must work with either a recursive or
 * nonrecursive mutex, whichever the thread implementation
 * provides. Note that PTHREAD_MUTEX_RECURSIVE does not work with
 * condition variables (does not save/restore the recursion count) so
 * don't try using simply pthread_cond_wait() and a
 * PTHREAD_MUTEX_RECURSIVE to implement this, it won't work right.
 *
 * Has no error conditions. Must succeed if it returns.
 */
typedef void (* DBusCondVarWaitFunction) (DBusCondVar *cond,
         DBusMutex *mutex);

/** Waits on a condition variable with a timeout.  Found in
 *  #DBusThreadFunctions. Returns #TRUE if the wait did not
 *  time out, and #FALSE if it did.
 *
 * Has no error conditions. Must succeed if it returns.
 */
typedef dbus_bool_t (* DBusCondVarWaitTimeoutFunction) (DBusCondVar *cond,
         DBusMutex *mutex,
         int timeout_milliseconds);
/** Wakes one waiting thread on a condition variable.  Found in #DBusThreadFunctions.
 *
 * Has no error conditions. Must succeed if it returns.
 */
typedef void (* DBusCondVarWakeOneFunction) (DBusCondVar *cond);

/** Wakes all waiting threads on a condition variable.  Found in #DBusThreadFunctions.
 *
 * Has no error conditions. Must succeed if it returns.
 */
typedef void (* DBusCondVarWakeAllFunction) (DBusCondVar *cond);

/**
 * Flags indicating which functions are present in #DBusThreadFunctions. Used to allow
 * the library to detect older callers of dbus_threads_init() if new possible functions
 * are added to #DBusThreadFunctions.
 */
typedef enum
{
  DBUS_THREAD_FUNCTIONS_MUTEX_NEW_MASK = 1 << 0,
  DBUS_THREAD_FUNCTIONS_MUTEX_FREE_MASK = 1 << 1,
  DBUS_THREAD_FUNCTIONS_MUTEX_LOCK_MASK = 1 << 2,
  DBUS_THREAD_FUNCTIONS_MUTEX_UNLOCK_MASK = 1 << 3,
  DBUS_THREAD_FUNCTIONS_CONDVAR_NEW_MASK = 1 << 4,
  DBUS_THREAD_FUNCTIONS_CONDVAR_FREE_MASK = 1 << 5,
  DBUS_THREAD_FUNCTIONS_CONDVAR_WAIT_MASK = 1 << 6,
  DBUS_THREAD_FUNCTIONS_CONDVAR_WAIT_TIMEOUT_MASK = 1 << 7,
  DBUS_THREAD_FUNCTIONS_CONDVAR_WAKE_ONE_MASK = 1 << 8,
  DBUS_THREAD_FUNCTIONS_CONDVAR_WAKE_ALL_MASK = 1 << 9,
  DBUS_THREAD_FUNCTIONS_RECURSIVE_MUTEX_NEW_MASK = 1 << 10,
  DBUS_THREAD_FUNCTIONS_RECURSIVE_MUTEX_FREE_MASK = 1 << 11,
  DBUS_THREAD_FUNCTIONS_RECURSIVE_MUTEX_LOCK_MASK = 1 << 12,
  DBUS_THREAD_FUNCTIONS_RECURSIVE_MUTEX_UNLOCK_MASK = 1 << 13,
  DBUS_THREAD_FUNCTIONS_ALL_MASK = (1 << 14) - 1
} DBusThreadFunctionsMask;

/**
 * Functions that must be implemented to make the D-Bus library
 * thread-aware.
 *
 * If you supply both recursive and non-recursive mutexes,
 * libdbus will use the non-recursive version for condition variables,
 * and the recursive version in other contexts.
 *
 * The condition variable functions have to work with nonrecursive
 * mutexes if you provide those, or with recursive mutexes if you
 * don't.
 */
typedef struct
{
  unsigned int mask; /**< Mask indicating which functions are present. */

  DBusMutexNewFunction mutex_new; /**< Function to create a mutex; optional and deprecated. */
  DBusMutexFreeFunction mutex_free; /**< Function to free a mutex; optional and deprecated. */
  DBusMutexLockFunction mutex_lock; /**< Function to lock a mutex; optional and deprecated. */
  DBusMutexUnlockFunction mutex_unlock; /**< Function to unlock a mutex; optional and deprecated. */

  DBusCondVarNewFunction condvar_new; /**< Function to create a condition variable */
  DBusCondVarFreeFunction condvar_free; /**< Function to free a condition variable */
  DBusCondVarWaitFunction condvar_wait; /**< Function to wait on a condition */
  DBusCondVarWaitTimeoutFunction condvar_wait_timeout; /**< Function to wait on a condition with a timeout */
  DBusCondVarWakeOneFunction condvar_wake_one; /**< Function to wake one thread waiting on the condition */
  DBusCondVarWakeAllFunction condvar_wake_all; /**< Function to wake all threads waiting on the condition */

  DBusRecursiveMutexNewFunction recursive_mutex_new; /**< Function to create a recursive mutex */
  DBusRecursiveMutexFreeFunction recursive_mutex_free; /**< Function to free a recursive mutex */
  DBusRecursiveMutexLockFunction recursive_mutex_lock; /**< Function to lock a recursive mutex */
  DBusRecursiveMutexUnlockFunction recursive_mutex_unlock; /**< Function to unlock a recursive mutex */

  void (* padding1) (void); /**< Reserved for future expansion */
  void (* padding2) (void); /**< Reserved for future expansion */
  void (* padding3) (void); /**< Reserved for future expansion */
  void (* padding4) (void); /**< Reserved for future expansion */

} DBusThreadFunctions;


dbus_bool_t dbus_threads_init (const DBusThreadFunctions *functions);

dbus_bool_t dbus_threads_init_default (void);

/** @} */


# 43 "dbus/dbus.h" 2
# 1 "./dbus/dbus-types.h" 1
/* -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*- */
/* dbus-types.h  types such as dbus_bool_t
 *
 * Copyright (C) 2002  Red Hat Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
 */
# 44 "dbus/dbus.h" 2



/**
 * @defgroup DBus D-Bus low-level public API
 * @brief The low-level public API of the D-Bus library
 *
 * libdbus provides a low-level C API intended primarily for use by
 * bindings to specific object systems and languages.  D-Bus is most
 * convenient when used with the GLib bindings, Python bindings, Qt
 * bindings, Mono bindings, and so forth.  This low-level API has a
 * lot of complexity useful only for bindings.
 *
 * @{
 */

/** @} */

/**
 * @mainpage
 *
 * This manual documents the <em>low-level</em> D-Bus C API. <b>If you use
 * this low-level API directly, you're signing up for some pain.</b>
 *
 * Caveats aside, you might get started learning the low-level API by reading
 * about @ref DBusConnection and @ref DBusMessage.
 *
 * There are several other places to look for D-Bus information, such
 * as the tutorial and the specification; those can be found at <a
 * href="http://www.freedesktop.org/wiki/Software/dbus">the D-Bus
 * website</a>. If you're interested in a sysadmin or package
 * maintainer's perspective on the dbus-daemon itself and its
 * configuration, be sure to check out the man pages as well.
 *
 * The low-level API documented in this manual deliberately lacks
 * most convenience functions - those are left up to higher-level libraries
 * based on frameworks such as GLib, Qt, Python, Mono, Java,
 * etc. These higher-level libraries (often called "D-Bus bindings")
 * have features such as object systems and main loops that allow a
 * <em>much</em> more convenient API.
 *
 * The low-level API also contains plenty of clutter to support
 * integration with arbitrary object systems, languages, main loops,
 * and so forth. These features add a lot of noise to the API that you
 * probably don't care about unless you're coding a binding.
 *
 * This manual also contains docs for @ref DBusInternals "D-Bus internals",
 * so you can use it to get oriented to the D-Bus source code if you're
 * interested in patching the code. You should also read the
 * file HACKING which comes with the source code if you plan to contribute to
 * D-Bus.
 *
 * As you read the code, you can identify internal D-Bus functions
 * because they start with an underscore ('_') character. Also, any
 * identifier or macro that lacks a DBus, dbus_, or DBUS_ namepace
 * prefix is internal, with a couple of exceptions such as #NULL,
 * #TRUE, and #FALSE.
 */
