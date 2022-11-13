.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tc-matchall(8) — Linux manual page
==================================

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

   Match-all classifier in tc(8)     Linux    Match-all classifier in tc(8)

NAME
-------------------------------------------------

::

          matchall - traffic control filter that matches every packet


---------------------------------------------------------

::

          tc filter ... matchall [ skip_sw | skip_hw  ] [ action
                  ACTION_SPEC ] [ classid CLASSID ]


---------------------------------------------------------------

::

          The matchall filter allows to classify every packet that flows on
          the port and run a action on it.


-------------------------------------------------------

::

          action ACTION_SPEC
                 Apply an action from the generic actions framework on
                 matching packets.

          classid CLASSID
                 Push matching packets into the class identified by
                 CLASSID.

          skip_sw
                 Do not process filter by software. If hardware has no
                 offload support for this filter, or TC offload is not
                 enabled for the interface, operation will fail.

          skip_hw
                 Do not process filter by hardware.


---------------------------------------------------------

::

          To create ingress mirroring from port eth1 to port eth2:

                 tc qdisc  add dev eth1 handle ffff: ingress
                 tc filter add dev eth1 parent ffff:           \
                         matchall skip_sw                      \
                         action mirred egress mirror           \
                         dev eth2

          The first command creates an ingress qdisc with handle ffff: on
          device eth1 where the second command attaches a matchall filters
          on it that mirrors the packets to device eth2.

          To create egress mirroring from port eth1 to port eth2:

                 tc qdisc add dev eth1 handle 1: root prio
                 tc filter add dev eth1 parent 1:               \
                         matchall skip_sw                       \
                         action mirred egress mirror            \
                         dev eth2

          The first command creates an egress qdisc with handle 1: that
          replaces the root qdisc on device eth1 where the second command
          attaches a matchall filters on it that mirrors the packets to
          device eth2.

          To sample one of every 100 packets flowing into interface eth0 to
          psample group 12:

                 tc qdisc add dev eth0 handle ffff: ingress
                 tc filter add dev eth0 parent ffff: matchall \
                      action sample rate 100 group 12


---------------------------------------------------------

::

          tc(8),

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

   iproute2                       21 Oct 2015 Match-all classifier in tc(8)

--------------

Pages that refer to this page: `tc(8) <../man8/tc.8.html>`__, 
`tc-sample(8) <../man8/tc-sample.8.html>`__

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
