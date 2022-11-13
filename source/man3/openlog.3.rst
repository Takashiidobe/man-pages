.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

syslog(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSLOG(3)               Linux Programmer's Manual              SYSLOG(3)

NAME
-------------------------------------------------

::

          closelog, openlog, syslog, vsyslog - send messages to the system
          logger


---------------------------------------------------------

::

          #include <syslog.h>

          void openlog(const char *ident, int option, int facility);
          void syslog(int priority, const char *format, ...);
          void closelog(void);

          void vsyslog(int priority, const char *format, va_list ap);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          vsyslog():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _BSD_SOURCE


---------------------------------------------------------------

::

      openlog()
          openlog() opens a connection to the system logger for a program.

          The string pointed to by ident is prepended to every message, and
          is typically set to the program name.  If ident is NULL, the
          program name is used.  (POSIX.1-2008 does not specify the
          behavior when ident is NULL.)

          The option argument specifies flags which control the operation
          of openlog() and subsequent calls to syslog().  The facility
          argument establishes a default to be used if none is specified in
          subsequent calls to syslog().  The values that may be specified
          for option and facility are described below.

          The use of openlog() is optional; it will automatically be called
          by syslog() if necessary, in which case ident will default to
          NULL.

      syslog() and vsyslog()
          syslog() generates a log message, which will be distributed by
          syslogd(8).

          The priority argument is formed by ORing together a facility
          value and a level value (described below).  If no facility value
          is ORed into priority, then the default value set by openlog() is
          used, or, if there was no preceding openlog() call, a default of
          LOG_USER is employed.

          The remaining arguments are a format, as in printf(3), and any
          arguments required by the format, except that the two-character
          sequence %m will be replaced by the error message string
          strerror(errno).  The format string need not include a
          terminating newline character.

          The function vsyslog() performs the same task as syslog() with
          the difference that it takes a set of arguments which have been
          obtained using the stdarg(3) variable argument list macros.

      closelog()
          closelog() closes the file descriptor being used to write to the
          system logger.  The use of closelog() is optional.

      Values for option
          The option argument to openlog() is a bit mask constructed by
          ORing together any of the following values:

          LOG_CONS
                 Write directly to the system console if there is an error
                 while sending to the system logger.

          LOG_NDELAY
                 Open the connection immediately (normally, the connection
                 is opened when the first message is logged).  This may be
                 useful, for example, if a subsequent chroot(2) would make
                 the pathname used internally by the logging facility
                 unreachable.

          LOG_NOWAIT
                 Don't wait for child processes that may have been created
                 while logging the message.  (The GNU C library does not
                 create a child process, so this option has no effect on
                 Linux.)

          LOG_ODELAY
                 The converse of LOG_NDELAY; opening of the connection is
                 delayed until syslog() is called.  (This is the default,
                 and need not be specified.)

          LOG_PERROR
                 (Not in POSIX.1-2001 or POSIX.1-2008.)  Also log the
                 message to stderr.

          LOG_PID
                 Include the caller's PID with each message.

      Values for facility
          The facility argument is used to specify what type of program is
          logging the message.  This lets the configuration file specify
          that messages from different facilities will be handled
          differently.

          LOG_AUTH
                 security/authorization messages

          LOG_AUTHPRIV
                 security/authorization messages (private)

          LOG_CRON
                 clock daemon (cron and at)

          LOG_DAEMON
                 system daemons without separate facility value

          LOG_FTP
                 ftp daemon

          LOG_KERN
                 kernel messages (these can't be generated from user
                 processes)

          LOG_LOCAL0 through LOG_LOCAL7
                 reserved for local use

          LOG_LPR
                 line printer subsystem

          LOG_MAIL
                 mail subsystem

          LOG_NEWS
                 USENET news subsystem

          LOG_SYSLOG
                 messages generated internally by syslogd(8)

          LOG_USER (default)
                 generic user-level messages

          LOG_UUCP
                 UUCP subsystem

      Values for level
          This determines the importance of the message.  The levels are,
          in order of decreasing importance:

          LOG_EMERG
                 system is unusable

          LOG_ALERT
                 action must be taken immediately

          LOG_CRIT
                 critical conditions

          LOG_ERR
                 error conditions

          LOG_WARNING
                 warning conditions

          LOG_NOTICE
                 normal, but significant, condition

          LOG_INFO
                 informational message

          LOG_DEBUG
                 debug-level message

          The function setlogmask(3) can be used to restrict logging to
          specified levels only.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────┬───────────────┬────────────────────┐
          │Interface                  │ Attribute     │ Value              │
          ├───────────────────────────┼───────────────┼────────────────────┤
          │openlog(), closelog()      │ Thread safety │ MT-Safe            │
          ├───────────────────────────┼───────────────┼────────────────────┤
          │syslog(), vsyslog()        │ Thread safety │ MT-Safe env locale │
          └───────────────────────────┴───────────────┴────────────────────┘


-------------------------------------------------------------------

::

          The functions openlog(), closelog(), and syslog() (but not
          vsyslog()) are specified in SUSv2, POSIX.1-2001, and
          POSIX.1-2008.

          POSIX.1-2001 specifies only the LOG_USER and LOG_LOCAL* values
          for facility.  However, with the exception of LOG_AUTHPRIV and
          LOG_FTP, the other facility values appear on most UNIX systems.

          The LOG_PERROR value for option is not specified by POSIX.1-2001
          or POSIX.1-2008, but is available in most versions of UNIX.


---------------------------------------------------

::

          The argument ident in the call of openlog() is probably stored
          as-is.  Thus, if the string it points to is changed, syslog() may
          start prepending the changed string, and if the string it points
          to ceases to exist, the results are undefined.  Most portable is
          to use a string constant.

          Never pass a string with user-supplied data as a format, use the
          following instead:

              syslog(priority, "%s", string);


---------------------------------------------------------

::

          journalctl(1), logger(1), setlogmask(3), syslog.conf(5),
          syslogd(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      SYSLOG(3)

--------------

Pages that refer to this page: `homectl(1) <../man1/homectl.1.html>`__, 
`inotifywait(1) <../man1/inotifywait.1.html>`__, 
`journalctl(1) <../man1/journalctl.1.html>`__, 
`localectl(1) <../man1/localectl.1.html>`__, 
`logger(1) <../man1/logger.1.html>`__, 
`loginctl(1) <../man1/loginctl.1.html>`__, 
`machinectl(1) <../man1/machinectl.1.html>`__, 
`portablectl(1) <../man1/portablectl.1.html>`__, 
`systemctl(1) <../man1/systemctl.1.html>`__, 
`systemd(1) <../man1/systemd.1.html>`__, 
`systemd-analyze(1) <../man1/systemd-analyze.1.html>`__, 
`systemd-cat(1) <../man1/systemd-cat.1.html>`__, 
`systemd-inhibit(1) <../man1/systemd-inhibit.1.html>`__, 
`systemd-nspawn(1) <../man1/systemd-nspawn.1.html>`__, 
`timedatectl(1) <../man1/timedatectl.1.html>`__, 
`userdbctl(1) <../man1/userdbctl.1.html>`__, 
`syslog(2) <../man2/syslog.2.html>`__, 
`pam_syslog(3) <../man3/pam_syslog.3.html>`__, 
`pmnotifyerr(3) <../man3/pmnotifyerr.3.html>`__, 
`sd-daemon(3) <../man3/sd-daemon.3.html>`__, 
`sd_journal_print(3) <../man3/sd_journal_print.3.html>`__, 
`sd_journal_stream_fd(3) <../man3/sd_journal_stream_fd.3.html>`__, 
`selinux_restorecon(3) <../man3/selinux_restorecon.3.html>`__, 
`setlogmask(3) <../man3/setlogmask.3.html>`__, 
`stdarg(3) <../man3/stdarg.3.html>`__, 
`limits.conf(5) <../man5/limits.conf.5.html>`__, 
`org.freedesktop.LogControl1(5) <../man5/org.freedesktop.LogControl1.5.html>`__, 
`pam.conf(5) <../man5/pam.conf.5.html>`__, 
`rsyslog.conf(5) <../man5/rsyslog.conf.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`time.conf(5) <../man5/time.conf.5.html>`__, 
`file-hierarchy(7) <../man7/file-hierarchy.7.html>`__, 
`systemd.generator(7) <../man7/systemd.generator.7.html>`__, 
`agetty(8) <../man8/agetty.8.html>`__, 
`cmirrord(8) <../man8/cmirrord.8.html>`__, 
`cron(8) <../man8/cron.8.html>`__, 
`lloadd(8) <../man8/lloadd.8.html>`__, 
`PAM(8) <../man8/PAM.8.html>`__, 
`pam_access(8) <../man8/pam_access.8.html>`__, 
`pam_cracklib(8) <../man8/pam_cracklib.8.html>`__, 
`pam_env(8) <../man8/pam_env.8.html>`__, 
`pam_keyinit(8) <../man8/pam_keyinit.8.html>`__, 
`pam_pwhistory(8) <../man8/pam_pwhistory.8.html>`__, 
`pam_selinux(8) <../man8/pam_selinux.8.html>`__, 
`pam_sepermit(8) <../man8/pam_sepermit.8.html>`__, 
`pam_tally2(8) <../man8/pam_tally2.8.html>`__, 
`pam_tally(8) <../man8/pam_tally.8.html>`__, 
`pam_time(8) <../man8/pam_time.8.html>`__, 
`pam_timestamp(8) <../man8/pam_timestamp.8.html>`__, 
`pam_unix(8) <../man8/pam_unix.8.html>`__, 
`pam_warn(8) <../man8/pam_warn.8.html>`__, 
`rsyslogd(8) <../man8/rsyslogd.8.html>`__, 
`slapd(8) <../man8/slapd.8.html>`__, 
`systemd-journald.service(8) <../man8/systemd-journald.service.8.html>`__, 
`systemd-tmpfiles(8) <../man8/systemd-tmpfiles.8.html>`__

--------------

`Copyright and license for this manual
page <../man3/syslog.3.license.html>`__

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
