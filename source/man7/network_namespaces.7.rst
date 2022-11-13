.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

network_namespaces(7) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NETWORK_NAMESPACES(7)   Linux Programmer's Manual  NETWORK_NAMESPACES(7)

NAME
-------------------------------------------------

::

          network_namespaces - overview of Linux network namespaces


---------------------------------------------------------------

::

          Network namespaces provide isolation of the system resources
          associated with networking: network devices, IPv4 and IPv6
          protocol stacks, IP routing tables, firewall rules, the /proc/net
          directory (which is a symbolic link to /proc/PID/net), the
          /sys/class/net directory, various files under /proc/sys/net, port
          numbers (sockets), and so on.  In addition, network namespaces
          isolate the UNIX domain abstract socket namespace (see unix(7)).

          A physical network device can live in exactly one network
          namespace.  When a network namespace is freed (i.e., when the
          last process in the namespace terminates), its physical network
          devices are moved back to the initial network namespace (not to
          the parent of the process).

          A virtual network (veth(4)) device pair provides a pipe-like
          abstraction that can be used to create tunnels between network
          namespaces, and can be used to create a bridge to a physical
          network device in another namespace.  When a namespace is freed,
          the veth(4) devices that it contains are destroyed.

          Use of network namespaces requires a kernel that is configured
          with the CONFIG_NET_NS option.


---------------------------------------------------------

::

          nsenter(1), unshare(1), clone(2), veth(4), proc(5), sysfs(5),
          namespaces(7), user_namespaces(7), brctl(8), ip(8),
          ip-address(8), ip-link(8), ip-netns(8), iptables(8), ovs-vsctl(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2020-06-09          NETWORK_NAMESPACES(7)

--------------

Pages that refer to this page: `nsenter(1) <../man1/nsenter.1.html>`__, 
`unshare(1) <../man1/unshare.1.html>`__, 
`clone(2) <../man2/clone.2.html>`__, 
`veth(4) <../man4/veth.4.html>`__,  `proc(5) <../man5/proc.5.html>`__, 
`systemd.socket(5) <../man5/systemd.socket.5.html>`__, 
`namespaces(7) <../man7/namespaces.7.html>`__, 
`rdma-system(8) <../man8/rdma-system.8.html>`__

--------------

`Copyright and license for this manual
page <../man7/network_namespaces.7.license.html>`__

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
