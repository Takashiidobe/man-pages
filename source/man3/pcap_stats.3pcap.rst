.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcap_stats(3pcap) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCAP_STATS(3PCAP)                                      PCAP_STATS(3PCAP)

NAME
-------------------------------------------------

::

          pcap_stats - get capture statistics


---------------------------------------------------------

::

          #include <pcap/pcap.h>

          int pcap_stats(pcap_t *p, struct pcap_stat *ps);


---------------------------------------------------------------

::

          pcap_stats() fills in the struct pcap_stat pointed to by its
          second argument.  The values represent packet statistics from the
          start of the run to the time of the call.

          pcap_stats() is supported only on live captures, not on
          ``savefiles''; no statistics are stored in ``savefiles'', so no
          statistics are available when reading from a ``savefile''.

          A struct pcap_stat has the following members:

                 ps_recv
                        number of packets received;

                 ps_drop
                        number of packets dropped because there was no room
                        in the operating system's buffer when they arrived,
                        because packets weren't being read fast enough;

                 ps_ifdrop
                        number of packets dropped by the network interface
                        or its driver.

          The statistics do not behave the same way on all platforms.
          ps_recv might count packets whether they passed any filter set
          with pcap_setfilter(3PCAP) or not, or it might count only packets
          that pass the filter.  It also might, or might not, count packets
          dropped because there was no room in the operating system's
          buffer when they arrived.  ps_drop is not available on all
          platforms; it is zero on platforms where it's not available.  If
          packet filtering is done in libpcap, rather than in the operating
          system, it would count packets that don't pass the filter.  Both
          ps_recv and ps_drop might, or might not, count packets not yet
          read from the operating system and thus not yet seen by the
          application.  ps_ifdrop might, or might not, be implemented; if
          it's zero, that might mean that no packets were dropped by the
          interface, or it might mean that the statistic is unavailable, so
          it should not be treated as an indication that the interface did
          not drop any packets.


-----------------------------------------------------------------

::

          pcap_stats() returns 0 on success and returns PCAP_ERROR if there
          is an error or if p doesn't support packet statistics. If
          PCAP_ERROR is returned, pcap_geterr(3PCAP) or pcap_perror(3PCAP)
          may be called with p as an argument to fetch or display the error
          text.


---------------------------------------------------------

::

          pcap(3PCAP)

COLOPHON
---------------------------------------------------------

::

          This page is part of the libpcap (packet capture library)
          project.  Information about the project can be found at 
          ⟨http://www.tcpdump.org/⟩.  If you have a bug report for this
          manual page, see ⟨http://www.tcpdump.org/#patches⟩.  This page
          was obtained from the project's upstream Git repository
          ⟨https://github.com/the-tcpdump-group/libpcap.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-17.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                 25 July 2018             PCAP_STATS(3PCAP)

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
