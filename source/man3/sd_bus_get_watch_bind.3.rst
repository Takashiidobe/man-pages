.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_set_watch_bind(3) — Linux manual page
============================================

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

   SD_BUS_SET_WATCH_BIND(3)  sd_bus_set_watch_bind SD_BUS_SET_WATCH_BIND(3)

NAME
-------------------------------------------------

::

          sd_bus_set_watch_bind, sd_bus_get_watch_bind - Control socket
          binding watching on bus connections


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_set_watch_bind(sd_bus *bus, int b);

          int sd_bus_get_watch_bind(sd_bus *bus);


---------------------------------------------------------------

::

          sd_bus_set_watch_bind() may be used to enable or disable
          client-side watching of server socket binding for a bus
          connection object. If the b is true, the feature is enabled,
          otherwise disabled (which is the default). When enabled, and the
          selected bus address refers to an AF_UNIX socket in the file
          system which does not exist while the connection attempt is made
          an inotify(7) watch is installed on it, waiting for the socket to
          appear. As soon as the socket appears the connection is made.
          This functionality is useful in particular in early-boot programs
          that need to run before the system bus is available, but want to
          connect to it the instant it may be connected to.

          sd_bus_get_watch_bind() may be used to query the current setting
          of this feature. It returns zero when the feature is disabled,
          and positive if enabled.

          Note that no timeout is applied while we wait for the socket to
          appear. This means that any synchronous remote operation (such as
          sd_bus_call(3), sd_bus_add_match(3) or sd_bus_request_name(3)),
          that is used on a connection with this feature enabled that
          hasn't been established yet, might block forever if the socket is
          never created. However, asynchronous remote operations (such as
          sd_bus_send(3), sd_bus_call_async(3), sd_bus_add_match_async(3))
          do not block in this case, and safely enqueue the requested
          operations to be dispatched the instant the connection is set up.

          Use sd_bus_is_ready(3) to determine whether the connection is
          fully established, i.e. whether the peer socket has been bound,
          connected to and authenticated. Use
          sd_bus_set_connected_signal(3) to be notified when the connection
          is fully established.


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

          systemd(1), sd-bus(3), inotify(7), sd_bus_call(3),
          sd_bus_add_match(3), sd_bus_request_name(3), sd_bus_is_ready(3),
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

   systemd 249                                     SD_BUS_SET_WATCH_BIND(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_set_connected_signal(3) <../man3/sd_bus_set_connected_signal.3.html>`__

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
