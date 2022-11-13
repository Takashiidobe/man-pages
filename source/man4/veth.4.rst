.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

veth(4) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   VETH(4)                 Linux Programmer's Manual                VETH(4)

NAME
-------------------------------------------------

::

          veth - Virtual Ethernet Device


---------------------------------------------------------------

::

          The veth devices are virtual Ethernet devices.  They can act as
          tunnels between network namespaces to create a bridge to a
          physical network device in another namespace, but can also be
          used as standalone network devices.

          veth devices are always created in interconnected pairs.  A pair
          can be created using the command:

              # ip link add <p1-name> type veth peer name <p2-name>

          In the above, p1-name and p2-name are the names assigned to the
          two connected end points.

          Packets transmitted on one device in the pair are immediately
          received on the other device.  When either devices is down the
          link state of the pair is down.

          veth device pairs are useful for combining the network facilities
          of the kernel together in interesting ways.  A particularly
          interesting use case is to place one end of a veth pair in one
          network namespace and the other end in another network namespace,
          thus allowing communication between network namespaces.  To do
          this, one can provide the netns parameter when creating the
          interfaces:

              # ip link add <p1-name> netns <p1-ns> type veth peer <p2-name> netns <p2-ns>

          or, for an existing veth pair, move one side to the other
          namespace:

              # ip link set <p2-name> netns <p2-ns>

          ethtool(8) can be used to find the peer of a veth network
          interface, using commands something like:

              # ip link add ve_A type veth peer name ve_B   # Create veth pair
              # ethtool -S ve_A         # Discover interface index of peer
              NIC statistics:
                   peer_ifindex: 16
              # ip link | grep '^16:'   # Look up interface
              16: ve_B@ve_A: <BROADCAST,MULTICAST,M-DOWN> mtu 1500 qdisc ...


---------------------------------------------------------

::

          clone(2), network_namespaces(7), ip(8), ip-link(8), ip-netns(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                        VETH(4)

--------------

Pages that refer to this page:
`network_namespaces(7) <../man7/network_namespaces.7.html>`__

--------------

`Copyright and license for this manual
page <../man4/veth.4.license.html>`__

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
