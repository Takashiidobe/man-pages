.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getcpu(2) — Linux manual page
=============================

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

   GETCPU(2)               Linux Programmer's Manual              GETCPU(2)

NAME
-------------------------------------------------

::

          getcpu - determine CPU and NUMA node on which the calling thread
          is running


---------------------------------------------------------

::

          #define _GNU_SOURCE             /* See feature_test_macros(7) */
          #include <sched.h>

          int getcpu(unsigned int *cpu, unsigned int *node);


---------------------------------------------------------------

::

          The getcpu() system call identifies the processor and node on
          which the calling thread or process is currently running and
          writes them into the integers pointed to by the cpu and node
          arguments.  The processor is a unique small integer identifying a
          CPU.  The node is a unique small identifier identifying a NUMA
          node.  When either cpu or node is NULL nothing is written to the
          respective pointer.

          The information placed in cpu is guaranteed to be current only at
          the time of the call: unless the CPU affinity has been fixed
          using sched_setaffinity(2), the kernel might change the CPU at
          any time.  (Normally this does not happen because the scheduler
          tries to minimize movements between CPUs to keep caches hot, but
          it is possible.)  The caller must allow for the possibility that
          the information returned in cpu and node is no longer current by
          the time the call returns.


-----------------------------------------------------------------

::

          On success, 0 is returned.  On error, -1 is returned, and errno
          is set to indicate the error.


-----------------------------------------------------

::

          EFAULT Arguments point outside the calling process's address
                 space.


---------------------------------------------------------

::

          getcpu() was added in kernel 2.6.19 for x86-64 and i386.  Library
          support was added in glibc 2.29 (Earlier glibc versions did not
          provide a wrapper for this system call, necessitating the use of
          syscall(2).)


-------------------------------------------------------------------

::

          getcpu() is Linux-specific.


---------------------------------------------------

::

          Linux makes a best effort to make this call as fast as possible.
          (On some architectures, this is done via an implementation in the
          vdso(7).)  The intention of getcpu() is to allow programs to make
          optimizations with per-CPU data or for NUMA optimization.

      C library/kernel differences
          The kernel system call has a third argument:

              int getcpu(unsigned int *cpu, unsigned int *node,
                         struct getcpu_cache *tcache);

          The tcache argument is unused since Linux 2.6.24, and (when
          invoking the system call directly) should be specified as NULL,
          unless portability to Linux 2.6.23 or earlier is required.

          In Linux 2.6.23 and earlier, if the tcache argument was non-NULL,
          then it specified a pointer to a caller-allocated buffer in
          thread-local storage that was used to provide a caching mechanism
          for getcpu().  Use of the cache could speed getcpu() calls, at
          the cost that there was a very small chance that the returned
          information would be out of date.  The caching mechanism was
          considered to cause problems when migrating threads between CPUs,
          and so the argument is now ignored.


---------------------------------------------------------

::

          mbind(2), sched_setaffinity(2), set_mempolicy(2),
          sched_getcpu(3), cpuset(7), vdso(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      GETCPU(2)

--------------

Pages that refer to this page:
`get_mempolicy(2) <../man2/get_mempolicy.2.html>`__, 
`mbind(2) <../man2/mbind.2.html>`__, 
`sched_setaffinity(2) <../man2/sched_setaffinity.2.html>`__, 
`set_mempolicy(2) <../man2/set_mempolicy.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`sched_getcpu(3) <../man3/sched_getcpu.3.html>`__, 
`cpuset(7) <../man7/cpuset.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/getcpu.2.license.html>`__

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
