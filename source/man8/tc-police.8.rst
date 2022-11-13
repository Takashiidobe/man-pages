.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tc-police(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   Policing action in tc(8)          Linux         Policing action in tc(8)

NAME
-------------------------------------------------

::

          police - policing action


---------------------------------------------------------

::

          tc ... action police [ rate RATE burst BYTES[/BYTES] ] [
                  pkts_rate RATE pkts_burst PACKETS] [ mtu BYTES[/BYTES] ]
                  [ peakrate RATE ] [ overhead BYTES ] [ linklayer TYPE ] [
                  CONTROL ]

          tc ... filter ... [ estimator SAMPLE AVERAGE ] action police
                  avrate RATE [ CONTROL ]

          CONTROL := conform-exceed EXCEEDACT[/NOTEXCEEDACT

          EXCEEDACT/NOTEXCEEDACT := { pipe | ok | reclassify | drop |
                  continue | goto chain CHAIN_INDEX }


---------------------------------------------------------------

::

          The police action allows limiting of the byte or packet rate of
          traffic matched by the filter it is attached to.

          There are two different algorithms available to measure the byte
          rate: The first one uses an internal dual token bucket and is
          configured using the rate, burst, mtu, peakrate, overhead and
          linklayer parameters. The second one uses an in-kernel sampling
          mechanism. It can be fine-tuned using the estimator filter
          parameter.

          There is one algorithm available to measure packet rate and it is
          similar to the first algorithm described for byte rate. It is
          configured using the pkt_rate and pkt_burst parameters.

          At least one of the rate and pkt_rate parameters must be
          configured.


-------------------------------------------------------

::

          rate RATE
                 The maximum byte rate of packets passing this action.
                 Those exceeding it will be treated as defined by the
                 conform-exceed option.

          burst BYTES[/BYTES]
                 Set the maximum allowed burst in bytes, optionally
                 followed by a slash ('/') sign and cell size which must be
                 a power of 2.

          pkt_rate RATE
                 The maximum packet rate or packets passing this action.
                 Those exceeding it will be treated as defined by the
                 conform-exceed option.

          pkt_burst PACKETS
                 Set the maximum allowed burst in packets.

          mtu BYTES[/BYTES]
                 This is the maximum packet size handled by the policer
                 (larger ones will be handled like they exceeded the
                 configured rate). Setting this value correctly will
                 improve the scheduler's precision.  Value formatting is
                 identical to burst above. Defaults to unlimited.

          peakrate RATE
                 Set the maximum bucket depletion rate, exceeding rate.

          avrate RATE
                 Make use of an in-kernel bandwidth rate estimator and
                 match the given RATE against it.

          overhead BYTES
                 Account for protocol overhead of encapsulating output
                 devices when computing rate and peakrate.

          linklayer TYPE
                 Specify the link layer type.  TYPE may be one of ethernet
                 (the default), atm or adsl (which are synonyms). It is
                 used to align the precomputed rate tables to ATM cell
                 sizes, for ethernet no action is taken.

          estimator SAMPLE AVERAGE
                 Fine-tune the in-kernel packet rate estimator.  SAMPLE and
                 AVERAGE are time values and control the frequency in which
                 samples are taken and over what timespan an average is
                 built.

          conform-exceed EXCEEDACT[/NOTEXCEEDACT]
                 Define how to handle packets which exceed or conform the
                 configured bandwidth limit. Possible values are:

                 continue
                        Don't do anything, just continue with the next
                        action in line.

                 drop   Drop the packet immediately.

                 shot   This is a synonym to drop.

                 ok     Accept the packet. This is the default for
                        conforming packets.

                 pass   This is a synonym to ok.

                 reclassify
                        Treat the packet as non-matching to the filter this
                        action is attached to and continue with the next
                        filter in line (if any). This is the default for
                        exceeding packets.

                 pipe   Pass the packet to the next action in line.


---------------------------------------------------------

::

          A typical application of the police action is to enforce ingress
          traffic rate by dropping exceeding packets. Although better done
          on the sender's side, especially in scenarios with lack of peer
          control (e.g. with dial-up providers) this is often the best one
          can do in order to keep latencies low under high load. The
          following establishes input bandwidth policing to 1mbit/s using
          the ingress qdisc and u32 filter:

                 # tc qdisc add dev eth0 handle ffff: ingress
                 # tc filter add dev eth0 parent ffff: u32 \
                      match u32 0 0 \
                      police rate 1mbit burst 100k

          As an action can not live on it's own, there always has to be a
          filter involved as link between qdisc and action. The example
          above uses u32 for that, which is configured to effectively match
          any packet (passing it to the police action thereby).


---------------------------------------------------------

::

          tc(8)

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

   iproute2                       20 Jan 2015      Policing action in tc(8)

--------------

Pages that refer to this page:
`tc-actions(8) <../man8/tc-actions.8.html>`__

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
