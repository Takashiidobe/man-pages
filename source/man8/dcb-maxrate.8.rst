.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dcb-maxrate(8) — Linux manual page
==================================

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

   DCB-MAXRATE(8)                    Linux                   DCB-MAXRATE(8)

NAME
-------------------------------------------------

::

          dcb-maxrate - show / manipulate port maxrate settings of the DCB
          (Data Center Bridging) subsystem


---------------------------------------------------------

::

          dcb [ OPTIONS ] maxrate { COMMAND | help }

          dcb maxrate show dev DEV [ tc-maxrate ]

          dcb maxrate set dev DEV [ tc-maxrate RATE-MAP ]

          RATE-MAP := [ RATE-MAP ] RATE-MAPPING

          RATE-MAPPING := { TC | all }:RATE

          TC := { 0 .. 7 }

          RATE := { INTEGER[bit] | INTEGERKbit | INTEGERMib | ... }


---------------------------------------------------------------

::

          dcb maxrate is used to configure and inspect maximum rate at
          which traffic is allowed to egress from a given traffic class.


-------------------------------------------------------------

::

          The following describes only the write direction, i.e. as used
          with the set command. For the show command, the parameter name is
          to be used as a simple keyword without further arguments. This
          instructs the tool to show the value of a given parameter. When
          no parameters are given, the tool shows the complete maxrate
          configuration.

          tc-maxrate RATE-MAP
                 RATE-MAP uses the array parameter syntax, see dcb(8) for
                 details. Keys are TC indices, values are traffic rates in
                 bits per second.  The rates can use the notation
                 documented in section PARAMETERS at tc(8).  Note that
                 under that notation, "bit" stands for bits per second
                 whereas "b" stands for bytes per second. When showing, the
                 command line option -i toggles between using decadic and
                 ISO/IEC prefixes.


-----------------------------------------------------------------------

::

          Set rates of all traffic classes to 25Gbps, except for TC 6,
          which will have the rate of 100Gbps:

          # dcb maxrate set dev eth0 tc-maxrate all:25Gbit 6:100Gbit

          Show what was set:

          # dcb maxrate show dev eth0
          tc-maxrate 0:25Gbit 1:25Gbit 2:25Gbit 3:25Gbit 4:25Gbit 5:25Gbit
          6:100Gbit 7:25Gbit


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

   iproute2                    22 November 2020              DCB-MAXRATE(8)

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
