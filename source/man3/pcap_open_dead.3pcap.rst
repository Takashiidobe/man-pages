.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcap_open_dead(3pcap) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `BACKWARD COMPATIBI               |                                   |
| LITY <#BACKWARD_COMPATIBILITY>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCAP_OPEN_DEAD(3PCAP)                              PCAP_OPEN_DEAD(3PCAP)

NAME
-------------------------------------------------

::

          pcap_open_dead, pcap_open_dead_with_tstamp_precision - open a
          fake pcap_t for compiling filters or opening a capture for output


---------------------------------------------------------

::

          #include <pcap/pcap.h>

          pcap_t *pcap_open_dead(int linktype, int snaplen);
          pcap_t *pcap_open_dead_with_tstamp_precision(int linktype, int snaplen,
              u_int precision);


---------------------------------------------------------------

::

          pcap_open_dead() and pcap_open_dead_with_tstamp_precision() are
          used for creating a pcap_t structure to use when calling the
          other functions in libpcap.  It is typically used when just using
          libpcap for compiling BPF code; it can also be used if using
          pcap_dump_open(3PCAP), pcap_dump(3PCAP), and
          pcap_dump_close(3PCAP) to write a savefile if there is no pcap_t
          that supplies the packets to be written.

          linktype specifies the link-layer type for the pcap_t.

          snaplen specifies the snapshot length for the pcap_t.

          When pcap_open_dead_with_tstamp_precision(), is used to create a
          pcap_t for use with pcap_dump_open(), precision specifies the
          time stamp precision for packets; PCAP_TSTAMP_PRECISION_MICRO
          should be specified if the packets to be written have time stamps
          in seconds and microseconds, and PCAP_TSTAMP_PRECISION_NANO
          should be specified if the packets to be written have time stamps
          in seconds and nanoseconds.  Its value does not affect
          pcap_compile(3PCAP).


-------------------------------------------------------------------------------------

::

          The pcap_open_dead_with_tstamp_precision() function became
          available in libpcap release 1.5.1.  In previous releases, there
          was no mechanism to open a savefile for writing with time stamps
          given in seconds and nanoseconds.


---------------------------------------------------------

::

          pcap(3PCAP), pcap-linktype(7)

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

                                3 January 2014        PCAP_OPEN_DEAD(3PCAP)

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
