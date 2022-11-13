.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sys_types.h(0p) — Linux manual page
===================================

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

   sys_types.h(0P)         POSIX Programmer's Manual        sys_types.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sys/types.h — data types


---------------------------------------------------------

::

          #include <sys/types.h>


---------------------------------------------------------------

::

          The <sys/types.h> header shall define at least the following
          types:

          blkcnt_t        Used for file block counts.

          blksize_t       Used for block sizes.

          clock_t         Used for system times in clock ticks or
                          CLOCKS_PER_SEC; see <time.h>.

          clockid_t       Used for clock ID type in the clock and timer
                          functions.

          dev_t           Used for device IDs.

          fsblkcnt_t      Used for file system block counts.

          fsfilcnt_t      Used for file system file counts.

          gid_t           Used for group IDs.

          id_t            Used as a general identifier; can be used to
                          contain at least a pid_t, uid_t, or gid_t.

          ino_t           Used for file serial numbers.

          key_t           Used for XSI interprocess communication.

          mode_t          Used for some file attributes.

          nlink_t         Used for link counts.

          off_t           Used for file sizes.

          pid_t           Used for process IDs and process group IDs.

          pthread_attr_t  Used to identify a thread attribute object.

          pthread_barrier_t
                          Used to identify a barrier.

          pthread_barrierattr_t
                          Used to define a barrier attributes object.

          pthread_cond_t  Used for condition variables.

          pthread_condattr_t
                          Used to identify a condition attribute object.

          pthread_key_t   Used for thread-specific data keys.

          pthread_mutex_t Used for mutexes.

          pthread_mutexattr_t
                          Used to identify a mutex attribute object.

          pthread_once_t  Used for dynamic package initialization.

          pthread_rwlock_t
                          Used for read-write locks.

          pthread_rwlockattr_t
                          Used for read-write lock attributes.

          pthread_spinlock_t
                          Used to identify a spin lock.

          pthread_t       Used to identify a thread.

          size_t          Used for sizes of objects.

          ssize_t         Used for a count of bytes or an error indication.

          suseconds_t     Used for time in microseconds.

          time_t          Used for time in seconds.

          timer_t         Used for timer ID returned by timer_create().

          trace_attr_t    Used to identify a trace stream attributes object

          trace_event_id_t
                          Used to identify a trace event type.

          trace_event_set_t
                          Used to identify a trace event type set.

          trace_id_t      Used to identify a trace stream.

          uid_t           Used for user IDs.

          All of the types shall be defined as arithmetic types of an
          appropriate length, with the following exceptions:

          pthread_attr_t
          pthread_barrier_t
          pthread_barrierattr_t
          pthread_cond_t
          pthread_condattr_t
          pthread_key_t
          pthread_mutex_t
          pthread_mutexattr_t
          pthread_once_t
          pthread_rwlock_t
          pthread_rwlockattr_t
          pthread_spinlock_t
          pthread_t
          timer_t
          trace_attr_t
          trace_event_id_t
          trace_event_set_t
          trace_id_t

          Additionally:

           *  mode_t shall be an integer type.

           *  dev_t shall be an integer type.

           *  nlink_t, uid_t, gid_t, and id_t shall be integer types.

           *  blkcnt_t and off_t shall be signed integer types.

           *  fsblkcnt_t, fsfilcnt_t, and ino_t shall be defined as
              unsigned integer types.

           *  size_t shall be an unsigned integer type.

           *  blksize_t, pid_t, and ssize_t shall be signed integer types.

           *  clock_t shall be an integer or real-floating type.  time_t
              shall be an integer type.

          The type ssize_t shall be capable of storing values at least in
          the range [-1, {SSIZE_MAX}].

          The type suseconds_t shall be a signed integer type capable of
          storing values at least in the range [-1, 1000000].

          The implementation shall support one or more programming
          environments in which the widths of blksize_t, pid_t, size_t,
          ssize_t, and suseconds_t are no greater than the width of type
          long.  The names of these programming environments can be
          obtained using the confstr() function or the getconf utility.

          There are no defined comparison or assignment operators for the
          following types:

          pthread_attr_t
          pthread_barrier_t
          pthread_barrierattr_t
          pthread_cond_t
          pthread_condattr_t
          pthread_mutex_t
          pthread_mutexattr_t
          pthread_rwlock_t
          pthread_rwlockattr_t
          pthread_spinlock_t
          timer_t
          trace_attr_t

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

          time.h(0p)

          The System Interfaces volume of POSIX.1‐2017, confstr(3p)

          The Shell and Utilities volume of POSIX.1‐2017, getconf(1p)


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

   IEEE/The Open Group               2017                   sys_types.h(0P)

--------------

