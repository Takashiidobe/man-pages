.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ip-tunnel(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IP-TUNNEL(8)                      Linux                     IP-TUNNEL(8)

NAME
-------------------------------------------------

::

          ip-tunnel - tunnel configuration


---------------------------------------------------------

::

          ip tunnel help

          ip [ OPTIONS ] tunnel { add | change | del | show | prl | 6rd } [
                  NAME ]
                  [ mode MODE ] [ remote ADDR ] [ local ADDR ]
                  [ [i|o]seq ] [ [i|o]key KEY ] [ [i|o]csum ] ]
                  [ encaplimit ELIM ] [ ttl|hoplimit TTL ]
                  [ tos TOS ] [ flowlabel FLOWLABEL ]
                  [ prl-default ADDR ] [ prl-nodefault ADDR ] [ prl-delete
                  ADDR ]
                  [ 6rd-prefix ADDR ] [ 6rd-relay_prefix ADDR ] [ 6rd-reset
                  ]
                  [ [no]pmtudisc ] [ [no]ignore-df ] [ [no]allow-
                  localremote ]
                  [ dev PHYS_DEV ]

          MODE :=  { ipip | gre | sit | isatap | vti | ip6ip6 | ipip6 |
                  ip6gre | vti6 | any }

          ADDR := { IP_ADDRESS | any }

          TOS := { STRING | 00..ff | inherit | inherit/STRING |
                  inherit/00..ff }

          ELIM := { none | 0..255 }

          TTL := { 1..255 | inherit }

          KEY := { DOTTED_QUAD | NUMBER }


---------------------------------------------------------------

::

          tunnel objects are tunnels, encapsulating packets in IP packets
          and then sending them over the IP infrastructure.  The
          encapsulating (or outer) address family is specified by the -f
          option. The default is IPv4.

          ip tunnel add
                 add a new tunnel

          ip tunnel change
                 change an existing tunnel

          ip tunnel delete
                 destroy a tunnel

                 name NAME (default)
                        select the tunnel device name.

                 mode MODE
                        set the tunnel mode. Available modes depend on the
                        encapsulating address family.
                        Modes for IPv4 encapsulation available: ipip, sit,
                        isatap, vti, and gre.
                        Modes for IPv6 encapsulation available: ip6ip6,
                        ipip6, ip6gre, vti6, and any.

                 remote ADDRESS
                        set the remote endpoint of the tunnel.

                 local ADDRESS
                        set the fixed local address for tunneled packets.
                        It must be an address on another interface of this
                        host.

                 ttl N

                 hoplimit N
                        set a fixed TTL (IPv4) or hoplimit (IPv6) N on
                        tunneled packets.  N is a number in the range
                        1--255. 0 is a special value meaning that packets
                        inherit the TTL value.  The default value for IPv4
                        tunnels is: inherit.  The default value for IPv6
                        tunnels is: 64.

                 tos T

                 dsfield T

                 tclass T
                        set the type of service (IPv4) or traffic class
                        (IPv6) field on tunneled packets, which can be
                        specified as either a two-digit hex value (e.g. c0)
                        or a predefined string (e.g. internet).  The value
                        inherit causes the field to be copied from the
                        original IP header. The values inherit/STRING or
                        inherit/00..ff will set the field to STRING or
                        00..ff when tunneling non-IP packets. The default
                        value is 00.

                 dev NAME
                        bind the tunnel to the device NAME so that tunneled
                        packets will only be routed via this device and
                        will not be able to escape to another device when
                        the route to endpoint changes.

                 nopmtudisc
                        disable Path MTU Discovery on this tunnel.  It is
                        enabled by default. Note that a fixed ttl is
                        incompatible with this option: tunneling with a
                        fixed ttl always makes pmtu discovery.

                 ignore-df
                        enable IPv4 DF suppression on this tunnel.
                        Normally datagrams that exceed the MTU will be
                        fragmented; the presence of the DF flag inhibits
                        this, resulting instead in an ICMP Unreachable
                        (Fragmentation Required) message.  Enabling this
                        attribute causes the DF flag to be ignored.

                 key K

                 ikey K

                 okey K ( only GRE tunnels ) use keyed GRE with key K. K is
                        either a number or an IP address-like dotted quad.
                        The key parameter sets the key to use in both
                        directions.  The ikey and okey parameters set
                        different keys for input and output.

                 csum, icsum, ocsum
                        ( only GRE tunnels ) generate/require checksums for
                        tunneled packets.  The ocsum flag calculates
                        checksums for outgoing packets.  The icsum flag
                        requires that all input packets have the correct
                        checksum. The csum flag is equivalent to the
                        combination icsum ocsum.

                 seq, iseq, oseq
                        ( only GRE tunnels ) serialize packets.  The oseq
                        flag enables sequencing of outgoing packets.  The
                        iseq flag requires that all input packets are
                        serialized.  The seq flag is equivalent to the
                        combination iseq oseq.  It doesn't work. Don't use
                        it.

                 encaplimit ELIM
                        ( only IPv6 tunnels ) set a fixed encapsulation
                        limit. Default is 4.

                 flowlabel FLOWLABEL
                        ( only IPv6 tunnels ) set a fixed flowlabel.

                 allow-localremote
                        ( only IPv6 tunnels ) allow remote endpoint on the
                        local host.

          ip tunnel prl
                 potential router list (ISATAP only)

                 dev NAME
                        mandatory device name.

                 prl-default ADDR

                 prl-nodefault ADDR

                 prl-delete ADDR
                        Add or delete ADDR as a potential router or default
                        router.

          ip tunnel show
                 list tunnels This command has no arguments.


---------------------------------------------------------

::

          ip(8)


-----------------------------------------------------

::

          Original Manpage by Michail Litvak <mci@owl.openwall.com>

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

   iproute2                       20 Dec 2011                  IP-TUNNEL(8)

--------------

Pages that refer to this page: `ip(8) <../man8/ip.8.html>`__, 
`iptunnel(8) <../man8/iptunnel.8.html>`__

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
