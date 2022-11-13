.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_message_append_string_memfd(3) — Linux manual page
=========================================================

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

   SD_BUS_MESSAGE_APPEND_STRING_MEMFD(3)end_string_memfdEND_STRING_MEMFD(3)

NAME
-------------------------------------------------

::

          sd_bus_message_append_string_memfd,
          sd_bus_message_append_string_iovec,
          sd_bus_message_append_string_space - Attach a string to a message


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_message_append_string_memfd(sd_bus_message *m,
                                                 int memfd);

          int sd_bus_message_append_string_iovec(sd_bus_message *m,
                                                 const struct iovec *iov,
                                                 unsigned n);

          int sd_bus_message_append_string_space(sd_bus_message *m,
                                                 size_t size, char **s);


---------------------------------------------------------------

::

          The functions sd_bus_message_append_string_memfd() and
          sd_bus_message_append_string_iovec() can be used to append a
          single string (item of type "s") to message m.

          In case of sd_bus_message_append_string_memfd(), the contents of
          memfd are the string. They must satisfy the same constraints as
          described for the "s" type in sd_bus_message_append_basic(3).

          In case of sd_bus_message_append_string_iovec(), the payload of
          iov is the string. It must satisfy the same constraints as
          described for the "s" type in sd_bus_message_append_basic(3).

          The iov argument must point to n struct iovec structures. Each
          structure may have the iov_base field set, in which case the
          memory pointed to will be copied into the message, or unset, in
          which case a block of spaces (ASCII 32) of length iov_len will be
          inserted. The memory pointed at by iov may be changed after this
          call.

          The sd_bus_message_append_string_space() function appends space
          for a string to message m. It behaves similar to
          sd_bus_message_append_basic() with type "s", but instead of
          copying a string into the message, it returns a pointer to the
          destination area to the caller in pointer p. Space for the string
          of length size plus the terminating NUL is allocated.


-----------------------------------------------------------------

::

          On success, those calls return 0 or a positive integer. On
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

          systemd(1), sd-bus(3), sd_bus_message_append_basic(3), The D-Bus
          specification[1]

.. _notes-top-1:


---------------------------------------------------

::

           1. The D-Bus specification
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

   systemd 249                        SD_BUS_MESSAGE_APPEND_STRING_MEMFD(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__

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
