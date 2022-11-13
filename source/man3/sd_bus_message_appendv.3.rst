.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_message_append(3) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `TYPES STRING G                   |                                   |
| RAMMAR <#TYPES_STRING_GRAMMAR>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_BUS_MESSAGE_APPEND(3)  sd_bus_message_append SD_BUS_MESSAGE_APPEND(3)

NAME
-------------------------------------------------

::

          sd_bus_message_append, sd_bus_message_appendv - Attach fields to
          a D-Bus message based on a type string


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_message_append(sd_bus_message *m, const char *types,
                                    ...);

          int sd_bus_message_appendv(sd_bus_message *m, const char *types,
                                     va_list ap);


---------------------------------------------------------------

::

          The sd_bus_message_append() function appends a sequence of fields
          to the D-Bus message object m. The type string types describes
          the types of the field arguments that follow. For each type
          specified in the type string, one or more arguments need to be
          specified, in the same order as declared in the type string.

          The type string is composed of the elements shown in the table
          below. It contains zero or more single "complete types". Each
          complete type may be one of the basic types or a fully described
          container type. A container type may be a structure with the
          contained types, a variant, an array with its element type, or a
          dictionary entry with the contained types. The type string is
          NUL-terminated.

          In case of a basic type, one argument of the corresponding type
          is expected.

          A structure is denoted by a sequence of complete types between
          "(" and ")". This sequence cannot be empty — it must contain at
          least one type. Arguments corresponding to this nested sequence
          follow the same rules as if they were not nested.

          A variant is denoted by "v". Corresponding arguments must begin
          with a type string denoting a complete type, and following that,
          arguments corresponding to the specified type.

          An array is denoted by "a" followed by a complete type.
          Corresponding arguments must begin with the number of entries in
          the array, followed by the entries themselves, matching the
          element type of the array.

          A dictionary is an array of dictionary entries, denoted by "a"
          followed by a pair of complete types between "{" and "}". The
          first of those types must be a basic type. Corresponding
          arguments must begin with the number of dictionary entries,
          followed by a pair of values for each entry matching the element
          type of the dictionary entries.

          sd_bus_message_appendv() is equivalent to
          sd_bus_message_append(), except that it is called with a
          "va_list" instead of a variable number of arguments. This
          function does not call the va_end() macro. Because it invokes the
          va_arg() macro, the value of ap is undefined after the call.

          For further details on the D-Bus type system, please consult the
          D-Bus Specification[1].

          Table 1. Item type specifiers
          ┌──────────┬──────────────────────────────┬────────────────┬──────────────┬─────────────┐
          │Specifier │ Constant                     │ Description    │ Size         │ Expected C  │
          │          │                              │                │              │ Type        │
          ├──────────┼──────────────────────────────┼────────────────┼──────────────┼─────────────┤
          │"y"       │ SD_BUS_TYPE_BYTE             │ unsigned       │ 1 byte       │ uint8_t     │
          │          │                              │ integer        │              │             │
          ├──────────┼──────────────────────────────┼────────────────┼──────────────┼─────────────┤
          │"b"       │ SD_BUS_TYPE_BOOLEAN          │ boolean        │ 4 bytes      │ int         │
          ├──────────┼──────────────────────────────┼────────────────┼──────────────┼─────────────┤
          │"n"       │ SD_BUS_TYPE_INT16            │ signed         │ 2 bytes      │ int16_t     │
          │          │                              │ integer        │              │             │
          ├──────────┼──────────────────────────────┼────────────────┼──────────────┼─────────────┤
          │"q"       │ SD_BUS_TYPE_UINT16           │ unsigned       │ 2 bytes      │ uint16_t    │
          │          │                              │ integer        │              │             │
          ├──────────┼──────────────────────────────┼────────────────┼──────────────┼─────────────┤
          │"i"       │ SD_BUS_TYPE_INT32            │ signed         │ 4 bytes      │ int32_t     │
          │          │                              │ integer        │              │             │
          ├──────────┼──────────────────────────────┼────────────────┼──────────────┼─────────────┤
          │"u"       │ SD_BUS_TYPE_UINT32           │ unsigned       │ 4 bytes      │ uint32_t    │
          │          │                              │ integer        │              │             │
          ├──────────┼──────────────────────────────┼────────────────┼──────────────┼─────────────┤
          │"x"       │ SD_BUS_TYPE_INT64            │ signed         │ 8 bytes      │ int64_t     │
          │          │                              │ integer        │              │             │
          ├──────────┼──────────────────────────────┼────────────────┼──────────────┼─────────────┤
          │"t"       │ SD_BUS_TYPE_UINT64           │ unsigned       │ 8 bytes      │ uint64_t    │
          │          │                              │ integer        │              │             │
          ├──────────┼──────────────────────────────┼────────────────┼──────────────┼─────────────┤
          │"d"       │ SD_BUS_TYPE_DOUBLE           │ floating-point │ 8 bytes      │ double      │
          ├──────────┼──────────────────────────────┼────────────────┼──────────────┼─────────────┤
          │"s"       │ SD_BUS_TYPE_STRING           │ Unicode string │ variable     │ char[]      │
          ├──────────┼──────────────────────────────┼────────────────┼──────────────┼─────────────┤
          │"o"       │ SD_BUS_TYPE_OBJECT_PATH      │ object path    │ variable     │ char[]      │
          ├──────────┼──────────────────────────────┼────────────────┼──────────────┼─────────────┤
          │"g"       │ SD_BUS_TYPE_SIGNATURE        │ signature      │ variable     │ char[]      │
          ├──────────┼──────────────────────────────┼────────────────┼──────────────┼─────────────┤
          │"h"       │ SD_BUS_TYPE_UNIX_FD          │ UNIX file      │ 4 bytes      │ int         │
          │          │                              │ descriptor     │              │             │
          ├──────────┼──────────────────────────────┼────────────────┼──────────────┼─────────────┤
          │"a"       │ SD_BUS_TYPE_ARRAY            │ array          │ determined   │ int,        │
          │          │                              │                │ by array     │ followed by │
          │          │                              │                │ type and     │ array       │
          │          │                              │                │ size         │ contents    │
          ├──────────┼──────────────────────────────┼────────────────┼──────────────┼─────────────┤
          │"v"       │ SD_BUS_TYPE_VARIANT          │ variant        │ determined   │ signature   │
          │          │                              │                │ by the type  │ string,     │
          │          │                              │                │ argument     │ followed by │
          │          │                              │                │              │ variant     │
          │          │                              │                │              │ contents    │
          ├──────────┼──────────────────────────────┼────────────────┼──────────────┼─────────────┤
          │"("       │ SD_BUS_TYPE_STRUCT_BEGIN     │ array start    │ determined   │ structure   │
          ├──────────┼──────────────────────────────┼────────────────┤ by the       │ contents    │
          │")"       │ SD_BUS_TYPE_STRUCT_END       │ array end      │ nested types │             │
          ├──────────┼──────────────────────────────┼────────────────┼──────────────┼─────────────┤
          │"{"       │ SD_BUS_TYPE_DICT_ENTRY_BEGIN │ dictionary     │              │             │
          │          │                              │ entry start    │ determined   │ dictionary  │
          ├──────────┼──────────────────────────────┼────────────────┤ by the       │ contents    │
          │"}"       │ SD_BUS_TYPE_DICT_ENTRY_END   │ dictionary     │ nested types │             │
          │          │                              │ entry end      │              │             │
          └──────────┴──────────────────────────────┴────────────────┴──────────────┴─────────────┘

          For types "s" and "g" (unicode string or signature), the pointer
          may be NULL, which is equivalent to an empty string. For "h"
          (UNIX file descriptor), the descriptor is duplicated by this call
          and the passed descriptor stays in possession of the caller. See
          sd_bus_message_append_basic(3) for the precise interpretation of
          those and other types.


---------------------------------------------------------------------------------

::

              types ::= complete_type*
              complete_type ::= basic_type | variant | structure | array | dictionary
              basic_type ::= "y" | "n" | "q" | "u" | "i" | "x" | "t" | "d" |
                             "b" | "h" |
                             "s" | "o" | "g"
              variant ::= "v"
              structure ::= "(" complete_type+ ")"
              array ::= "a" complete_type
              dictionary ::= "a" "{" basic_type complete_type "}"


---------------------------------------------------------

::

          Append a single basic type (the string "a string"):

              sd_bus_message *m;
              ...
              sd_bus_message_append(m, "s", "a string");

          Append all types of integers:

              uint8_t y = 1;
              int16_t n = 2;
              uint16_t q = 3;
              int32_t i = 4;
              uint32_t u = 5;
              int32_t x = 6;
              uint32_t t = 7;
              double d = 8.0;
              sd_bus_message_append(m, "ynqiuxtd", y, n, q, i, u, x, t, d);

          Append a structure composed of a string and a D-Bus path:

              sd_bus_message_append(m, "(so)", "a string", "/a/path");

          Append an array of UNIX file descriptors:

              sd_bus_message_append(m, "ah", 3, STDIN_FILENO, STDOUT_FILENO, STDERR_FILENO);

          Append a variant, with the real type "g" (signature), and value
          "sdbusisgood":

              sd_bus_message_append(m, "v", "g", "sdbusisgood");

          Append a dictionary containing the mapping {1=>"a", 2=>"b",
          3=>""}:

              sd_bus_message_append(m, "a{is}", 3, 1, "a", 2, "b", 3, NULL);


-----------------------------------------------------------------

::

          On success, these functions return a non-negative integer. On
          failure, they return a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              Specified parameter is invalid.

          -EPERM
              Message has been sealed.

          -ESTALE
              Message is in invalid state.

          -ENXIO
              Message cannot be appended to.

          -ENOMEM
              Memory allocation failed.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_message_append_basic(3),
          sd_bus_message_append_array(3), sd_bus_message_open_container(3)

.. _notes-top-1:


---------------------------------------------------

::

           1. D-Bus Specification
              http://dbus.freedesktop.org/doc/dbus-specification.html#type-system

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                     SD_BUS_MESSAGE_APPEND(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_call(3) <../man3/sd_bus_call.3.html>`__, 
`sd_bus_call_method(3) <../man3/sd_bus_call_method.3.html>`__, 
`sd_bus_emit_signal(3) <../man3/sd_bus_emit_signal.3.html>`__, 
`sd_bus_message_append_array(3) <../man3/sd_bus_message_append_array.3.html>`__, 
`sd_bus_message_append_basic(3) <../man3/sd_bus_message_append_basic.3.html>`__, 
`sd_bus_message_append_strv(3) <../man3/sd_bus_message_append_strv.3.html>`__, 
`sd_bus_message_copy(3) <../man3/sd_bus_message_copy.3.html>`__, 
`sd_bus_message_open_container(3) <../man3/sd_bus_message_open_container.3.html>`__, 
`sd_bus_message_read(3) <../man3/sd_bus_message_read.3.html>`__, 
`sd_bus_message_verify_type(3) <../man3/sd_bus_message_verify_type.3.html>`__, 
`sd_bus_reply_method_return(3) <../man3/sd_bus_reply_method_return.3.html>`__, 
`sd_bus_set_property(3) <../man3/sd_bus_set_property.3.html>`__

