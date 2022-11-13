.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tc-bfifo(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ALGORITHM <#ALGORITHM>`__ \|     |                                   |
| `PARAMETERS <#PARAMETERS>`__ \|   |                                   |
| `OUTPUT <#OUTPUT>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PBFIFO(8)                         Linux                        PBFIFO(8)

NAME
-------------------------------------------------

::

          pfifo - Packet limited First In, First Out queue

          bfifo - Byte limited First In, First Out queue


---------------------------------------------------------

::

          tc qdisc ... add pfifo [ limit packets ]

          tc qdisc ... add bfifo [ limit bytes ]


---------------------------------------------------------------

::

          The pfifo and bfifo qdiscs are unadorned First In, First Out
          queues. They are the simplest queues possible and therefore have
          no overhead.  pfifo constrains the queue size as measured in
          packets.  bfifo does so as measured in bytes.

          Like all non-default qdiscs, they maintain statistics. This might
          be a reason to prefer pfifo or bfifo over the default.


-----------------------------------------------------------

::

          A list of packets is maintained, when a packet is enqueued it
          gets inserted at the tail of a list. When a packet needs to be
          sent out to the network, it is taken from the head of the list.

          If the list is too long, no further packets are allowed on. This
          is called 'tail drop'.


-------------------------------------------------------------

::

          limit  Maximum queue size. Specified in bytes for bfifo, in
                 packets for pfifo. For pfifo, defaults to the interface
                 txqueuelen, as specified with ifconfig(8) or ip(8).  The
                 range for this parameter is [0, UINT32_MAX].

                 For bfifo, it defaults to the txqueuelen multiplied by the
                 interface MTU.  The range for this parameter is [0,
                 UINT32_MAX] bytes.

                 Note: The link layer header was considered when counting
                 packets length.


-----------------------------------------------------

::

          The output of tc -s qdisc ls contains the limit, either in
          packets or in bytes, and the number of bytes and packets actually
          sent. An unsent and dropped packet only appears between braces
          and is not counted as 'Sent'.

          In this example, the queue length is 100 packets, 45894 bytes
          were sent over 681 packets.  No packets were dropped, and as the
          pfifo queue does not slow down packets, there were also no
          overlimits:

          # tc -s qdisc ls dev eth0
          qdisc pfifo 8001: dev eth0 limit 100p
           Sent 45894 bytes 681 pkts (dropped 0, overlimits 0)

          If a backlog occurs, this is displayed as well.


---------------------------------------------------------

::

          tc(8)


-------------------------------------------------------

::

          Alexey N. Kuznetsov, <kuznet@ms2.inr.ac.ru>

          This manpage maintained by bert hubert <ahu@ds9a.nl>

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

   iproute2                     10 January 2002                   PBFIFO(8)

--------------

Pages that refer to this page: `tc(8) <../man8/tc.8.html>`__, 
`tc-cbq(8) <../man8/tc-cbq.8.html>`__, 
`tc-cbq-details(8) <../man8/tc-cbq-details.8.html>`__, 
`tc-htb(8) <../man8/tc-htb.8.html>`__, 
`tc-pfifo_fast(8) <../man8/tc-pfifo_fast.8.html>`__

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
