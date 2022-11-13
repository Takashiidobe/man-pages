.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sched_get_priority_max(2) — Linux manual page
=============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SCHED_GET_PRIORITY_MAX(2)inux Programmer's ManualHED_GET_PRIORITY_MAX(2)

NAME
-------------------------------------------------

::

          sched_get_priority_max, sched_get_priority_min  - get static
          priority range


---------------------------------------------------------

::

          #include <sched.h>

          int sched_get_priority_max(int policy);
          int sched_get_priority_min(int policy);


---------------------------------------------------------------

::

          sched_get_priority_max() returns the maximum priority value that
          can be used with the scheduling algorithm identified by policy.
          sched_get_priority_min() returns the minimum priority value that
          can be used with the scheduling algorithm identified by policy.
          Supported policy values are SCHED_FIFO, SCHED_RR, SCHED_OTHER,
          SCHED_BATCH, SCHED_IDLE, and SCHED_DEADLINE.  Further details
          about these policies can be found in sched(7).

          Processes with numerically higher priority values are scheduled
          before processes with numerically lower priority values.  Thus,
          the value returned by sched_get_priority_max() will be greater
          than the value returned by sched_get_priority_min().

          Linux allows the static priority range 1 to 99 for the SCHED_FIFO
          and SCHED_RR policies, and the priority 0 for the remaining
          policies.  Scheduling priority ranges for the various policies
          are not alterable.

          The range of scheduling priorities may vary on other POSIX
          systems, thus it is a good idea for portable applications to use
          a virtual priority range and map it to the interval given by
          sched_get_priority_max() and sched_get_priority_min() POSIX.1
          requires a spread of at least 32 between the maximum and the
          minimum values for SCHED_FIFO and SCHED_RR.

          POSIX systems on which sched_get_priority_max() and
          sched_get_priority_min() are available define
          _POSIX_PRIORITY_SCHEDULING in <unistd.h>.


-----------------------------------------------------------------

::

          On success, sched_get_priority_max() and sched_get_priority_min()
          return the maximum/minimum priority value for the named
          scheduling policy.  On error, -1 is returned, and errno is set to
          indicate the error.


-----------------------------------------------------

::

          EINVAL The argument policy does not identify a defined scheduling
                 policy.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------------

::

          sched_getaffinity(2), sched_getparam(2), sched_getscheduler(2),
          sched_setaffinity(2), sched_setparam(2), sched_setscheduler(2),
          sched(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22      SCHED_GET_PRIORITY_MAX(2)

--------------

Pages that refer to this page:
`sched_setaffinity(2) <../man2/sched_setaffinity.2.html>`__, 
`sched_setattr(2) <../man2/sched_setattr.2.html>`__, 
`sched_setparam(2) <../man2/sched_setparam.2.html>`__, 
`sched_setscheduler(2) <../man2/sched_setscheduler.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`pthread_attr_setschedparam(3) <../man3/pthread_attr_setschedparam.3.html>`__, 
`pthread_setschedparam(3) <../man3/pthread_setschedparam.3.html>`__, 
`pthread_setschedprio(3) <../man3/pthread_setschedprio.3.html>`__, 
`sched(7) <../man7/sched.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/sched_get_priority_max.2.license.html>`__

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
