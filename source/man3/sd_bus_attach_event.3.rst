.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_bus_attach_event(3) — Linux manual page
==========================================

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

   SD_BUS_ATTACH_EVENT(3)     sd_bus_attach_event    SD_BUS_ATTACH_EVENT(3)

NAME
-------------------------------------------------

::

          sd_bus_attach_event, sd_bus_detach_event, sd_bus_get_event -
          Attach a bus connection object to an event loop


---------------------------------------------------------

::

          #include <systemd/sd-bus.h>

          int sd_bus_attach_event(sd_bus *bus, sd_event *e, int priority);

          int sd_bus_detach_event(sd_bus *bus);

          sd_event *sd_bus_get_event(sd_bus *bus);


---------------------------------------------------------------

::

          sd_bus_attach_event() attaches the specified bus connection
          object to an sd-event(3) event loop object at the specified
          priority (see sd_event_source_set_priority(3) for details on
          event loop priorities). When a bus connection object is attached
          to an event loop incoming messages will be automatically read and
          processed, and outgoing messages written, whenever the event loop
          is run. When the event loop is about to terminate, the bus
          connection is automatically flushed and closed (see
          sd_bus_set_close_on_exit(3) for details on this). By default bus
          connection objects are not attached to any event loop. When a bus
          connection object is attached to one it is not necessary to
          invoke sd_bus_wait(3) or sd_bus_process(3) as this functionality
          is handled automatically by the event loop.

          sd_bus_detach_event() detaches a bus object from its event loop.

          The sd_bus_get_event() returns the event loop object the
          specified bus object is currently attached to, or NULL if it is
          currently not attached to any.

          Note that sd_bus_attach_event() is only one of three supported
          ways to implement I/O event handling for bus connections.
          Alternatively use sd_bus_get_fd(3) for hooking up a bus
          connection object with external or manual event loops. Or use
          sd_bus_wait(3) as a simple synchronous, blocking I/O waiting
          call.


-----------------------------------------------------------------

::

          On success, sd_bus_attach_event() and sd_bus_detach_event()
          return 0 or a positive integer. On failure, they return a
          negative errno-style error code.

          sd_bus_get_event() returns an event loop object or NULL.

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

          systemd(1), sd-bus(3), sd-event(3),
          sd_event_source_set_priority(3), sd_bus_set_close_on_exit(3),
          sd_bus_wait(3), sd_bus_get_fd(3)

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

   systemd 249                                       SD_BUS_ATTACH_EVENT(3)

--------------

Pages that refer to this page: `sd-bus(3) <../man3/sd-bus.3.html>`__, 
`sd_bus_get_fd(3) <../man3/sd_bus_get_fd.3.html>`__, 
`sd_bus_process(3) <../man3/sd_bus_process.3.html>`__, 
`sd_bus_set_close_on_exit(3) <../man3/sd_bus_set_close_on_exit.3.html>`__, 
`sd_bus_set_exit_on_disconnect(3) <../man3/sd_bus_set_exit_on_disconnect.3.html>`__, 
`sd_bus_wait(3) <../man3/sd_bus_wait.3.html>`__

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
