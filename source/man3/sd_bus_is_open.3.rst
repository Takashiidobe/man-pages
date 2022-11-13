.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_is_open(3) — Linux manual page
=====================================

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

   SD_BUS_IS_OPEN(3)            sd_bus_is_open            SD_BUS_IS_OPEN(3)

NAME
-------------------------------------------------

::

          sd_bus_is_open, sd_bus_is_ready - Check whether the bus
          connection is open or ready


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_is_open(sd_bus *bus);

          int sd_bus_is_ready(sd_bus *bus);


---------------------------------------------------------------

::

          sd_bus_is_open() checks whether the specified bus connection is
          open, i.e. in the process of being established, already
          established or in the process of being torn down. It returns zero
          when the connection has not been started yet (i.e.
          sd_bus_start(3) or some equivalent call has not been invoked
          yet), or is fully terminated again (for example after
          sd_bus_close(3)), it returns positive otherwise.

          sd_bus_is_ready() checks whether the specified connection is
          fully established, i.e. completed the connection and
          authentication phases of the protocol and received the Hello()
          method call response, and is not in the process of being torn
          down again. It returns zero outside of this state, and positive
          otherwise. Effectively, this function returns positive while
          regular messages can be sent or received on the connection.

          The bus argument may be NULL, zero is also returned in that case.

          To be notified when the connection is fully established, use
          sd_bus_set_connected_signal(3) and install a match for the
          Connected() signal on the "org.freedesktop.DBus.Local" interface.
          To be notified when the connection is torn down again, install a
          match for the Disconnected() signal on the
          "org.freedesktop.DBus.Local" interface.


-----------------------------------------------------------------

::

          Those functions return 0 if the bus is not in the given state,
          and a positive integer when it is. On failure, a negative
          errno-style error code is returned.

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

          systemd(1), sd-bus(3), sd_bus_start(3), sd_bus_close(3),
          sd_bus_set_connected_signal(3)

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

   systemd 249                                            SD_BUS_IS_OPEN(3)

--------------

Pages that refer to this page:
`sd_bus_set_connected_signal(3) <../man3/sd_bus_set_connected_signal.3.html>`__, 
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
