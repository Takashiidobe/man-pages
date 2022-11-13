.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcap_fileno(3pcap) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCAP_FILENO(3PCAP)                                    PCAP_FILENO(3PCAP)

NAME
-------------------------------------------------

::

          pcap_fileno - get the file descriptor for a live capture


---------------------------------------------------------

::

          #include <pcap/pcap.h>

          int pcap_fileno(pcap_t *p);


---------------------------------------------------------------

::

          If p refers to a network device that was opened for a live
          capture using a combination of pcap_create(3PCAP) and
          pcap_activate(3PCAP), or using pcap_open_live(3PCAP),
          pcap_fileno() returns the file descriptor from which captured
          packets are read.

          If p refers to a ``savefile'' that was opened using functions
          such as pcap_open_offline(3PCAP) or pcap_fopen_offline(3PCAP), a
          ``dead'' pcap_t opened using pcap_open_dead(3PCAP), or a pcap_t
          that was created with pcap_create() but that has not yet been
          activated with pcap_activate(), it returns PCAP_ERROR.


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

                                 25 July 2018            PCAP_FILENO(3PCAP)

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
