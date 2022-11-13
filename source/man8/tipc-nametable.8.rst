.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tipc-nametable(8) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
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

   TIPC-NAMETABLE(8)                 Linux                TIPC-NAMETABLE(8)

NAME
-------------------------------------------------

::

          tipc-nametable - show TIPC nametable


---------------------------------------------------------

::

          tipc nametable show


-------------------------------------------------------

::

          Options (flags) that can be passed anywhere in the command chain.

          -h, --help

          -j, -json
                 Output results in JavaScript Object Notation (JSON).

          -p, -pretty
                 The default JSON format is compact and more efficient to
                 parse but hard for most users to read.  This flag adds
                 indentation for readability.

                 Show help about last valid command. For example tipc
                 nametable --help will show nametable help and tipc --help
                 will show general help. The position of the option in the
                 string is irrelevant.


---------------------------------------------------------------

::

          The nametable shows TIPC publication information.

      Nametable format
          Type
                 The 32-bit type field of the port name. The type field
                 often indicates the class of service provided by a port.

          Lower
                 The lower bound of the 32-bit instance field of the port
                 name.  The instance field is often used as as a sub-class
                 indicator.

          Upper
                 The upper bound of the 32-bit instance field of the port
                 name.  The instance field is often used as as a sub-class
                 indicator.  A difference in lower and upper means the
                 socket is bound to the port name range [lower,upper]

          Port Identity
                 The unique socket (port) identifier within the TIPC
                 cluster. The port identity consists of a node identity
                 followed by a socket reference number.

          Publication
                 The publication ID is a random number used internally to
                 represent a publication.

          Scope
                 The publication scope specifies the visibility of a bound
                 port name.  The scope can be specified to comprise three
                 different domains: node, cluster and zone.  Applications
                 residing within the specified scope can see and access the
                 port using the displayed port name.


---------------------------------------------------------------

::

          Exit status is 0 if command was successful or a positive integer
          upon failure.


---------------------------------------------------------

::

          tipc(8), tipc-bearer(8), tipc-link(8), tipc-media(8),
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

   iproute2                       02 Jun 2015             TIPC-NAMETABLE(8)

--------------

Pages that refer to this page: `tipc(8) <../man8/tipc.8.html>`__, 
`tipc-bearer(8) <../man8/tipc-bearer.8.html>`__, 
`tipc-link(8) <../man8/tipc-link.8.html>`__, 
`tipc-media(8) <../man8/tipc-media.8.html>`__, 
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
