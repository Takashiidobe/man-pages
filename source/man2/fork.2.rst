.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fork(2) — Linux manual page
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
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FORK(2)                 Linux Programmer's Manual                FORK(2)

NAME
-------------------------------------------------

::

          fork - create a child process


---------------------------------------------------------

::

          #include <unistd.h>

          pid_t fork(void);


---------------------------------------------------------------

::

          fork() creates a new process by duplicating the calling process.
          The new process is referred to as the child process.  The calling
          process is referred to as the parent process.

          The child process and the parent process run in separate memory
          spaces.  At the time of fork() both memory spaces have the same
          content.  Memory writes, file mappings (mmap(2)), and unmappings
          (munmap(2)) performed by one of the processes do not affect the
          other.

          The child process is an exact duplicate of the parent process
          except for the following points:

          *  The child has its own unique process ID, and this PID does not
             match the ID of any existing process group (setpgid(2)) or
             session.

          *  The child's parent process ID is the same as the parent's
             process ID.

          *  The child does not inherit its parent's memory locks
             (mlock(2), mlockall(2)).

          *  Process resource utilizations (getrusage(2)) and CPU time
             counters (times(2)) are reset to zero in the child.

          *  The child's set of pending signals is initially empty
             (sigpending(2)).

          *  The child does not inherit semaphore adjustments from its
             parent (semop(2)).

          *  The child does not inherit process-associated record locks
             from its parent (fcntl(2)).  (On the other hand, it does
             inherit fcntl(2) open file description locks and flock(2)
             locks from its parent.)

          *  The child does not inherit timers from its parent
             (setitimer(2), alarm(2), timer_create(2)).

          *  The child does not inherit outstanding asynchronous I/O
             operations from its parent (aio_read(3), aio_write(3)), nor
             does it inherit any asynchronous I/O contexts from its parent
             (see io_setup(2)).

          The process attributes in the preceding list are all specified in
          POSIX.1.  The parent and child also differ with respect to the
          following Linux-specific process attributes:

          *  The child does not inherit directory change notifications
             (dnotify) from its parent (see the description of F_NOTIFY in
             fcntl(2)).

          *  The prctl(2) PR_SET_PDEATHSIG setting is reset so that the
             child does not receive a signal when its parent terminates.

          *  The default timer slack value is set to the parent's current
             timer slack value.  See the description of PR_SET_TIMERSLACK
             in prctl(2).

          *  Memory mappings that have been marked with the madvise(2)
             MADV_DONTFORK flag are not inherited across a fork().

          *  Memory in address ranges that have been marked with the
             madvise(2) MADV_WIPEONFORK flag is zeroed in the child after a
             fork().  (The MADV_WIPEONFORK setting remains in place for
             those address ranges in the child.)

          *  The termination signal of the child is always SIGCHLD (see
             clone(2)).

          *  The port access permission bits set by ioperm(2) are not
             inherited by the child; the child must turn on any bits that
             it requires using ioperm(2).

          Note the following further points:

          *  The child process is created with a single thread—the one that
             called fork().  The entire virtual address space of the parent
             is replicated in the child, including the states of mutexes,
             condition variables, and other pthreads objects; the use of
             pthread_atfork(3) may be helpful for dealing with problems
             that this can cause.

          *  After a fork() in a multithreaded program, the child can
             safely call only async-signal-safe functions (see
             signal-safety(7)) until such time as it calls execve(2).

          *  The child inherits copies of the parent's set of open file
             descriptors.  Each file descriptor in the child refers to the
             same open file description (see open(2)) as the corresponding
             file descriptor in the parent.  This means that the two file
             descriptors share open file status flags, file offset, and
             signal-driven I/O attributes (see the description of F_SETOWN
             and F_SETSIG in fcntl(2)).

          *  The child inherits copies of the parent's set of open message
             queue descriptors (see mq_overview(7)).  Each file descriptor
             in the child refers to the same open message queue description
             as the corresponding file descriptor in the parent.  This
             means that the two file descriptors share the same flags
             (mq_flags).

          *  The child inherits copies of the parent's set of open
             directory streams (see opendir(3)).  POSIX.1 says that the
             corresponding directory streams in the parent and child may
             share the directory stream positioning; on Linux/glibc they do
             not.


-----------------------------------------------------------------

::

          On success, the PID of the child process is returned in the
          parent, and 0 is returned in the child.  On failure, -1 is
          returned in the parent, no child process is created, and errno is
          set to indicate the error.


-----------------------------------------------------

