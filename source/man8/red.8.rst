.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tc-red(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ALGORITHM <#ALGORITHM>`__ \|     |                                   |
| `PARAMETERS <#PARAMETERS>`__ \|   |                                   |
| `QEVENTS <#QEVENTS>`__ \|         |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `SOURCES <#SOURCES>`__ \|         |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RED(8)                            Linux                           RED(8)

NAME
-------------------------------------------------

::

          red - Random Early Detection


---------------------------------------------------------

::

          tc qdisc ... red limit bytes [ min bytes ] [ max bytes ] avpkt
          bytes [ burst packets ] [ ecn ] [ harddrop ] [ nodrop ] [
          bandwidth rate ] [ probability chance ] [ adaptive ] [ qevent
          early_drop block index ] [ qevent mark block index ]


---------------------------------------------------------------

::

          Random Early Detection is a classless qdisc which manages its
          queue size smartly. Regular queues simply drop packets from the
          tail when they are full, which may not be the optimal behaviour.
          RED also performs tail drop, but does so in a more gradual way.

          Once the queue hits a certain average length, packets enqueued
          have a configurable chance of being marked (which may mean
          dropped). This chance increases linearly up to a point called the
          max average queue length, although the queue might get bigger.

          This has a host of benefits over simple taildrop, while not being
          processor intensive. It prevents synchronous retransmits after a
          burst in traffic, which cause further retransmits, etc.

          The goal is to have a small queue size, which is good for
          interactivity while not disturbing TCP/IP traffic with too many
          sudden drops after a burst of traffic.

          Depending on if ECN is configured, marking either means dropping
          or purely marking a packet as overlimit.


-----------------------------------------------------------

::

          The average queue size is used for determining the marking
          probability. This is calculated using an Exponential Weighted
          Moving Average, which can be more or less sensitive to bursts.

          When the average queue size is below min bytes, no packet will
          ever be marked. When it exceeds min, the probability of doing so
          climbs linearly up to probability, until the average queue size
          hits max bytes. Because probability is normally not set to 100%,
          the queue size might conceivably rise above max bytes, so the
          limit parameter is provided to set a hard maximum for the size of
          the queue.


-------------------------------------------------------------

::

          min    Average queue size at which marking becomes a possibility.
                 Defaults to max /3

          max    At this average queue size, the marking probability is
                 maximal. Should be at least twice min to prevent
                 synchronous retransmits, higher for low min.  Default to
                 limit /4

          probability
                 Maximum probability for marking, specified as a floating
                 point number from 0.0 to 1.0. Suggested values are 0.01 or
                 0.02 (1 or 2%, respectively). Default : 0.02

          limit  Hard limit on the real (not average) queue size in bytes.
                 Further packets are dropped. Should be set higher than
                 max+burst. It is advised to set this a few times higher
                 than max.

          burst  Used for determining how fast the average queue size is
                 influenced by the real queue size. Larger values make the
                 calculation more sluggish, allowing longer bursts of
                 traffic before marking starts. Real life experiments
                 support the following guideline: (min+min+max)/(3*avpkt).

          avpkt  Specified in bytes. Used with burst to determine the time
                 constant for average queue size calculations. 1000 is a
                 good value.

          bandwidth
                 This rate is used for calculating the average queue size
                 after some idle time. Should be set to the bandwidth of
                 your interface. Does not mean that RED will shape for you!
                 Optional. Default : 10Mbit

          ecn    As mentioned before, RED can either 'mark' or 'drop'.
                 Explicit Congestion Notification allows RED to notify
                 remote hosts that their rate exceeds the amount of
                 bandwidth available. Non-ECN capable hosts can only be
                 notified by dropping a packet. If this parameter is
                 specified, packets which indicate that their hosts honor
                 ECN will only be marked and not dropped, unless the queue
                 size hits limit bytes. Recommended.

          harddrop
                 If average flow queue size is above max bytes, this
                 parameter forces a drop instead of ecn marking.

          nodrop With this parameter, traffic that should be marked, but is
                 not ECN-capable, is enqueued. Without the parameter it is
                 early-dropped.

          adaptive
                 (Added in linux-3.3) Sets RED in adaptive mode as
                 described in http://icir.org/floyd/papers/adaptiveRed.pdf
                 Goal of Adaptive RED is to make 'probability' dynamic value between 1% and 50% to reach the target average queue :
                 (max - min) / 2


-------------------------------------------------------

::

          See tc (8) for some general notes about qevents. The RED qdisc
          supports the following qevents:

          early_drop
                 The associated block is executed when packets are early-
                 dropped. This includes non-ECT packets in ECN mode.

          mark   The associated block is executed when packets are marked
                 in ECN mode.


-------------------------------------------------------

::

          # tc qdisc add dev eth0 parent 1:1 handle 10: red
           limit 400000 min 30000 max 90000 avpkt 1000
           burst 55 ecn adaptive bandwidth 10Mbit


---------------------------------------------------------

::

          tc(8), tc-choke(8)


-------------------------------------------------------

::

          o      Floyd, S., and Jacobson, V., Random Early Detection
                 gateways for Congestion Avoidance.
                 http://www.aciri.org/floyd/papers/red/red.html

          o      Some changes to the algorithm by Alexey N. Kuznetsov.

          o      Adaptive RED  :
                 http://icir.org/floyd/papers/adaptiveRed.pdf


-------------------------------------------------------

::

          Alexey N. Kuznetsov, <kuznet@ms2.inr.ac.ru>,  Alexey Makarenko
          <makar@phoenix.kharkov.ua>, J Hadi Salim
          <hadi@nortelnetworks.com>, Eric Dumazet <eric.dumazet@gmail.com>.
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

   iproute2                    13 December 2001                      RED(8)

--------------

Pages that refer to this page: `tc(8) <../man8/tc.8.html>`__, 
`tc-choke(8) <../man8/tc-choke.8.html>`__, 
`tc-codel(8) <../man8/tc-codel.8.html>`__, 
`tc-fq_codel(8) <../man8/tc-fq_codel.8.html>`__, 
`tc-pie(8) <../man8/tc-pie.8.html>`__, 
`tc-sfb(8) <../man8/tc-sfb.8.html>`__, 
`tc-sfq(8) <../man8/tc-sfq.8.html>`__

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
