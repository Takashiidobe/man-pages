.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_watchdog_enabled(3) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_WATCHDOG_ENABLED(3)     sd_watchdog_enabled    SD_WATCHDOG_ENABLED(3)

NAME
-------------------------------------------------

::

          sd_watchdog_enabled - Check whether the service manager expects
          watchdog keep-alive notifications from a service


---------------------------------------------------------

::

          #include <systemd/sd-daemon.h>

          int sd_watchdog_enabled(int unset_environment, uint64_t *usec);


---------------------------------------------------------------

::

          sd_watchdog_enabled() may be called by a service to detect
          whether the service manager expects regular keep-alive watchdog
          notification events from it, and the timeout after which the
          manager will act on the service if it did not get such a
          notification.

          If the $WATCHDOG_USEC environment variable is set, and the
          $WATCHDOG_PID variable is unset or set to the PID of the current
          process, the service manager expects notifications from this
          process. The manager will usually terminate a service when it
          does not get a notification message within the specified time
          after startup and after each previous message. It is recommended
          that a daemon sends a keep-alive notification message to the
          service manager every half of the time returned here.
          Notification messages may be sent with sd_notify(3) with a
          message string of "WATCHDOG=1".

          If the unset_environment parameter is non-zero,
          sd_watchdog_enabled() will unset the $WATCHDOG_USEC and
          $WATCHDOG_PID environment variables before returning (regardless
          of whether the function call itself succeeded or not). Those
          variables are no longer inherited by child processes. Further
          calls to sd_watchdog_enabled() will also return with zero.

          If the usec parameter is non-NULL, sd_watchdog_enabled() will
          write the timeout in µs for the watchdog logic to it.

          To enable service supervision with the watchdog logic, use
          WatchdogSec= in service files. See systemd.service(5) for
          details.

          Use sd_event_set_watchdog(3) to enable automatic watchdog support
          in sd-event(3)-based event loops.


-----------------------------------------------------------------

::

          On failure, this call returns a negative errno-style error code.
          If the service manager expects watchdog keep-alive notification
          messages to be sent, > 0 is returned, otherwise 0 is returned.
          Only if the return value is > 0, the usec parameter is valid
          after the call.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.

          Internally, this function parses the $WATCHDOG_PID and
          $WATCHDOG_USEC environment variable. The call will ignore these
          variables if $WATCHDOG_PID does not contain the PID of the
          current process, under the assumption that in that case, the
          variables were set for a different process further up the process
          tree.


---------------------------------------------------------------

::

          $WATCHDOG_PID
              Set by the system manager for supervised process for which
              watchdog support is enabled, and contains the PID of that
              process. See above for details.

          $WATCHDOG_USEC
              Set by the system manager for supervised process for which
              watchdog support is enabled, and contains the watchdog
              timeout in µs. See above for details.


---------------------------------------------------------

::

          systemd(1), sd-daemon(3), daemon(7), systemd.service(5),
          sd_notify(3), sd_event_set_watchdog(3)

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

   systemd 249                                       SD_WATCHDOG_ENABLED(3)

--------------

Pages that refer to this page:
`sd-daemon(3) <../man3/sd-daemon.3.html>`__, 
`sd_event_set_watchdog(3) <../man3/sd_event_set_watchdog.3.html>`__, 
`sd_notify(3) <../man3/sd_notify.3.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
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