::

          EAGAIN A system-imposed limit on the number of threads was
                 encountered.  There are a number of limits that may
                 trigger this error:

                 *  the RLIMIT_NPROC soft resource limit (set via
                    setrlimit(2)), which limits the number of processes and
                    threads for a real user ID, was reached;

                 *  the kernel's system-wide limit on the number of
                    processes and threads, /proc/sys/kernel/threads-max,
                    was reached (see proc(5));

                 *  the maximum number of PIDs, /proc/sys/kernel/pid_max,
                    was reached (see proc(5)); or

                 *  the PID limit (pids.max) imposed by the cgroup "process
                    number" (PIDs) controller was reached.

          EAGAIN The caller is operating under the SCHED_DEADLINE
                 scheduling policy and does not have the reset-on-fork flag
                 set.  See sched(7).

          ENOMEM fork() failed to allocate the necessary kernel structures
                 because memory is tight.

          ENOMEM An attempt was made to create a child process in a PID
                 namespace whose "init" process has terminated.  See
                 pid_namespaces(7).

          ENOSYS fork() is not supported on this platform (for example,
                 hardware without a Memory-Management Unit).

          ERESTARTNOINTR (since Linux 2.6.17)
                 System call was interrupted by a signal and will be
                 restarted.  (This can be seen only during a trace.)


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.


---------------------------------------------------

::

          Under Linux, fork() is implemented using copy-on-write pages, so
          the only penalty that it incurs is the time and memory required
          to duplicate the parent's page tables, and to create a unique
          task structure for the child.

      C library/kernel differences
          Since version 2.3.3, rather than invoking the kernel's fork()
          system call, the glibc fork() wrapper that is provided as part of
          the NPTL threading implementation invokes clone(2) with flags
          that provide the same effect as the traditional system call.  (A
          call to fork() is equivalent to a call to clone(2) specifying
          flags as just SIGCHLD.)  The glibc wrapper invokes any fork
          handlers that have been established using pthread_atfork(3).


---------------------------------------------------------

::

          See pipe(2) and wait(2).


---------------------------------------------------------

