.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcap_open_live(3pcap) — Linux manual page
=========================================

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

   PCAP_OPEN_LIVE(3PCAP)                              PCAP_OPEN_LIVE(3PCAP)

NAME
-------------------------------------------------

::

          pcap_open_live - open a device for capturing


---------------------------------------------------------

::

          #include <pcap/pcap.h>

          char errbuf[PCAP_ERRBUF_SIZE];

          pcap_t *pcap_open_live(const char *device, int snaplen,
                  int promisc, int to_ms, char *errbuf);


---------------------------------------------------------------

::

          pcap_open_live() is used to obtain a packet capture handle to
          look at packets on the network.  device is a string that
          specifies the network device to open; on Linux systems with 2.2
          or later kernels, a device argument of "any" or NULL can be used
          to capture packets from all interfaces.

          snaplen specifies the snapshot length to be set on the handle.

          promisc specifies whether the interface is to be put into
          promiscuous mode.  If promisc is non-zero, promiscuous mode will
          be set, otherwise it will not be set.

          to_ms specifies the packet buffer timeout, as a non-negative
          value, in milliseconds.  (See pcap(3PCAP) for an explanation of
          the packet buffer timeout.)


-----------------------------------------------------------------

::

          pcap_open_live() returns a pcap_t * on success and NULL on
          failure.  If NULL is returned, errbuf is filled in with an
          appropriate error message.  errbuf may also be set to warning
          text when pcap_open_live() succeeds; to detect this case the
          caller should store a zero-length string in errbuf before calling
          pcap_open_live() and display the warning to the user if errbuf is
          no longer a zero-length string.  errbuf is assumed to be able to
          hold at least PCAP_ERRBUF_SIZE chars.


---------------------------------------------------------

::

          pcap_create(3PCAP), pcap_activate(3PCAP)

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

                                6 December 2017       PCAP_OPEN_LIVE(3PCAP)

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
