.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nice(2) — Linux manual page
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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NICE(2)                 Linux Programmer's Manual                NICE(2)

NAME
-------------------------------------------------

::

          nice - change process priority


---------------------------------------------------------

::

          #include <unistd.h>

          int nice(int inc);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          nice():
              _XOPEN_SOURCE
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          nice() adds inc to the nice value for the calling thread.  (A
          higher nice value means a lower priority.)

          The range of the nice value is +19 (low priority) to -20 (high
          priority).  Attempts to set a nice value outside the range are
          clamped to the range.

          Traditionally, only a privileged process could lower the nice
          value (i.e., set a higher priority).  However, since Linux
          2.6.12, an unprivileged process can decrease the nice value of a
          target process that has a suitable RLIMIT_NICE soft limit; see
          getrlimit(2) for details.


-----------------------------------------------------------------

::

          On success, the new nice value is returned (but see NOTES below).
          On error, -1 is returned, and errno is set to indicate the error.

          A successful call can legitimately return -1.  To detect an
          error, set errno to 0 before the call, and check whether it is
          nonzero after nice() returns -1.


-----------------------------------------------------

::

          EPERM  The calling process attempted to increase its priority by
                 supplying a negative inc but has insufficient privileges.
                 Under Linux, the CAP_SYS_NICE capability is required.
                 (But see the discussion of the RLIMIT_NICE resource limit
                 in setrlimit(2).)


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.  However, the raw
          system call and (g)libc (earlier than glibc 2.2.4) return value
          is nonstandard, see below.


---------------------------------------------------

::

          For further details on the nice value, see sched(7).

          Note: the addition of the "autogroup" feature in Linux 2.6.38
          means that the nice value no longer has its traditional effect in
          many circumstances.  For details, see sched(7).

      C library/kernel differences
          POSIX.1 specifies that nice() should return the new nice value.
          However, the raw Linux system call returns 0 on success.
          Likewise, the nice() wrapper function provided in glibc 2.2.3 and
          earlier returns 0 on success.

          Since glibc 2.2.4, the nice() wrapper function provided by glibc
          provides conformance to POSIX.1 by calling getpriority(2) to
          obtain the new nice value, which is then returned to the caller.


---------------------------------------------------------

::

          nice(1), renice(1), fork(2), getpriority(2), getrlimit(2),
          setpriority(2), capabilities(7), sched(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                        NICE(2)

--------------

Pages that refer to this page: `nice(1) <../man1/nice.1.html>`__, 
`getpriority(2) <../man2/getpriority.2.html>`__, 
`getrlimit(2) <../man2/getrlimit.2.html>`__, 
`sched_setaffinity(2) <../man2/sched_setaffinity.2.html>`__, 
`sched_setattr(2) <../man2/sched_setattr.2.html>`__, 
`sched_setparam(2) <../man2/sched_setparam.2.html>`__, 
`sched_setscheduler(2) <../man2/sched_setscheduler.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`sched(7) <../man7/sched.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/nice.2.license.html>`__

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
