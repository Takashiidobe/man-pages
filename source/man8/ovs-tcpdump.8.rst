.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ovs-tcpdump(8) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ovs-tcpdump(8)             Open vSwitch Manual            ovs-tcpdump(8)

NAME
-------------------------------------------------

::

          ovs-tcpdump - Dump traffic from an Open vSwitch port using
          tcpdump.


---------------------------------------------------------

::

          ovs-tcpdump -i port tcpdump options...


---------------------------------------------------------------

::

          ovs-tcpdump creates switch mirror ports in the ovs-vswitchd
          daemon and executes tcpdump to listen against those ports. When
          the tcpdump instance exits, it then cleans up the mirror port it
          created.

          ovs-tcpdump will not allow multiple mirrors for the same port. It
          has some logic to parse the current configuration and prevent
          duplicate mirrors.

          The -i option may not appear multiple times.

          It is important to note that under Linux based kernels, tap
          devices do not receive packets unless the specific tuntap device
          has been opened by an application. This requires CAP_NET_ADMIN
          privileges, so the ovs-tcpdump command must be run as a user with
          such permissions (this is usually a super-user).


-------------------------------------------------------

::

          -h
          --help Prints a brief help message to the console.

          -V
          --version
                 Prints version information to the console.

          --db-sock
                 The Open vSwitch database socket connection string. The
                 default is unix:/usr/local/var/run/openvswitch/db.sock

          --dump-cmd
                 The command to run instead of tcpdump.

          -i
          --interface
                 The interface for which a mirror port should be created,
                 and packets should be dumped.

          --mirror-to
                 The name of the interface which should be the destination
                 of the mirrored packets. The default is miINTERFACE

          --span If specified, mirror all ports (optional).


---------------------------------------------------------

::

          ovs-appctl(8), ovs-vswitchd(8), ovs-pcap(1), ovs-tcpundump(1),
          tcpdump(8), wireshark(8).

COLOPHON
---------------------------------------------------------

::

          This page is part of the Open vSwitch (a distributed virtual
          multilayer switch) project.  Information about the project can be
          found at ⟨http://openvswitch.org/⟩.  If you have a bug report for
          this manual page, send it to bugs@openvswitch.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/openvswitch/ovs.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-20.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Open vSwitch                     2.11.90                  ovs-tcpdump(8)

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
