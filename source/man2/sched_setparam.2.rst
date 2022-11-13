.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sched_setparam(2) — Linux manual page
=====================================

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

   SCHED_SETPARAM(2)       Linux Programmer's Manual      SCHED_SETPARAM(2)

NAME
-------------------------------------------------

::

          sched_setparam, sched_getparam - set and get scheduling
          parameters


---------------------------------------------------------

::

          #include <sched.h>

          int sched_setparam(pid_t pid, const struct sched_param *param);
          int sched_getparam(pid_t pid, struct sched_param *param);

          struct sched_param {
              ...
              int sched_priority;
              ...
          };


---------------------------------------------------------------

::

          sched_setparam() sets the scheduling parameters associated with
          the scheduling policy for the thread whose thread ID is specified
          in pid.  If pid is zero, then the parameters of the calling
          thread are set.  The interpretation of the argument param depends
          on the scheduling policy of the thread identified by pid.  See
          sched(7) for a description of the scheduling policies supported
          under Linux.

          sched_getparam() retrieves the scheduling parameters for the
          thread identified by pid.  If pid is zero, then the parameters of
          the calling thread are retrieved.

          sched_setparam() checks the validity of param for the scheduling
          policy of the thread.  The value param->sched_priority must lie
          within the range given by sched_get_priority_min(2) and
          sched_get_priority_max(2).

          For a discussion of the privileges and resource limits related to
          scheduling priority and policy, see sched(7).

          POSIX systems on which sched_setparam() and sched_getparam() are
          available define _POSIX_PRIORITY_SCHEDULING in <unistd.h>.


-----------------------------------------------------------------

::

          On success, sched_setparam() and sched_getparam() return 0.  On
          error, -1 is returned, and errno is set to indicate the error.


-----------------------------------------------------

::

          EINVAL Invalid arguments: param is NULL or pid is negative

          EINVAL (sched_setparam()) The argument param does not make sense
                 for the current scheduling policy.

          EPERM  (sched_setparam()) The caller does not have appropriate
                 privileges (Linux: does not have the CAP_SYS_NICE
                 capability).

          ESRCH  The thread whose ID is pid could not be found.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------------

::

          getpriority(2), gettid(2), nice(2), sched_get_priority_max(2),
          sched_get_priority_min(2), sched_getaffinity(2),
          sched_getscheduler(2), sched_setaffinity(2), sched_setattr(2),
          sched_setscheduler(2), setpriority(2), capabilities(7), sched(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22              SCHED_SETPARAM(2)

--------------

Pages that refer to this page:
`getrlimit(2) <../man2/getrlimit.2.html>`__, 
`gettid(2) <../man2/gettid.2.html>`__, 
`sched_get_priority_max(2) <../man2/sched_get_priority_max.2.html>`__, 
`sched_setattr(2) <../man2/sched_setattr.2.html>`__, 
`sched_setscheduler(2) <../man2/sched_setscheduler.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`posix_spawn(3) <../man3/posix_spawn.3.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`sched(7) <../man7/sched.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/sched_setparam.2.license.html>`__

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
