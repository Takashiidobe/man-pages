.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_event_set_watchdog(3) — Linux manual page
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

   SD_EVENT_SET_WATCHDOG(3)  sd_event_set_watchdog SD_EVENT_SET_WATCHDOG(3)

NAME
-------------------------------------------------

::

          sd_event_set_watchdog, sd_event_get_watchdog - Enable event loop
          watchdog support


---------------------------------------------------------

::

          #include <systemd/sd-event.h>

          int sd_event_set_watchdog(sd_event *event, int b);

          int sd_event_get_watchdog(sd_event *event);


---------------------------------------------------------------

::

          sd_event_set_watchdog() may be used to enable or disable
          automatic watchdog notification support in the event loop object
          specified in the event parameter. Specifically, depending on the
          b boolean argument this will make sure the event loop wakes up in
          regular intervals and sends watchdog notification messages to the
          service manager, if this was requested by the service manager.
          Watchdog support is determined with sd_watchdog_enabled(3), and
          watchdog messages are sent with sd_notify(3). See the
          WatchdogSec= setting in systemd.service(5) for details on how to
          enable watchdog support for a service and the protocol used. The
          wake-up interval is chosen as half the watchdog timeout declared
          by the service manager via the $WATCHDOG_USEC environment
          variable. If the service manager did not request watchdog
          notifications, or if the process was not invoked by the service
          manager this call with a true b parameter executes no operation.
          Passing a false b parameter will disable the automatic sending of
          watchdog notification messages if it was enabled before. Newly
          allocated event loop objects have this feature disabled.

          The first watchdog notification message is sent immediately when
          sd_event_set_watchdog() is invoked with a true b parameter.

          The watchdog logic is designed to allow the service manager to
          automatically detect services that ceased processing of incoming
          events, and thus appear "hung". Watchdog notifications are sent
          out only at the beginning of each event loop iteration. If an
          event source dispatch function blocks for an excessively long
          time and does not return execution to the event loop quickly,
          this might hence cause the notification message to be delayed,
          and possibly result in abnormal program termination, as
          configured in the service unit file.

          sd_event_get_watchdog() may be used to determine whether watchdog
          support was previously requested by a call to
          sd_event_set_watchdog() with a true b parameter and successfully
          enabled.


-----------------------------------------------------------------

::

          On success, sd_event_set_watchdog() and sd_event_get_watchdog()
          return a non-zero positive integer if the service manager
          requested watchdog support and watchdog support was successfully
          enabled. They return zero if the service manager did not request
          watchdog support, or if watchdog support was explicitly disabled
          with a false b parameter. On failure, they return a negative
          errno-style error code.

      Errors
          Returned errors may indicate the following problems:

          -ECHILD
              The event loop has been created in a different process.

          -EINVAL
              The passed event loop object was invalid.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd-event(3), sd_event_new(3), sd_event_add_io(3),
          sd_event_add_time(3), sd_event_add_signal(3),
          sd_event_add_child(3), sd_event_add_inotify(3),
          sd_event_add_defer(3), sd_watchdog_enabled(3), sd_notify(3),
          systemd.service(5)

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

   systemd 249                                     SD_EVENT_SET_WATCHDOG(3)

--------------

Pages that refer to this page:
`sd-event(3) <../man3/sd-event.3.html>`__, 
`sd_watchdog_enabled(3) <../man3/sd_watchdog_enabled.3.html>`__, 
`systemd.service(5) <../man5/systemd.service.5.html>`__

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
