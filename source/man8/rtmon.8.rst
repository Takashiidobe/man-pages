.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rtmon(8) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `US                               |                                   |
| AGE EXAMPLES <#USAGE_EXAMPLES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RTMON(8)                 System Manager's Manual                RTMON(8)

NAME
-------------------------------------------------

::

          rtmon - listens to and monitors RTnetlink


---------------------------------------------------------

::

          rtmon [ options ] file FILE [ all | LISTofOBJECTS ]


---------------------------------------------------------------

::

          This manual page documents briefly the rtmon command.

          rtmon listens on netlink socket and monitors routing table
          changes.

          rtmon can be started before the first network configuration
          command is issued.  For example if you insert:

          rtmon file /var/log/rtmon.log

          in a startup script, you will be able to view the full history
          later.  Certainly, it is possible to start rtmon at any time. It
          prepends the history with the state snapshot dumped at the moment
          of starting.


-------------------------------------------------------

::

          rtmon supports the following options:

          -Version
                 Print version and exit.

          help   Show summary of options.

          file FILE [ all | LISTofOBJECTS ]
                 Log output to FILE. LISTofOBJECTS is the list of object
                 types that we want to monitor. It may contain 'link',
                 'address', 'route' and 'all'. 'link' specifies the network
                 device, 'address' the protocol (IP or IPv6) address on a
                 device, 'route' the routing table entry and 'all' does
                 what the name says.

          -family [ inet | inet6 | link | help ]
                 Specify protocol family. 'inet' is IPv4, 'inet6' is IPv6,
                 'link' means that no networking protocol is involved and
                 'help' prints usage information.

          -4     Use IPv4. Shortcut for -family inet.

          -6     Use IPv6. Shortcut for -family inet6.

          -0     Use a special family identifier meaning that no networking
                 protocol is involved. Shortcut for -family link.


---------------------------------------------------------------------

::

          # rtmon file /var/log/rtmon.log
                 Log to file /var/log/rtmon.log, then run:

          # ip monitor file /var/log/rtmon.log
                 to display logged output from file.


---------------------------------------------------------

::

          ip(8)


-----------------------------------------------------

::

          rtmon was written by Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>.

          This manual page was written by Michael Prokop <mika@grml.org>,
          for the Debian project (but may be used by others).

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

                                                                   RTMON(8)

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
