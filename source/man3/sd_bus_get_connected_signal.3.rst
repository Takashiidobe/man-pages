.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_set_connected_signal(3) — Linux manual page
==================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_BUS_SET_CONNECTED_SIGNAL(3)set_connected_signalET_CONNECTED_SIGNAL(3)

NAME
-------------------------------------------------

::

          sd_bus_set_connected_signal, sd_bus_get_connected_signal -
          Control emission of local connection establishment signal on bus
          connections


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_set_connected_signal(sd_bus *bus, int b);

          int sd_bus_get_connected_signal(sd_bus *bus);


---------------------------------------------------------------

::

          sd_bus_set_connected_signal() may be used to control whether a
          local, synthetic Connected() signal message shall be generated
          and enqueued for dispatching when the connection is fully
          established. If the b parameter is zero the message is not
          generated (the default), otherwise it is generated.

          sd_bus_get_connected_signal() may be used to query whether this
          feature is enabled. It returns zero if not, positive otherwise.

          The Connected() signal message is generated from the
          "org.freedesktop.DBus.Local" service and interface, and
          "/org/freedesktop/DBus/Local" object path. Use
          sd_bus_match_signal_async(3) to match on this signal.

          This message is particularly useful on slow transports where
          connections take a long time to be established. This is
          especially the case when sd_bus_set_watch_bind(3) is used. The
          signal is generated when the sd_bus_is_ready(3) returns positive
          for the first time.

          The Connected() signal corresponds with the Disconnected() signal
          that is synthesized locally when the connection is terminated.
          The latter is generated unconditionally however, unlike the
          former which needs to be enabled explicitly before it is
          generated, with sd_bus_set_connected_signal().


-----------------------------------------------------------------

::

          On success, these functions return 0 or a positive integer. On
          failure, they return a negative errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -ECHILD
              The bus connection has been created in a different process.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_match_signal_async(3),
          sd_bus_set_watch_bind(3), sd_bus_is_ready(3)

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

   systemd 249                               SD_BUS_SET_CONNECTED_SIGNAL(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_is_open(3) <../man3/sd_bus_is_open.3.html>`__, 
`sd_bus_set_watch_bind(3) <../man3/sd_bus_set_watch_bind.3.html>`__

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
