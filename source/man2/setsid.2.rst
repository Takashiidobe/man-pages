.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setsid(2) — Linux manual page
=============================

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

   SETSID(2)               Linux Programmer's Manual              SETSID(2)

NAME
-------------------------------------------------

::

          setsid - creates a session and sets the process group ID


---------------------------------------------------------

::

          #include <unistd.h>

          pid_t setsid(void);


---------------------------------------------------------------

::

          setsid() creates a new session if the calling process is not a
          process group leader.  The calling process is the leader of the
          new session (i.e., its session ID is made the same as its process
          ID).  The calling process also becomes the process group leader
          of a new process group in the session (i.e., its process group ID
          is made the same as its process ID).

          The calling process will be the only process in the new process
          group and in the new session.

          Initially, the new session has no controlling terminal.  For
          details of how a session acquires a controlling terminal, see
          credentials(7).


-----------------------------------------------------------------

::

          On success, the (new) session ID of the calling process is
          returned.  On error, (pid_t) -1 is returned, and errno is set to
          indicate the error.


-----------------------------------------------------

::

          EPERM  The process group ID of any process equals the PID of the
                 calling process.  Thus, in particular, setsid() fails if
                 the calling process is already a process group leader.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4.


---------------------------------------------------

::

          A child created via fork(2) inherits its parent's session ID.
          The session ID is preserved across an execve(2).

          A process group leader is a process whose process group ID equals
          its PID.  Disallowing a process group leader from calling
          setsid() prevents the possibility that a process group leader
          places itself in a new session while other processes in the
          process group remain in the original session; such a scenario
          would break the strict two-level hierarchy of sessions and
          process groups.  In order to be sure that setsid() will succeed,
          call fork(2) and have the parent _exit(2), while the child (which
          by definition can't be a process group leader) calls setsid().

          If a session has a controlling terminal, and the CLOCAL flag for
          that terminal is not set, and a terminal hangup occurs, then the
          session leader is sent a SIGHUP signal.

          If a process that is a session leader terminates, then a SIGHUP
          signal is sent to each process in the foreground process group of
          the controlling terminal.


---------------------------------------------------------

::

          setsid(1), getsid(2), setpgid(2), setpgrp(2), tcgetsid(3),
          credentials(7), sched(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      SETSID(2)

--------------

Pages that refer to this page: `setsid(1) <../man1/setsid.1.html>`__, 
`getsid(2) <../man2/getsid.2.html>`__, 
`setpgid(2) <../man2/setpgid.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`daemon(3) <../man3/daemon.3.html>`__, 
`posix_spawn(3) <../man3/posix_spawn.3.html>`__, 
`tcgetpgrp(3) <../man3/tcgetpgrp.3.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__, 
`pty(7) <../man7/pty.7.html>`__,  `sched(7) <../man7/sched.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/setsid.2.license.html>`__

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
