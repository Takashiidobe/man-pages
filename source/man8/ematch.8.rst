.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tc-ematch(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `MATCHES <#MATCHES>`__ \|         |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `EXAM                             |                                   |
| PLE & USAGE <#EXAMPLE_&_USAGE>`__ |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ematch(8)                         Linux                        ematch(8)

NAME
-------------------------------------------------

::

          ematch - extended matches for use with "basic", "cgroup"  or
          "flow" filters


---------------------------------------------------------

::

          tc filter add .. basic match EXPR .. flowid ..

          EXPR := TERM [ { and | or } EXPR ]

          TERM := [ not ] { MATCH | '(' EXPR ')' }

          MATCH := module '(' ARGS ')'

          ARGS := ARG1 ARG2 ..


-------------------------------------------------------

::

      cmp
          Simple comparison ematch: arithmetic compare of packet data to a
          given value.

          cmp( ALIGN at OFFSET [ ATTRS ] { eq | lt | gt } VALUE )

          ALIGN := { u8 | u16 | u32 }

          ATTRS := [ layer LAYER ] [ mask MASK ] [ trans ]

          LAYER := { link | network | transport | 0..2 }

      meta
          Metadata ematch

          meta( OBJECT { eq | lt |gt } OBJECT )

          OBJECT := { META_ID |  VALUE }

          META_ID := id [ shift SHIFT ] [ mask MASK ]

          meta attributes:

                 random 32 bit random value

                 loadavg_1 Load average in last 5 minutes

                 nf_mark Netfilter mark

                 vlan Vlan tag

                 sk_rcvbuf Receive buffer size

                 sk_snd_queue Send queue length

          A full list of meta attributes can be obtained via

          # tc filter add dev eth1 basic match 'meta(list)'

      nbyte
          match packet data byte sequence

          nbyte( NEEDLE at OFFSET [ layer LAYER ] )

          NEEDLE := { string | c-escape-sequence  }

          OFFSET := int

          LAYER := { link | network | transport | 0..2 }

      u32
          u32 ematch

          u32( ALIGN VALUE MASK at [ nexthdr+ ] OFFSET )

          ALIGN := { u8 | u16 | u32 }

      ipset
          test packet against ipset membership

          ipset( SETNAME FLAGS )

          SETNAME := string

          FLAGS := { FLAG [, FLAGS] }

          The flag options are the same as those used by the iptables "set"
          match.

          When using the ipset ematch with the "ip_set_hash:net,iface" set
          type, the interface can be queried using "src,dst (source ip
          address, outgoing interface) or "src,src" (source ip address,
          incoming interface) syntax.

      ipt
          test packet against xtables matches

          ipt( [-6] -m MATCH_NAME FLAGS )

          MATCH_NAME := string

          FLAGS := { FLAG [, FLAGS] }

          The flag options are the same as those used by the xtable match
          used.

      canid
          ematch rule to match CAN frames

          canid( IDLIST )

          IDLIST :=  IDSPEC[IDLIST]

          IDSPEC := { ’sff’ CANID | ’eff’ CANID }

          CANID := ID[:MASK]

          ID, MASK := hexadecimal number (i.e. 0x123)


-------------------------------------------------------

::

          The ematch syntax uses '(' and ')' to group expressions. All
          braces need to be escaped properly to prevent shell commandline
          from interpreting these directly.

          When using the ipset ematch with the "ifb" device, the outgoing
          device will be the ifb device itself, e.g. "ifb0".  The original
          interface (i.e. the device the packet arrived on) is treated as
          the incoming interface.


-----------------------------------------------------------------------

::

          # tc filter add .. basic match ...

          # 'cmp(u16 at 3 layer 2 mask 0xff00 gt 20)'

          # 'meta(nfmark gt 24)' and 'meta(tcindex mask 0xf0 eq 0xf0)'

          # 'nbyte("ababa" at 12 layer 1)'

          # 'u32(u16 0x1122 0xffff at nexthdr+4)'

          Check if packet source ip address is member of set named bulk:

          # 'ipset(bulk src)'

          Check if packet source ip and the interface the packet arrived on
          is member of "hash:net,iface" set named interactive:

          # 'ipset(interactive src,src)'

          Check if packet matches an IPSec state with reqid 1:

          # 'ipt(-m policy --dir in --pol ipsec --reqid 1)'


-----------------------------------------------------

::

          The extended match infrastructure was added by Thomas Graf.

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

   iproute2                      6 August 2012                    ematch(8)

--------------

Pages that refer to this page: `tc(8) <../man8/tc.8.html>`__, 
`tc-basic(8) <../man8/tc-basic.8.html>`__, 
`tc-bpf(8) <../man8/tc-bpf.8.html>`__, 
`tc-cgroup(8) <../man8/tc-cgroup.8.html>`__, 
`tc-flow(8) <../man8/tc-flow.8.html>`__

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
