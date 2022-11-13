.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ifstat(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IFSTAT(8)                         Linux                        IFSTAT(8)

NAME
-------------------------------------------------

::

          ifstat - handy utility to read network interface statistics


---------------------------------------------------------

::

          ifstat [ OPTIONS ] [ INTERFACE_LIST ]

          INTERFACE_LIST := INTERFACE_LIST | interface


---------------------------------------------------------------

::

          ifstat neatly prints out network interface statistics.  The
          utility keeps records of the previous data displayed in history
          files and by default only shows difference between the last and
          the current call.  Location of the history files defaults to
          /tmp/.ifstat.u$UID but may be overridden with the IFSTAT_HISTORY
          environment variable. Similarly, the default location for xstat
          (extended stats) is /tmp/.<xstat name>_ifstat.u$UID.


-------------------------------------------------------

::

          -h, --help
                 Show summary of options.

          -V, --version
                 Show version of program.

          -a, --ignore
                 Ignore the history file.

          -d, --scan=SECS
                 Sample statistics every SECS second.

          -e, --errors
                 Show errors.

          -n, --nooutput
                 Don't display any output.  Update the history file only.

          -r, --reset
                 Reset history.

          -s, --noupdate
                 Don't update the history file.

          -t, --interval=SECS
                 Report average over the last SECS seconds.

          -z, --zeros
                 Show entries with zero activity.

          -j, --json
                 Display results in JSON format

          -p, --pretty
                 If combined with --json, pretty print the output.

          -x, --extended=TYPE
                 Show extended stats of TYPE. Supported types are:

                         cpu_hits - Counts only packets that went via the
                         CPU.


---------------------------------------------------------------

::

          IFSTAT_HISTORY
                 If set, it's value is interpreted as alternate history
                 file path.


---------------------------------------------------------

::

          ip(8)


-----------------------------------------------------

::

          ifstat was written by Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>.

          This manual page was written by Petr Sabata <contyk@redhat.com>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the iproute2 (utilities for controlling
          TCP/IP networking and traffic) project.  Information about the
          project can be found at 
          ⟨http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2⟩.
          If you have a bug report for this manual page, send it to
          netdev@vger.kernel.org, shemminger@osdl.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/network/iproute2/iproute2.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-18.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   iproute2                       28 Oct 2015                     IFSTAT(8)

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
