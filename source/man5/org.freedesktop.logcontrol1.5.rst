.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

org.freedesktop.LogControl1(5) — Linux manual page
==================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `INTRODUCTION <#INTRODUCTION>`__  |                                   |
| \| `DESCRIPTION <#DESCRIPTION>`__ |                                   |
| \| `TOOLS <#TOOLS>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ORG.FREEDESKTOP.LOGCONTROL1(5)edesktop.LogControl1DESKTOP.LOGCONTROL1(5)

NAME
-------------------------------------------------

::

          org.freedesktop.LogControl1 - D-Bus interface to query and set
          logging configuration


-----------------------------------------------------------------

::

          org.freedesktop.LogControl1 is a generic interface that is
          intended to be used by any daemon which allows the log level and
          target to be set over D-Bus. It is implemented by various daemons
          that are part of the systemd(1) suite.

          It is assumed that those settings are global for the whole
          program, so a fixed object path is used. The interface should
          always be available under the path /org/freedesktop/LogControl1.


---------------------------------------------------------------

::

          The following interface is exposed:

              node /org/freedesktop/LogControl1 {
                interface org.freedesktop.LogControl1 {
                  properties:
                    @org.freedesktop.DBus.Property.EmitsChangedSignal("false")
                    @org.freedesktop.systemd1.Privileged("true")
                    readwrite s LogLevel = '...';
                    @org.freedesktop.DBus.Property.EmitsChangedSignal("false")
                    @org.freedesktop.systemd1.Privileged("true")
                    readwrite s LogTarget = '...';
                    @org.freedesktop.DBus.Property.EmitsChangedSignal("false")
                    readonly s SyslogIdentifier = '...';
                };
                interface org.freedesktop.DBus.Peer { ... };
                interface org.freedesktop.DBus.Introspectable { ... };
                interface org.freedesktop.DBus.Properties { ... };
              };

      Properties
          LogLevel describes the syslog(3)-style log-level, and should be
          one of "emerg", "alert", "crit", "err", "warning", "notice",
          "info", "debug", in order of increasing verbosity.

          LogTarget describes the log target (mechanism). It should be one
          of "console" (log to the console or standard output), "kmsg" (log
          to the kernel ring buffer), "journal" (log to the journal
          natively, see systemd-journald.service(8)), "syslog" (log using
          the syslog(3) call).

          Those two properties are writable, so they may be set by
          sufficiently privileged users.

          SyslogIdentifier is a read-only property that shows the "syslog
          identifier". It is a short string that identifies the program
          that is the source of log messages that is passed to the
          syslog(3) call.


---------------------------------------------------

::

          journalctl option -p/--priority= may be used to filter log
          messages by log level, option -t/--identifier= may be used to by
          the syslog identifier, and filters like "_TRANSPORT=syslog",
          "_TRANSPORT=journal", and "_TRANSPORT=kernel" may be used to
          filter messages by the mechanism through which they reached
          systemd-journald.

          systemctl log-level and systemctl log-target verbs may be used to
          query and set the LogLevel and LogTarget properties of the
          service manager.  systemctl service-log-level and systemctl
          service-log-target may similarly be used for individual services.
          (Services must have the BusName= property set and must implement
          the interface described here. See systemd.service(5) for details
          about BusName=.)


---------------------------------------------------------

::

          systemd(1), journalctl(1), systemctl(1), systemd.service(5),
          syslog(3)

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

   systemd 249                               ORG.FREEDESKTOP.LOGCONTROL1(5)

--------------

Pages that refer to this page:
`systemctl(1) <../man1/systemctl.1.html>`__, 
`systemd(1) <../man1/systemd.1.html>`__, 
`systemd-hostnamed.service(8) <../man8/systemd-hostnamed.service.8.html>`__, 
`systemd-importd.service(8) <../man8/systemd-importd.service.8.html>`__, 
`systemd-localed.service(8) <../man8/systemd-localed.service.8.html>`__, 
`systemd-logind.service(8) <../man8/systemd-logind.service.8.html>`__, 
`systemd-machined.service(8) <../man8/systemd-machined.service.8.html>`__, 
`systemd-resolved.service(8) <../man8/systemd-resolved.service.8.html>`__, 
`systemd-timedated.service(8) <../man8/systemd-timedated.service.8.html>`__

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
