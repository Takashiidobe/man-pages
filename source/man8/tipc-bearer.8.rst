.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tipc-bearer(8) — Linux manual page
==================================

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

   TIPC-BEARER(8)                    Linux                   TIPC-BEARER(8)

NAME
-------------------------------------------------

::

          tipc-bearer - show or modify TIPC bearers


---------------------------------------------------------

::

          tipc bearer add media udp name NAME remoteip REMOTEIP

          tipc bearer enable [ domain DOMAIN ] [ priority PRIORITY ] media
                  { { eth | ib } device DEVICE } |
                  { udp name NAME localip LOCALIP [ localport LOCALPORT ] [
                  remoteip REMOTEIP ] [ remoteport REMOTEPORT ] }

          tipc bearer disable media
                  { { eth | ib } device DEVICE } |
                  { udp name NAME }

          tipc bearer set { priority PRIORITY | tolerance TOLERANCE |
                  window WINDOW } media
                  { { eth | ib } device DEVICE } |
                  { udp name NAME }

          tipc bearer get [ priority | tolerance | window ] media
                  { { eth | ib } device DEVICE } |
                  { udp name NAME [ localip | localport | remoteip |
                  remoteport ] }

          tipc bearer list


-------------------------------------------------------

::

          Options (flags) that can be passed anywhere in the command chain.

          -h, --help
                 Show help about last valid command. For example tipc
                 bearer --help will show bearer help and tipc --help will
                 show general help. The position of the option in the
                 string is irrelevant.


---------------------------------------------------------------

::

      Bearer identification
          media MEDIA
                 Specifies the TIPC media type for a particular bearer to
                 operate on.  Different media types have different ways of
                 identifying a unique bearer.  For example, ib and eth
                 identify a bearer with a DEVICE while udp identify a
                 bearer with a LOCALIP and a NAME

                 ib - Infiniband

                 eth - Ethernet

                 udp - User Datagram Protocol (UDP)

          name NAME
                 Logical bearer identifier valid for bearers on udp media.

          device DEVICE
                 Physical bearer device valid for bearers on eth and ib
                 media.

      Bearer properties
          domain
                 The addressing domain (region) in which a bearer will
                 establish links and accept link establish requests.

          priority
                 Default link priority inherited by all links subsequently
                 established over a bearer. A single bearer can only host
                 one link to a particular node. This means the default link
                 priority for a bearer typically affects which bearer to
                 use when communicating with a particular node in an multi
                 bearer setup. For more info about link priority see
                 tipc-link(8)

          tolerance
                 Default link tolerance inherited by all links subsequently
                 established over a bearer. For more info about link
                 tolerance see tipc-link(8)

          window
                 Default link window inherited by all links subsequently
                 established over a bearer. For more info about the link
                 window size see tipc-link(8)

      UDP bearer options
          localip LOCALIP
                 Specify a local IP v4/v6 address for a udp bearer.

          localport LOCALPORT
                 Specify the local port for a udp bearer. The default port
                 6118 is used if no port is specified.

          remoteip REMOTEIP
                 Specify a remote IP for a udp bearer. If no remote IP is
                 specified a udp bearer runs in multicast mode and tries to
                 auto-discover its neighbours.  The multicast IP address is
                 generated based on the TIPC network ID. If a remote IP is
                 specified the udp bearer runs in point-to-point mode.

                 Multiple remoteip addresses can be added via the bearer
                 add command. Adding one or more unicast remoteip addresses
                 to an existing udp bearer puts the bearer in replicast
                 mode where IP multicast is emulated by sending multiple
                 unicast messages to each configured remoteip.  When a peer
                 sees a TIPC discovery message from an unknown peer the
                 peer address is automatically added to the remoteip
                 (replicast) list, thus only one side of a link needs to be
                 manually configured. A remoteip address cannot be added to
                 a multicast bearer.

          remoteport REMOTEPORT
                 Specify the remote port for a udp bearer. The default port
                 6118 is used if no port is specified.


---------------------------------------------------------------

::

          Exit status is 0 if command was successful or a positive integer
          upon failure.


---------------------------------------------------------

::

          tipc(8), tipc-link(8), tipc-media(8), tipc-nametable(8),
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

   iproute2                       02 Jun 2015                TIPC-BEARER(8)

--------------

Pages that refer to this page: `tipc(8) <../man8/tipc.8.html>`__, 
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
