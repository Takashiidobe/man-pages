.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-timesyncd.service(8) — Linux manual page
================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-TIMESYNCD.SERVICE(8)emd-timesyncd.serviceMD-TIMESYNCD.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-timesyncd.service, systemd-timesyncd - Network Time
          Synchronization


---------------------------------------------------------

::

          systemd-timesyncd.service

          /usr/lib/systemd/systemd-timesyncd


---------------------------------------------------------------

::

          systemd-timesyncd is a system service that may be used to
          synchronize the local system clock with a remote Network Time
          Protocol (NTP) server. It also saves the local time to disk every
          time the clock has been synchronized and uses this to possibly
          advance the system realtime clock on subsequent reboots to ensure
          it (roughly) monotonically advances even if the system lacks a
          battery-buffered RTC chip.

          The systemd-timesyncd service implements SNTP only. This
          minimalistic service will step the system clock for large offsets
          or slowly adjust it for smaller deltas. Complex use cases that
          require full NTP support (and where SNTP is not sufficient) are
          not covered by systemd-timesyncd.

          The NTP servers contacted are determined from the global settings
          in timesyncd.conf(5), the per-link static settings in .network
          files, and the per-link dynamic settings received over DHCP. See
          systemd.network(5) for further details.

          timedatectl(1)'s set-ntp command may be used to enable and start,
          or disable and stop this service.

          timedatectl(1)'s timesync-status or show-timesync command can be
          used to show the current status of this service.

          systemd-timesyncd initialization delays the start of units that
          are ordered after time-set.target (see systemd.special(7) for
          details) until the local time has been updated from
          /var/lib/systemd/timesync/clock (see below) in order to make it
          roughly monotonic. It does not delay other units until
          synchronization with an accurate reference time sources has been
          reached. Use systemd-time-wait-sync.service(8) to achieve that,
          which will delay start of units that are ordered after
          time-sync.target until synchronization to an accurate reference
          clock is reached.


---------------------------------------------------

::

          /var/lib/systemd/timesync/clock
              The modification time ("mtime") of this file is updated on
              each successful NTP synchronization or after each
              SaveIntervalSec= time interval, as specified in
              timesyncd.conf(5). At the minimum, it will be set to the
              systemd build date. It is used to ensure that the system
              clock remains roughly monotonic across reboots, in case no
              local RTC is available.

          /run/systemd/timesync/synchronized
              A file that is touched on each successful synchronization, to
              assist systemd-time-wait-sync and other applications to
              detecting synchronization with accurate reference clocks.


---------------------------------------------------------

::

          systemd(1), timesyncd.conf(5), systemd.network(5),
          systemd-networkd.service(8), systemd-time-wait-sync.service(8),
          systemd.special(7), timedatectl(1), localtime(5), hwclock(8)

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

   systemd 249                                 SYSTEMD-TIMESYNCD.SERVICE(8)

--------------

Pages that refer to this page:
`timedatectl(1) <../man1/timedatectl.1.html>`__, 
`systemd.network(5) <../man5/systemd.network.5.html>`__, 
`timesyncd.conf(5) <../man5/timesyncd.conf.5.html>`__, 
`systemd.special(7) <../man7/systemd.special.7.html>`__, 
`systemd-timedated.service(8) <../man8/systemd-timedated.service.8.html>`__, 
`systemd-time-wait-sync.service(8) <../man8/systemd-time-wait-sync.service.8.html>`__

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