::

          clone(2), execve(2), exit(2), setrlimit(2), unshare(2), vfork(2),
          wait(2), daemon(3), pthread_atfork(3), capabilities(7),
          credentials(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                        FORK(2)

--------------

Pages that refer to this page: `chrt(1) <../man1/chrt.1.html>`__, 
`dbpmda(1) <../man1/dbpmda.1.html>`__, 
`pmcd(1) <../man1/pmcd.1.html>`__, 
`setsid(1) <../man1/setsid.1.html>`__, 
`strace(1) <../man1/strace.1.html>`__, 
`xargs(1) <../man1/xargs.1.html>`__, 
`alarm(2) <../man2/alarm.2.html>`__, 
`arch_prctl(2) <../man2/arch_prctl.2.html>`__, 
`bpf(2) <../man2/bpf.2.html>`__,  `chdir(2) <../man2/chdir.2.html>`__, 
`chroot(2) <../man2/chroot.2.html>`__, 
`clone(2) <../man2/clone.2.html>`__, 
`eventfd(2) <../man2/eventfd.2.html>`__, 
`execve(2) <../man2/execve.2.html>`__, 
`\_exit(2) <../man2/_exit.2.html>`__, 
`fcntl(2) <../man2/fcntl.2.html>`__, 
`flock(2) <../man2/flock.2.html>`__, 
`getitimer(2) <../man2/getitimer.2.html>`__, 
`getpid(2) <../man2/getpid.2.html>`__, 
`getpriority(2) <../man2/getpriority.2.html>`__, 
`getrlimit(2) <../man2/getrlimit.2.html>`__, 
`gettid(2) <../man2/gettid.2.html>`__, 
`ioctl_userfaultfd(2) <../man2/ioctl_userfaultfd.2.html>`__, 
`ioperm(2) <../man2/ioperm.2.html>`__, 
`iopl(2) <../man2/iopl.2.html>`__,  `kcmp(2) <../man2/kcmp.2.html>`__, 
`keyctl(2) <../man2/keyctl.2.html>`__, 
`lseek(2) <../man2/lseek.2.html>`__, 
`madvise(2) <../man2/madvise.2.html>`__, 
`memfd_create(2) <../man2/memfd_create.2.html>`__, 
`mlock(2) <../man2/mlock.2.html>`__, 
`mmap(2) <../man2/mmap.2.html>`__, 
`mount(2) <../man2/mount.2.html>`__, 
`nice(2) <../man2/nice.2.html>`__,  `open(2) <../man2/open.2.html>`__, 
`perf_event_open(2) <../man2/perf_event_open.2.html>`__, 
`pidfd_open(2) <../man2/pidfd_open.2.html>`__, 
`pipe(2) <../man2/pipe.2.html>`__, 
`prctl(2) <../man2/prctl.2.html>`__, 
`ptrace(2) <../man2/ptrace.2.html>`__, 
`sched_setaffinity(2) <../man2/sched_setaffinity.2.html>`__, 
`sched_setattr(2) <../man2/sched_setattr.2.html>`__, 
`sched_setscheduler(2) <../man2/sched_setscheduler.2.html>`__, 
`seccomp(2) <../man2/seccomp.2.html>`__, 
`select_tut(2) <../man2/select_tut.2.html>`__, 
`semop(2) <../man2/semop.2.html>`__, 
`set_mempolicy(2) <../man2/set_mempolicy.2.html>`__, 
`setns(2) <../man2/setns.2.html>`__, 
`setpgid(2) <../man2/setpgid.2.html>`__, 
`setsid(2) <../man2/setsid.2.html>`__, 
`shmop(2) <../man2/shmop.2.html>`__, 
`sigaction(2) <../man2/sigaction.2.html>`__, 
`sigaltstack(2) <../man2/sigaltstack.2.html>`__, 
`signalfd(2) <../man2/signalfd.2.html>`__, 
`sigpending(2) <../man2/sigpending.2.html>`__, 
`sigprocmask(2) <../man2/sigprocmask.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`timer_create(2) <../man2/timer_create.2.html>`__, 
`timerfd_create(2) <../man2/timerfd_create.2.html>`__, 
`umask(2) <../man2/umask.2.html>`__, 
`unshare(2) <../man2/unshare.2.html>`__, 
`userfaultfd(2) <../man2/userfaultfd.2.html>`__, 
`vfork(2) <../man2/vfork.2.html>`__, 
`wait(2) <../man2/wait.2.html>`__, 
`wait4(2) <../man2/wait4.2.html>`__, 
`atexit(3) <../man3/atexit.3.html>`__, 
`cap_launch(3) <../man3/cap_launch.3.html>`__, 
`daemon(3) <../man3/daemon.3.html>`__, 
`exec(3) <../man3/exec.3.html>`__, 
`lttng-ust(3) <../man3/lttng-ust.3.html>`__, 
`on_exit(3) <../man3/on_exit.3.html>`__, 
`openpty(3) <../man3/openpty.3.html>`__, 
`pam_end(3) <../man3/pam_end.3.html>`__, 
`\__pmprocessexec(3) <../man3/__pmprocessexec.3.html>`__, 
`\__pmprocesspipe(3) <../man3/__pmprocesspipe.3.html>`__, 
`popen(3) <../man3/popen.3.html>`__, 
`posix_spawn(3) <../man3/posix_spawn.3.html>`__, 
`pthread_atfork(3) <../man3/pthread_atfork.3.html>`__, 
`sd_bus_creds_get_pid(3) <../man3/sd_bus_creds_get_pid.3.html>`__, 
`sem_init(3) <../man3/sem_init.3.html>`__, 
`system(3) <../man3/system.3.html>`__, 
`core(5) <../man5/core.5.html>`__,  `proc(5) <../man5/proc.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`cgroups(7) <../man7/cgroups.7.html>`__, 
`cpuset(7) <../man7/cpuset.7.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`environ(7) <../man7/environ.7.html>`__, 
`epoll(7) <../man7/epoll.7.html>`__, 
`mq_overview(7) <../man7/mq_overview.7.html>`__, 
`persistent-keyring(7) <../man7/persistent-keyring.7.html>`__, 
`pid_namespaces(7) <../man7/pid_namespaces.7.html>`__, 
`pipe(7) <../man7/pipe.7.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__, 
`sched(7) <../man7/sched.7.html>`__, 
`session-keyring(7) <../man7/session-keyring.7.html>`__, 
`signal(7) <../man7/signal.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`thread-keyring(7) <../man7/thread-keyring.7.html>`__, 
`user-keyring(7) <../man7/user-keyring.7.html>`__, 
`user_namespaces(7) <../man7/user_namespaces.7.html>`__, 
`user-session-keyring(7) <../man7/user-session-keyring.7.html>`__, 
`btrfs-balance(8) <../man8/btrfs-balance.8.html>`__, 
`trafgen(8) <../man8/trafgen.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/fork.2.license.html>`__

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
