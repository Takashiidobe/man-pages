.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_journal_stream_fd(3) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| SIGNAL SAFETY <#SIGNAL_SAFETY>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_JOURNAL_STREAM_FD(3)   sd_journal_stream_fd   SD_JOURNAL_STREAM_FD(3)

NAME
-------------------------------------------------

::

          sd_journal_stream_fd - Create log stream file descriptor to the
          journal


---------------------------------------------------------

::

          #include <systemd/sd-journal.h>

          int sd_journal_stream_fd(const char *identifier, int priority,
                                   int level_prefix);


---------------------------------------------------------------

::

          sd_journal_stream_fd() may be used to create a log stream file
          descriptor. Log messages written to this file descriptor as
          simple newline-separated text strings are written to the journal.
          This file descriptor can be used internally by applications or be
          made standard output or standard error of other processes
          executed.

          sd_journal_stream_fd() takes a short program identifier string as
          first argument, which will be written to the journal as
          SYSLOG_IDENTIFIER= field for each log entry (see
          systemd.journal-fields(7) for more information). The second
          argument shall be the default priority level for all messages.
          The priority level is one of LOG_EMERG, LOG_ALERT, LOG_CRIT,
          LOG_ERR, LOG_WARNING, LOG_NOTICE, LOG_INFO, LOG_DEBUG, as defined
          in syslog.h, see syslog(3) for details. The third argument is a
          boolean: if true kernel-style log level prefixes (such as
          SD_WARNING) are interpreted, see sd-daemon(3) for more
          information.

          It is recommended that applications log UTF-8 messages only with
          this API, but this is not enforced.

          Each invocation of sd_journal_stream_fd() allocates a new log
          stream file descriptor, that is not shared with prior or later
          invocations. The file descriptor is write-only (its reading
          direction is shut down), and O_NONBLOCK is turned off initially.


-----------------------------------------------------------------

::

          The call returns a valid write-only file descriptor on success or
          a negative errno-style error code.


-------------------------------------------------------------------

::

          sd_journal_stream_fd() is "async signal safe" in the meaning of
          signal-safety(7).


---------------------------------------------------

::

          All functions listed here are thread-safe and may be called in
          parallel from multiple threads.

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          Creating a log stream suitable for fprintf(3):

              #include <syslog.h>
              #include <stdio.h>
              #include <string.h>
              #include <unistd.h>
              #include <systemd/sd-journal.h>
              #include <systemd/sd-daemon.h>

              int main(int argc, char *argv[]) {
                int fd;
                FILE *log;
                fd = sd_journal_stream_fd("test", LOG_INFO, 1);
                if (fd < 0) {
                  fprintf(stderr, "Failed to create stream fd: %s\n", strerror(-fd));
                  return 1;
                }
                log = fdopen(fd, "w");
                if (!log) {
                  fprintf(stderr, "Failed to create file object: %m\n");
                  close(fd);
                  return 1;
                }
                fprintf(log, "Hello World!\n");
                fprintf(log, SD_WARNING "This is a warning!\n");
                fclose(log);
                return 0;
              }


---------------------------------------------------------

::

          systemd(1), sd-journal(3), sd-daemon(3), sd_journal_print(3),
          syslog(3), fprintf(3), systemd.journal-fields(7)

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

   systemd 249                                      SD_JOURNAL_STREAM_FD(3)

--------------

Pages that refer to this page:
`sd-journal(3) <../man3/sd-journal.3.html>`__, 
`sd_journal_print(3) <../man3/sd_journal_print.3.html>`__

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
