.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tc-gate(8) — Linux manual page
==============================

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

   GATE(8)                           Linux                          GATE(8)

NAME
-------------------------------------------------

::

          gate - Stream Gate Action


---------------------------------------------------------

::

          tc  ...  action gate
                  [ base-time BASETIME ] [ clockid CLOCKID ]
                  sched-entry <gate state> <interval 1> [ <internal
          priority> <max octets> ]
                  sched-entry <gate state> <interval 2> [ <internal
          priority> <max octets> ]
                  sched-entry <gate state> <interval 3> [ <internal
          priority> <max octets> ]
                  ......
                  sched-entry <gate state> <interval N> [ <internal
          priority> <max octets> ]


---------------------------------------------------------------

::

          GATE action allows specified ingress frames can be passed at
          specific time slot, or be dropped at specific time slot. Tc
          filter filters the ingress frames, then tc gate action would
          specify which time slot and how many bytes these frames can be
          passed to device and which time slot frames would be dropped.
          Gate action also assign a base-time to tell when the entry list
          start.  Then gate action would start to repeat the gate entry
          list cyclically at the start base-time.  For the software
          simulation, gate action requires the user assign reference time
          clock type.


-------------------------------------------------------------

::

          base-time
                 Specifies the instant in nanoseconds, defining the time
                 when the schedule starts. If 'base-time' is a time in the
                 past, the schedule will start at

                 base-time + (N * cycle-time)

                 where N is the smallest integer so the resulting time is
                 greater than "now", and "cycle-time" is the sum of all the
                 intervals of the entries in the schedule. Without base-
                 time specified, will default to be 0.

          clockid
                 Specifies the clock to be used by qdisc's internal timer
                 for measuring time and scheduling events. Not valid if
                 gate action is used for offloading filter.  For example,
                 tc filter command with skip_sw parameter.

          sched-entry
                 There may multiple sched-entry parameters in a single
                 schedule. Each one has the format:

                 sched-entry <gate state> <interval> [ <internal priority>
                 <max octets> ]

                 <gate state> means gate states. 'open' keep gate open,
                 'close' keep gate close.
                 <interval> means how much nano seconds for this time slot.
                 <internal priority> means internal priority value. Present
                 of the internal receiving queue for this stream. "-1"
                 means wildcard.  <internal priority> and <max octets> can
                 be omit default to be "-1" which both
                  value to be "-1" for this <sched-entry>.
                 <max octets> means how many octets size could pass in this
                 time slot. Dropped if overlimited. "-1" means wildcard.
                 <max octets> can be omit default to be "-1" which value to
                 be "-1" for this <sched-entry>.
                 Note that <internal priority> and <max octets> are nothing
                 meaning for gate state is "close" in a "sched-entry". All
                 frames are dropped when "sched-entry" with "close" state.


---------------------------------------------------------

::

          The following example shows tc filter frames source ip match to
          the 192.168.0.20 will keep the gate open for 200ms and limit the
          traffic to 8MB in this sched-entry. Then keep the traffic gate to
          be close for 100ms.  Frames arrived at gate close state would be
          dropped. Then the cycle would run the gate entries periodically.
          The schedule will start at instant 200.0s using the reference
          CLOCK_TAI. The schedule is composed of two entries each of 300ms
          duration.

          # tc qdisc add dev eth0 ingress
          # tc filter add dev eth0 parent ffff: protocol ip \
                     flower skip_hw src_ip 192.168.0.20 \
                     action gate index 2 clockid CLOCK_TAI \
                     base-time 200000000000ns \
                     sched-entry open 200000000ns -1 8000000b \
                     sched-entry close 100000000ns

          Following commands is an example to filter a stream source mac
          match to the 10:00:80:00:00:00 icmp frames will be dropped at any
          time with cycle 200ms.  With a default basetime 0 and clockid is
          CLOCK_TAI as default.

          # tc qdisc add dev eth0 ingress
          # tc filter add dev eth0 parent ffff:  protocol ip \
               flower ip_proto icmp dst_mac 10:00:80:00:00:00 \
               action gate index 12 sched-entry close 200000000ns


-------------------------------------------------------

::

          Po Liu <Po.Liu@nxp.com>

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

   iproute2                       12 Mar 2020                       GATE(8)

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
