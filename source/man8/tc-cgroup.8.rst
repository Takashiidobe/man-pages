.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tc-cgroup(8) — Linux manual page
================================

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

   Cgroup classifier in tc(8)        Linux       Cgroup classifier in tc(8)

NAME
-------------------------------------------------

::

          cgroup - control group based traffic control filter


---------------------------------------------------------

::

          tc filter ... cgroup [ match EMATCH_TREE ] [ action ACTION_SPEC ]


---------------------------------------------------------------

::

          This filter serves as a hint to tc that the assigned class ID of
          the net_cls control group the process the packet originates from
          belongs to should be used for classification. Obviously, it is
          useful for locally generated packets only.


-------------------------------------------------------

::

          action ACTION_SPEC
                 Apply an action from the generic actions framework on
                 matching packets.

          match EMATCH_TREE
                 Match packets using the extended match infrastructure. See
                 tc-ematch(8) for a detailed description of the allowed
                 syntax in EMATCH_TREE.


---------------------------------------------------------

::

          In order to use this filter, a net_cls control group has to be
          created first and class as well as process ID(s) assigned to it.
          The following creates a net_cls cgroup named "foobar":

                 modprobe cls_cgroup
                 mkdir /sys/fs/cgroup/net_cls
                 mount -t cgroup -onet_cls net_cls /sys/fs/cgroup/net_cls
                 mkdir /sys/fs/cgroup/net_cls/foobar

          To assign a class ID to the created cgroup, a file named
          net_cls.classid has to be created which contains the class ID to
          be assigned as a hexadecimal, 64bit wide number. The upper 32bits
          are reserved for the major handle, the remaining hold the minor.
          So a class ID of e.g.  ff:be has to be written like so: 0xff00be
          (leading zeroes may be omitted). To continue the above example,
          the following assigns class ID 1:2 to foobar cgroup:

                 echo 0x10002 > /sys/fs/cgroup/net_cls/foobar/net_cls.classid

          Finally some PIDs can be assigned to the given cgroup:

                 echo 1234 > /sys/fs/cgroup/net_cls/foobar/tasks
                 echo 5678 > /sys/fs/cgroup/net_cls/foobar/tasks

          Now by simply attaching a cgroup filter to a qdisc makes packets
          from PIDs 1234 and 5678 be pushed into class 1:2.


---------------------------------------------------------

::

          tc(8), tc-ematch(8),
          the file Documentation/cgroups/net_cls.txt of the Linux kernel
          tree

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

   iproute2                       21 Oct 2015    Cgroup classifier in tc(8)

--------------

Pages that refer to this page: `tc(8) <../man8/tc.8.html>`__

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
