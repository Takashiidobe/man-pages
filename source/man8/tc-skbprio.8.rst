.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tc-skbprio(8) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ALGORITHM <#ALGORITHM>`__ \|     |                                   |
| `PARAMETERS <#PARAMETERS>`__ \|   |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SKBPRIO(8)                        Linux                       SKBPRIO(8)

NAME
-------------------------------------------------

::

          skbprio - SKB Priority Queue


---------------------------------------------------------

::

          tc qdisc ... add skbprio [ limit packets ]


---------------------------------------------------------------

::

          SKB Priority Queue is a queueing discipline intended to
          prioritize the most important packets during a denial-of-service
          ( DoS ) attack. The priority of a packet is given by
          skb->priority , where a higher value places the packet closer to
          the exit of the queue. When the queue is full, the lowest
          priority packet in the queue is dropped to make room for the
          packet to be added if it has higher priority. If the packet to be
          added has lower priority than all packets in the queue, it is
          dropped.

          Without SKB priority queue, queue length limits must be imposed
          on individual sub-queues, and there is no straightforward way to
          enforce a global queue length limit across all priorities.
          SKBprio queue enforces a global queue length limit while not
          restricting the lengths of individual sub-queues.

          While SKB Priority Queue is agnostic to how skb->priority is
          assigned. A typical use case is to copy the 6-bit DS field of
          IPv4 and IPv6 packets using tc-skbedit(8).  If skb->priority is
          greater or equal to 64, the priority is assumed to be 63.
          Priorities less than 64 are taken at face value.

          SKB Priority Queue enables routers to locally decide which
          packets to drop under a DoS attack.  Priorities should be
          assigned to packets such that the higher the priority, the more
          expected behavior a source shows.  So sources have an incentive
          to play by the rules.


-----------------------------------------------------------

::

          Skbprio maintains 64 lists (priorities go from 0 to 63).  When a
          packet is enqueued, it gets inserted at the tail of its priority
          list. When a packet needs to be sent out to the network, it is
          taken from the head of the highest priority list. When the queue
          is full, the packet at the tail of the lowest priority list is
          dropped to serve the ingress packet - if it is of higher
          priority, otherwise the ingress packet is dropped. This algorithm
          allocates as much bandwidth as possible to high priority packets,
          while only servicing low priority packets when there is enough
          bandwidth.


-------------------------------------------------------------

::

          limit  Maximum queue size specified in packets. It defaults to
                 64.  The range for this parameter is [0, UINT32_MAX].


---------------------------------------------------------

::

          tc-prio(8), tc-skbedit(8)


-------------------------------------------------------

::

          Nishanth Devarajan <devarajn@uci.edu>, Michel Machado
          <michel@digirati.com.br>

          This manpage maintained by Bert Hubert <ahu@ds9a.nl>

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

   iproute2                     13 August 2018                   SKBPRIO(8)

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
