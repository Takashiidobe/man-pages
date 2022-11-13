.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

waitid(3p) — Linux manual page
==============================

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

   WAITID(3P)              POSIX Programmer's Manual             WAITID(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          waitid — wait for a child process to change state


---------------------------------------------------------

::

          #include <sys/wait.h>

          int waitid(idtype_t idtype, id_t id, siginfo_t *infop, int options);


---------------------------------------------------------------

::

          The waitid() function shall obtain status information (see
          Section 2.13, Status Information) pertaining to termination,
          stop, and/or continue events in one of the caller's child
          processes.

          The waitid() function shall cause the calling thread to become
          blocked until an error occurs or status information becomes
          available to the calling thread that satisfies all of the
          following properties (``matching status information''):

           *  The status information is from one of the child processes in
              the set of child processes specified by the idtype and id
              arguments.

           *  The state change in the status information matches one of the
              state change flags set in the options argument.

          If matching status information is available prior to the call to
          waitid(), return shall be immediate. If matching status
          information is available for two or more child processes, the
          order in which their status is reported is unspecified.

          As described in Section 2.13, Status Information, the waitid()
          function consumes the status information it obtains unless the
          WNOWAIT flag is set in the options argument.

          The behavior when multiple threads are blocked in wait(),
          waitid(), or waitpid() is described in Section 2.13, Status
          Information.

          The waitid() function shall record the obtained status
          information in the structure pointed to by infop.  The fields of
          the structure pointed to by infop shall be filled in as described
          under ``Pointer to a Function'' in Section 2.4.3, Signal Actions.

          The idtype and id arguments are used to specify which children
          waitid() waits for.

          If idtype is P_PID, waitid() shall wait for the child with a
          process ID equal to (pid_t)id.

          If idtype is P_PGID, waitid() shall wait for any child with a
          process group ID equal to (pid_t)id.

          If idtype is P_ALL, waitid() shall wait for any children and id
          is ignored.

          The options argument is used to specify which state changes
          waitid() shall wait for. It is formed by OR'ing together the
          following flags:

          WCONTINUED  Status shall be returned for any continued child
                      process whose status either has not been reported
                      since it continued from a job control stop or has
                      been reported only by calls to waitid() with the
                      WNOWAIT flag set.

          WEXITED     Wait for processes that have exited.

          WNOHANG     Do not hang if no status is available; return
                      immediately.

          WNOWAIT     Keep the process whose status is returned in infop in
                      a waitable state. This shall not affect the state of
                      the process; the process may be waited for again
                      after this call completes.

          WSTOPPED    Status shall be returned for any child that has
                      stopped upon receipt of a signal, and whose status
                      either has not been reported since it stopped or has
                      been reported only by calls to waitid() with the
                      WNOWAIT flag set.

          Applications shall specify at least one of the flags WEXITED,
          WSTOPPED, or WCONTINUED to be OR'ed in with the options argument.

          The application shall ensure that the infop argument points to a
          siginfo_t structure. If waitid() returns because a child process
          was found that satisfied the conditions indicated by the
          arguments idtype and options, then the structure pointed to by
          infop shall be filled in by the system with the status of the
          process; the si_signo member shall be set equal to SIGCHLD.  If
          waitid() returns because WNOHANG was specified and status is not
          available for any process specified by idtype and id, then the
          si_signo and si_pid members of the structure pointed to by infop
          shall be set to zero and the values of other members of the
          structure are unspecified.


-----------------------------------------------------------------

::

          If WNOHANG was specified and status is not available for any
          process specified by idtype and id, 0 shall be returned. If
          waitid() returns due to the change of state of one of its
          children, 0 shall be returned. Otherwise, -1 shall be returned
          and errno set to indicate the error.


-----------------------------------------------------

::

          The waitid() function shall fail if:

          ECHILD The calling process has no existing unwaited-for child
                 processes.

          EINTR  The waitid() function was interrupted by a signal.

          EINVAL An invalid value was specified for options, or idtype and
                 id specify an invalid set of processes.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          Calls to waitid() with idtype equal to P_ALL will collect
          information about any child process. This may result in
          interactions with other interfaces that may be waiting for their
          own children (such as by use of system()).  For this reason it is
          recommended that portable applications not use waitid() with
          idtype of P_ALL. See also APPLICATION USAGE for wait().

          As specified in Consequences of Process Termination, if the
          calling process has SA_NOCLDWAIT set or has SIGCHLD set to
          SIG_IGN, then the termination of a child process will not cause
          status information to become available to a thread blocked in
          wait(), waitid(), or waitpid().  Thus, a thread blocked in one of
          the wait functions will remain blocked unless some other
          condition causes the thread to resume execution (such as an
          [ECHILD] failure due to no remaining children in the set of
          waited-for children).


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.4.3, Signal Actions, Section 2.13, Status Information,
          exec(1p), exit(3p), wait(3p)

          The Base Definitions volume of POSIX.1‐2017, signal.h(0p),
          sys_wait.h(0p)


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

   IEEE/The Open Group               2017                        WAITID(3P)

--------------

Pages that refer to this page:
`signal.h(0p) <../man0/signal.h.0p.html>`__, 
`sys_wait.h(0p) <../man0/sys_wait.h.0p.html>`__, 
`abort(3p) <../man3/abort.3p.html>`__, 
`exit(3p) <../man3/exit.3p.html>`__, 
`\_Exit(3p) <../man3/_Exit.3p.html>`__, 
`popen(3p) <../man3/popen.3p.html>`__, 
`posix_spawn(3p) <../man3/posix_spawn.3p.html>`__, 
`sigaction(3p) <../man3/sigaction.3p.html>`__, 
`sighold(3p) <../man3/sighold.3p.html>`__, 
`signal(3p) <../man3/signal.3p.html>`__, 
`times(3p) <../man3/times.3p.html>`__, 
`wait(3p) <../man3/wait.3p.html>`__

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
