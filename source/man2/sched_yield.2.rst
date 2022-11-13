.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sched_yield(2) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SCHED_YIELD(2)          Linux Programmer's Manual         SCHED_YIELD(2)

NAME
-------------------------------------------------

::

          sched_yield - yield the processor


---------------------------------------------------------

::

          #include <sched.h>

          int sched_yield(void);


---------------------------------------------------------------

::

          sched_yield() causes the calling thread to relinquish the CPU.
          The thread is moved to the end of the queue for its static
          priority and a new thread gets to run.


-----------------------------------------------------------------

::

          On success, sched_yield() returns 0.  On error, -1 is returned,
          and errno is set to indicate the error.


-----------------------------------------------------

::

          In the Linux implementation, sched_yield() always succeeds.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          If the calling thread is the only thread in the highest priority
          list at that time, it will continue to run after a call to
          sched_yield().

          POSIX systems on which sched_yield() is available define
          _POSIX_PRIORITY_SCHEDULING in <unistd.h>.

          Strategic calls to sched_yield() can improve performance by
          giving other threads or processes a chance to run when (heavily)
          contended resources (e.g., mutexes) have been released by the
          caller.  Avoid calling sched_yield() unnecessarily or
          inappropriately (e.g., when resources needed by other schedulable
          threads are still held by the caller), since doing so will result
          in unnecessary context switches, which will degrade system
          performance.

          sched_yield() is intended for use with real-time scheduling
          policies (i.e., SCHED_FIFO or SCHED_RR).  Use of sched_yield()
          with nondeterministic scheduling policies such as SCHED_OTHER is
          unspecified and very likely means your application design is
          broken.


---------------------------------------------------------

::

          sched(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                 SCHED_YIELD(2)

--------------

Pages that refer to this page:
`getrlimit(2) <../man2/getrlimit.2.html>`__, 
`sched_setattr(2) <../man2/sched_setattr.2.html>`__, 
`sched_setscheduler(2) <../man2/sched_setscheduler.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`pthread_yield(3) <../man3/pthread_yield.3.html>`__, 
`sched(7) <../man7/sched.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/sched_yield.2.license.html>`__

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
