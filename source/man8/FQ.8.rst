.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tc-fq(8) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `PARAMETERS <#PARAMETERS>`__ \|   |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FQ(8)                             Linux                            FQ(8)

NAME
-------------------------------------------------

::

          FQ - Fair Queue traffic policing


---------------------------------------------------------

::

          tc qdisc ... fq [ limit PACKETS ] [ flow_limit PACKETS ] [
          quantum BYTES ] [ initial_quantum BYTES ] [ maxrate RATE ] [
          buckets NUMBER ] [ orphan_mask NUMBER ] [ pacing | nopacing ] [
          ce_threshold TIME ]


---------------------------------------------------------------

::

          FQ (Fair Queue) is a classless packet scheduler meant to be
          mostly used for locally generated traffic.  It is designed to
          achieve per flow pacing.  FQ does flow separation, and is able to
          respect pacing requirements set by TCP stack.  All packets
          belonging to a socket are considered as a 'flow'.  For non local
          packets (router workload), packet hash is used as fallback.

          An application can specify a maximum pacing rate using the
          SO_MAX_PACING_RATE setsockopt call.  This packet scheduler adds
          delay between packets to respect rate limitation set on each
          socket. Note that after linux-4.20, linux adopted EDT (Earliest
          Departure Time) and TCP directly sets the appropriate Departure
          Time for each skb.

          Dequeueing happens in a round-robin fashion.  A special FIFO
          queue is reserved for high priority packets ( TC_PRIO_CONTROL
          priority), such packets are always dequeued first.

          FQ is non-work-conserving.

          TCP pacing is good for flows having idle times, as the congestion
          window permits TCP stack to queue a possibly large number of
          packets.  This removes the 'slow start after idle' choice, badly
          hitting large BDP flows and applications delivering chunks of
          data such as video streams.


-------------------------------------------------------------

::

      limit
          Hard limit on the real queue size. When this limit is reached,
          new packets are dropped. If the value is lowered, packets are
          dropped so that the new limit is met. Default is 10000 packets.

      flow_limit
          Hard limit on the maximum number of packets queued per flow.
          Default value is 100.

      quantum
          The credit per dequeue RR round, i.e. the amount of bytes a flow
          is allowed to dequeue at once. A larger value means a longer time
          period before the next flow will be served.  Default is 2 *
          interface MTU bytes.

      initial_quantum
          The initial sending rate credit, i.e. the amount of bytes a new
          flow is allowed to dequeue initially.  This is specifically meant
          to allow using IW10 without added delay.  Default is 10 *
          interface MTU, i.e. 15140 for 'standard' ethernet.

      maxrate
          Maximum sending rate of a flow.  Default is unlimited.
          Application specific setting via SO_MAX_PACING_RATE is ignored
          only if it is larger than this value.

      buckets
          The size of the hash table used for flow lookups. Each bucket is
          assigned a red-black tree for efficient collision sorting.
          Default: 1024.

      orphan_mask
          For packets not owned by a socket, fq is able to mask a part of
          skb->hash and reduce number of buckets associated with the
          traffic. This is a DDOS prevention mechanism, and the default is
          1023 (meaning no more than 1024 flows are allocated for these
          packets)

      [no]pacing
          Enable or disable flow pacing. Default is enabled.

      ce_threshold
          sets a threshold above which all packets are marked with ECN
          Congestion Experienced. This is useful for DCTCP-style congestion
          control algorithms that require marking at very shallow queueing
          thresholds.


---------------------------------------------------------

::

          #tc qdisc add dev eth0 root fq ce_threshold 4ms
          #tc -s -d qdisc show dev eth0
          qdisc fq 8001: dev eth0 root refcnt 2 limit 10000p flow_limit
          100p buckets 1024 orphan_mask 1023 quantum 3028b initial_quantum
          15140b low_rate_threshold 550Kbit refill_delay 40.0ms
          ce_threshold 4.0ms
           Sent 72149092 bytes 48062 pkt (dropped 2176, overlimits 0
          requeues 0)
           backlog 1937920b 1280p requeues 0
            flows 34 (inactive 17 throttled 0)
            gc 0 highprio 0 throttled 0 ce_mark 47622 flows_plimit 2176


---------------------------------------------------------

::

          tc(8), socket(7)


-------------------------------------------------------

::

          FQ was written by Eric Dumazet.

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

   iproute2                      10 Sept 2015                         FQ(8)

--------------

Pages that refer to this page: `tc(8) <../man8/tc.8.html>`__

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
