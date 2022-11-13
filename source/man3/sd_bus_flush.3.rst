.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_close(3) — Linux manual page
===================================

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

   SD_BUS_CLOSE(3)               sd_bus_close               SD_BUS_CLOSE(3)

NAME
-------------------------------------------------

::

          sd_bus_close, sd_bus_flush, sd_bus_default_flush_close - Close
          and flush a bus connection


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          void sd_bus_close(sd_bus *bus);

          int sd_bus_flush(sd_bus *bus);

          void sd_bus_default_flush_close(void);


---------------------------------------------------------------

::

          sd_bus_close() disconnects the specified bus connection. When
          this call is invoked and the specified bus object refers to an
          active connection it is immediately terminated. No further
          messages may be sent or received on it. Any messages queued in
          the bus object (both incoming and outgoing) are released. If
          invoked on NULL bus object or when the bus connection is already
          closed this function executes no operation. This call does not
          free or unreference the bus object itself. Use sd_bus_unref(3)
          for that.

          sd_bus_flush() synchronously writes out all outgoing queued
          message on a bus connection if there are any. This function call
          may block if the peer is not processing bus messages quickly.

          Before a program exits it is usually a good idea to flush any
          pending messages with sd_bus_flush() and then close connections
          with sd_bus_close() to ensure that no unwritten messages are
          lost, no further messages may be queued and all incoming but
          unprocessed messages are released. After both operations have
          been done, it is a good idea to also drop any remaining
          references to the bus object so that it may be freed. Since these
          three operations are frequently done together a helper call
          sd_bus_flush_close_unref(3) is provided that combines them into
          one.

          sd_bus_default_flush_close() is similar to
          sd_bus_flush_close_unref(), but does not take a bus pointer
          argument and instead iterates over any of the "default" buses
          opened by sd_bus_default(3), sd_bus_default_user(3),
          sd_bus_default_system(3), and similar calls.
          sd_bus_default_flush_close() is particularly useful to clean up
          any buses opened using those calls before the program exits.


-----------------------------------------------------------------

::

          On success, sd_bus_flush() returns a non-negative integer. On
          failure, it returns a negative errno-style error code.

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

          systemd(1), sd-bus(3), sd_bus_unref(3),
          sd_bus_set_close_on_exit(3)

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

   systemd 249                                              SD_BUS_CLOSE(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_default(3) <../man3/sd_bus_default.3.html>`__, 
`sd_bus_get_n_queued_read(3) <../man3/sd_bus_get_n_queued_read.3.html>`__, 
`sd_bus_is_open(3) <../man3/sd_bus_is_open.3.html>`__, 
`sd_bus_new(3) <../man3/sd_bus_new.3.html>`__, 
`sd_bus_set_close_on_exit(3) <../man3/sd_bus_set_close_on_exit.3.html>`__, 
`sd_bus_start(3) <../man3/sd_bus_start.3.html>`__

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
