.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tc-etf(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `PARAMETERS <#PARAMETERS>`__ \|   |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ETF(8)                            Linux                           ETF(8)

NAME
-------------------------------------------------

::

          ETF - Earliest TxTime First (ETF) Qdisc


---------------------------------------------------------

::

          tc qdisc ... dev dev parent classid [ handle major: ] etf clockid
          clockid [ delta delta_nsecs ] [ deadline_mode ] [ offload ]


---------------------------------------------------------------

::

          The ETF (Earliest TxTime First) qdisc allows applications to
          control the instant when a packet should be dequeued from the
          traffic control layer into the netdevice. If offload is
          configured and supported by the network interface card, the it
          will also control when packets leave the network controller.

          ETF achieves that by buffering packets until a configurable time
          before their transmission time (i.e. txtime, or deadline), which
          can be configured through the delta option.

          The qdisc uses a rb-tree internally so packets are always
          'ordered' by their txtime and will be dequeued following the
          (next) earliest txtime first.

          It relies on the SO_TXTIME socket option and the SCM_TXTIME CMSG
          in each packet field to configure the behavior of time dependent
          sockets: the clockid to be used as a reference, if the expected
          mode of txtime for that socket is deadline or strict mode, and if
          packet drops should be reported on the socket's error queue. See
          socket(7) for more information.

          The etf qdisc will drop any packets with a txtime in the past, or
          if a packet expires while waiting for being dequeued.

          This queueing discipline is intended to be used by TSN (Time
          Sensitive Networking) applications, and it exposes a traffic
          shaping functionality that is commonly documented as "Launch
          Time" or "Time-Based Scheduling" by vendors and the documentation
          of network interface controllers.

          ETF is meant to be installed under another qdisc that maps packet
          flows to traffic classes, one example is mqprio(8).


-------------------------------------------------------------

::

          clockid
                 Specifies the clock to be used by qdisc's internal timer
                 for measuring time and scheduling events. The qdisc
                 expects that packets passing through it to be using this
                 same clockid as the reference of their txtime timestamps.
                 It will drop packets coming from sockets that do not
                 comply with that.

                 For more information about time and clocks on Linux,
                 please refer to time(7) and clock_gettime(3).

          delta
                 After enqueueing or dequeueing a packet, the qdisc will
                 schedule its next wake-up time for the next txtime minus
                 this delta value.  This means delta can be used as a fudge
                 factor for the scheduler latency of a system.  This value
                 must be specified in nanoseconds.  The default value is 0
                 nanoseconds.

          deadline_mode
                 When deadline_mode is set, the qdisc will handle txtime
                 with a different semantics, changed from a 'strict'
                 transmission time to a deadline.  In practice, this means
                 during the dequeue flow etf(8) will set the txtime of the
                 packet being dequeued to 'now'.  The default is for this
                 option to be disabled.

          offload
                 When offload is set, etf(8) will try to configure the
                 network interface so time-based transmission arbitration
                 is enabled in the controller. This feature is commonly
                 referred to as "Launch Time" or "Time-Based Scheduling" by
                 the documentation of network interface controllers.  The
                 default is for this option to be disabled.

          skip_sock_check
                 etf(8) currently drops any packet which does not have a
                 socket associated with it or if the socket does not have
                 SO_TXTIME socket option set. But, this will not work if
                 the launchtime is set by another entity inside the kernel
                 (e.g. some other Qdisc). Setting the skip_sock_check will
                 skip checking for a socket associated with the packet.


---------------------------------------------------------

::

          ETF is used to enforce a Quality of Service. It controls when
          each packets should be dequeued and transmitted, and can be used
          for limiting the data rate of a traffic class. To separate
          packets into traffic classes the user may choose mqprio(8), and
          configure it like this:

          # tc qdisc add dev eth0 handle 100: parent root mqprio num_tc 3 \
               map 2 2 1 0 2 2 2 2 2 2 2 2 2 2 2 2 \
               queues 1@0 1@1 2@2 \
               hw 0

          To replace the current queueing discipline by ETF in traffic
          class number 0, issue:

          # tc qdisc replace dev eth0 parent 100:1 etf \
               clockid CLOCK_TAI delta 300000 offload

          With the options above, etf will be configured to use CLOCK_TAI
          as its clockid_t, will schedule packets for 300 us before their
          txtime, and will enable the functionality on that in the network
          interface card. Deadline mode will not be configured for this
          mode.


-------------------------------------------------------

::

          Jesus Sanchez-Palencia <jesus.sanchez-palencia@intel.com>
          Vinicius Costa Gomes <vinicius.gomes@intel.com>

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

   iproute2                       05 Jul 2018                        ETF(8)

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
