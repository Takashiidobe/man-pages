.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd-daemon(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD-DAEMON(3)                    sd-daemon                   SD-DAEMON(3)

NAME
-------------------------------------------------

::

          sd-daemon, SD_EMERG, SD_ALERT, SD_CRIT, SD_ERR, SD_WARNING,
          SD_NOTICE, SD_INFO, SD_DEBUG - APIs for new-style daemons


---------------------------------------------------------

::

          #include <systemd/sd-daemon.h>

          pkg-config --cflags --libs libsystemd


---------------------------------------------------------------

::

          sd-daemon.h provides APIs for new-style daemons, as implemented
          by the systemd(1) service manager.

          See sd_listen_fds(3), sd_notify(3), sd_booted(3), sd_is_fifo(3),
          sd_watchdog_enabled(3) for more information about the functions
          implemented. In addition to these functions, a couple of logging
          prefixes are defined as macros:

              #define SD_EMERG   "<0>"  /* system is unusable */
              #define SD_ALERT   "<1>"  /* action must be taken immediately */
              #define SD_CRIT    "<2>"  /* critical conditions */
              #define SD_ERR     "<3>"  /* error conditions */
              #define SD_WARNING "<4>"  /* warning conditions */
              #define SD_NOTICE  "<5>"  /* normal but significant condition */
              #define SD_INFO    "<6>"  /* informational */
              #define SD_DEBUG   "<7>"  /* debug-level messages */

          These prefixes are intended to be used in conjunction with
          stderr-based logging (or stdout-based logging) as implemented by
          systemd. If a systemd service definition file is configured with
          StandardError=journal or StandardError=kmsg (and similar with
          StandardOutput=), these prefixes can be used to encode a log
          level in lines printed. This is similar to the kernel
          printk()-style logging. See klogctl(2) for more information.

          The log levels are identical to syslog(3)'s log level system. To
          use these prefixes simply prefix every line with one of these
          strings. A line that is not prefixed will be logged at the
          default log level SD_INFO.

          Example 1. Hello World

          A daemon may log with the log level NOTICE by issuing this call:

              fprintf(stderr, SD_NOTICE "Hello World!\n");


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd_listen_fds(3), sd_notify(3), sd_booted(3),
          sd_is_fifo(3), sd_watchdog_enabled(3), daemon(7),
          systemd.service(5), systemd.socket(5), fprintf(3), pkg-config(1)

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

   systemd 249                                                 SD-DAEMON(3)

--------------

Pages that refer to this page: `systemd(1) <../man1/systemd.1.html>`__, 
`sd_booted(3) <../man3/sd_booted.3.html>`__, 
`sd_is_fifo(3) <../man3/sd_is_fifo.3.html>`__, 
`sd_journal_stream_fd(3) <../man3/sd_journal_stream_fd.3.html>`__, 
`sd_listen_fds(3) <../man3/sd_listen_fds.3.html>`__, 
`sd-login(3) <../man3/sd-login.3.html>`__, 
`sd_notify(3) <../man3/sd_notify.3.html>`__, 
`sd_watchdog_enabled(3) <../man3/sd_watchdog_enabled.3.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`daemon(7) <../man7/daemon.7.html>`__

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
