.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_setschedprio(3) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTHREAD_SETSCHEDPRIO(3) Linux Programmer's ManualPTHREAD_SETSCHEDPRIO(3)

NAME
-------------------------------------------------

::

          pthread_setschedprio - set scheduling priority of a thread


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_setschedprio(pthread_t thread, int prio);

          Compile and link with -pthread.


---------------------------------------------------------------

::

          The pthread_setschedprio() function sets the scheduling priority
          of the thread thread to the value specified in prio.  (By
          contrast pthread_setschedparam(3) changes both the scheduling
          policy and priority of a thread.)


-----------------------------------------------------------------

::

          On success, this function returns 0; on error, it returns a
          nonzero error number.  If pthread_setschedprio() fails, the
          scheduling priority of thread is not changed.


-----------------------------------------------------

::

          EINVAL prio is not valid for the scheduling policy of the
                 specified thread.

          EPERM  The caller does not have appropriate privileges to set the
                 specified priority.

          ESRCH  No thread with the ID thread could be found.

          POSIX.1 also documents an ENOTSUP ("attempt was made to set the
          priority to an unsupported value") error for
          pthread_setschedparam(3).


---------------------------------------------------------

::

          This function is available in glibc since version 2.3.4.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │pthread_setschedprio()                │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          For a description of the permissions required to, and the effect
          of, changing a thread's scheduling priority, and details of the
          permitted ranges for priorities in each scheduling policy, see
          sched(7).


---------------------------------------------------------

::

          getrlimit(2), sched_get_priority_min(2), pthread_attr_init(3),
          pthread_attr_setinheritsched(3), pthread_attr_setschedparam(3),
          pthread_attr_setschedpolicy(3), pthread_create(3),
          pthread_self(3), pthread_setschedparam(3), pthreads(7), sched(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22        PTHREAD_SETSCHEDPRIO(3)

--------------

Pages that refer to this page:
`sched_setattr(2) <../man2/sched_setattr.2.html>`__, 
`sched_setscheduler(2) <../man2/sched_setscheduler.2.html>`__, 
`pthread_attr_setinheritsched(3) <../man3/pthread_attr_setinheritsched.3.html>`__, 
`pthread_attr_setschedparam(3) <../man3/pthread_attr_setschedparam.3.html>`__, 
`pthread_attr_setschedpolicy(3) <../man3/pthread_attr_setschedpolicy.3.html>`__, 
`pthread_setschedparam(3) <../man3/pthread_setschedparam.3.html>`__, 
`sched(7) <../man7/sched.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_setschedprio.3.license.html>`__

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
