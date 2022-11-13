.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sched.h(0p) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   sched.h(0P)             POSIX Programmer's Manual            sched.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sched.h — execution scheduling


---------------------------------------------------------

::

          #include <sched.h>


---------------------------------------------------------------

::

          The <sched.h> header shall define the pid_t type as described in
          <sys/types.h>.

          The <sched.h> header shall define the time_t type as described in
          <sys/types.h>.

          The <sched.h> header shall define the timespec structure as
          described in <time.h>.

          The <sched.h> header shall define the sched_param structure,
          which shall include the scheduling parameters required for
          implementation of each supported scheduling policy. This
          structure shall include at least the following member:

              int       sched_priority        Process or thread execution scheduling priority.

          The sched_param structure defined in <sched.h> shall include the
          following members in addition to those specified above:

              int             sched_ss_low_priority Low scheduling priority for
                                                    sporadic server.
              struct timespec sched_ss_repl_period  Replenishment period for
                                                    sporadic server.
              struct timespec sched_ss_init_budget  Initial budget for sporadic server.
              int             sched_ss_max_repl     Maximum pending replenishments for
                                                    sporadic server.

          Each process or thread is controlled by an associated scheduling
          policy and priority. Associated with each policy is a priority
          range. Each policy definition specifies the minimum priority
          range for that policy. The priority ranges for each policy may
          overlap the priority ranges of other policies.

          Four scheduling policies are defined; others may be defined by
          the implementation. The four standard policies are indicated by
          the values of the following symbolic constants:

          SCHED_FIFO    First in-first out (FIFO) scheduling policy.

          SCHED_RR      Round robin scheduling policy.

          SCHED_SPORADIC
                        Sporadic server scheduling policy.

          SCHED_OTHER   Another scheduling policy.

          The values of these constants are distinct.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided.

              int    sched_get_priority_max(int);
              int    sched_get_priority_min(int);
              int    sched_getparam(pid_t, struct sched_param *);
              int    sched_getscheduler(pid_t);
              int    sched_rr_get_interval(pid_t, struct timespec *);
              int    sched_setparam(pid_t, const struct sched_param *);
              int    sched_setscheduler(pid_t, int, const struct sched_param *);
              int    sched_yield(void);

          Inclusion of the <sched.h> header may make visible all symbols
          from the <time.h> header.

          The following sections are informative.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          sys_types.h(0p), time.h(0p)

          The System Interfaces volume of POSIX.1‐2017,
          sched_get_priority_max(3p), sched_getparam(3p),
          sched_getscheduler(3p), sched_rr_get_interval(3p),
          sched_setparam(3p), sched_setscheduler(3p), sched_yield(3p)


-----------------------------------------------------------

::

          Portions of this text are reprinted and reproduced in electronic
          form from IEEE Std 1003.1-2017, Standard for Information
          Technology -- Portable Operating System Interface (POSIX), The
          Open Group Base Specifications Issue 7, 2018 Edition, Copyright
          (C) 2018 by the Institute of Electrical and Electronics
          Engineers, Inc and The Open Group.  In the event of any
          discrepancy between this version and the original IEEE and The
          Open Group Standard, the original IEEE and The Open Group
          Standard is the referee document. The original Standard can be
          obtained online at http://www.opengroup.org/unix/online.html .

          Any typographical or formatting errors that appear in this page
          are most likely to have been introduced during the conversion of
          the source files to man page format. To report such errors, see
          https://www.kernel.org/doc/man-pages/reporting_bugs.html .

   IEEE/The Open Group               2017                       sched.h(0P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`spawn.h(0p) <../man0/spawn.h.0p.html>`__, 
`posix_spawnattr_getschedparam(3p) <../man3/posix_spawnattr_getschedparam.3p.html>`__, 
`posix_spawnattr_getschedpolicy(3p) <../man3/posix_spawnattr_getschedpolicy.3p.html>`__, 
`pthread_attr_getinheritsched(3p) <../man3/pthread_attr_getinheritsched.3p.html>`__, 
`pthread_attr_getschedparam(3p) <../man3/pthread_attr_getschedparam.3p.html>`__, 
`pthread_attr_getschedpolicy(3p) <../man3/pthread_attr_getschedpolicy.3p.html>`__, 
`pthread_attr_getscope(3p) <../man3/pthread_attr_getscope.3p.html>`__, 
`pthread_getschedparam(3p) <../man3/pthread_getschedparam.3p.html>`__, 
`sched_getparam(3p) <../man3/sched_getparam.3p.html>`__, 
`sched_get_priority_max(3p) <../man3/sched_get_priority_max.3p.html>`__, 
`sched_getscheduler(3p) <../man3/sched_getscheduler.3p.html>`__, 
`sched_rr_get_interval(3p) <../man3/sched_rr_get_interval.3p.html>`__, 
`sched_setparam(3p) <../man3/sched_setparam.3p.html>`__, 
`sched_setscheduler(3p) <../man3/sched_setscheduler.3p.html>`__, 
`sched_yield(3p) <../man3/sched_yield.3p.html>`__

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
