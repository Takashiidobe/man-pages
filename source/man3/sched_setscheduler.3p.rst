.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sched_setscheduler(3p) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
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

   SCHED_SETSCHEDULER(3P)  POSIX Programmer's Manual SCHED_SETSCHEDULER(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sched_setscheduler — set scheduling policy and parameters
          (REALTIME)


---------------------------------------------------------

::

          #include <sched.h>

          int sched_setscheduler(pid_t pid, int policy,
              const struct sched_param *param);


---------------------------------------------------------------

::

          The sched_setscheduler() function shall set the scheduling policy
          and scheduling parameters of the process specified by pid to
          policy and the parameters specified in the sched_param structure
          pointed to by param, respectively. The value of the
          sched_priority member in the sched_param structure shall be any
          integer within the inclusive priority range for the scheduling
          policy specified by policy.  If the value of pid is negative, the
          behavior of the sched_setscheduler() function is unspecified.

          The possible values for the policy parameter are defined in the
          <sched.h> header.

          If a process specified by pid exists, and if the calling process
          has permission, the scheduling policy and scheduling parameters
          shall be set for the process whose process ID is equal to pid.

          If pid is zero, the scheduling policy and scheduling parameters
          shall be set for the calling process.

          The conditions under which one process has appropriate privileges
          to change the scheduling parameters of another process are
          implementation-defined.

          Implementations may require that the requesting process have
          permission to set its own scheduling parameters or those of
          another process.  Additionally, implementation-defined
          restrictions may apply as to the appropriate privileges required
          to set the scheduling policy of the process, or the scheduling
          policy of another process, to a particular value.

          The sched_setscheduler() function shall be considered successful
          if it succeeds in setting the scheduling policy and scheduling
          parameters of the process specified by pid to the values
          specified by policy and the structure pointed to by param,
          respectively.

          See Scheduling Policies for a description on how this function
          affects the scheduling of the threads within the target process.

          If the current scheduling policy for the target process is not
          SCHED_FIFO, SCHED_RR, or SCHED_SPORADIC, the result is
          implementation-defined; this case includes the SCHED_OTHER
          policy.

          The specified sched_ss_repl_period shall be greater than or equal
          to the specified sched_ss_init_budget for the function to
          succeed; if it is not, then the function shall fail.

          The value of sched_ss_max_repl shall be within the inclusive
          range [1,{SS_REPL_MAX}] for the function to succeed; if not, the
          function shall fail. It is unspecified whether the
          sched_ss_repl_period and sched_ss_init_budget values are stored
          as provided by this function or are rounded to align with the
          resolution of the clock being used.

          This function is not atomic with respect to other threads in the
          process. Threads may continue to execute while this function call
          is in the process of changing the scheduling policy and
          associated scheduling parameters for the underlying kernel-
          scheduled entities used by the process contention scope threads.


-----------------------------------------------------------------

::

          Upon successful completion, the function shall return the former
          scheduling policy of the specified process. If the
          sched_setscheduler() function fails to complete successfully, the
          policy and scheduling parameters shall remain unchanged, and the
          function shall return a value of -1 and set errno to indicate the
          error.


-----------------------------------------------------

::

          The sched_setscheduler() function shall fail if:

          EINVAL The value of the policy parameter is invalid, or one or
                 more of the parameters contained in param is outside the
                 valid range for the specified scheduling policy.

          EPERM  The requesting process does not have permission to set
                 either or both of the scheduling parameters or the
                 scheduling policy of the specified process.

          ESRCH  No process can be found corresponding to that specified by
                 pid.

          The following sections are informative.


---------------------------------------------------------

::

          None.


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

          Scheduling Policies, sched_getparam(3p), sched_getscheduler(3p),
          sched_setparam(3p)

          The Base Definitions volume of POSIX.1‐2017, sched.h(0p)


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

   IEEE/The Open Group               2017            SCHED_SETSCHEDULER(3P)

--------------

Pages that refer to this page:
`sched.h(0p) <../man0/sched.h.0p.html>`__, 
`getpriority(3p) <../man3/getpriority.3p.html>`__, 
`posix_spawn(3p) <../man3/posix_spawn.3p.html>`__, 
`sched_getparam(3p) <../man3/sched_getparam.3p.html>`__, 
`sched_get_priority_max(3p) <../man3/sched_get_priority_max.3p.html>`__, 
`sched_getscheduler(3p) <../man3/sched_getscheduler.3p.html>`__, 
`sched_rr_get_interval(3p) <../man3/sched_rr_get_interval.3p.html>`__, 
`sched_setparam(3p) <../man3/sched_setparam.3p.html>`__

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
