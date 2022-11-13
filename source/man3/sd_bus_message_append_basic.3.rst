.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_message_append_basic(3) — Linux manual page
==================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_BUS_MESSAGE_APPEND_BASIC(3)message_append_basicESSAGE_APPEND_BASIC(3)

NAME
-------------------------------------------------

::

          sd_bus_message_append_basic - Attach a single field to a message


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_message_append_basic(sd_bus_message *m, char type,
                                          const void *p);


---------------------------------------------------------------

::

          sd_bus_message_append_basic() appends a single field to the
          message m. The parameter type determines how the pointer p is
          interpreted.  type must be one of the basic types as defined by
          the Basic Types[1] section of the D-Bus specification, and listed
          in the table below.

          Table 1. Item type specifiers
          ┌──────────┬─────────────────────────┬────────────────┬──────────┬────────────┐
          │Specifier │ Constant                │ Description    │ Size     │ Expected C │
          │          │                         │                │          │ Type       │
          ├──────────┼─────────────────────────┼────────────────┼──────────┼────────────┤
          │"y"       │ SD_BUS_TYPE_BYTE        │ unsigned       │ 1 byte   │ uint8_t    │
          │          │                         │ integer        │          │            │
          ├──────────┼─────────────────────────┼────────────────┼──────────┼────────────┤
          │"b"       │ SD_BUS_TYPE_BOOLEAN     │ boolean        │ 4 bytes  │ int        │
          ├──────────┼─────────────────────────┼────────────────┼──────────┼────────────┤
          │"n"       │ SD_BUS_TYPE_INT16       │ signed         │ 2 bytes  │ int16_t    │
          │          │                         │ integer        │          │            │
          ├──────────┼─────────────────────────┼────────────────┼──────────┼────────────┤
          │"q"       │ SD_BUS_TYPE_UINT16      │ unsigned       │ 2 bytes  │ uint16_t   │
          │          │                         │ integer        │          │            │
          ├──────────┼─────────────────────────┼────────────────┼──────────┼────────────┤
          │"i"       │ SD_BUS_TYPE_INT32       │ signed         │ 4 bytes  │ int32_t    │
          │          │                         │ integer        │          │            │
          ├──────────┼─────────────────────────┼────────────────┼──────────┼────────────┤
          │"u"       │ SD_BUS_TYPE_UINT32      │ unsigned       │ 4 bytes  │ uint32_t   │
          │          │                         │ integer        │          │            │
          ├──────────┼─────────────────────────┼────────────────┼──────────┼────────────┤
          │"x"       │ SD_BUS_TYPE_INT64       │ signed         │ 8 bytes  │ int64_t    │
          │          │                         │ integer        │          │            │
          ├──────────┼─────────────────────────┼────────────────┼──────────┼────────────┤
          │"t"       │ SD_BUS_TYPE_UINT64      │ unsigned       │ 8 bytes  │ uint64_t   │
          │          │                         │ integer        │          │            │
          ├──────────┼─────────────────────────┼────────────────┼──────────┼────────────┤
          │"d"       │ SD_BUS_TYPE_DOUBLE      │ floating-point │ 8 bytes  │ double     │
          ├──────────┼─────────────────────────┼────────────────┼──────────┼────────────┤
          │"s"       │ SD_BUS_TYPE_STRING      │ Unicode string │ variable │ char[]     │
          ├──────────┼─────────────────────────┼────────────────┼──────────┼────────────┤
          │"o"       │ SD_BUS_TYPE_OBJECT_PATH │ object path    │ variable │ char[]     │
          ├──────────┼─────────────────────────┼────────────────┼──────────┼────────────┤
          │"g"       │ SD_BUS_TYPE_SIGNATURE   │ signature      │ variable │ char[]     │
          ├──────────┼─────────────────────────┼────────────────┼──────────┼────────────┤
          │"h"       │ SD_BUS_TYPE_UNIX_FD     │ UNIX file      │ 4 bytes  │ int        │
          │          │                         │ descriptor     │          │            │
          └──────────┴─────────────────────────┴────────────────┴──────────┴────────────┘

          The value of the parameter is copied into a memory area held by
          the message object, stays in the possession of the caller and may
          hence be freely changed after this call without affecting the bus
          message it has been added to. If type is "h" (UNIX file
          descriptor), the descriptor is duplicated by this call and the
          passed descriptor stays in possession of the caller.

          For types "s", "o", and "g", the parameter p is interpreted as a
          pointer to a NUL-terminated character sequence. As a special
          case, a NULL pointer is interpreted as an empty string. The
          string should be valid Unicode string encoded as UTF-8. In case
          of the two latter types, the additional requirements for a D-Bus
          object path or type signature should be satisfied. Those
          requirements should be verified by the recipient of the message.


-----------------------------------------------------------------

::

          On success, this call returns 0 or a positive integer. On
          failure, it returns a negative errno-style error code.

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

          systemd(1), sd-bus(3), sd_bus_message_read_basic(3),
          sd_bus_message_append(3), The D-Bus specification[2]

.. _notes-top-1:


---------------------------------------------------

::

           1. Basic Types
              http://dbus.freedesktop.org/doc/dbus-specification.html#basic-types

           2. The D-Bus specification
              http://dbus.freedesktop.org/doc/dbus-specification.html

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

   systemd 249                               SD_BUS_MESSAGE_APPEND_BASIC(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_message_append(3) <../man3/sd_bus_message_append.3.html>`__, 
`sd_bus_message_append_array(3) <../man3/sd_bus_message_append_array.3.html>`__, 
`sd_bus_message_append_string_memfd(3) <../man3/sd_bus_message_append_string_memfd.3.html>`__, 
`sd_bus_message_append_strv(3) <../man3/sd_bus_message_append_strv.3.html>`__, 
`sd_bus_message_read_basic(3) <../man3/sd_bus_message_read_basic.3.html>`__

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
