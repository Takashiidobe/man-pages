.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tc-drr(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ALGORITHM <#ALGORITHM>`__ \|     |                                   |
| `PARAMETERS <#PARAMETERS>`__ \|   |                                   |
| `EXAM                             |                                   |
| PLE & USAGE <#EXAMPLE_&_USAGE>`__ |                                   |
| \| `SOURCE <#SOURCE>`__ \|        |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
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

          drr - deficit round robin scheduler


---------------------------------------------------------

::

          tc qdisc ... add drr [ quantum bytes ]


---------------------------------------------------------------

::

          The Deficit Round Robin Scheduler is a classful queuing
          discipline as a more flexible replacement for Stochastic Fairness
          Queuing.

          Unlike SFQ, there are no built-in queues -- you need to add
          classes and then set up filters to classify packets accordingly.
          This can be useful e.g. for using RED qdiscs with different
          settings for particular traffic. There is no default class -- if
          a packet cannot be classified, it is dropped.


-----------------------------------------------------------

::

          Each class is assigned a deficit counter, initialized to quantum.

          DRR maintains an (internal) ''active'' list of classes whose
          qdiscs are non-empty. This list is used for dequeuing. A packet
          is dequeued from the class at the head of the list if the packet
          size is smaller or equal to the deficit counter. If the counter
          is too small, it is increased by quantum and the scheduler moves
          on to the next class in the active list.


-------------------------------------------------------------

::

          quantum
                 Amount of bytes a flow is allowed to dequeue before the
                 scheduler moves to the next class. Defaults to the MTU of
                 the interface. The minimum value is 1.


-----------------------------------------------------------------------

::

          To attach to device eth0, using the interface MTU as its quantum:

          # tc qdisc add dev eth0 handle 1 root drr

          Adding two classes:

          # tc class add dev eth0 parent 1: classid 1:1 drr
          # tc class add dev eth0 parent 1: classid 1:2 drr

          You also need to add at least one filter to classify packets.

          # tc filter add dev eth0 protocol .. classid 1:1

          Like SFQ, DRR is only useful when it owns the queue -- it is a
          pure scheduler and does not delay packets. Attaching non-work-
          conserving qdiscs like tbf to it does not make sense -- other
          qdiscs in the active list will also become inactive until the
          dequeue operation succeeds. Embed DRR within another qdisc like
          HTB or HFSC to ensure it owns the queue.

          You can mimic SFQ behavior by assigning packets to the attached
          classes using the flow filter:

          tc qdisc add dev .. drr

          for i in .. 1024;do
               tc class add dev .. classid $handle:$(print %x $i)
               tc qdisc add dev .. fifo limit 16
          done

          tc filter add .. protocol ip .. $handle flow hash keys
          src,dst,proto,proto-src,proto-dst divisor 1024 perturb 10


-----------------------------------------------------

::

          o      M. Shreedhar and George Varghese "Efficient Fair Queuing
                 using Deficit Round Robin", Proc. SIGCOMM 95.


---------------------------------------------------

::

          This implementation does not drop packets from the longest queue
          on overrun, as limits are handled by the individual child qdiscs.


---------------------------------------------------------

::

          tc(8), tc-htb(8), tc-sfq(8)


-----------------------------------------------------

::

          sched_drr was written by Patrick McHardy.

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

   iproute2                      January 2010                         TC(8)

--------------

Pages that refer to this page: `tc(8) <../man8/tc.8.html>`__, 
`tc-ets(8) <../man8/tc-ets.8.html>`__

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
