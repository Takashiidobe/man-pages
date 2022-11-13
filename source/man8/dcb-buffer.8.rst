.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dcb-buffer(8) — Linux manual page
=================================

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

   DCB-BUFFER(8)                     Linux                    DCB-BUFFER(8)

NAME
-------------------------------------------------

::

          dcb-buffer - show / manipulate port buffer settings of the DCB
          (Data Center Bridging) subsystem


---------------------------------------------------------

::

          dcb [ OPTIONS ] buffer { COMMAND | help }

          dcb buffer show dev DEV [ prio-buffer ] [ buffer-size ] [ total-
                  size ]

          dcb buffer set dev DEV [ prio-buffer PRIO-MAP ] [ buffer-size
                  SIZE-MAP ]

          PRIO-MAP := [ PRIO-MAP ] PRIO-MAPPING

          PRIO-MAPPING := { PRIO | all }:BUFFER

          SIZE-MAP := [ SIZE-MAP ] SIZE-MAPPING

          SIZE-MAPPING := { BUFFER | all }:SIZE

          PRIO := { 0 .. 7 }

          BUFFER := { 0 .. 7 }

          SIZE := { INTEGER | INTEGERK | INTEGERM | ... }


---------------------------------------------------------------

::

          dcb buffer is used to configure assignment of traffic to port
          buffers based on traffic priority, and sizes of those buffers. It
          can be also used to inspect the current configuration, as well as
          total device memory that the port buffers take.


-------------------------------------------------------------

::

          For read-write parameters, the following describes only the write
          direction, i.e. as used with the set command. For the show
          command, the parameter name is to be used as a simple keyword
          without further arguments. This instructs the tool to show the
          value of a given parameter. When no parameters are given, the
          tool shows the complete buffer configuration.

          total-size
                 A read-only property that shows the total device memory
                 taken up by port buffers. This might be more than a simple
                 sum of individual buffer sizes if there are any hidden or
                 internal buffers.

          prio-buffer PRIO-MAP
                 PRIO-MAP uses the array parameter syntax, see dcb(8) for
                 details. Keys are priorities, values are buffer indices.
                 For each priority sets a buffer where traffic with that
                 priority is directed to.

          buffer-size SIZE-MAP
                 SIZE-MAP uses the array parameter syntax, see dcb(8) for
                 details. Keys are buffer indices, values are sizes of that
                 buffer in bytes.  The sizes can use the notation
                 documented in section PARAMETERS at tc(8).  Note that the
                 size requested by the tool can be rounded or capped by the
                 driver to satisfy the requirements of the device.


-----------------------------------------------------------------------

::

          Configure the priomap in a one-to-one fashion:

          # dcb buffer set dev eth0 prio-buffer 0:0 1:1 2:2 3:3 4:4 5:5 6:6
          7:7

          Set sizes of all buffers to 10KB, except for buffer 6, which will
          have the size 1MB:

          # dcb buffer set dev eth0 buffer-size all:10K 6:1M

          Show what was set:

          # dcb buffer show dev eth0
          prio-buffer 0:0 1:1 2:2 3:3 4:4 5:5 6:6 7:7
          buffer-size 0:10Kb 1:10Kb 2:10Kb 3:10Kb 4:10Kb 5:10Kb 6:1Mb
          7:10Kb
          total-size 1222Kb


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

   iproute2                    12 November 2020               DCB-BUFFER(8)

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
