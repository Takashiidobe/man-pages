.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ip-netns(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IP-NETNS(8)                       Linux                      IP-NETNS(8)

NAME
-------------------------------------------------

::

          ip-netns - process network namespace management


---------------------------------------------------------

::

          ip [ OPTIONS ] netns  { COMMAND | help }

          ip netns [ list ]

          ip netns add NETNSNAME

          ip netns attach NETNSNAME PID

          ip [-all] netns del [ NETNSNAME ]

          ip netns set NETNSNAME NETNSID

          NETNSID := auto | POSITIVE-INT

          ip netns identify [ PID ]

          ip netns pids NETNSNAME

          ip [-all] netns exec [ NETNSNAME ] command...

          ip netns monitor

          ip netns list-id [ target-nsid POSITIVE-INT ] [ nsid POSITIVE-INT
                  ]


---------------------------------------------------------------

::

          A network namespace is logically another copy of the network
          stack, with its own routes, firewall rules, and network devices.

          By default a process inherits its network namespace from its
          parent. Initially all the processes share the same default
          network namespace from the init process.

          By convention a named network namespace is an object at
          /var/run/netns/NAME that can be opened. The file descriptor
          resulting from opening /var/run/netns/NAME refers to the
          specified network namespace. Holding that file descriptor open
          keeps the network namespace alive. The file descriptor can be
          used with the setns(2) system call to change the network
          namespace associated with a task.

          For applications that are aware of network namespaces, the
          convention is to look for global network configuration files
          first in /etc/netns/NAME/ then in /etc/.  For example, if you
          want a different version of /etc/resolv.conf for a network
          namespace used to isolate your vpn you would name it
          /etc/netns/myvpn/resolv.conf.

          ip netns exec automates handling of this configuration, file
          convention for network namespace unaware applications, by
          creating a mount namespace and bind mounting all of the per
          network namespace configure files into their traditional location
          in /etc.

          ip netns list - show all of the named network namespaces

                 This command displays all of the network namespaces in
                 /var/run/netns

          ip netns add NAME - create a new named network namespace

                 If NAME is available in /var/run/netns this command
                 creates a new network namespace and assigns NAME.

          ip netns attach NAME PID - create a new named network namespace

                 If NAME is available in /var/run/netns this command
                 attaches the network namespace of the process PID to NAME
                 as if it were created with ip netns.

          ip [-all] netns delete [ NAME ] - delete the name of a network
          namespace(s)

                 If NAME is present in /var/run/netns it is umounted and
                 the mount point is removed. If this is the last user of
                 the network namespace the network namespace will be freed
                 and all physical devices will be moved to the default one,
                 otherwise the network namespace persists until it has no
                 more users. ip netns delete may fail if the mount point is
                 in use in another mount namespace.

                 If -all option was specified then all the network
                 namespace names will be removed.

                 It is possible to lose the physical device when it was
                 moved to netns and then this netns was deleted with a
                 running process:

                    $ ip netns add net0
                    $ ip link set dev eth0 netns net0
                    $ ip netns exec net0 SOME_PROCESS_IN_BACKGROUND
                    $ ip netns del net0

                 and eth0 will appear in the default netns only after
                 SOME_PROCESS_IN_BACKGROUND will exit or will be killed. To
                 prevent this the processes running in net0 should be
                 killed before deleting the netns:

                    $ ip netns pids net0 | xargs kill
                    $ ip netns del net0

          ip netns set NAME NETNSID - assign an id to a peer network
          namespace

                 This command assigns a id to a peer network namespace.
                 This id is valid only in the current network namespace.
                 If the keyword "auto" is specified an available nsid will
                 be chosen.  This id will be used by the kernel in some
                 netlink messages. If no id is assigned when the kernel
                 needs it, it will be automatically assigned by the kernel.
                 Once it is assigned, it's not possible to change it.

          ip netns identify [PID] - Report network namespaces names for
          process

                 This command walks through /var/run/netns and finds all
                 the network namespace names for network namespace of the
                 specified process, if PID is not specified then the
                 current process will be used.

          ip netns pids NAME - Report processes in the named network
          namespace

                 This command walks through proc and finds all of the
                 process who have the named network namespace as their
                 primary network namespace.

          ip [-all] netns exec [ NAME ] cmd ... - Run cmd in the named
          network namespace

                 This command allows applications that are network
                 namespace unaware to be run in something other than the
                 default network namespace with all of the configuration
                 for the specified network namespace appearing in the
                 customary global locations. A network namespace and bind
                 mounts are used to move files from their network namespace
                 specific location to their default locations without
                 affecting other processes.

                 If -all option was specified then cmd will be executed
                 synchronously on the each named network namespace even if
                 cmd fails on some of them. Network namespace name is
                 printed on each cmd executing.

          ip netns monitor - Report as network namespace names are added
          and deleted

                 This command watches network namespace name addition and
                 deletion events and prints a line for each event it sees.

          ip netns list-id [target-nsid POSITIVE-INT] [nsid POSITIVE-INT] -
          list network namespace ids (nsid)

                 Network namespace ids are used to identify a peer network
                 namespace. This command displays nsids of the current
                 network namespace and provides the corresponding iproute2
                 netns name (from /var/run/netns) if any.

                 The target-nsid option enables to display nsids of the
                 specified network namespace instead of the current network
                 namespace. This target-nsid is a nsid from the current
                 network namespace.

                 The nsid option enables to display only this nsid. It is a
                 nsid from the current network namespace. In combination
                 with the target-nsid option, it enables to convert a
                 specific nsid from the current network namespace to a nsid
                 of the target-nsid network namespace.


---------------------------------------------------------

::

          ip netns list
                 Shows the list of current named network namespaces

          ip netns add vpn
                 Creates a network namespace and names it vpn

          ip netns exec vpn ip link set lo up
                 Bring up the loopback interface in the vpn network
                 namespace.

          ip netns add foo
          ip netns add bar
          ip netns set foo 12
          ip netns set bar 13
          ip -n foo netns set foo 22
          ip -n foo netns set bar 23
          ip -n bar netns set foo 32
          ip -n bar netns set bar 33
          ip netns list-id target-nsid 12
                 Shows the list of nsids from the network namespace foo.
          ip netns list-id target-nsid 12 nsid 13
                 Get nsid of bar from the network namespace foo (result is
                 23).


---------------------------------------------------------

::

          ip(8)


-----------------------------------------------------

::

          Original Manpage by Eric W. Biederman
          Manpage revised by Nicolas Dichtel <nicolas.dichtel@6wind.com>

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

   iproute2                       16 Jan 2013                   IP-NETNS(8)

--------------

Pages that refer to this page:
`systemd-nspawn(1) <../man1/systemd-nspawn.1.html>`__, 
`veth(4) <../man4/veth.4.html>`__, 
`network_namespaces(7) <../man7/network_namespaces.7.html>`__, 
`ip(8) <../man8/ip.8.html>`__,  `ip-link(8) <../man8/ip-link.8.html>`__

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
