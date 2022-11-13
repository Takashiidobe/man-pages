.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tipc(8) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TIPC(8)                           Linux                          TIPC(8)

NAME
-------------------------------------------------

::

          tipc - a TIPC configuration and management tool


---------------------------------------------------------

::

          tipc [ OPTIONS ] COMMAND ARGUMENTS

          COMMAND := { bearer | link | media | nametable | node | socket }

          OPTIONS := { -h[help] }


---------------------------------------------------------------

::

          The Transparent Inter-Process Communication (TIPC) protocol
          offers total address transparency between processes which allows
          applications in a clustered computer environment to communicate
          quickly and reliably with each other, regardless of their
          location within the cluster.

          TIPC originated at the telecommunications manufacturer Ericsson.
          The first open source version of TIPC was created in 2000 when
          Ericsson released its first Linux version of TIPC. TIPC was
          introduced in the mainline Linux kernel in 2006 and is now widely
          used both within and outside of Ericsson.


-------------------------------------------------------

::

          -h, --help
                 Show help about last given command. For example tipc
                 bearer --help will show bearer help and tipc --help will
                 show general help. The position of the option in the
                 string is irrelevant.

          -j, -json
                 Output results in JavaScript Object Notation (JSON).

          -p, -pretty
                 The default JSON format is compact and more efficient to
                 parse but hard for most users to read.  This flag adds
                 indentation for readability.


---------------------------------------------------------

::

          BEARER - Show or modify TIPC bearers

          LINK   - Show or modify TIPC links

          MEDIA  - Show or modify TIPC media

          NAMETABLE
                 - Show TIPC nametable

          NODE   - Show or modify TIPC node parameters

          SOCKET - Show TIPC sockets


-----------------------------------------------------------

::

          Command arguments are described in a command specific man page
          and typically consists of nested commands along with key value
          pairs.  If no arguments are given a command typically shows its
          help text. The explicit help option -h or --help can occur
          anywhere among the arguments and will show help for the last
          valid command given.


---------------------------------------------------------------

::

          Exit status is 0 if command was successful or a positive integer
          upon failure.


---------------------------------------------------------

::

          tipc-bearer(8), tipc-link(8), tipc-media(8), tipc-nametable(8),
          tipc-node(8), tipc-peer(8), tipc-socket(8)


---------------------------------------------------------------------

::

          Report any bugs to the Network Developers mailing list
          <netdev@vger.kernel.org> where the development and maintenance is
          primarily done.  You do not have to be subscribed to the list to
          send a message there.


-----------------------------------------------------

::

          Richard Alpe <richard.alpe@ericsson.com>

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

   iproute2                       02 Jun 2015                       TIPC(8)

--------------

Pages that refer to this page:
`tipc-bearer(8) <../man8/tipc-bearer.8.html>`__, 
`tipc-link(8) <../man8/tipc-link.8.html>`__, 
`tipc-media(8) <../man8/tipc-media.8.html>`__, 
`tipc-nametable(8) <../man8/tipc-nametable.8.html>`__, 
`tipc-node(8) <../man8/tipc-node.8.html>`__, 
`tipc-peer(8) <../man8/tipc-peer.8.html>`__, 
`tipc-socket(8) <../man8/tipc-socket.8.html>`__

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
