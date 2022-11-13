.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_set_exit_on_disconnect(3) — Linux manual page
====================================================

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

   SD_BUS_SET_EXIT_ON_DISCONNECT(3)_exit_on_disconnectEXIT_ON_DISCONNECT(3)

NAME
-------------------------------------------------

::

          sd_bus_set_exit_on_disconnect, sd_bus_get_exit_on_disconnect -
          Control the exit behavior when the bus object disconnects


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_set_exit_on_disconnect(sd_bus *bus, int b);

          int sd_bus_get_exit_on_disconnect(sd_bus *bus);


---------------------------------------------------------------

::

          sd_bus_set_exit_on_disconnect() may be used to configure the exit
          behavior when the given bus object disconnects. If b is zero, no
          special logic is executed when the bus object disconnects. If b
          is non-zero, the behavior on disconnect depends on whether the
          bus object is attached to an event loop or not. If the bus object
          is attached to an event loop (see sd_bus_attach_event(3)), the
          event loop is closed when the bus object disconnects (as if
          calling sd_event_exit(3)). Otherwise, exit(3) is called. The exit
          code passed to sd_event_exit() and exit() is EXIT_FAILURE. If the
          bus object has already disconnected when enabling the exit
          behavior, the exit behavior is executed immediately. By default,
          the exit behavior is disabled.

          sd_bus_get_exit_on_disconnect() returns whether the exit on
          disconnect behavior is enabled for the given bus object.


-----------------------------------------------------------------

::

          On success, sd_bus_set_exit_on_disconnect() returns a
          non-negative integer. On failure, it returns a negative
          errno-style error code.

          sd_bus_get_exit_on_disconnect() returns a positive integer if the
          exit on disconnect behavior is enabled. Otherwise, it returns
          zero.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              A required parameter was NULL.

          -ENOPKG
              The bus object could not be resolved.

          -ECHILD
              The bus connection was created in a different process.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_attach_event(3), sd-event(3),
          sd_event_exit(3)

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

   systemd 249                             SD_BUS_SET_EXIT_ON_DISCONNECT(3)

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