Pages that refer to this page: `aio.h(0p) <../man0/aio.h.0p.html>`__, 
`dirent.h(0p) <../man0/dirent.h.0p.html>`__, 
`fcntl.h(0p) <../man0/fcntl.h.0p.html>`__, 
`glob.h(0p) <../man0/glob.h.0p.html>`__, 
`grp.h(0p) <../man0/grp.h.0p.html>`__, 
`iconv.h(0p) <../man0/iconv.h.0p.html>`__, 
`math.h(0p) <../man0/math.h.0p.html>`__, 
`monetary.h(0p) <../man0/monetary.h.0p.html>`__, 
`mqueue.h(0p) <../man0/mqueue.h.0p.html>`__, 
`ndbm.h(0p) <../man0/ndbm.h.0p.html>`__, 
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pwd.h(0p) <../man0/pwd.h.0p.html>`__, 
`regex.h(0p) <../man0/regex.h.0p.html>`__, 
`sched.h(0p) <../man0/sched.h.0p.html>`__, 
`search.h(0p) <../man0/search.h.0p.html>`__, 
`semaphore.h(0p) <../man0/semaphore.h.0p.html>`__, 
`signal.h(0p) <../man0/signal.h.0p.html>`__, 
`spawn.h(0p) <../man0/spawn.h.0p.html>`__, 
`stddef.h(0p) <../man0/stddef.h.0p.html>`__, 
`stdio.h(0p) <../man0/stdio.h.0p.html>`__, 
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`string.h(0p) <../man0/string.h.0p.html>`__, 
`strings.h(0p) <../man0/strings.h.0p.html>`__, 
`stropts.h(0p) <../man0/stropts.h.0p.html>`__, 
`sys_ipc.h(0p) <../man0/sys_ipc.h.0p.html>`__, 
`sys_mman.h(0p) <../man0/sys_mman.h.0p.html>`__, 
`sys_msg.h(0p) <../man0/sys_msg.h.0p.html>`__, 
`sys_resource.h(0p) <../man0/sys_resource.h.0p.html>`__, 
`sys_select.h(0p) <../man0/sys_select.h.0p.html>`__, 
`sys_sem.h(0p) <../man0/sys_sem.h.0p.html>`__, 
`sys_shm.h(0p) <../man0/sys_shm.h.0p.html>`__, 
`sys_socket.h(0p) <../man0/sys_socket.h.0p.html>`__, 
`sys_stat.h(0p) <../man0/sys_stat.h.0p.html>`__, 
`sys_statvfs.h(0p) <../man0/sys_statvfs.h.0p.html>`__, 
`sys_time.h(0p) <../man0/sys_time.h.0p.html>`__, 
`sys_times.h(0p) <../man0/sys_times.h.0p.html>`__, 
`sys_uio.h(0p) <../man0/sys_uio.h.0p.html>`__, 
`sys_wait.h(0p) <../man0/sys_wait.h.0p.html>`__, 
`termios.h(0p) <../man0/termios.h.0p.html>`__, 
`time.h(0p) <../man0/time.h.0p.html>`__, 
`trace.h(0p) <../man0/trace.h.0p.html>`__, 
`unistd.h(0p) <../man0/unistd.h.0p.html>`__, 
`utime.h(0p) <../man0/utime.h.0p.html>`__, 
`utmpx.h(0p) <../man0/utmpx.h.0p.html>`__, 
`chmod(3p) <../man3/chmod.3p.html>`__, 
`chown(3p) <../man3/chown.3p.html>`__, 
`creat(3p) <../man3/creat.3p.html>`__, 
`fdopendir(3p) <../man3/fdopendir.3p.html>`__, 
`fork(3p) <../man3/fork.3p.html>`__, 
`fstat(3p) <../man3/fstat.3p.html>`__, 
`fstatat(3p) <../man3/fstatat.3p.html>`__, 
`getegid(3p) <../man3/getegid.3p.html>`__, 
`geteuid(3p) <../man3/geteuid.3p.html>`__, 
`getgid(3p) <../man3/getgid.3p.html>`__, 
`getgrgid(3p) <../man3/getgrgid.3p.html>`__, 
`getgrnam(3p) <../man3/getgrnam.3p.html>`__, 
`getgroups(3p) <../man3/getgroups.3p.html>`__, 
`getpgrp(3p) <../man3/getpgrp.3p.html>`__, 
`getpid(3p) <../man3/getpid.3p.html>`__, 
`getppid(3p) <../man3/getppid.3p.html>`__, 
`getpwnam(3p) <../man3/getpwnam.3p.html>`__, 
`getpwuid(3p) <../man3/getpwuid.3p.html>`__, 
`getuid(3p) <../man3/getuid.3p.html>`__, 
`kill(3p) <../man3/kill.3p.html>`__, 
`lseek(3p) <../man3/lseek.3p.html>`__, 
`mkdir(3p) <../man3/mkdir.3p.html>`__, 
`mkfifo(3p) <../man3/mkfifo.3p.html>`__, 
`open(3p) <../man3/open.3p.html>`__, 
`posix_trace_attr_getlogsize(3p) <../man3/posix_trace_attr_getlogsize.3p.html>`__, 
`posix_trace_clear(3p) <../man3/posix_trace_clear.3p.html>`__, 
`posix_trace_create(3p) <../man3/posix_trace_create.3p.html>`__, 
`posix_trace_event(3p) <../man3/posix_trace_event.3p.html>`__, 
`posix_trace_getnext_event(3p) <../man3/posix_trace_getnext_event.3p.html>`__, 
`pthread_atfork(3p) <../man3/pthread_atfork.3p.html>`__, 
`raise(3p) <../man3/raise.3p.html>`__, 
`readdir(3p) <../man3/readdir.3p.html>`__, 
`regcomp(3p) <../man3/regcomp.3p.html>`__, 
`rewinddir(3p) <../man3/rewinddir.3p.html>`__, 
`seekdir(3p) <../man3/seekdir.3p.html>`__, 
`semop(3p) <../man3/semop.3p.html>`__, 
`setegid(3p) <../man3/setegid.3p.html>`__, 
`setenv(3p) <../man3/setenv.3p.html>`__, 
`seteuid(3p) <../man3/seteuid.3p.html>`__, 
`setgid(3p) <../man3/setgid.3p.html>`__, 
`setpgid(3p) <../man3/setpgid.3p.html>`__, 
`setsid(3p) <../man3/setsid.3p.html>`__, 
`setuid(3p) <../man3/setuid.3p.html>`__, 
`tcgetpgrp(3p) <../man3/tcgetpgrp.3p.html>`__, 
`tcsetpgrp(3p) <../man3/tcsetpgrp.3p.html>`__, 
`umask(3p) <../man3/umask.3p.html>`__, 
`unsetenv(3p) <../man3/unsetenv.3p.html>`__

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
