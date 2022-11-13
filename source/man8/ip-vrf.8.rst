.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ip-vrf(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IP-VRF(8)                         Linux                        IP-VRF(8)

NAME
-------------------------------------------------

::

          ip-vrf - run a command against a vrf


---------------------------------------------------------

::

          ip vrf  { COMMAND | help }

          ip vrf show [ NAME ]

          ip vrf identify [ PID ]

          ip vrf pids NAME

          ip vrf exec [ NAME ] command...


---------------------------------------------------------------

::

          A VRF provides traffic isolation at layer 3 for routing, similar
          to how a VLAN is used to isolate traffic at layer 2.
          Fundamentally, a VRF is a separate routing table. Network devices
          are associated with a VRF by enslaving the device to the VRF. At
          that point network addresses assigned to the device are local to
          the VRF with host and connected routes moved to the table
          associated with the VRF.

          A process can specify a VRF using several APIs -- binding the
          socket to the VRF device using SO_BINDTODEVICE, setting the VRF
          association using IP_UNICAST_IF or IPV6_UNICAST_IF, or specifying
          the VRF for a specific message using IP_PKTINFO or IPV6_PKTINFO.

          By default a process is not bound to any VRF. An association can
          be set explicitly by making the program use one of the APIs
          mentioned above or implicitly using a helper to set
          SO_BINDTODEVICE for all IPv4 and IPv6 sockets (AF_INET and
          AF_INET6) when the socket is created. This ip-vrf command is a
          helper to run a command against a specific VRF with the VRF
          association inherited parent to child.

          ip vrf show [ NAME ] - Show all configured VRF

                 This command lists all VRF and their corresponding table
                 ids. If NAME is given, then only that VRF and table id is
                 shown. The latter command is useful for scripting where
                 the table id for a VRF is needed.

          ip vrf exec [ NAME ] cmd ... - Run cmd against the named VRF

                 This command allows applications that are VRF unaware to
                 be run against a VRF other than the default VRF (main
                 table). A command can be run against the default VRF by
                 passing the "default" as the VRF name. This is useful if
                 the current shell is associated with another VRF (e.g,
                 Management VRF).

                 This command requires the system to be booted with cgroup
                 v2 (e.g. with systemd, add
                 systemd.unified_cgroup_hierarchy=1 to the kernel command
                 line).

                 This command also requires to be ran as root or with the
                 CAP_SYS_ADMIN, CAP_NET_ADMIN and CAP_DAC_OVERRIDE
                 capabilities. If built with libcap and if capabilities are
                 added to the ip binary program via setcap, the program
                 will drop them as the first thing when invoked, unless the
                 command is vrf exec.
                 NOTE: capabilities will NOT be dropped if CAP_NET_ADMIN is
                 set to INHERITABLE to avoid breaking programs with ambient
                 capabilities that call ip.  Do not set the INHERITABLE
                 flag on the ip binary itself.

          ip vrf identify [PID] - Report VRF association for process

                 This command shows the VRF association of the specified
                 process. If PID is not specified then the id of the
                 current process is used.

          ip vrf pids NAME - Report processes associated with the named VRF

                 This command shows all process ids that are associated
                 with the given VRF.


-------------------------------------------------------

::

          This command requires a kernel compiled with CGROUPS and
          CGROUP_BPF enabled.

          The VRF helper *only* affects network layer sockets.


---------------------------------------------------------

::

          ip vrf exec red ssh 10.100.1.254
                 Executes ssh to 10.100.1.254 against the VRF red table.


---------------------------------------------------------

::

          ip(8), ip-link(8), ip-address(8), ip-route(8), ip-neighbor(8)


-----------------------------------------------------

::

          Original Manpage by David Ahern

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

   iproute2                       7 Dec 2016                      IP-VRF(8)

--------------

Pages that refer to this page: `ip(8) <../man8/ip.8.html>`__

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
