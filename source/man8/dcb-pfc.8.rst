.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dcb-pfc(8) — Linux manual page
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

   DCB-PFC(8)                        Linux                       DCB-PFC(8)

NAME
-------------------------------------------------

::

          dcb-pfc - show / manipulate PFC (Priority-based Flow Control)
          settings of the DCB (Data Center Bridging) subsystem


---------------------------------------------------------

::

          dcb [ OPTIONS ] pfc { COMMAND | help }

          dcb pfc show dev DEV [ pfc-cap ] [ prio-pfc ] [ macsec-bypass ] [
                  delay ] [ requests ] [ indications ]

          dcb pfc set dev DEV [ prio-pfc PFC-MAP ] [ macsec-bypass { on |
                  off } ] [ delay INTEGER ]

          PFC-MAP := [ PFC-MAP ] PFC-MAPPING

          PFC-MAPPING := { PRIO | all }:{ on | off }

          PRIO := { 0 .. 7 }


---------------------------------------------------------------

::

          dcb pfc is used to configure Priority-based Flow Control
          attributes through Linux DCB (Data Center Bridging) interface.
          PFC permits marking flows with a certain priority as lossless,
          and holds related configuration, as well as PFC counters.


-------------------------------------------------------------

::

          For read-write parameters, the following describes only the write
          direction, i.e. as used with the set command. For the show
          command, the parameter name is to be used as a simple keyword
          without further arguments. This instructs the tool to show the
          value of a given parameter. When no parameters are given, the
          tool shows the complete PFC configuration.

          pfc-cap
                 A read-only property that shows the number of traffic
                 classes that may simultaneously support PFC.

          requests
                 A read-only count of the sent PFC frames per traffic
                 class. Only shown when -s is given, or when requested
                 explicitly.

          indications
                 A read-only count of the received PFC frames per traffic
                 class. Only shown when -s is given, or when requested
                 explicitly.

          macsec-bypass { on | off }
                 Whether the sending station is capable of bypassing MACsec
                 processing when MACsec is disabled.

          prio-pfc PFC-MAP
                 PFC-MAP uses the array parameter syntax, see dcb(8) for
                 details. Keys are priorities, values are on / off
                 indicators of whether PFC is enabled for a given priority.

          delay INTEGER
                 The allowance made for round-trip propagation delay of the
                 link in bits.  The value shall be 0..65535.


-----------------------------------------------------------------------

::

          Enable PFC on priorities 6 and 7, leaving the rest intact:

          # dcb pfc set dev eth0 prio-pfc 6:on 7:on

          Disable PFC of all priorities except 6 and 7, and configure delay
          to 4096 bits:

          # dcb pfc set dev eth0 prio-pfc all:off 6:on 7:on delay 0x1000

          Show what was set:

          # dcb pfc show dev eth0
          pfc-cap 8 macsec-bypass off delay 4096
          prio-pfc 0:off 1:off 2:off 3:off 4:off 5:off 6:on 7:on


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

   iproute2                     31 October 2020                  DCB-PFC(8)

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
