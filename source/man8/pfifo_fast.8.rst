.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tc-pfifo_fast(8) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ALGORITHM <#ALGORITHM>`__ \|     |                                   |
| `PARAMETERS <#PARAMETERS>`__ \|   |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PFIFO_FAST(8)                     Linux                    PFIFO_FAST(8)

NAME
-------------------------------------------------

::

          pfifo_fast - three-band first in, first out queue


---------------------------------------------------------------

::

          pfifo_fast is the default qdisc of each interface.

          Whenever an interface is created, the pfifo_fast qdisc is
          automatically used as a queue. If another qdisc is attached, it
          preempts the default pfifo_fast, which automatically returns to
          function when an existing qdisc is detached.

          In this sense this qdisc is magic, and unlike other qdiscs.


-----------------------------------------------------------

::

          The algorithm is very similar to that of the classful tc-prio(8)
          qdisc.  pfifo_fast is like three tc-pfifo(8) queues side by side,
          where packets can be enqueued in any of the three bands based on
          their Type of Service bits or assigned priority.

          Not all three bands are dequeued simultaneously - as long as
          lower bands have traffic, higher bands are never dequeued. This
          can be used to prioritize interactive traffic or penalize 'lowest
          cost' traffic.

          Each band can be txqueuelen packets long, as configured with
          ifconfig(8) or ip(8).  Additional packets coming in are not
          enqueued but are instead dropped.

          See tc-prio(8) for complete details on how TOS bits are
          translated into bands.


-------------------------------------------------------------

::

          txqueuelen
                 The length of the three bands depends on the interface
                 txqueuelen, as specified with ifconfig(8) or ip(8).


-------------------------------------------------

::

          Does not maintain statistics and does not show up in tc qdisc ls.
          This is because it is the automatic default in the absence of a
          configured qdisc.


---------------------------------------------------------

::

          tc(8)


-------------------------------------------------------

::

          Alexey N. Kuznetsov, <kuznet@ms2.inr.ac.ru>

          This manpage maintained by bert hubert <ahu@ds9a.nl>

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

   iproute2                     10 January 2002               PFIFO_FAST(8)

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
