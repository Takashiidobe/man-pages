.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_set_server(3) — Linux manual page
========================================

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

   SD_BUS_SET_SERVER(3)        sd_bus_set_server       SD_BUS_SET_SERVER(3)

NAME
-------------------------------------------------

::

          sd_bus_set_server, sd_bus_is_server, sd_bus_get_bus_id,
          sd_bus_set_bus_client, sd_bus_is_bus_client, sd_bus_set_monitor,
          sd_bus_is_monitor - Configure connection mode for a bus object


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_set_server(sd_bus *bus, int b, sd_id128_t id);

          int sd_bus_is_server(sd_bus *bus);

          int sd_bus_get_bus_id(sd_bus *bus, sd_id128_t *id);

          int sd_bus_set_bus_client(sd_bus *bus, int b);

          int sd_bus_is_bus_client(sd_bus *bus);

          int sd_bus_set_monitor(sd_bus *bus, int b);

          int sd_bus_is_monitor(sd_bus *bus);


---------------------------------------------------------------

::

          sd_bus_set_server() configures the bus object as a server for
          direct D-Bus connections.  b enables/disables the server mode. If
          zero, the server mode is disabled. Otherwise, the server mode is
          enabled. Configuring a bus object as a server is required to
          allow establishing direct connections between two peers without
          going via the D-Bus daemon.  id must contain a 128-bit integer id
          for the server. If clients add a guid field to their D-Bus
          address string, the server id must match this guid or the D-Bus
          authentication handshake will fail. If no specific id is defined
          for the server, sd_id128_randomize(3) can be used to generate a
          random id instead.

          sd_bus_is_server() returns whether the server mode is enabled for
          the given bus object.

          sd_bus_get_bus_id() stores the D-Bus server id configured using
          sd_bus_set_server() (for server bus objects) or received during
          D-Bus authentication (for client bus objects) in id.

          sd_bus_set_bus_client() configures the bus object as a D-Bus
          daemon client.  b enables/disables the client mode. If zero, the
          client mode is disabled and the bus object should connect
          directly to a D-Bus server. Otherwise, the client mode is enabled
          and the bus object should connect to a D-Bus daemon. When
          connecting to an existing bus using any of the functions in the
          sd_bus_open(3) family of functions or any of the functions in the
          sd_bus_default(3) family of functions, the bus object is
          automatically configured as a bus client. However, when
          connecting to a D-Bus daemon by calling sd_bus_set_address(3)
          followed by sd_bus_start(3), the bus object should be manually
          configured as a bus client using sd_bus_set_bus_client(). By
          default, a bus object is not configured as a D-Bus daemon client.

          sd_bus_is_bus_client() returns whether the client mode is
          enabled/disabled for the given bus object.

          sd_bus_set_monitor() configures the bus object as a D-Bus monitor
          object.  b enables/disables the monitor mode. If zero, the
          monitor mode is disabled. If non-zero, the monitor mode is
          enabled. When the monitor mode is enabled, no messages may be
          sent via the bus object and it may not expose any objects on the
          bus. To start monitoring messages, call the
          org.freedesktop.DBus.Monitoring.BecomeMonitor method of the D-Bus
          daemon and pass a list of matches indicating which messages to
          intercept. See The D-Bus specification[1] for more information.

          sd_bus_is_monitor() returns whether the monitor mode is
          enabled/disabled for the given bus object.


-----------------------------------------------------------------

::

          On success, sd_bus_set_server(), sd_bus_get_bus_id(),
          sd_bus_set_bus_client() and sd_bus_set_monitor() return a
          non-negative integer. On failure, they return a negative
          errno-style error code.

          sd_bus_is_server(), sd_bus_is_bus_client() and
          sd_bus_is_monitor() return a positive integer when the server or
          client mode is enabled, respectively. Otherwise, they return
          zero.

      Errors
          Returned errors may indicate the following problems:

          -ECHILD
              The bus connection has been created in a different process.

          -EPERM
              The bus connection has already been started.

          -ENOPKG
              The bus cannot be resolved.

          -EINVAL
              A required parameter was NULL or b was zero and id did not
              equal SD_ID128_NULL.

          -ENOTCONN
              The bus is not connected.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3)

.. _notes-top-1:


---------------------------------------------------

::

           1. The D-Bus specification
              https://dbus.freedesktop.org/doc/dbus-specification.html#bus-messages-become-monitor

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

   systemd 249                                         SD_BUS_SET_SERVER(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_add_match(3) <../man3/sd_bus_add_match.3.html>`__

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
