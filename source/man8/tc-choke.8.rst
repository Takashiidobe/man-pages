.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tc-choke(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ALGORITHM <#ALGORITHM>`__ \|     |                                   |
| `PARAMETERS <#PARAMETERS>`__ \|   |                                   |
| `SOURCE <#SOURCE>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TC(8)                             Linux                            TC(8)

NAME
-------------------------------------------------

::

          choke - choose and keep scheduler


---------------------------------------------------------

::

          tc qdisc ... choke limit packets min packets max packets avpkt
          bytes burst packets [ ecn ] [ bandwidth rate ] probability chance


---------------------------------------------------------------

::

          CHOKe (CHOose and Keep for responsive flows, CHOose and Kill for
          unresponsive flows) is a classless qdisc designed to both
          identify and penalize flows that monopolize the queue. CHOKe is a
          variation of RED, and the configuration is similar to RED.


-----------------------------------------------------------

::

          Once the queue hits a certain average length, a random packet is
          drawn from the queue. If both the to-be-queued and the drawn
          packet belong to the same flow, both packets are dropped.
          Otherwise, if the queue length is still below the maximum length,
          the new packet has a configurable chance of being marked (which
          may mean dropped).  If the queue length exceeds max, the new
          packet will always be marked (or dropped).  If the queue length
          exceeds limit, the new packet is always dropped.

          The marking probability computation is the same as used by the
          RED qdisc.


-------------------------------------------------------------

::

          The parameters are the same as for RED, except that RED uses
          bytes whereas choke counts packets. See tc-red(8) for a
          description.


-----------------------------------------------------

::

          o      R. Pan, B. Prabhakar, and K. Psounis, "CHOKe, A Stateless
                 Active Queue Management Scheme for Approximating Fair
                 Bandwidth Allocation", IEEE INFOCOM, 2000.

          o      A. Tang, J. Wang, S. Low, "Understanding CHOKe: Throughput
                 and Spatial Characteristics", IEEE/ACM Transactions on
                 Networking, 2004


---------------------------------------------------------

::

          tc(8), tc-red(8)


-----------------------------------------------------

::

          sched_choke was contributed by Stephen Hemminger.

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

   iproute2                       August 2011                         TC(8)

--------------

Pages that refer to this page: `tc(8) <../man8/tc.8.html>`__, 
`tc-red(8) <../man8/tc-red.8.html>`__

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
