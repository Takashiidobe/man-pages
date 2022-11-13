.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_message_read_basic(3) — Linux manual page
================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_BUS_MESSAGE_READ_BASIC(3)us_message_read_basicS_MESSAGE_READ_BASIC(3)

NAME
-------------------------------------------------

::

          sd_bus_message_read_basic - Read a basic type from a message


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_message_read_basic(sd_bus_message *m, char type,
                                        void *p);


---------------------------------------------------------------

::

          sd_bus_message_read_basic() reads a basic type from a message and
          advances the read position in the message. The set of basic types
          and their ascii codes passed in type are described in the D-Bus
          Specification[1].

          If p is not NULL, it should contain a pointer to an appropriate
          object. For example, if type is 'y', the object passed in p
          should have type uint8_t *. If type is 's', the object passed in
          p should have type const char **. Note that, if the basic type is
          a pointer (e.g., const char * in the case of a string), the
          pointer is only borrowed and the contents must be copied if they
          are to be used after the end of the message's lifetime.
          Similarly, during the lifetime of such a pointer, the message
          must not be modified. If type is 'h' (UNIX file descriptor), the
          descriptor is not duplicated by this call and the returned
          descriptor remains in possession of the message object, and needs
          to be duplicated by the caller in order to keep an open reference
          to it after the message object is freed (for example by calling
          "fcntl(fd, FD_DUPFD_CLOEXEC, 3)"). See the table below for a
          complete list of allowed types.

          Table 1. Item type specifiers
          ┌──────────┬─────────────────────────┬────────────────┬────────────────┐
          │Specifier │ Constant                │ Description    │ Expected C     │
          │          │                         │                │ Type           │
          ├──────────┼─────────────────────────┼────────────────┼────────────────┤
          │"y"       │ SD_BUS_TYPE_BYTE        │ 8bit unsigned  │ uint8_t *      │
          │          │                         │ integer        │                │
          ├──────────┼─────────────────────────┼────────────────┼────────────────┤
          │"b"       │ SD_BUS_TYPE_BOOLEAN     │ boolean        │ int * (NB: not │
          │          │                         │                │ bool *)        │
          ├──────────┼─────────────────────────┼────────────────┼────────────────┤
          │"n"       │ SD_BUS_TYPE_INT16       │ 16bit signed   │ int16_t *      │
          │          │                         │ integer        │                │
          ├──────────┼─────────────────────────┼────────────────┼────────────────┤
          │"q"       │ SD_BUS_TYPE_UINT16      │ 16bit unsigned │ uint16_t *     │
          │          │                         │ integer        │                │
          ├──────────┼─────────────────────────┼────────────────┼────────────────┤
          │"i"       │ SD_BUS_TYPE_INT32       │ 32bit signed   │ int32_t *      │
          │          │                         │ integer        │                │
          ├──────────┼─────────────────────────┼────────────────┼────────────────┤
          │"u"       │ SD_BUS_TYPE_UINT32      │ 32bit unsigned │ uint32_t *     │
          │          │                         │ integer        │                │
          ├──────────┼─────────────────────────┼────────────────┼────────────────┤
          │"x"       │ SD_BUS_TYPE_INT64       │ 64bit signed   │ int64_t *      │
          │          │                         │ integer        │                │
          ├──────────┼─────────────────────────┼────────────────┼────────────────┤
          │"t"       │ SD_BUS_TYPE_UINT64      │ 64bit unsigned │ uint64_t *     │
          │          │                         │ integer        │                │
          ├──────────┼─────────────────────────┼────────────────┼────────────────┤
          │"d"       │ SD_BUS_TYPE_DOUBLE      │ IEEE 754       │ double *       │
          │          │                         │ double         │                │
          │          │                         │ precision      │                │
          │          │                         │ floating-point │                │
          ├──────────┼─────────────────────────┼────────────────┼────────────────┤
          │"s"       │ SD_BUS_TYPE_STRING      │ UTF-8 string   │ const char **  │
          ├──────────┼─────────────────────────┼────────────────┼────────────────┤
          │"o"       │ SD_BUS_TYPE_OBJECT_PATH │ D-Bus object   │ const char **  │
          │          │                         │ path string    │                │
          ├──────────┼─────────────────────────┼────────────────┼────────────────┤
          │"g"       │ SD_BUS_TYPE_SIGNATURE   │ D-Bus          │ const char **  │
          │          │                         │ signature      │                │
          │          │                         │ string         │                │
          ├──────────┼─────────────────────────┼────────────────┼────────────────┤
          │"h"       │ SD_BUS_TYPE_UNIX_FD     │ UNIX file      │ int *          │
          │          │                         │ descriptor     │                │
          └──────────┴─────────────────────────┴────────────────┴────────────────┘

          If there is no object of the specified type at the current
          position in the message, an error is returned.


-----------------------------------------------------------------

::

          On success, sd_bus_message_read_basic() returns a positive
          integer. If the end of the currently opened array has been
          reached, it returns 0. On failure, it returns a negative
          errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              Specified type string is invalid or the message parameter is
              NULL.

          -ENXIO
              The message does not contain the specified type at current
              position.

          -EBADMSG
              The message cannot be parsed.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_message_append_basic(3),
          sd_bus_message_skip(3), sd_bus_message_read(3)


---------------------------------------------------

::

           1. D-Bus Specification
              https://dbus.freedesktop.org/doc/dbus-specification.html

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

   systemd 249                                 SD_BUS_MESSAGE_READ_BASIC(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_message_append_basic(3) <../man3/sd_bus_message_append_basic.3.html>`__, 
`sd_bus_message_read(3) <../man3/sd_bus_message_read.3.html>`__, 
`sd_bus_message_skip(3) <../man3/sd_bus_message_skip.3.html>`__

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
