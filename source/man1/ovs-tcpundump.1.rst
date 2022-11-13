.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ovs-tcpundump(1) — Linux manual page
====================================

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

   ovs-tcpundump(1)           Open vSwitch Manual          ovs-tcpundump(1)

NAME
-------------------------------------------------

::

          ovs-tcpundump - convert ``tcpdump -xx'' output to hex strings


---------------------------------------------------------

::

          ovs-tcpundump < file

          Common options:
                 [-h | --help] [-V | --version]


---------------------------------------------------------------

::

          The ovs-tcpundump program reads tcpdump -xx output on stdin,
          looking for hexadecimal packet data, and dumps each Ethernet as a
          single hexadecimal string on stdout.  This format is suitable for
          use with the ofproto/trace command supported by ovs-vswitchd(8)
          via ovs-appctl(8).

          At least two -x or -X options must be given, otherwise the output
          will omit the Ethernet header, which prevents the output from
          being using with ofproto/trace.


-------------------------------------------------------

::

          -h
          --help Prints a brief help message to the console.

          -V
          --version
                 Prints version information to the console.


---------------------------------------------------------

::

          ovs-appctl(8), ovs-vswitchd(8), ovs-pcap(1), tcpdump(8),
          wireshark(8).

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

   Open vSwitch                     2.11.90                ovs-tcpundump(1)

--------------

Pages that refer to this page:
`ovs-pcap(1) <../man1/ovs-pcap.1.html>`__, 
`ovs-tcpdump(8) <../man8/ovs-tcpdump.8.html>`__, 
`ovs-vswitchd(8) <../man8/ovs-vswitchd.8.html>`__

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
