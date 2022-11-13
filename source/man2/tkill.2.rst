.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tkill(2) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TKILL(2)                Linux Programmer's Manual               TKILL(2)

NAME
-------------------------------------------------

::

          tkill, tgkill - send a signal to a thread


---------------------------------------------------------

::

          #include <signal.h>           /* Definition of SIG* constants */
          #include <sys/syscall.h>      /* Definition of SYS_* constants */
          #include <unistd.h>

          int syscall(SYS_tkill, pid_t tid, int sig);

          #include <signal.h>

          int tgkill(pid_t tgid, pid_t tid, int sig);

          Note: glibc provides no wrapper for tkill(), necessitating the
          use of syscall(2).


---------------------------------------------------------------

::

          tgkill() sends the signal sig to the thread with the thread ID
          tid in the thread group tgid.  (By contrast, kill(2) can be used
          to send a signal only to a process (i.e., thread group) as a
          whole, and the signal will be delivered to an arbitrary thread
          within that process.)

          tkill() is an obsolete predecessor to tgkill().  It allows only
          the target thread ID to be specified, which may result in the
          wrong thread being signaled if a thread terminates and its thread
          ID is recycled.  Avoid using this system call.

          These are the raw system call interfaces, meant for internal
          thread library use.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EAGAIN The RLIMIT_SIGPENDING resource limit was reached and sig
                 is a real-time signal.

          EAGAIN Insufficient kernel memory was available and sig is a
                 real-time signal.

          EINVAL An invalid thread ID, thread group ID, or signal was
                 specified.

          EPERM  Permission denied.  For the required permissions, see
                 kill(2).

          ESRCH  No process with the specified thread ID (and thread group
                 ID) exists.


---------------------------------------------------------

::

          tkill() is supported since Linux 2.4.19 / 2.5.4.  tgkill() was
          added in Linux 2.5.75.

          Library support for tgkill() was added to glibc in version 2.30.


-------------------------------------------------------------------

::

          tkill() and tgkill() are Linux-specific and should not be used in
          programs that are intended to be portable.


---------------------------------------------------

::

          See the description of CLONE_THREAD in clone(2) for an
          explanation of thread groups.

          Before glibc 2.30, there was also no wrapper function for
          tgkill().


---------------------------------------------------------

::

          clone(2), gettid(2), kill(2), rt_sigqueueinfo(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                       TKILL(2)

--------------

Pages that refer to this page: `clone(2) <../man2/clone.2.html>`__, 
`gettid(2) <../man2/gettid.2.html>`__, 
`kill(2) <../man2/kill.2.html>`__, 
`ptrace(2) <../man2/ptrace.2.html>`__, 
`rt_sigqueueinfo(2) <../man2/rt_sigqueueinfo.2.html>`__, 
`sigaction(2) <../man2/sigaction.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`raise(3) <../man3/raise.3.html>`__, 
`nptl(7) <../man7/nptl.7.html>`__, 
`signal(7) <../man7/signal.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/tkill.2.license.html>`__

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
