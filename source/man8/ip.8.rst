.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ip(8) — Linux manual page
=========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `IP - COMMAND                     |                                   |
|  SYNTAX <#IP_-_COMMAND_SYNTAX>`__ |                                   |
| \| `ENVIRONMENT <#ENVIRONMENT>`__ |                                   |
| \| `EXIT STATUS <#EXIT_STATUS>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IP(8)                             Linux                            IP(8)

NAME
-------------------------------------------------

::

          ip - show / manipulate routing, network devices, interfaces and
          tunnels


---------------------------------------------------------

::

          ip [ OPTIONS ] OBJECT { COMMAND | help }

          ip [ -force ] -batch filename

          OBJECT := { link | address | addrlabel | route | rule | neigh |
                  ntable | tunnel | tuntap | maddress | mroute | mrule |
                  monitor | xfrm | netns | l2tp | tcp_metrics | token |
                  macsec | vrf | mptcp }

          OPTIONS := { -V[ersion] | -h[uman-readable] | -s[tatistics] |
                  -d[etails] | -r[esolve] | -iec | -f[amily] { inet | inet6
                  | link } | -4 | -6 | -I | -D | -B | -0 | -l[oops] {
                  maximum-addr-flush-attempts } | -o[neline] | -rc[vbuf]
                  [size] | -t[imestamp] | -ts[hort] | -n[etns] name |
                  -N[umeric] | -a[ll] | -c[olor] | -br[ief] | -j[son] |
                  -p[retty] }


-------------------------------------------------------

::

          -V, -Version
                 Print the version of the ip utility and exit.

          -h, -human, -human-readable
                 output statistics with human readable values followed by
                 suffix.

          -b, -batch <FILENAME>
                 Read commands from provided file or standard input and
                 invoke them.  First failure will cause termination of ip.

          -force Don't terminate ip on errors in batch mode.  If there were
                 any errors during execution of the commands, the
                 application return code will be non zero.

          -s, -stats, -statistics
                 Output more information. If the option appears twice or
                 more, the amount of information increases.  As a rule, the
                 information is statistics or some time values.

          -d, -details
                 Output more detailed information.

          -l, -loops <COUNT>
                 Specify maximum number of loops the 'ip address flush'
                 logic will attempt before giving up. The default is 10.
                 Zero (0) means loop until all addresses are removed.

          -f, -family <FAMILY>
                 Specifies the protocol family to use. The protocol family
                 identifier can be one of inet, inet6, bridge, mpls or
                 link.  If this option is not present, the protocol family
                 is guessed from other arguments. If the rest of the
                 command line does not give enough information to guess the
                 family, ip falls back to the default one, usually inet or
                 any.  link is a special family identifier meaning that no
                 networking protocol is involved.

          -4     shortcut for -family inet.

          -6     shortcut for -family inet6.

          -B     shortcut for -family bridge.

          -M     shortcut for -family mpls.

          -0     shortcut for -family link.

          -o, -oneline
                 output each record on a single line, replacing line feeds
                 with the '\' character. This is convenient when you want
                 to count records with wc(1) or to grep(1) the output.

          -r, -resolve
                 use the system's name resolver to print DNS names instead
                 of host addresses.

          -n, -netns <NETNS>
                 switches ip to the specified network namespace NETNS.
                 Actually it just simplifies executing of:

                 ip netns exec NETNS ip [ OPTIONS ] OBJECT { COMMAND | help
                 }

                 to

                 ip -n[etns] NETNS [ OPTIONS ] OBJECT { COMMAND | help }

          -N, -Numeric
                 Print the number of protocol, scope, dsfield, etc directly
                 instead of converting it to human readable name.

          -a, -all
                 executes specified command over all objects, it depends if
                 command supports this option.

          -c[color][={always|auto|never}
                 Configure color output. If parameter is omitted or always,
                 color output is enabled regardless of stdout state. If
                 parameter is auto, stdout is checked to be a terminal
                 before enabling color output. If parameter is never, color
                 output is disabled. If specified multiple times, the last
                 one takes precedence. This flag is ignored if -json is
                 also given.

                 Used color palette can be influenced by COLORFGBG
                 environment variable (see ENVIRONMENT).

          -t, -timestamp
                 display current time when using monitor option.

          -ts, -tshort
                 Like -timestamp, but use shorter format.

          -rc, -rcvbuf<SIZE>
                 Set the netlink socket receive buffer size, defaults to
                 1MB.

          -iec   print human readable rates in IEC units (e.g. 1Ki = 1024).

          -br, -brief
                 Print only basic information in a tabular format for
                 better readability. This option is currently only
                 supported by ip addr show and ip link show commands.

          -j, -json
                 Output results in JavaScript Object Notation (JSON).

          -p, -pretty
                 The default JSON format is compact and more efficient to
                 parse but hard for most users to read.  This flag adds
                 indentation for readability.


-------------------------------------------------------------------------------

::

      OBJECT
          address
                 - protocol (IP or IPv6) address on a device.

          addrlabel
                 - label configuration for protocol address selection.

          l2tp   - tunnel ethernet over IP (L2TPv3).

          link   - network device.

          maddress
                 - multicast address.

          monitor
                 - watch for netlink messages.

          mptcp  - manage MPTCP path manager.

          mroute - multicast routing cache entry.

          mrule  - rule in multicast routing policy database.

          neighbour
                 - manage ARP or NDISC cache entries.

          netns  - manage network namespaces.

          ntable - manage the neighbor cache's operation.

          route  - routing table entry.

          rule   - rule in routing policy database.

          tcp_metrics/tcpmetrics
                 - manage TCP Metrics

          token  - manage tokenized interface identifiers.

          tunnel - tunnel over IP.

          tuntap - manage TUN/TAP devices.

          vrf    - manage virtual routing and forwarding devices.

          xfrm   - manage IPSec policies.

          The names of all objects may be written in full or abbreviated
          form, for example address can be abbreviated as addr or just a.

      COMMAND
          Specifies the action to perform on the object.  The set of
          possible actions depends on the object type.  As a rule, it is
          possible to add, delete and show (or list ) objects, but some
          objects do not allow all of these operations or have some
          additional commands. The help command is available for all
          objects. It prints out a list of available commands and argument
          syntax conventions.

          If no command is given, some default command is assumed.  Usually
          it is list or, if the objects of this class cannot be listed,
          help.


---------------------------------------------------------------

::

          COLORFGBG
                 If set, it's value is used for detection whether
                 background is dark or light and use contrast colors for
                 it.

                 COLORFGBG environment variable usually contains either two
                 or three values separated by semicolons; we want the last
                 value in either case.  If this value is 0-6 or 8, chose
                 colors suitable for dark background:

                 COLORFGBG=";0" ip -c a


---------------------------------------------------------------

::

          Exit status is 0 if command was successful, and 1 if there is a
          syntax error.  If an error was reported by the kernel exit status
          is 2.


---------------------------------------------------------

::

          ip addr
              Shows addresses assigned to all network interfaces.

          ip neigh
              Shows the current neighbour table in kernel.

          ip link set x up
              Bring up interface x.

          ip link set x down
              Bring down interface x.

          ip route
              Show table routes.


-------------------------------------------------------

::

          ip was written by Alexey N. Kuznetsov and added in Linux 2.2.


---------------------------------------------------------

::

          ip-address(8), ip-addrlabel(8), ip-l2tp(8), ip-link(8),
          ip-maddress(8), ip-monitor(8), ip-mptcp(8), ip-mroute(8),
          ip-neighbour(8), ip-netns(8), ip-ntable(8), ip-route(8),
          ip-rule(8), ip-tcp_metrics(8), ip-token(8), ip-tunnel(8),
          ip-vrf(8), ip-xfrm(8)
          IP Command reference ip-cref.ps


---------------------------------------------------------------------

::

          Report any bugs to the Network Developers mailing list
          <netdev@vger.kernel.org> where the development and maintenance is
          primarily done.  You do not have to be subscribed to the list to
          send a message there.


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

   iproute2                       20 Dec 2011                         IP(8)

--------------

Pages that refer to this page:
`networkctl(1) <../man1/networkctl.1.html>`__, 
`pmdanetcheck(1) <../man1/pmdanetcheck.1.html>`__, 
`veth(4) <../man4/veth.4.html>`__, 
`bpf-helpers(7) <../man7/bpf-helpers.7.html>`__, 
`ip(7) <../man7/ip.7.html>`__, 
`network_namespaces(7) <../man7/network_namespaces.7.html>`__, 
`arptables-nft(8) <../man8/arptables-nft.8.html>`__, 
`bridge(8) <../man8/bridge.8.html>`__, 
`ebtables-nft(8) <../man8/ebtables-nft.8.html>`__, 
`genl(8) <../man8/genl.8.html>`__, 
`ifstat(8) <../man8/ifstat.8.html>`__, 
`ip-address(8) <../man8/ip-address.8.html>`__, 
`ip-addrlabel(8) <../man8/ip-addrlabel.8.html>`__, 
`ip-fou(8) <../man8/ip-fou.8.html>`__, 
`ip-l2tp(8) <../man8/ip-l2tp.8.html>`__, 
`ip-link(8) <../man8/ip-link.8.html>`__, 
`ipmaddr(8) <../man8/ipmaddr.8.html>`__, 
`ip-maddress(8) <../man8/ip-maddress.8.html>`__, 
`ip-monitor(8) <../man8/ip-monitor.8.html>`__, 
`ip-mroute(8) <../man8/ip-mroute.8.html>`__, 
`ip-neighbour(8) <../man8/ip-neighbour.8.html>`__, 
`ip-netconf(8) <../man8/ip-netconf.8.html>`__, 
`ip-netns(8) <../man8/ip-netns.8.html>`__, 
`ip-nexthop(8) <../man8/ip-nexthop.8.html>`__, 
`ip-ntable(8) <../man8/ip-ntable.8.html>`__, 
`ip-route(8) <../man8/ip-route.8.html>`__, 
`ip-rule(8) <../man8/ip-rule.8.html>`__, 
`ip-tcp_metrics(8) <../man8/ip-tcp_metrics.8.html>`__, 
`ip-token(8) <../man8/ip-token.8.html>`__, 
`ip-tunnel(8) <../man8/ip-tunnel.8.html>`__, 
`iptunnel(8) <../man8/iptunnel.8.html>`__, 
`ip-vrf(8) <../man8/ip-vrf.8.html>`__, 
`lnstat(8) <../man8/lnstat.8.html>`__, 
`netstat(8) <../man8/netstat.8.html>`__, 
`ping(8) <../man8/ping.8.html>`__, 
`rdma-dev(8) <../man8/rdma-dev.8.html>`__, 
`routel(8) <../man8/routel.8.html>`__, 
`rtmon(8) <../man8/rtmon.8.html>`__, 
`rtpr(8) <../man8/rtpr.8.html>`__,  `ss(8) <../man8/ss.8.html>`__, 
`tc-bfifo(8) <../man8/tc-bfifo.8.html>`__, 
`tc-pfifo_fast(8) <../man8/tc-pfifo_fast.8.html>`__, 
`wg(8) <../man8/wg.8.html>`__, 
`wg-quick(8) <../man8/wg-quick.8.html>`__

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
