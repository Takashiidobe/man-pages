.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

kill(2) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   KILL(2)                 Linux Programmer's Manual                KILL(2)

NAME
-------------------------------------------------

::

          kill - send signal to a process


---------------------------------------------------------

::

          #include <signal.h>

          int kill(pid_t pid, int sig);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          kill():
              _POSIX_C_SOURCE


---------------------------------------------------------------

::

          The kill() system call can be used to send any signal to any
          process group or process.

          If pid is positive, then signal sig is sent to the process with
          the ID specified by pid.

          If pid equals 0, then sig is sent to every process in the process
          group of the calling process.

          If pid equals -1, then sig is sent to every process for which the
          calling process has permission to send signals, except for
          process 1 (init), but see below.

          If pid is less than -1, then sig is sent to every process in the
          process group whose ID is -pid.

          If sig is 0, then no signal is sent, but existence and permission
          checks are still performed; this can be used to check for the
          existence of a process ID or process group ID that the caller is
          permitted to signal.

          For a process to have permission to send a signal, it must either
          be privileged (under Linux: have the CAP_KILL capability in the
          user namespace of the target process), or the real or effective
          user ID of the sending process must equal the real or saved set-
          user-ID of the target process.  In the case of SIGCONT, it
          suffices when the sending and receiving processes belong to the
          same session.  (Historically, the rules were different; see
          NOTES.)


-----------------------------------------------------------------

::

          On success (at least one signal was sent), zero is returned.  On
          error, -1 is returned, and errno is set to indicate the error.


-----------------------------------------------------

::

          EINVAL An invalid signal was specified.

          EPERM  The calling process does not have permission to send the
                 signal to any of the target processes.

          ESRCH  The target process or process group does not exist.  Note
                 that an existing process might be a zombie, a process that
                 has terminated execution, but has not yet been wait(2)ed
                 for.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.


---------------------------------------------------

::

          The only signals that can be sent to process ID 1, the init
          process, are those for which init has explicitly installed signal
          handlers.  This is done to assure the system is not brought down
          accidentally.

          POSIX.1 requires that kill(-1,sig) send sig to all processes that
          the calling process may send signals to, except possibly for some
          implementation-defined system processes.  Linux allows a process
          to signal itself, but on Linux the call kill(-1,sig) does not
          signal the calling process.

          POSIX.1 requires that if a process sends a signal to itself, and
          the sending thread does not have the signal blocked, and no other
          thread has it unblocked or is waiting for it in sigwait(3), at
          least one unblocked signal must be delivered to the sending
          thread before the kill() returns.

      Linux notes
          Across different kernel versions, Linux has enforced different
          rules for the permissions required for an unprivileged process to
          send a signal to another process.  In kernels 1.0 to 1.2.2, a
          signal could be sent if the effective user ID of the sender
          matched effective user ID of the target, or the real user ID of
          the sender matched the real user ID of the target.  From kernel
          1.2.3 until 1.3.77, a signal could be sent if the effective user
          ID of the sender matched either the real or effective user ID of
          the target.  The current rules, which conform to POSIX.1, were
          adopted in kernel 1.3.78.


-------------------------------------------------

::

          In 2.6 kernels up to and including 2.6.7, there was a bug that
          meant that when sending signals to a process group, kill() failed
          with the error EPERM if the caller did not have permission to
          send the signal to any (rather than all) of the members of the
          process group.  Notwithstanding this error return, the signal was
          still delivered to all of the processes for which the caller had
          permission to signal.


---------------------------------------------------------

::

          kill(1), _exit(2), pidfd_send_signal(2), signal(2), tkill(2),
          exit(3), killpg(3), sigqueue(3), capabilities(7), credentials(7),
          signal(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                        KILL(2)

--------------

Pages that refer to this page: `capsh(1) <../man1/capsh.1.html>`__, 
`fuser(1) <../man1/fuser.1.html>`__, 
`kill(1@@coreutils) <../man1/kill.1@@coreutils.html>`__, 
`kill(1) <../man1/kill.1.html>`__, 
`kill(1@@procps-ng) <../man1/kill.1@@procps-ng.html>`__, 
`killall(1) <../man1/killall.1.html>`__, 
`pgrep(1) <../man1/pgrep.1.html>`__, 
`skill(1) <../man1/skill.1.html>`__, 
`strace(1) <../man1/strace.1.html>`__, 
`clone(2) <../man2/clone.2.html>`__, 
`\_exit(2) <../man2/_exit.2.html>`__, 
`fcntl(2) <../man2/fcntl.2.html>`__, 
`getpid(2) <../man2/getpid.2.html>`__, 
`getrlimit(2) <../man2/getrlimit.2.html>`__, 
`pause(2) <../man2/pause.2.html>`__, 
`pidfd_open(2) <../man2/pidfd_open.2.html>`__, 
`pidfd_send_signal(2) <../man2/pidfd_send_signal.2.html>`__, 
`ptrace(2) <../man2/ptrace.2.html>`__, 
`rt_sigqueueinfo(2) <../man2/rt_sigqueueinfo.2.html>`__, 
`setfsgid(2) <../man2/setfsgid.2.html>`__, 
`setfsuid(2) <../man2/setfsuid.2.html>`__, 
`sigaction(2) <../man2/sigaction.2.html>`__, 
`signal(2) <../man2/signal.2.html>`__, 
`sigpending(2) <../man2/sigpending.2.html>`__, 
`sigprocmask(2) <../man2/sigprocmask.2.html>`__, 
`sigreturn(2) <../man2/sigreturn.2.html>`__, 
`sigsuspend(2) <../man2/sigsuspend.2.html>`__, 
`sigwaitinfo(2) <../man2/sigwaitinfo.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`tkill(2) <../man2/tkill.2.html>`__, 
`wait(2) <../man2/wait.2.html>`__, 
`gsignal(3) <../man3/gsignal.3.html>`__, 
`killpg(3) <../man3/killpg.3.html>`__, 
`psignal(3) <../man3/psignal.3.html>`__, 
`pthread_kill(3) <../man3/pthread_kill.3.html>`__, 
`raise(3) <../man3/raise.3.html>`__, 
`sd_event_add_child(3) <../man3/sd_event_add_child.3.html>`__, 
`sigpause(3) <../man3/sigpause.3.html>`__, 
`sigqueue(3) <../man3/sigqueue.3.html>`__, 
`sigset(3) <../man3/sigset.3.html>`__, 
`sigvec(3) <../man3/sigvec.3.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`systemd.kill(5) <../man5/systemd.kill.5.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`cpuset(7) <../man7/cpuset.7.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`pid_namespaces(7) <../man7/pid_namespaces.7.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__, 
`signal(7) <../man7/signal.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`systemd-coredump(8) <../man8/systemd-coredump.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/kill.2.license.html>`__

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
