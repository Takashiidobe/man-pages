.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tc-mirred(8) — Linux manual page
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

   Mirror/redirect action in tc(8)   Linux  Mirror/redirect action in tc(8)

NAME
-------------------------------------------------

::

          mirred - mirror/redirect action


---------------------------------------------------------

::

          tc ... action mirred DIRECTION ACTION [ index INDEX ] dev
                  DEVICENAME

          DIRECTION := { ingress | egress }

          ACTION := { mirror | redirect }


---------------------------------------------------------------

::

          The mirred action allows packet mirroring (copying) or
          redirecting (stealing) the packet it receives. Mirroring is what
          is sometimes referred to as Switch Port Analyzer (SPAN) and is
          commonly used to analyze and/or debug flows.


-------------------------------------------------------

::

          ingress
          egress Specify the direction in which the packet shall appear on
                 the destination interface.

          mirror
          redirect
                 Define whether the packet should be copied (mirror) or
                 moved (redirect) to the destination interface.

          index INDEX
                 Assign a unique ID to this action instead of letting the
                 kernel choose one automatically.  INDEX is a 32bit
                 unsigned integer greater than zero.

          dev DEVICENAME
                 Specify the network interface to redirect or mirror to.


---------------------------------------------------------

::

          Limit ingress bandwidth on eth0 to 1mbit/s, redirect exceeding
          traffic to lo for debugging purposes:

                 # tc qdisc add dev eth0 handle ffff: ingress
                 # tc filter add dev eth0 parent ffff: u32 \
                      match u32 0 0 \
                      action police rate 1mbit burst 100k conform-exceed pipe \
                      action mirred egress redirect dev lo

          Mirror all incoming ICMP packets on eth0 to a dummy interface for
          examination with e.g. tcpdump:

                 # ip link add dummy0 type dummy
                 # ip link set dummy0 up
                 # tc qdisc add dev eth0 handle ffff: ingress
                 # tc filter add dev eth0 parent ffff: protocol ip \
                      u32 match ip protocol 1 0xff \
                      action mirred egress mirror dev dummy0

          Using an ifb interface, it is possible to send ingress traffic
          through an instance of sfq:

                 # modprobe ifb
                 # ip link set ifb0 up
                 # tc qdisc add dev ifb0 root sfq
                 # tc qdisc add dev eth0 handle ffff: ingress
                 # tc filter add dev eth0 parent ffff: u32 \
                      match u32 0 0 \
                      action mirred egress redirect dev ifb0


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

   iproute2                       11 Jan 2015Mirror/redirect action in tc(8)

--------------

Pages that refer to this page:
`tc-actions(8) <../man8/tc-actions.8.html>`__, 
`tc-ct(8) <../man8/tc-ct.8.html>`__, 
`tc-ctinfo(8) <../man8/tc-ctinfo.8.html>`__, 
`tc-mpls(8) <../man8/tc-mpls.8.html>`__

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
