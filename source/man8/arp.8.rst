.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

arp(8) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `MODES <#MODES>`__ \|             |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ARP(8)             Linux System Administrator's Manual            ARP(8)

NAME
-------------------------------------------------

::

          arp - manipulate the system ARP cache


---------------------------------------------------------

::

          arp [-vn] [-H type] [-i if] [-ae] [hostname]

          arp [-v] [-i if] -d hostname [pub]

          arp [-v] [-H type] [-i if] -s hostname hw_addr [temp]

          arp [-v] [-H type] [-i if] -s hostname hw_addr [netmask nm] pub

          arp [-v] [-H type] [-i if] -Ds hostname ifname [netmask nm] pub

          arp [-vnD] [-H type] [-i if] -f [filename]


---------------------------------------------------------------

::

          Arp manipulates or displays the kernel's IPv4 network neighbour
          cache. It can add entries to the table, delete one or display the
          current content.

          ARP stands for Address Resolution Protocol, which is used to find
          the media access control address of a network neighbour for a
          given IPv4 Address.


---------------------------------------------------

::

          arp with no mode specifier will print the current content of the
          table. It is possible to limit the number of entries printed, by
          specifying an hardware address type, interface name or host
          address.

          arp -d address will delete a ARP table entry. Root or netadmin
          privilege is required to do this. The entry is found by IP
          address. If a hostname is given, it will be resolved before
          looking up the entry in the ARP table.

          arp -s address hw_addr is used to set up a new table entry. The
          format of the hw_addr parameter is dependent on the hardware
          class, but for most classes one can assume that the usual
          presentation can be used.  For the Ethernet class, this is 6
          bytes in hexadecimal, separated by colons. When adding proxy arp
          entries (that is those with the publish flag set) a netmask may
          be specified to proxy arp for entire subnets. This is not good
          practice, but is supported by older kernels because it can be
          useful. If the temp flag is not supplied entries will be
          permanent stored into the ARP cache. To simplify setting up
          entries for one of your own network interfaces, you can use the
          arp -Ds address ifname form. In that case the hardware address is
          taken from the interface with the specified name.


-------------------------------------------------------

::

          -v, --verbose
                 Tell the user what is going on by being verbose.

          -n, --numeric
                 shows numerical addresses instead of trying to determine
                 symbolic host, port or user names.

          -H type, --hw-type type, -t type
                 When setting or reading the ARP cache, this optional
                 parameter tells arp which class of entries it should check
                 for.  The default value of this parameter is ether (i.e.
                 hardware code 0x01 for IEEE 802.3 10Mbps Ethernet).  Other
                 values might include network technologies such as ARCnet
                 (arcnet) , PROnet (pronet) , AX.25 (ax25) and NET/ROM
                 (netrom).

          -a     Use alternate BSD style output format (with no fixed
                 columns).

          -e     Use default Linux style output format (with fixed
                 columns).

          -D, --use-device
                 Instead of a hw_addr, the given argument is the name of an
                 interface.  arp will use the MAC address of that interface
                 for the table entry. This is usually the best option to
                 set up a proxy ARP entry to yourself.

          -i If, --device If
                 Select an interface. When dumping the ARP cache only
                 entries matching the specified interface will be printed.
                 When setting a permanent or temp ARP entry this interface
                 will be associated with the entry; if this option is not
                 used, the kernel will guess based on the routing table.
                 For pub entries the specified interface is the interface
                 on which ARP requests will be answered.
                 NOTE: This has to be different from the interface to which
                 the IP datagrams will be routed.  NOTE: As of kernel 2.2.0
                 it is no longer possible to set an ARP entry for an entire
                 subnet. Linux instead does automagic proxy arp when a
                 route exists and it is forwarding. See arp(7) for details.
                 Also the dontpub option which is available for delete and
                 set operations cannot be used with 2.4 and newer kernels.

          -f filename, --file filename
                 Similar to the -s option, only this time the address info
                 is taken from file filename.  This can be used if ARP
                 entries for a lot of hosts have to be set up.  The name of
                 the data file is very often /etc/ethers, but this is not
                 official. If no filename is specified /etc/ethers is used
                 as default.

                 The format of the file is simple; it only contains ASCII
                 text lines with a hostname, and a hardware address
                 separated by whitespace. Additionally the pub, temp and
                 netmask flags can be used.

          In all places where a hostname is expected, one can also enter an
          IP address in dotted-decimal notation.

          As a special case for compatibility the order of the hostname and
          the hardware address can be exchanged.

          Each complete entry in the ARP cache will be marked with the C
          flag. Permanent entries are marked with M and published entries
          have the P flag.


---------------------------------------------------------

::

          /usr/sbin/arp -i eth0 -Ds 10.0.0.2 eth1 pub

          This will answer ARP requests for 10.0.0.2 on eth0 with the MAC
          address for eth1.

          /usr/sbin/arp -i eth1 -d 10.0.0.1

          Delete the ARP table entry for 10.0.0.1 on interface eth1. This
          will match published proxy ARP entries and permanent entries.


---------------------------------------------------

::

          /proc/net/arp
          /etc/networks
          /etc/hosts
          /etc/ethers


---------------------------------------------------------

::

          ethers(5), rarp(8), route(8), ifconfig(8), netstat(8)


-------------------------------------------------------

::

          Fred N. van Kempen <waltje@uwalt.nl.mugnet.org>, Bernd Eckenfels
          <net-tools@lina.inka.de>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the net-tools (networking utilities)
          project.  Information about the project can be found at 
          ⟨http://net-tools.sourceforge.net/⟩.  If you have a bug report for
          this manual page, see ⟨http://net-tools.sourceforge.net/⟩.  This
          page was obtained from the project's upstream Git repository
          ⟨git://git.code.sf.net/p/net-tools/code⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-04-22.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   net-tools                      2008-10-03                         ARP(8)

--------------

Pages that refer to this page: `ethers(5) <../man5/ethers.5.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`ifconfig(8) <../man8/ifconfig.8.html>`__, 
`rarp(8) <../man8/rarp.8.html>`__,  `route(8) <../man8/route.8.html>`__

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
