.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcap_open_offline(3pcap) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `BACKWARD COMPATIBI               |                                   |
| LITY <#BACKWARD_COMPATIBILITY>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCAP_OPEN_OFFLINE(3PCAP)                        PCAP_OPEN_OFFLINE(3PCAP)

NAME
-------------------------------------------------

::

          pcap_open_offline, pcap_open_offline_with_tstamp_precision,
          pcap_fopen_offline, pcap_fopen_offline_with_tstamp_precision -
          open a saved capture file for reading


---------------------------------------------------------

::

          #include <pcap/pcap.h>

          char errbuf[PCAP_ERRBUF_SIZE];

          pcap_t *pcap_open_offline(const char *fname, char *errbuf);
          pcap_t *pcap_open_offline_with_tstamp_precision(const char *fname,
              u_int precision, char *errbuf);
          pcap_t *pcap_fopen_offline(FILE *fp, char *errbuf);
          pcap_t *pcap_fopen_offline_with_tstamp_precision(FILE *fp,
              u_int precision, char *errbuf);


---------------------------------------------------------------

::

          pcap_open_offline() and pcap_open_offline_with_tstamp_precision()
          are called to open a ``savefile'' for reading.

          fname specifies the name of the file to open. The file can have
          the pcap file format as described in pcap-savefile(5), which is
          the file format used by, among other programs, tcpdump(1) and
          tcpslice(1), or can have the pcapng file format, although not all
          pcapng files can be read.  The name "-" is a synonym for stdin.

          pcap_open_offline_with_tstamp_precision() takes an additional
          precision argument specifying the time stamp precision desired;
          if PCAP_TSTAMP_PRECISION_MICRO is specified, packet time stamps
          will be supplied in seconds and microseconds, and if
          PCAP_TSTAMP_PRECISION_NANO is specified, packet time stamps will
          be supplied in seconds and nanoseconds.  If the time stamps in
          the file do not have the same precision as the requested
          precision, they will be scaled up or down as necessary before
          being supplied.

          Alternatively, you may call pcap_fopen_offline() or
          pcap_fopen_offline_with_tstamp_precision() to read dumped data
          from an existing open stream fp.
          pcap_fopen_offline_with_tstamp_precision() takes an additional
          precision argument as described above.  Note that on Windows,
          that stream should be opened in binary mode.


-----------------------------------------------------------------

::

          pcap_open_offline(), pcap_open_offline_with_tstamp_precision(),
          pcap_fopen_offline(), and
          pcap_fopen_offline_with_tstamp_precision() return a pcap_t * on
          success and NULL on failure.  If NULL is returned, errbuf is
          filled in with an appropriate error message.  errbuf is assumed
          to be able to hold at least PCAP_ERRBUF_SIZE chars.


-------------------------------------------------------------------------------------

::

          pcap_open_offline_with_tstamp_precision() and
          pcap_fopen_offline_with_tstamp_precision() became available in
          libpcap release 1.5.1.  In previous releases, time stamps from a
          savefile are always given in seconds and microseconds.


---------------------------------------------------------

::

          pcap(3PCAP), pcap-savefile(5)

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

                                23 August 2018     PCAP_OPEN_OFFLINE(3PCAP)

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
