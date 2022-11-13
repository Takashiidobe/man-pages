.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

clockdiff(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `WARNINGS <#WARNINGS>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `REFERENCES <#REFERENCES>`__ \|   |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SECURITY <#SECURITY>`__ \|       |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CLOCKDIFF(8)                     iputils                    CLOCKDIFF(8)

NAME
-------------------------------------------------

::

          clockdiff - measure clock difference between hosts


---------------------------------------------------------

::

          clockdiff [-o] [-o1] [--time-format ctime iso] [-V] {destination}


---------------------------------------------------------------

::

          clockdiff Measures clock difference between us and destination
          with 1 msec resolution using ICMP TIMESTAMP [2] packets or,
          optionally, IP TIMESTAMP option [3] option added to ICMP ECHO.
          [1]


-------------------------------------------------------

::

          -o
              Use IP TIMESTAMP with ICMP ECHO instead of ICMP TIMESTAMP
              messages. It is useful with some destinations, which do not
              support ICMP TIMESTAMP (f.e. Solaris <2.4).

          -o1
              Slightly different form of -o, namely it uses three-term IP
              TIMESTAMP with prespecified hop addresses instead of four
              term one. What flavor works better depends on target host.
              Particularly, -o is better for Linux.

          -T, --time-format ctime iso
              Print time stamp in output either ISO-8601 format or
              classical ctime format. The ctime format is default. The ISO
              time stamp includes timezone, and is easier to parse.

          -I
              Alias of --time-format iso option and argument.

          -h, --help
              Print help and exit.

          -V, --version
              Print version and exit.


---------------------------------------------------------

::

              • Some nodes (Cisco) use non-standard timestamps, which is
              allowed by RFC, but makes timestamps mostly useless.

              • Some nodes generate messed timestamps (Solaris>2.4), when
              run xntpd. Seems, its IP stack uses a corrupted clock source,
              which is synchronized to time-of-day clock periodically and
              jumps randomly making timestamps mostly useless. Good news is
              that you can use NTP in this case, which is even better.

              • clockdiff shows difference in time modulo 24 days.


---------------------------------------------------------

::

          ping(8), arping(8), tracepath(8).


-------------------------------------------------------------

::

          [1] ICMP ECHO, RFC0792, page 14.

          [2] ICMP TIMESTAMP, RFC0792, page 16.

          [3] IP TIMESTAMP option, RFC0791, 3.1, page 16.


-----------------------------------------------------

::

          clockdiff was compiled by Alexey Kuznetsov
          <kuznet@ms2.inr.ac.ru>. It was based on code borrowed from BSD
          timed daemon.


---------------------------------------------------------

::

          clockdiff requires CAP_NET_RAW capability to be executed. It is
          safe to be used as set-uid root.


-----------------------------------------------------------------

::

          clockdiff is part of iputils package.

COLOPHON
---------------------------------------------------------

::

          This page is part of the iputils (IP utilities) project.
          Information about the project can be found at 
          ⟨http://www.skbuff.net/iputils/⟩.  If you have a bug report for
          this manual page, send it to yoshfuji@skbuff.net,
          netdev@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/iputils/iputils.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   iputils 20210722                                            CLOCKDIFF(8)

--------------

Pages that refer to this page: `arping(8) <../man8/arping.8.html>`__

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