--------------

--------------

.. container:: footer

   +-----------------------+-----------------------+-----------------------+
   | HTML rendering        |                       | |Cover of TLPI|       |
   | created 2021-08-27 by |                       |                       |
   | `Michael              |                       |                       |
   | Ker                   |                       |                       |
   | risk <https://man7.or |                       |                       |
   | g/mtk/index.html>`__, |                       |                       |
   | author of `The Linux  |                       |                       |
   | Programming           |                       |                       |
   | Interface <https:     |                       |                       |
   | //man7.org/tlpi/>`__, |                       |                       |
   | maintainer of the     |                       |                       |
   | `Linux man-pages      |                       |                       |
   | project <             |                       |                       |
   | https://www.kernel.or |                       |                       |
   | g/doc/man-pages/>`__. |                       |                       |
   |                       |                       |                       |
   | For details of        |                       |                       |
   | in-depth **Linux/UNIX |                       |                       |
   | system programming    |                       |                       |
   | training courses**    |                       |                       |
   | that I teach, look    |                       |                       |
   | `here <https://ma     |                       |                       |
   | n7.org/training/>`__. |                       |                       |
   |                       |                       |                       |
   | Hosting by `jambit    |                       |                       |
   | GmbH                  |                       |                       |
   | <https://www.jambit.c |                       |                       |
   | om/index_en.html>`__. |                       |                       |
   +-----------------------+-----------------------+-----------------------+

--------------

.. container:: statcounter

   |Web Analytics Made Easy - StatCounter|

.. |Cover of TLPI| image:: https://man7.org/tlpi/cover/TLPI-front-cover-vsmall.png
   :target: https://man7.org/tlpi/
.. |Web Analytics Made Easy - StatCounter| image:: https://c.statcounter.com/7422636/0/9b6714ff/1/
   :class: statcounter
   :target: https://statcounter.com/
