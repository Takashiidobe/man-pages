.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tc-codel(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ALGORITHM <#ALGORITHM>`__ \|     |                                   |
| `PARAMETERS <#PARAMETERS>`__ \|   |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `SOURCES <#SOURCES>`__ \|         |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CoDel(8)                          Linux                         CoDel(8)

NAME
-------------------------------------------------

::

          CoDel - Controlled-Delay Active Queue Management algorithm


---------------------------------------------------------

::

          tc qdisc ... codel [ limit PACKETS ] [ target TIME ] [ interval
          TIME ] [ ecn | noecn ] [ ce_threshold TIME ]


---------------------------------------------------------------

::

          CoDel (pronounced "coddle") is an adaptive "no-knobs" active
          queue management algorithm (AQM) scheme that was developed to
          address the shortcomings of RED and its variants. It was
          developed with the following goals in mind:
           o It should be parameterless.
           o It should keep delays low while permitting bursts of traffic.
           o It should control delay.
           o It should adapt dynamically to changing link rates with no
          impact on utilization.
           o It should be simple and efficient and should scale from simple
          to complex routers.


-----------------------------------------------------------

::

          CoDel comes with three major innovations. Instead of using queue
          size or queue average, it uses the local minimum queue as a
          measure of the standing/persistent queue.  Second, it uses a
          single state-tracking variable of the minimum delay to see where
          it is relative to the standing queue delay. Third, instead of
          measuring queue size in bytes or packets, it is measured in
          packet-sojourn time in the queue.

          CoDel measures the minimum local queue delay (i.e. standing queue
          delay) and compares it to the value of the given acceptable queue
          delay target.  As long as the minimum queue delay is less than
          target or the buffer contains fewer than MTU worth of bytes,
          packets are not dropped.  Codel enters a dropping mode when the
          minimum queue delay has exceeded target for a time greater than
          interval.  In this mode, packets are dropped at different drop
          times which is set by a control law. The control law ensures that
          the packet drops cause a linear change in the throughput. Once
          the minimum delay goes below target, packets are no longer
          dropped.

          Additional details can be found in the paper cited below.


-------------------------------------------------------------

::

      limit
          hard limit on the real queue size. When this limit is reached,
          incoming packets are dropped. If the value is lowered, packets
          are dropped so that the new limit is met. Default is 1000
          packets.

      target
          is the acceptable minimum standing/persistent queue delay. This
          minimum delay is identified by tracking the local minimum queue
          delay that packets experience.  Default and recommended value is
          5ms.

      interval
          is used to ensure that the measured minimum delay does not become
          too stale. The minimum delay must be experienced in the last
          epoch of length interval.  It should be set on the order of the
          worst-case RTT through the bottleneck to give endpoints
          sufficient time to react. Default value is 100ms.

      ecn | noecn
          can be used to mark packets instead of dropping them. If ecn has
          been enabled, noecn can be used to turn it off and vice-a-versa.
          By default, ecn is turned off.

      ce_threshold
          sets a threshold above which all packets are marked with ECN
          Congestion Experienced. This is useful for DCTCP-style congestion
          control algorithms that require marking at very shallow queueing
          thresholds.


---------------------------------------------------------

::

           # tc qdisc add dev eth0 root codel
           # tc -s qdisc show
             qdisc codel 801b: dev eth0 root refcnt 2 limit 1000p target
          5.0ms interval 100.0ms
              Sent 245801662 bytes 275853 pkt (dropped 0, overlimits 0
          requeues 24)
              backlog 0b 0p requeues 24
               count 0 lastcount 0 ldelay 2us drop_next 0us
               maxpacket 7306 ecn_mark 0 drop_overlimit 0

           # tc qdisc add dev eth0 root codel limit 100 target 4ms interval
          30ms ecn
           # tc -s qdisc show
             qdisc codel 801c: dev eth0 root refcnt 2 limit 100p target
          4.0ms interval 30.0ms ecn
              Sent 237573074 bytes 268561 pkt (dropped 0, overlimits 0
          requeues 5)
              backlog 0b 0p requeues 5
               count 0 lastcount 0 ldelay 76us drop_next 0us
               maxpacket 2962 ecn_mark 0 drop_overlimit 0


---------------------------------------------------------

::

          tc(8), tc-red(8)


-------------------------------------------------------

::

          o   Kathleen Nichols and Van Jacobson, "Controlling Queue Delay",
          ACM Queue, http://queue.acm.org/detail.cfm?id=2209336


-------------------------------------------------------

::

          CoDel was implemented by Eric Dumazet and David Taht. This
          manpage was written by Vijay Subramanian. Please reports
          corrections to the Linux Networking mailing list
          <netdev@vger.kernel.org>.

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

   iproute2                       23 May 2012                      CoDel(8)

--------------

Pages that refer to this page:
`ovs-vswitchd.conf.db(5) <../man5/ovs-vswitchd.conf.db.5.html>`__, 
`tc(8) <../man8/tc.8.html>`__, 
`tc-cake(8) <../man8/tc-cake.8.html>`__, 
`tc-fq_codel(8) <../man8/tc-fq_codel.8.html>`__, 
`tc-pie(8) <../man8/tc-pie.8.html>`__

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
