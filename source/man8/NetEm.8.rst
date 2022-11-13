.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tc-netem(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| netem OPTIONS <#netem_OPTIONS>`__ |                                   |
| \| `LIMITATIONS <#LIMITATIONS>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SOURCES <#SOURCES>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NETEM(8)                          Linux                         NETEM(8)

NAME
-------------------------------------------------

::

          NetEm - Network Emulator


---------------------------------------------------------

::

          tc qdisc ... dev DEVICE ] add netem OPTIONS

          OPTIONS := [ LIMIT ] [ DELAY ] [ LOSS ] [ CORRUPT ] [ DUPLICATION
          ] [ REORDERING ] [ RATE ] [ SLOT ]

          LIMIT := limit packets

          DELAY := delay TIME [ JITTER [ CORRELATION ]]]
                 [ distribution { uniform | normal | pareto |  paretonormal
          } ]

          LOSS := loss { random PERCENT [ CORRELATION ]  |
                         state p13 [ p31 [ p32 [ p23 [ p14]]]] |
                         gemodel p [ r [ 1-h [ 1-k ]]] }  [ ecn ]

          CORRUPT := corrupt PERCENT [ CORRELATION ]]

          DUPLICATION := duplicate PERCENT [ CORRELATION ]]

          REORDERING := reorder PERCENT [ CORRELATION ] [ gap DISTANCE ]

          RATE := rate RATE [ PACKETOVERHEAD [ CELLSIZE [ CELLOVERHEAD ]]]]

          SLOT := slot { MIN_DELAY [ MAX_DELAY ] |
                         distribution { uniform | normal | pareto |
          paretonormal | FILE } DELAY JITTER }
                       [ packets PACKETS ] [ bytes BYTES ]


---------------------------------------------------------------

::

          NetEm is an enhancement of the Linux traffic control facilities
          that allow to add delay, packet loss, duplication and more other
          characteristics to packets outgoing from a selected network
          interface. NetEm is built using the existing Quality Of Service
          (QOS) and Differentiated Services (diffserv) facilities in the
          Linux kernel.


-------------------------------------------------------------------

::

          netem has the following options:

      limit packets
          maximum number of packets the qdisc may hold queued at a time.

      delay
          adds the chosen delay to the packets outgoing to chosen network
          interface. The optional parameters allows to introduce a delay
          variation and a correlation.  Delay and jitter values are
          expressed in ms while correlation is percentage.

      distribution
          allow the user to choose the delay distribution. If not
          specified, the default distribution is Normal. Additional
          parameters allow to consider situations in which network has
          variable delays depending on traffic flows concurring on the same
          path, that causes several delay peaks and a tail.

      loss random
          adds an independent loss probability to the packets outgoing from
          the chosen network interface. It is also possible to add a
          correlation, but this option is now deprecated due to the noticed
          bad behavior.

      loss state
          adds packet losses according to the 4-state Markov using the
          transition probabilities as input parameters. The parameter p13
          is mandatory and if used alone corresponds to the Bernoulli
          model. The optional parameters allows to extend the model to
          2-state (p31), 3-state (p23 and p32) and 4-state (p14).  State 1
          corresponds to good reception, State 4 to independent losses,
          State 3 to burst losses and State 2 to good reception within a
          burst.

      loss gemodel
          adds packet losses according to the Gilbert-Elliot loss model or
          its special cases (Gilbert, Simple Gilbert and Bernoulli). To use
          the Bernoulli model, the only needed parameter is p while the
          others will be set to the default values r=1-p, 1-h=1 and 1-k=0.
          The parameters needed for the Simple Gilbert model are two (p and
          r), while three parameters (p, r, 1-h) are needed for the Gilbert
          model and four (p, r, 1-h and 1-k) are needed for the Gilbert-
          Elliot model. As known, p and r are the transition probabilities
          between the bad and the good states, 1-h is the loss probability
          in the bad state and 1-k is the loss probability in the good
          state.

      ecn
          can be used optionally to mark packets instead of dropping them.
          A loss model has to be used for this to be enabled.

      corrupt
          allows the emulation of random noise introducing an error in a
          random position for a chosen percent of packets. It is also
          possible to add a correlation through the proper parameter.

      duplicate
          using this option the chosen percent of packets is duplicated
          before queuing them. It is also possible to add a correlation
          through the proper parameter.

      reorder
          to use reordering, a delay option must be specified. There are
          two ways to use this option (assuming 'delay 10ms' in the options
          list).

          reorder 25% 50% gap 5
          in this first example, the first 4 (gap - 1) packets are delayed
          by 10ms and subsequent packets are sent immediately with a
          probability of 0.25 (with correlation of 50% ) or delayed with a
          probability of 0.75. After a packet is reordered, the process
          restarts i.e. the next 4 packets are delayed and subsequent
          packets are sent immediately or delayed based on reordering
          probability. To cause a repeatable pattern where every 5th packet
          is reordered reliably, a reorder probability of 100% can be used.

          reorder 25% 50%
          in this second example 25% of packets are sent immediately (with
          correlation of 50%) while the others are delayed by 10 ms.

      rate
          delay packets based on packet size and is a replacement for TBF.
          Rate can be specified in common units (e.g. 100kbit). Optional
          PACKETOVERHEAD (in bytes) specify an per packet overhead and can
          be negative. A positive value can be used to simulate additional
          link layer headers. A negative value can be used to artificial
          strip the Ethernet header (e.g. -14) and/or simulate a link layer
          header compression scheme. The third parameter - an unsigned
          value - specify the cellsize. Cellsize can be used to simulate
          link layer schemes. ATM for example has an payload cellsize of 48
          bytes and 5 byte per cell header. If a packet is 50 byte then ATM
          must use two cells: 2 * 48 bytes payload including 2 * 5 byte
          header, thus consume 106 byte on the wire. The last optional
          value CELLOVERHEAD can be used to specify per cell overhead - for
          our ATM example 5.  CELLOVERHEAD can be negative, but use
          negative values with caution.

          Note that rate throttling is limited by several factors: the
          kernel clock granularity avoid a perfect shaping at a specific
          level. This will show up in an artificial packet compression
          (bursts). Another influence factor are network adapter buffers
          which can also add artificial delay.

      slot
          defer delivering accumulated packets to within a slot. Each
          available slot can be configured with a minimum delay to acquire,
          and an optional maximum delay.  Alternatively it can be
          configured with the distribution similar to distribution for
          delay option. Slot delays can be specified in nanoseconds,
          microseconds, milliseconds or seconds (e.g. 800us). Values for
          the optional parameters BYTES will limit the number of bytes
          delivered per slot, and/or PACKETS will limit the number of
          packets delivered per slot.

          These slot options can provide a crude approximation of bursty
          MACs such as DOCSIS, WiFi, and LTE.

          Note that slotting is limited by several factors: the kernel
          clock granularity, as with a rate, and attempts to deliver many
          packets within a slot will be smeared by the timer resolution,
          and by the underlying native bandwidth also.

          It is possible to combine slotting with a rate, in which case
          complex behaviors where either the rate, or the slot limits on
          bytes or packets per slot, govern the actual delivered rate.


---------------------------------------------------------------

::

          The main known limitation of Netem are related to timer
          granularity, since Linux is not a real-time operating system.


---------------------------------------------------------

::

          tc qdisc add dev eth0 root netem rate 5kbit 20 100 5
              delay all outgoing packets on device eth0 with a rate of
              5kbit, a per packet overhead of 20 byte, a cellsize of 100
              byte and a per celloverhead of 5 byte:


-------------------------------------------------------

::

           1. Hemminger S. , "Network Emulation with NetEm", Open Source
              Development Lab, April 2005 (http://devresources.linux-
              foundation.org/shemminger/netem/LCA2005_paper.pdf)

           2. Netem page from Linux foundation,
              (https://wiki.linuxfoundation.org/networking/netem)

           3. Salsano S., Ludovici F., Ordine A., "Definition of a general
              and intuitive loss model for packet networks and its
              implementation in the Netem module in the Linux kernel",
              available at http://netgroup.uniroma2.it/NetemCLG


---------------------------------------------------------

::

          tc(8), tc-tbf(8)


-----------------------------------------------------

::

          Netem was written by Stephen Hemminger at Linux foundation and is
          based on NISTnet.  This manpage was created by Fabio Ludovici
          <fabio.ludovici at yahoo dot it> and Hagen Paul Pfeifer
          <hagen@jauu.net>

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

   iproute2                    25 November 2011                    NETEM(8)

--------------

Pages that refer to this page:
`ovs-vswitchd.conf.db(5) <../man5/ovs-vswitchd.conf.db.5.html>`__

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
