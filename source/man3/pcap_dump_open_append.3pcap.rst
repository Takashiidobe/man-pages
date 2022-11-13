.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcap_dump_open(3pcap) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| RETURN VALUES <#RETURN_VALUES>`__ |                                   |
| \|                                |                                   |
| `BACKWARD COMPATIBI               |                                   |
| LITY <#BACKWARD_COMPATIBILITY>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCAP_DUMP_OPEN(3PCAP)                              PCAP_DUMP_OPEN(3PCAP)

NAME
-------------------------------------------------

::

          pcap_dump_open, pcap_dump_open_append, pcap_dump_fopen - open a
          file to which to write packets


---------------------------------------------------------

::

          #include <pcap/pcap.h>

          pcap_dumper_t *pcap_dump_open(pcap_t *p, const char *fname);
          pcap_dumper_t *pcap_dump_open_append(pcap_t *p, const char *fname);
          pcap_dumper_t *pcap_dump_fopen(pcap_t *p, FILE *fp);


---------------------------------------------------------------

::

          pcap_dump_open() is called to open a ``savefile'' for writing.
          fname specifies the name of the file to open. The file will have
          the same format as those used by tcpdump(1) and tcpslice(1).  If
          the file does not exist, it will be created; if the file exists,
          it will be truncated and overwritten.  The name "-" is a synonym
          for stdout.

          pcap_dump_fopen() is called to write data to an existing open
          stream fp; this stream will be closed by a subsequent call to
          pcap_dump_close(3PCAP).  The stream is assumed to be at the
          beginning of a file that has been newly created or truncated, so
          that writes will start at the beginning of the file.  Note that
          on Windows, that stream should be opened in binary mode.

          p is a capture or ``savefile'' handle returned by an earlier call
          to pcap_create(3PCAP) and activated by an earlier call to
          pcap_activate(3PCAP), or returned by an earlier call to
          pcap_open_offline(3PCAP), pcap_open_live(3PCAP), or
          pcap_open_dead(3PCAP).  The time stamp precision, link-layer
          type, and snapshot length from p are used as the link-layer type
          and snapshot length of the output file.

          pcap_dump_open_append() is like pcap_dump_open() but, if the file
          already exists, and is a pcap file with the same byte order as
          the host opening the file, and has the same time stamp precision,
          link-layer header type, and snapshot length as p, it will write
          new packets at the end of the file.


-------------------------------------------------------------------

::

          A pointer to a pcap_dumper_t structure to use in subsequent
          pcap_dump(3PCAP) and pcap_dump_close(3PCAP) calls is returned on
          success.  NULL is returned on failure.  If NULL is returned,
          pcap_geterr(3PCAP) can be used to get the error text.


-------------------------------------------------------------------------------------

::

          The pcap_dump_open_append() function became available in libpcap
          release 1.7.2.  In previous releases, there is no support for
          appending packets to an existing savefile.


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

                                  3 July 2020         PCAP_DUMP_OPEN(3PCAP)

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
