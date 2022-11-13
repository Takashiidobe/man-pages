.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

perf-iostat(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PERF-IOSTAT(1)                 perf Manual                PERF-IOSTAT(1)

NAME
-------------------------------------------------

::

          perf-iostat - Show I/O performance metrics


---------------------------------------------------------

::

          perf iostat list
          perf iostat <ports> — <command> [<options>]


---------------------------------------------------------------

::

          Mode is intended to provide four I/O performance metrics per each
          PCIe root port:

          •   Inbound Read - I/O devices below root port read from the host
              memory, in MB

          •   Inbound Write - I/O devices below root port write to the host
              memory, in MB

          •   Outbound Read - CPU reads from I/O devices below root port,
              in MB

          •   Outbound Write - CPU writes to I/O devices below root port,
              in MB


-------------------------------------------------------

::

          <command>...
              Any command you can specify in a shell.

          list
              List all PCIe root ports.

          <ports>
              Select the root ports for monitoring. Comma-separated list is
              supported.


---------------------------------------------------------

::

           1. List all PCIe root ports (example for 2-S platform):

                  $ perf iostat list
                  S0-uncore_iio_0<0000:00>
                  S1-uncore_iio_0<0000:80>
                  S0-uncore_iio_1<0000:17>
                  S1-uncore_iio_1<0000:85>
                  S0-uncore_iio_2<0000:3a>
                  S1-uncore_iio_2<0000:ae>
                  S0-uncore_iio_3<0000:5d>
                  S1-uncore_iio_3<0000:d7>

           2. Collect metrics for all PCIe root ports:

                  $ perf iostat -- dd if=/dev/zero of=/dev/nvme0n1 bs=1M oflag=direct
                  357708+0 records in
                  357707+0 records out
                  375083606016 bytes (375 GB, 349 GiB) copied, 215.974 s, 1.7 GB/s

                  Performance counter stats for 'system wide':

                     port             Inbound Read(MB)    Inbound Write(MB)    Outbound Read(MB)   Outbound Write(MB)
                  0000:00                    1                    0                    2                    3
                  0000:80                    0                    0                    0                    0
                  0000:17               352552                   43                    0                   21
                  0000:85                    0                    0                    0                    0
                  0000:3a                    3                    0                    0                    0
                  0000:ae                    0                    0                    0                    0
                  0000:5d                    0                    0                    0                    0
                  0000:d7                    0                    0                    0                    0

           3. Collect metrics for comma-separated list of PCIe root ports:

                  $ perf iostat 0000:17,0:3a -- dd if=/dev/zero of=/dev/nvme0n1 bs=1M oflag=direct
                  357708+0 records in
                  357707+0 records out
                  375083606016 bytes (375 GB, 349 GiB) copied, 197.08 s, 1.9 GB/s

                  Performance counter stats for 'system wide':

                     port             Inbound Read(MB)    Inbound Write(MB)    Outbound Read(MB)   Outbound Write(MB)
                  0000:17               358559                   44                    0                   22
                  0000:3a                    3                    2                    0                    0

                  197.081983474 seconds time elapsed


---------------------------------------------------------

::

          perf-stat(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the perf (Performance analysis tools for
          Linux (in Linux source tree)) project.  Information about the
          project can be found at 
          ⟨https://perf.wiki.kernel.org/index.php/Main_Page⟩.  If you have a
          bug report for this manual page, send it to
          linux-kernel@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git⟩
          on 2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-26.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   perf                           2021-04-20                 PERF-IOSTAT(1)

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
