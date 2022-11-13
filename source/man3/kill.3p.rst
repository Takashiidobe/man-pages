.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

kill(3p) — Linux manual page
============================

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

   KILL(3P)                POSIX Programmer's Manual               KILL(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          kill — send a signal to a process or a group of processes


---------------------------------------------------------

::

          #include <signal.h>

          int kill(pid_t pid, int sig);


---------------------------------------------------------------

::

          The kill() function shall send a signal to a process or a group
          of processes specified by pid.  The signal to be sent is
          specified by sig and is either one from the list given in
          <signal.h> or 0. If sig is 0 (the null signal), error checking is
          performed but no signal is actually sent. The null signal can be
          used to check the validity of pid.

          For a process to have permission to send a signal to a process
          designated by pid, unless the sending process has appropriate
          privileges, the real or effective user ID of the sending process
          shall match the real or saved set-user-ID of the receiving
          process.

          If pid is greater than 0, sig shall be sent to the process whose
          process ID is equal to pid.

          If pid is 0, sig shall be sent to all processes (excluding an
          unspecified set of system processes) whose process group ID is
          equal to the process group ID of the sender, and for which the
          process has permission to send a signal.

          If pid is -1, sig shall be sent to all processes (excluding an
          unspecified set of system processes) for which the process has
          permission to send that signal.

          If pid is negative, but not -1, sig shall be sent to all
          processes (excluding an unspecified set of system processes)
          whose process group ID is equal to the absolute value of pid, and
          for which the process has permission to send a signal.

          If the value of pid causes sig to be generated for the sending
          process, and if sig is not blocked for the calling thread and if
          no other thread has sig unblocked or is waiting in a sigwait()
          function for sig, either sig or at least one pending unblocked
          signal shall be delivered to the sending thread before kill()
          returns.

          The user ID tests described above shall not be applied when
          sending SIGCONT to a process that is a member of the same session
          as the sending process.

          An implementation that provides extended security controls may
          impose further implementation-defined restrictions on the sending
          of signals, including the null signal. In particular, the system
          may deny the existence of some or all of the processes specified
          by pid.

          The kill() function is successful if the process has permission
          to send sig to any of the processes specified by pid.  If kill()
          fails, no signal shall be sent.


-----------------------------------------------------------------

::

          Upon successful completion, 0 shall be returned. Otherwise, -1
          shall be returned and errno set to indicate the error.


-----------------------------------------------------

