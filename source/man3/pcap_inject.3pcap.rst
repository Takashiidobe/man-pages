.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcap_inject(3pcap) — Linux manual page
======================================

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

   PCAP_INJECT(3PCAP)                                    PCAP_INJECT(3PCAP)

NAME
-------------------------------------------------

::

          pcap_inject, pcap_sendpacket - transmit a packet


---------------------------------------------------------

::

          #include <pcap/pcap.h>

          int pcap_inject(pcap_t *p, const void *buf, size_t size);
          int pcap_sendpacket(pcap_t *p, const u_char *buf, int size);


---------------------------------------------------------------

::

          pcap_inject() sends a raw packet through the network interface;
          buf points to the data of the packet, including the link-layer
          header, and size is the number of bytes in the packet.

          Note that, even if you successfully open the network interface,
          you might not have permission to send packets on it, or it might
          not support sending packets; as pcap_open_live(3PCAP) doesn't
          have a flag to indicate whether to open for capturing, sending,
          or capturing and sending, you cannot request an open that
          supports sending and be notified at open time whether sending
          will be possible.  Note also that some devices might not support
          sending packets.

          Note that, on some platforms, the link-layer header of the packet
          that's sent might not be the same as the link-layer header of the
          packet supplied to pcap_inject(), as the source link-layer
          address, if the header contains such an address, might be changed
          to be the address assigned to the interface on which the packet
          it sent, if the platform doesn't support sending completely raw
          and unchanged packets.  Even worse, some drivers on some
          platforms might change the link-layer type field to whatever
          value libpcap used when attaching to the device, even on
          platforms that do nominally support sending completely raw and
          unchanged packets.

          pcap_sendpacket() is like pcap_inject(), but it returns 0 on
          success, rather than returning the number of bytes written.
          (pcap_inject() comes from OpenBSD; pcap_sendpacket() comes from
          WinPcap/Npcap.  Both are provided for compatibility.)


-----------------------------------------------------------------

::

          pcap_inject() returns the number of bytes written on success and
          PCAP_ERROR on failure.

          pcap_sendpacket() returns 0 on success and PCAP_ERROR on failure.

          If PCAP_ERROR is returned, pcap_geterr(3PCAP) or
          pcap_perror(3PCAP) may be called with p as an argument to fetch
          or display the error text.


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

                                 25 July 2018            PCAP_INJECT(3PCAP)

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
