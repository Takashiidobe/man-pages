.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rdisc(8) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `REFERENCES <#REFERENCES>`__ \|   |                                   |
| `SECURITY <#SECURITY>`__ \|       |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RDISC(8)                         iputils                        RDISC(8)

NAME
-------------------------------------------------

::

          rdisc - network router discovery daemon


---------------------------------------------------------

::

          rdisc [-abdfrstvV] [-p preference] [-T max_interval]
                [send_address] [receive_address]


---------------------------------------------------------------

::

          rdisc implements client side of the ICMP Internet Router
          Discovery Protocol (IRDP).  rdisc is invoked at boot time to
          populate the network routing tables with default routes.

          rdisc listens on the ALL_HOSTS (224.0.0.1) multicast address (or
          receive_address if it is provided) for ROUTER_ADVERTISE messages
          from routers. The received messages are handled by first ignoring
          those listed router addresses with which the host does not share
          a network. Among the remaining addresses the ones with the
          highest preference are selected as default routers and a default
          route is entered in the kernel routing table for each one of
          them.

          Optionally, rdisc can avoid waiting for routers to announce
          themselves by sending out a few ROUTER_SOLICITATION messages to
          the ALL_ROUTERS (224.0.0.2) multicast address (or send_address if
          it is provided) when it is started.

          A timer is associated with each router address and the address
          will no longer be considered for inclusion in the routing tables
          if the timer expires before a new advertise message is received
          from the router. The address will also be excluded from
          consideration if the received advertise message has a preference
          of maximum negative.

          Server side of router discovery protocol is supported by Cisco
          IOS and by any more or less complete UNIX routing daemon, for
          example gated. If compiled with ENABLE_RDISC_SERVER, rdisc can
          act as responder.


-------------------------------------------------------

::

          -a
              Accept all routers independently of the preference they have
              in their advertise messages. Normally rdisc only accepts (and
              enters in the kernel routing tables) the router or routers
              with the highest preference.

          -b
              Opposite to -a, i.e. install only router with the best
              preference value. This is the default behaviour.

          -d
              Send debugging messages to syslog.

          -f
              Keep rdisc running in the background even if no routers are
              found. Normally rdisc gives up if it has not received any
              advertise message after soliciting three times. In this case
              it exits with a non-zero exit code. If -f is not specified in
              the first form then -s must be specified.

          -r
              Responder mode, available only if compiled with
              ENABLE_RDISC_SERVER.

          -s
              Send three solicitation messages initially to quickly
              discover the routers when the system is booted. When -s is
              specified rdisc exits with a non-zero exit code if it can not
              find any routers. This can be overridden with the -f option.

          -p preference
              Set preference in advertisement messages. Available only with
              -r option.

          -T max_interval
              Set maximum advertisement interval in seconds. Default is
              600. Available only with -r option.

          -t
              Test mode. Do not go to background.

          -v
              Be verbose and send lots of debugging messages to syslog.

          -V
              Print version and exit.


-------------------------------------------------------

::

          This program was developed by Sun Microsystems (see copyright
          notice in source file). It was ported to Linux by Alexey
          Kuznetsov <kuznet@ms2.inr.ac.ru>.


---------------------------------------------------------

::

          icmp(7), inet(7), ping(8).


-------------------------------------------------------------

::

          RFC1256 ICMP Router Discovery Messages. S. Deering, Ed..
          September 1991.


---------------------------------------------------------

::

          rdisc requires CAP_NET_RAW to listen and send ICMP messages and
          capability CAP_NET_ADMIN to update routing tables.


-----------------------------------------------------------------

::

          rdisc is part of iputils package.

COLOPHON
---------------------------------------------------------

::

          This page is part of the iputils (IP utilities) project.
          Information about the project can be found at 
          ⟨http://www.skbuff.net/iputils/⟩.  If you have a bug report for
          this manual page, send it to yoshfuji@skbuff.net,
          netdev@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/iputils/iputils.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   iputils 20210722                                                RDISC(8)

--------------

Pages that refer to this page: `icmp(7) <../man7/icmp.7.html>`__

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
