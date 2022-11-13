.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

arpd(8) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SIGNALS <#SIGNALS>`__ \|         |                                   |
| `NOTE <#NOTE>`__ \|               |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ARPD(8)                  System Manager's Manual                 ARPD(8)

NAME
-------------------------------------------------

::

          arpd - userspace arp daemon.


---------------------------------------------------------

::

          Usage: arpd [ -lkh? ] [ -a N ] [ -b dbase ] [ -B number ] [ -f
          file ] [-p interval ] [ -n time ] [ -R rate ] [ <INTERFACES> ]


---------------------------------------------------------------

::

          The arpd daemon collects gratuitous ARP information, saving it on
          local disk and feeding it to the kernel on demand to avoid
          redundant broadcasting due to limited size of the kernel ARP
          cache.


-------------------------------------------------------

::

          -h -?  Print help

          -l     Dump the arpd database to stdout and exit. The output
                 consists of three columns: the interface index, the IP
                 address of the interface, and the MAC address of the
                 interface. Negative entries for dead hosts are also shown,
                 in this case the MAC address is replaced by the word
                 FAILED followed by a colon and the most recent time when
                 the fact that the host is dead was proven.

          -f <FILE>
                 Read and load an arpd database from FILE in a text format
                 similar to that dumped by option -l. Exit after load,
                 possibly listing resulting database, if option -l is also
                 given. If FILE is -, stdin is read to get the ARP table.

          -b <DATABASE>
                 the location of the database file. The default location is
                 /var/lib/arpd/arpd.db

          -a <NUMBER>
                 With this option, arpd not only passively listens for ARP
                 packets on the interface, but also sends broadcast queries
                 itself. NUMBER is the number of such queries to make
                 before a destination is considered dead. When arpd is
                 started as kernel helper (i.e. with app_solicit enabled in
                 sysctl or even with option -k) without this option and
                 still did not learn enough information, you can observe 1
                 second gaps in service. Not fatal, but not good.

          -k     Suppress sending broadcast queries by the kernel. This
                 option only makes sense together with option -a.

          -n <TIME>
                 Specifies the timeout of the negative cache. When
                 resolution fails, arpd suppresses further attempts to
                 resolve for this period. This option only makes sense
                 together with option '-k'. This timeout should not be too
                 much longer than the boot time of a typical host not
                 supporting gratuitous ARP. Default value is 60 seconds.

          -p <TIME>
                 The time to wait in seconds between polling attempts to
                 the kernel ARP table. TIME may be a floating point number.
                 The default value is 30.

          -R <RATE>
                 Maximal steady rate of broadcasts sent by arpd in packets
                 per second. Default value is 1.

          -B <NUMBER>
                 The number of broadcasts sent by arpd back to back.
                 Default value is 3. Together with the -R option, this
                 option ensures that the number of ARP queries that are
                 broadcast does not exceed B+R*T over any interval of time
                 T.

          <INTERFACES> is a list of names of networking interfaces to
          watch. If no interfaces are given, arpd monitors all the
          interfaces. In this case arpd does not adjust sysctl parameters,
          it is assumed that the user does this himself after arpd is
          started.


-------------------------------------------------------

::

          When arpd receives a SIGINT or SIGTERM signal, it exits
          gracefully, syncing the database and restoring adjusted sysctl
          parameters. On a SIGHUP it syncs the database to disk. With
          SIGUSR1 it sends some statistics to syslog. The effect of any
          other signals is undefined. In particular, they may corrupt the
          database and leave the sysctl parameters in an unpredictable
          state.


-------------------------------------------------

::

          In order for arpd to be able to serve as ARP resolver, the kernel
          must be compiled with the option CONFIG_ARPD and, in the case
          when interface list in not given on command line, variable
          app_solicit on interfaces of interest should be in
          /proc/sys/net/ipv4/neigh/*. If this is not made arpd still
          collects gratuitous ARP information in its database.


---------------------------------------------------------

::

          arpd -b /var/tmp/arpd.db
                 Start arpd to collect gratuitous ARP, but not messing with
                 kernel functionality.

          killall arpd ; arpd -l -b /var/tmp/arpd.db
                 Look at result after some time.

          arpd -b /var/tmp/arpd.db -a 1 eth0 eth1
                 Enable kernel helper, leaving leading role to kernel.

          arpd -b /var/tmp/arpd.db -a 3 -k eth0 eth1
                 Completely replace kernel resolution on interfaces eth0
                 and eth1. In this case the kernel still does unicast
                 probing to validate entries, but all the broadcast
                 activity is suppressed and made under authority of arpd.

          This is the mode in which arpd normally is supposed to work. It
          is not the default to prevent occasional enabling of too
          aggressive a mode.

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

                                 28 June, 2007                      ARPD(8)

--------------

Pages that refer to this page: `arp(7) <../man7/arp.7.html>`__

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
