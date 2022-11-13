.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ip-fou(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IP-FOU(8)                         Linux                        IP-FOU(8)

NAME
-------------------------------------------------

::

          ip-fou - Foo-over-UDP receive port configuration

          ip-gue - Generic UDP Encapsulation receive port configuration


---------------------------------------------------------

::

          ip [ OPTIONS ] fou  { COMMAND | help }

          ip fou add port PORT { gue | ipproto PROTO  } [ local IFADDR  ] [
                  peer IFADDR  ] [ peer_port PORT  ] [ dev IFNAME  ]
          ip fou del port PORT [ local IFADDR  ] [ peer IFADDR  ] [
                  peer_port PORT  ] [ dev IFNAME  ]
          ip fou show


---------------------------------------------------------------

::

          The ip fou commands are used to create and delete receive ports
          for Foo-over-UDP (FOU) as well as Generic UDP Encapsulation
          (GUE).

          Foo-over-UDP allows encapsulating packets of an IP protocol
          directly over UDP. The receiver infers the protocol of a packet
          received on a FOU UDP port to be the protocol configured for the
          port.

          Generic UDP Encapsulation (GUE) encapsulates packets of an IP
          protocol within UDP and an encapsulation header. The
          encapsulation header contains the IP protocol number for the
          encapsulated packet.

          When creating a FOU or GUE receive port, the port number is
          specified in PORT argument. If FOU is used, the IP protocol
          number associated with the port is specified in PROTO argument.
          You can bind a port to a local address/interface, by specifying
          the address in the local IFADDR argument or the device in the
          IFNAME argument. If you would like to connect the port, you can
          specify the peer address in the peer IFADDR argument and peer
          port in the peer_port PORT argument.

          A FOU or GUE receive port is deleted by specifying PORT in the
          delete command, as well as local address/interface or peer
          address/port (if set).


---------------------------------------------------------

::

      Configure a FOU receive port for GRE bound to 7777
          # ip fou add port 7777 ipproto 47

      Configure a FOU receive port for IPIP bound to 8888
          # ip fou add port 8888 ipproto 4

      Configure a GUE receive port bound to 9999
          # ip fou add port 9999 gue

      Delete the GUE receive port bound to 9999
          # ip fou del port 9999

      Configure a FOU receive port for GRE bound to 1.2.3.4:7777
          # ip fou add port 7777 ipproto 47 local 1.2.3.4


---------------------------------------------------------

::

          ip(8)


-----------------------------------------------------

::

          Tom Herbert <therbert@google.com>

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

   iproute2                       2 Nov 2014                      IP-FOU(8)

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
