.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_start(3) — Linux manual page
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

   SD_BUS_START(3)               sd_bus_start               SD_BUS_START(3)

NAME
-------------------------------------------------

::

          sd_bus_start - Initiate a bus connection to the D-bus broker
          daemon


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_start(sd_bus *bus);


---------------------------------------------------------------

::

          sd_bus_start() connects an existing bus connection object to the
          D-Bus broker daemon, usually dbus-daemon(1) or dbus-broker(1).
          The mechanism to use for the connection must be configured before
          the call to sd_bus_start(), using one of sd_bus_set_address(3),
          sd_bus_set_fd(3), or sd_bus_set_exec(3).  sd_bus_start() will
          open the connection socket or spawn the executable as needed, and
          asynchronously start a org.freedesktop.DBus.Hello() call. The
          answer to the Hello call will be processed later from
          sd_bus_process(3). If opening of the connection or queuing of the
          asynchronous call fail, the connection will be closed with
          sd_bus_close(3).

          In most cases, it is better to use sd_bus_default_user(3),
          sd_bus_default_system(3) or related calls instead of the more
          low-level sd_bus_new() and sd_bus_start(). The higher-level
          functions not only allocate a bus object but also start the
          connection to a well-known bus in a single function call.


-----------------------------------------------------------------

::

          On success, this function returns a non-negative integer. On
          failure, it returns a negative errno-style error code.

      Errors
          -EINVAL
              The input parameter bus is NULL.

          -ENOPKG
              Bus object bus could not be resolved.

          -EPERM
              The input parameter bus is in a wrong state (sd_bus_start()
              may only be called once on a newly-created bus object).

          -ECHILD
              The bus object bus was created in a different process.

          In addition, other connection-related errors may be returned. See
          sd_bus_send(3).


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-bus(3), sd_bus_default(3), sd_bus_call_async(3)

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

   systemd 249                                              SD_BUS_START(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_default(3) <../man3/sd_bus_default.3.html>`__, 
`sd_bus_is_open(3) <../man3/sd_bus_is_open.3.html>`__, 
`sd_bus_negotiate_fds(3) <../man3/sd_bus_negotiate_fds.3.html>`__, 
`sd_bus_new(3) <../man3/sd_bus_new.3.html>`__, 
`sd_bus_set_address(3) <../man3/sd_bus_set_address.3.html>`__, 
`sd_bus_set_fd(3) <../man3/sd_bus_set_fd.3.html>`__, 
`sd_bus_set_server(3) <../man3/sd_bus_set_server.3.html>`__

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
