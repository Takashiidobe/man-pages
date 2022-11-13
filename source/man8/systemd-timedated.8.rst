.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-timedated.service(8) — Linux manual page
================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `LIST OF NETWORK TIME SYNCHRONIZ  |                                   |
| ATION SERVICES <#LIST_OF_NETWORK_ |                                   |
| TIME_SYNCHRONIZATION_SERVICES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-TIMEDATED.SERVICE(8)emd-timedated.serviceMD-TIMEDATED.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-timedated.service, systemd-timedated - Time and date bus
          mechanism


---------------------------------------------------------

::

          systemd-timedated.service

          /usr/lib/systemd/systemd-timedated


---------------------------------------------------------------

::

          systemd-timedated.service is a system service that may be used as
          a mechanism to change the system clock and timezone, as well as
          to enable/disable network time synchronization.
          systemd-timedated is automatically activated on request and
          terminates itself when it is unused.

          The tool timedatectl(1) is a command line client to this service.

          systemd-timedated currently offers access to the following four
          settings:

          •   The system time

          •   The system timezone

          •   A boolean controlling whether the system RTC is in local or
              UTC timezone

          •   Whether the time synchronization service is enabled/started
              or disabled/stopped, see next section.

          See org.freedesktop.timedate1(5) and
          org.freedesktop.LogControl1(5) for information about the D-Bus
          API.


-----------------------------------------------------------------------------------------------------------------------------------

::

          systemd-timesyncd will look for files with a ".list" extension in
          ntp-units.d/ directories. Each file is parsed as a list of unit
          names, one per line. Empty lines and lines with comments ("#")
          are ignored. Files are read from /usr/lib/systemd/ntp-units.d/
          and the corresponding directories under /etc/, /run/,
          /usr/local/lib/. Files in /etc/ override files with the same name
          in /run/, /usr/local/lib/, and /usr/lib/. Files in /run/ override
          files with the same name under /usr/. Packages should install
          their configuration files in /usr/lib/ (distribution packages) or
          /usr/local/lib/ (local installs).

          Example 1. ntp-units.d/ entry for systemd-timesyncd

              # /usr/lib/systemd/ntp-units.d/80-systemd-timesync.list
              systemd-timesyncd.service

          If the environment variable $SYSTEMD_TIMEDATED_NTP_SERVICES is
          set, systemd-timesyncd will parse the contents of that variable
          as a colon-separated list of unit names. When set, this variable
          overrides the file-based list described above.

          Example 2. An override that specifies that chronyd should be used
          if available

              SYSTEMD_TIMEDATED_NTP_SERVICES=chronyd.service:systemd-timesyncd.service


---------------------------------------------------------

::

          systemd(1), timedatectl(1), localtime(5), hwclock(8),
          systemd-timesyncd(8)

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

   systemd 249                                 SYSTEMD-TIMEDATED.SERVICE(8)

--------------

Pages that refer to this page:
`timedatectl(1) <../man1/timedatectl.1.html>`__, 
`localtime(5) <../man5/localtime.5.html>`__, 
`org.freedesktop.timedate1(5) <../man5/org.freedesktop.timedate1.5.html>`__

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
