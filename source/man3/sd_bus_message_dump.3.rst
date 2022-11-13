.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_message_dump(3) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_BUS_MESSAGE_DUMP(3)     sd_bus_message_dump    SD_BUS_MESSAGE_DUMP(3)

NAME
-------------------------------------------------

::

          sd_bus_message_dump - Produce a string representation of a
          message for debugging purposes


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_message_dump(sd_bus_message *m, FILE *f,
                                  uint64_t flags);

          SD_BUS_MESSAGE_DUMP_WITH_HEADER, SD_BUS_MESSAGE_DUMP_SUBTREE_ONLY


---------------------------------------------------------------

::

          The sd_bus_message_dump() function writes a textual
          representation of the message m to the stream f. This function is
          intended to be used for debugging purposes, and the output is
          neither stable nor designed to be machine readable.

          The flags parameter may be used to modify the output. With
          SD_BUS_MESSAGE_DUMP_WITH_HEADER, a header that specifies the
          message type and flags and some additional metadata is printed.
          When SD_BUS_MESSAGE_DUMP_SUBTREE_ONLY is not passed, the contents
          of the whole message are printed. When it is passed, only the
          current container in printed.

          Note that this function moves the read pointer of the message. It
          may be necessary to reset the position afterwards, for example
          with sd_bus_message_rewind(3).


---------------------------------------------------------

::

          Output for a signal message (with
          SD_BUS_MESSAGE_DUMP_WITH_HEADER):

              > Type=signal  Endian=l  Flags=1  Version=1  Cookie=22
                Path=/value/a  Interface=org.freedesktop.DBus.Properties  Member=PropertiesChanged
                MESSAGE "sa{sv}as" {
                        STRING "org.freedesktop.systemd.ValueTest";
                        ARRAY "{sv}" {
                                DICT_ENTRY "sv" {
                                        STRING "Value";
                                        VARIANT "s" {
                                                STRING "object 0x1e, path /value/a";
                                        };
                                };
                        };
                        ARRAY "s" {
                                STRING "Value2";
                                STRING "AnExplicitProperty";
                        };
                };


-----------------------------------------------------------------

::

          On success, this function returns 0 or a positive integer. On
          failure, it returns a negative errno-style error code. No error
          codes are currently defined.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3)

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

   systemd 249                                       SD_BUS_MESSAGE_DUMP(3)

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