::

          The kill() function shall fail if:

          EINVAL The value of the sig argument is an invalid or unsupported
                 signal number.

          EPERM  The process does not have permission to send the signal to
                 any receiving process.

          ESRCH  No process or process group can be found corresponding to
                 that specified by pid.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The semantics for permission checking for kill() differed between
          System V and most other implementations, such as Version 7 or 4.3
          BSD. The semantics chosen for this volume of POSIX.1‐2017 agree
          with System V.  Specifically, a set-user-ID process cannot
          protect itself against signals (or at least not against SIGKILL)
          unless it changes its real user ID.  This choice allows the user
          who starts an application to send it signals even if it changes
          its effective user ID.  The other semantics give more power to an
          application that wants to protect itself from the user who ran
          it.

          Some implementations provide semantic extensions to the kill()
          function when the absolute value of pid is greater than some
          maximum, or otherwise special, value. Negative values are a flag
          to kill().  Since most implementations return [ESRCH] in this
          case, this behavior is not included in this volume of
          POSIX.1‐2017, although a conforming implementation could provide
          such an extension.

          The unspecified processes to which a signal cannot be sent may
          include the scheduler or init.

          There was initially strong sentiment to specify that, if pid
          specifies that a signal be sent to the calling process and that
          signal is not blocked, that signal would be delivered before
          kill() returns. This would permit a process to call kill() and be
          guaranteed that the call never return. However, historical
          implementations that provide only the signal() function make only
          the weaker guarantee in this volume of POSIX.1‐2017, because they
          only deliver one signal each time a process enters the kernel.
          Modifications to such implementations to support the sigaction()
          function generally require entry to the kernel following return
          from a signal-catching function, in order to restore the signal
          mask. Such modifications have the effect of satisfying the
          stronger requirement, at least when sigaction() is used, but not
          necessarily when signal() is used. The standard developers
          considered making the stronger requirement except when signal()
          is used, but felt this would be unnecessarily complex.
          Implementors are encouraged to meet the stronger requirement
          whenever possible. In practice, the weaker requirement is the
          same, except in the rare case when two signals arrive during a
          very short window. This reasoning also applies to a similar
          requirement for sigprocmask().

          In 4.2 BSD, the SIGCONT signal can be sent to any descendant
          process regardless of user-ID security checks.  This allows a job
          control shell to continue a job even if processes in the job have
          altered their user IDs (as in the su command). In keeping with
          the addition of the concept of sessions, similar functionality is
          provided by allowing the SIGCONT signal to be sent to any process
          in the same session regardless of user ID security checks. This
          is less restrictive than BSD in the sense that ancestor processes
          (in the same session) can now be the recipient.  It is more
          restrictive than BSD in the sense that descendant processes that
          form new sessions are now subject to the user ID checks. A
          similar relaxation of security is not necessary for the other job
          control signals since those signals are typically sent by the
          terminal driver in recognition of special characters being typed;
          the terminal driver bypasses all security checks.

          In secure implementations, a process may be restricted from
          sending a signal to a process having a different security label.
          In order to prevent the existence or nonexistence of a process
          from being used as a covert channel, such processes should appear
          nonexistent to the sender; that is, [ESRCH] should be returned,
          rather than [EPERM], if pid refers only to such processes.

          Historical implementations varied on the result of a kill() with
          pid indicating a zombie process. Some indicated success on such a
          call (subject to permission checking), while others gave an error
          of [ESRCH].  Since the definition of process lifetime in this
          volume of POSIX.1‐2017 covers zombie processes, the [ESRCH] error
          as described is inappropriate in this case and implementations
          that give this error do not conform. This means that an
          application cannot have a parent process check for termination of
          a particular child by sending it the null signal with kill(), but
          must instead use waitpid() or waitid().

          There is some belief that the name kill() is misleading, since
          the function is not always intended to cause process termination.
          However, the name is common to all historical implementations,
          and any change would be in conflict with the goal of minimal
          changes to existing application code.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          getpid(3p), raise(3p), setsid(3p), sigaction(3p), sigqueue(3p),
          wait(3p)

          The Base Definitions volume of POSIX.1‐2017, signal.h(0p),
          sys_types.h(0p)


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

   IEEE/The Open Group               2017                          KILL(3P)

--------------

Pages that refer to this page:
`signal.h(0p) <../man0/signal.h.0p.html>`__, 
`kill(1p) <../man1/kill.1p.html>`__, 
`abort(3p) <../man3/abort.3p.html>`__, 
`fcntl(3p) <../man3/fcntl.3p.html>`__, 
`getpgrp(3p) <../man3/getpgrp.3p.html>`__, 
`getpid(3p) <../man3/getpid.3p.html>`__, 
`getppid(3p) <../man3/getppid.3p.html>`__, 
`killpg(3) <../man3/killpg.3.html>`__, 
`killpg(3p) <../man3/killpg.3p.html>`__, 
`posix_spawn(3p) <../man3/posix_spawn.3p.html>`__, 
`pthread_kill(3p) <../man3/pthread_kill.3p.html>`__, 
`pthread_sigmask(3p) <../man3/pthread_sigmask.3p.html>`__, 
`raise(3p) <../man3/raise.3p.html>`__, 
`setpgrp(3p) <../man3/setpgrp.3p.html>`__, 
`sigaction(3p) <../man3/sigaction.3p.html>`__

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
