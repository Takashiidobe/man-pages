.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dcb-ets(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `PARAMETERS <#PARAMETERS>`__ \|   |                                   |
| `EXAM                             |                                   |
| PLE & USAGE <#EXAMPLE_&_USAGE>`__ |                                   |
| \| `EXIT STATUS <#EXIT_STATUS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DCB-ETS(8)                        Linux                       DCB-ETS(8)

NAME
-------------------------------------------------

::

          dcb-ets - show / manipulate ETS (Enhanced Transmission Selection)
          settings of the DCB (Data Center Bridging) subsystem


---------------------------------------------------------

::

          dcb [ OPTIONS ] ets { COMMAND | help }

          dcb ets show dev DEV [ willing ] [ ets-cap ] [ cbs ] [ tc-tsa ] [
                  reco-tc-tsa ] [ pg-bw ] [ tc-bw ] [ reco-tc-bw ] [ prio-
                  tc ] [ reco-prio-tc ]

          dcb ets set dev DEV [ willing { on | off } ] [ { tc-tsa | reco-
                  tc-tsa } TSA-MAP ] [ { pg-bw | tc-bw | reco-tc-bw } BW-
                  MAP ] [ { prio-tc | reco-prio-tc } PRIO-MAP ]

          TSA-MAP := [ TSA-MAP ] TSA-MAPPING

          TSA-MAPPING := { TC | all }:{ strict | cbs | ets | vendor }

          BW-MAP := [ BW-MAP ] BW-MAPPING

          BW-MAPPING := { TC | all }:INTEGER

          PRIO-MAP := [ PRIO-MAP ] PRIO-MAPPING

          PRIO-MAPPING := { PRIO | all }:TC

          TC := { 0 .. 7 }

          PRIO := { 0 .. 7 }


---------------------------------------------------------------

::

          dcb ets is used to configure Enhanced Transmission Selection
          attributes through Linux DCB (Data Center Bridging) interface.
          ETS permits configuration of mapping of priorities to traffic
          classes, traffic selection algorithm to use per traffic class,
          bandwidth allocation, etc.

          Two DCB TLVs are related to the ETS feature: a configuration and
          recommendation values. Recommendation values are named with a
          prefix reco-, while the configuration ones have plain names.


-------------------------------------------------------------

::

          For read-write parameters, the following describes only the write
          direction, i.e. as used with the set command. For the show
          command, the parameter name is to be used as a simple keyword
          without further arguments. This instructs the tool to show the
          value of a given parameter. When no parameters are given, the
          tool shows the complete ETS configuration.

          ets-cap
                 A read-only property that shows the number of supported
                 ETS traffic classes.

          cbs    A read-only property that is enabled if the driver and the
                 hardware support the CBS Transmission Selection Algorithm.

          willing { on | off }
                 Whether local host should accept configuration from peer
                 TLVs.

          prio-tc PRIO-MAP
          reco-prio-tc PRIO-MAP
                 PRIO-MAP uses the array parameter syntax, see dcb(8) for
                 details. Keys are priorities, values are traffic classes.
                 For each priority sets a TC where traffic with that
                 priority is directed to.

          tc-tsa TSA-MAP
          reco-tc-tsa TSA-MAP
                 TSA-MAP uses the array parameter syntax, see dcb(8) for
                 details. Keys are TCs, values are Transmission Selection
                 Algorithm (TSA) keywords described below. For each TC sets
                 an algorithm used for deciding how traffic queued up at
                 this TC is scheduled for transmission. Supported TSAs are:

                 strict - for strict priority, where traffic in higher-
                 numbered TCs always takes precedence over traffic in
                 lower-numbered TCs.
                 ets - for Enhanced Traffic Selection, where available
                 bandwidth is distributed among the ETS-enabled TCs
                 according to the weights set by tc-bw and reco-tc-bw,
                 respectively.
                 cbs - for Credit Based Shaper, where traffic is scheduled
                 in a strict manner up to the limit set by a shaper.
                 vendor - for vendor-specific traffic selection algorithm.

          tc-bw BW-MAP
          reco-tc-bw BW-MAP
                 BW-MAP uses the array parameter syntax, see dcb(8) for
                 details. Keys are TCs, values are integers representing
                 percent of available bandwidth given to the traffic class
                 in question. The value should be 0 for TCs whose TSA is
                 not ets, and the sum of all values shall be 100. As an
                 exception to the standard wording, a configuration with no
                 ets TCs is permitted to sum up to 0 instead.

          pg-bw BW-MAP
                 The precise meaning of pg-bw is not standardized, but the
                 assumption seems to be that the same scheduling process as
                 on the transmit side is applicable on receive side as
                 well, and configures receive bandwidth allocation for ets
                 ingress traffic classes (priority groups).


-----------------------------------------------------------------------

::

          Configure ETS priomap in a one-to-one fashion:

          # dcb ets set dev eth0 prio-tc 0:0 1:1 2:2 3:3 4:4 5:5 6:6 7:7

          Set TSA and transmit bandwidth configuration:

          # dcb ets set dev eth0 tc-tsa all:strict 0:ets 1:ets 2:ets \
                                 tc-bw all:0 0:33 1:33 2:34

          Show what was set:

          # dcb ets show dev eth0 prio-tc tc-tsa tc-bw
          prio-tc 0:0 1:1 2:2 3:3 4:4 5:5 6:6 7:7
          tc-tsa 0:ets 1:ets 2:ets 3:strict 4:strict 5:strict 6:strict
          7:strict
          tc-bw 0:33 1:33 2:34 3:0 4:0 5:0 6:0 7:0


---------------------------------------------------------------

::

          Exit status is 0 if command was successful or a positive integer
          upon failure.


---------------------------------------------------------

::

          dcb(8)


---------------------------------------------------------------------

::

          Report any bugs to the Network Developers mailing list
          <netdev@vger.kernel.org> where the development and maintenance is
          primarily done.  You do not have to be subscribed to the list to
          send a message there.


-----------------------------------------------------

::

          Petr Machata <me@pmachata.org>

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

   iproute2                     19 October 2020                  DCB-ETS(8)

--------------

Pages that refer to this page: `dcb(8) <../man8/dcb.8.html>`__

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
