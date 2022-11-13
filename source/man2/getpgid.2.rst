.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setpgid(2) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SETPGID(2)              Linux Programmer's Manual             SETPGID(2)

NAME
-------------------------------------------------

::

          setpgid, getpgid, setpgrp, getpgrp - set/get process group


---------------------------------------------------------

::

          #include <unistd.h>

          int setpgid(pid_t pid, pid_t pgid);
          pid_t getpgid(pid_t pid);

          pid_t getpgrp(void);                 /* POSIX.1 version */
          pid_t getpgrp(pid_t pid);            /* BSD version */

          int setpgrp(void);                   /* System V version */
          int setpgrp(pid_t pid, pid_t pgid);  /* BSD version */

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          getpgid():
              _XOPEN_SOURCE >= 500
                  || /* Since glibc 2.12: */ _POSIX_C_SOURCE >= 200809L

          setpgrp() (POSIX.1):
              _XOPEN_SOURCE >= 500
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _SVID_SOURCE

          setpgrp() (BSD), getpgrp() (BSD):
              [These are available only before glibc 2.19]
              _BSD_SOURCE &&
                  ! (_POSIX_SOURCE || _POSIX_C_SOURCE || _XOPEN_SOURCE
                      || _GNU_SOURCE || _SVID_SOURCE)


---------------------------------------------------------------

::

          All of these interfaces are available on Linux, and are used for
          getting and setting the process group ID (PGID) of a process.
          The preferred, POSIX.1-specified ways of doing this are:
          getpgrp(void), for retrieving the calling process's PGID; and
          setpgid(), for setting a process's PGID.

          setpgid() sets the PGID of the process specified by pid to pgid.
          If pid is zero, then the process ID of the calling process is
          used.  If pgid is zero, then the PGID of the process specified by
          pid is made the same as its process ID.  If setpgid() is used to
          move a process from one process group to another (as is done by
          some shells when creating pipelines), both process groups must be
          part of the same session (see setsid(2) and credentials(7)).  In
          this case, the pgid specifies an existing process group to be
          joined and the session ID of that group must match the session ID
          of the joining process.

          The POSIX.1 version of getpgrp(), which takes no arguments,
          returns the PGID of the calling process.

          getpgid() returns the PGID of the process specified by pid.  If
          pid is zero, the process ID of the calling process is used.
          (Retrieving the PGID of a process other than the caller is rarely
          necessary, and the POSIX.1 getpgrp() is preferred for that task.)

          The System V-style setpgrp(), which takes no arguments, is
          equivalent to setpgid(0, 0).

          The BSD-specific setpgrp() call, which takes arguments pid and
          pgid, is a wrapper function that calls

              setpgid(pid, pgid)

          Since glibc 2.19, the BSD-specific setpgrp() function is no
          longer exposed by <unistd.h>; calls should be replaced with the
          setpgid() call shown above.

          The BSD-specific getpgrp() call, which takes a single pid
          argument, is a wrapper function that calls

              getpgid(pid)

          Since glibc 2.19, the BSD-specific getpgrp() function is no
          longer exposed by <unistd.h>; calls should be replaced with calls
          to the POSIX.1 getpgrp() which takes no arguments (if the intent
          is to obtain the caller's PGID), or with the getpgid() call shown
          above.


-----------------------------------------------------------------

::

          On success, setpgid() and setpgrp() return zero.  On error, -1 is
          returned, and errno is set to indicate the error.

          The POSIX.1 getpgrp() always returns the PGID of the caller.

          getpgid(), and the BSD-specific getpgrp() return a process group
          on success.  On error, -1 is returned, and errno is set to
          indicate the error.


-----------------------------------------------------

::

          EACCES An attempt was made to change the process group ID of one
                 of the children of the calling process and the child had
                 already performed an execve(2) (setpgid(), setpgrp()).

          EINVAL pgid is less than 0 (setpgid(), setpgrp()).

          EPERM  An attempt was made to move a process into a process group
                 in a different session, or to change the process group ID
                 of one of the children of the calling process and the
                 child was in a different session, or to change the process
                 group ID of a session leader (setpgid(), setpgrp()).

          ESRCH  For getpgid(): pid does not match any process.  For
                 setpgid(): pid is not the calling process and not a child
                 of the calling process.


-------------------------------------------------------------------

::

          setpgid() and the version of getpgrp() with no arguments conform
          to POSIX.1-2001.

          POSIX.1-2001 also specifies getpgid() and the version of
          setpgrp() that takes no arguments.  (POSIX.1-2008 marks this
          setpgrp() specification as obsolete.)

          The version of getpgrp() with one argument and the version of
          setpgrp() that takes two arguments derive from 4.2BSD, and are
          not specified by POSIX.1.


---------------------------------------------------

::

          A child created via fork(2) inherits its parent's process group
          ID.  The PGID is preserved across an execve(2).

          Each process group is a member of a session and each process is a
          member of the session of which its process group is a member.
          (See credentials(7).)

          A session can have a controlling terminal.  At any time, one (and
          only one) of the process groups in the session can be the
          foreground process group for the terminal; the remaining process
          groups are in the background.  If a signal is generated from the
          terminal (e.g., typing the interrupt key to generate SIGINT),
          that signal is sent to the foreground process group.  (See
          termios(3) for a description of the characters that generate
          signals.)  Only the foreground process group may read(2) from the
          terminal; if a background process group tries to read(2) from the
          terminal, then the group is sent a SIGTTIN signal, which suspends
          it.  The tcgetpgrp(3) and tcsetpgrp(3) functions are used to
          get/set the foreground process group of the controlling terminal.

          The setpgid() and getpgrp() calls are used by programs such as
          bash(1) to create process groups in order to implement shell job
          control.

          If the termination of a process causes a process group to become
          orphaned, and if any member of the newly orphaned process group
          is stopped, then a SIGHUP signal followed by a SIGCONT signal
          will be sent to each process in the newly orphaned process group.
          An orphaned process group is one in which the parent of every
          member of process group is either itself also a member of the
          process group or is a member of a process group in a different
          session (see also credentials(7)).


---------------------------------------------------------

::

          getuid(2), setsid(2), tcgetpgrp(3), tcsetpgrp(3), termios(3),
          credentials(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                     SETPGID(2)

--------------

Pages that refer to this page: `gawk(1) <../man1/gawk.1.html>`__, 
`strace(1) <../man1/strace.1.html>`__, 
`fork(2) <../man2/fork.2.html>`__, 
`getsid(2) <../man2/getsid.2.html>`__, 
`setsid(2) <../man2/setsid.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`exit(3) <../man3/exit.3.html>`__, 
`killpg(3) <../man3/killpg.3.html>`__, 
`posix_spawn(3) <../man3/posix_spawn.3.html>`__, 
`tcgetpgrp(3) <../man3/tcgetpgrp.3.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/setpgid.2.license.html>`__

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
