.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ovs-dpctl-top(8) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ovs-dpctl-top(8)           Open vSwitch Manual          ovs-dpctl-top(8)

NAME
-------------------------------------------------

::

          ovs-dpctl-top - Top like behavior for ovs-dpctl dump-flows


---------------------------------------------------------

::

          ovs-dpctl-top [-h] [-v] [-f FLOWFILES] [-V] [-s] [--host HOST]
          [-a | --accumulate] [--accumulate-decay ACCUMULATEDECAY] [-d
          DELAY]


---------------------------------------------------------------

::

          This program summarizes ovs-dpctl flow content by aggregating the
          number of packets, total bytes and occurrence of the following
          fields:

                 - Datapath in_port

                 - Ethernet type

                 - Source and destination MAC addresses

                 - IP protocol

                 - Source and destination IPv4 addresses

                 - Source and destination IPv6 addresses

                 - UDP and TCP destination port

                 - Tunnel source and destination addresses

      Output shows four values:
                 - FIELDS: the flow fields for example in_port(1).

                 - COUNT: the number of lines in the dump-flow output
                 contain the flow field.

                 - PACKETS: the total number of packets containing the flow
                 field.

                 - BYTES: the total number of bytes containing the flow
                 field.  If units are not present then values are in bytes.

                 - AVERAGE: the average packets size (BYTES/PACKET).

      Top Behavior
          While in top mode, the default behavior, the following single
          character commands are supported:

                 a - toggles top in accumulate and live mode.  Accumulate
                 mode is described below.

                 s - toggles which column is used to sort content in
                 decreasing order.  A DESC title is placed over the column.

                 _ - a space indicating to collect dump-flow content again

                 h - halt output.  Any character will restart sampling

                 f - cycle through flow fields

                 q - q for quit.

      Accumulate Mode
          There are two supported modes: live and accumulate.  The default
          is live.  The parameter --accumulate  or the 'a' character in top
          mode enables the latter.  In live mode, recent dump-flow content
          is presented.  Where as accumulate mode keeps track of the prior
          historical information until the flow is reset not when the flow
          is purged.  Reset flows are determined when the packet count for
          a flow has decreased from its previous sample.  There is one
          caveat, eventually the system will run out of memory if, after
          the accumulate-decay period any flows that have not been
          refreshed are purged.  The goal here is to free memory of flows
          that are not active.  Statistics are not decremented.  Their
          purpose is to reflect the overall history of the flow fields.

      Debugging Errors
          Parsing errors are counted and displayed in the status line at
          the beginning of the output.  Use the --verbose option with
          --script to see what output was not parsed, like this:

          $ ovs-dpctl dump-flows | ovs-dpctl-top --script --verbose

          Error messages will identify content that failed to parse.

      Access Remote Hosts
          The --host must follow the format user@hostname.  This script
          simply calls 'ssh user@Hostname' without checking for login
          credentials therefore public keys should be installed on the
          system identified by hostname, such as:

          $ ssh-copy-id user@hostname

          Consult ssh-copy-id man pages for more details.

      Expected usage
          $ ovs-dpctl-top

          or to run as a script:

          $ ovs-dpctl dump-flows > dump-flows.log

          $ ovs-dpctl-top --script --flow-file dump-flows.log

      OPTIONS
          -h, --help
                 show this help message and exit.

          -v, --version
                 show program's version number and exit.

          -f FLOWFILES, --flow-file FLOWFILES
                 file containing flows from ovs-dpctl dump-flow.

          -V, --verbose
                 enable debug level verbosity.

          -s, --script
                 Run from a script (no user interface).

          --host HOST
                 Specify a user@host for retrieving flows see Accessing
                 Remote Hosts for more information.

          -a, --accumulate
                 Accumulate dump-flow content.

          --accumulate-decay ACCUMULATEDECAY
                 Decay old accumulated flows.  The default is 5 minutes. A
                 value of 0 disables decay.

          -d DELAY, --delay DELAY
                 Delay in milliseconds to collect dump-flow content (sample
                 rate).

COLOPHON
---------------------------------------------------------

::

          This page is part of the Open vSwitch (a distributed virtual
          multilayer switch) project.  Information about the project can be
          found at ⟨http://openvswitch.org/⟩.  If you have a bug report for
          this manual page, send it to bugs@openvswitch.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/openvswitch/ovs.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-20.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Open vSwitch                     2.13.90                ovs-dpctl-top(8)

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
