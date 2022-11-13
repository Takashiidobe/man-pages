.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tc-ife(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IFE action in tc(8)               Linux              IFE action in tc(8)

NAME
-------------------------------------------------

::

          IFE - encapsulate/decapsulate metadata


---------------------------------------------------------

::

          tc ...  action ife DIRECTION [ ACTION ] [ dst DMAC ] [ src SMAC ]
                  [ type TYPE ] [ CONTROL ] [ index INDEX ]

          DIRECTION := { decode | encode }

          ACTION := { allow ATTR | use ATTR value }

          ATTR := { mark | prio | tcindex }

          CONTROL := { reclassify | use | pipe | drop | continue | ok |
                  goto chain CHAIN_INDEX }


---------------------------------------------------------------

::

          The ife action allows for a sending side to encapsulate arbitrary
          metadata, which is then decapsulated by the receiving end. The
          sender runs in encoding mode and the receiver in decode mode.
          Both sender and receiver must specify the same ethertype. In the
          future, a registered ethertype may be available as a default.


-------------------------------------------------------

::

          decode For the receiving side; decode the metadata if the packet
                 matches.

          encode For the sending side. Encode the specified metadata if the
                 packet matches.

          allow  Encode direction only. Allows encoding specified metadata.

          use    Encode direction only. Enforce static encoding of
                 specified metadata.

          mark [ u32_value ] The value to set for the skb mark. The u32
                 value is required only when use is specified. If mark
                 value is zero, it will not be encoded, instead
                 "overlimits" statistics increment and CONTROL action is
                 taken.

          prio [ u32_value ] The value to set for priority in the skb
                 structure. The u32 value is required only when use is
                 specified.

          tcindex [
                 u16_value ] Value to set for the traffic control index in
                 the skb structure. The u16 value is required only when use
                 is specified.

          dmac DMAC
          smac SMAC
                 Optional six byte destination or source MAC address to
                 encode.

          type TYPE
                 Optional 16-bit ethertype to encode. If not specified
                 value of 0xED3E will be used.

          CONTROL
                 Action to take following an encode/decode.

          index INDEX
                 Assign a unique ID to this action instead of letting the
                 kernel choose one automatically.  INDEX is a 32bit
                 unsigned integer greater than zero.


---------------------------------------------------------

::

          On the receiving side, match packets with ethertype 0xdead and
          restart classification so that it will match ICMP on the next
          rule, at prio 3:
                 # tc qdisc add dev eth0 handle ffff: ingress
                 # tc filter add dev eth0 parent ffff: prio 2 protocol 0xdead \
                      u32 match u32 0 0 flowid 1:1 \
                      action ife decode reclassify
                 # tc filter add dev eth0 parent ffff: prio 3 protocol ip \
                      u32 match ip protocol 0xff flowid 1:1 \
                      action continue

          Match with skb mark of 17:

                 # tc filter add dev eth0 parent ffff: prio 4 protocol ip \
                      handle 0x11 fw flowid 1:1 \
                      action ok

          Configure the sending side to encode for the filters above. Use a
          destination IP address of 192.168.122.237/24, then tag with skb
          mark of decimal 17. Encode the packaet with ethertype 0xdead, add
          skb->mark to whitelist of metadatum to send, and rewrite the
          destination MAC address to 02:15:15:15:15:15.

                 # tc qdisc add dev eth0 root handle 1: prio
                 # tc filter add dev eth0 parent 1: protocol ip prio 10 u32 \
                      match ip dst 192.168.122.237/24 \
                      match ip protocol 1 0xff \
                      flowid 1:2 \
                      action skbedit mark 17 \
                      action ife encode \
                      type 0xDEAD \
                      allow mark \
                      dst 02:15:15:15:15:15


---------------------------------------------------------

::

          tc(8), tc-u32(8)

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

   iproute2                       22 Apr 2016           IFE action in tc(8)

--------------

Pages that refer to this page:
`tc-actions(8) <../man8/tc-actions.8.html>`__

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
