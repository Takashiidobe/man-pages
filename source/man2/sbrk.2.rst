.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

brk(2) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BRK(2)                  Linux Programmer's Manual                 BRK(2)

NAME
-------------------------------------------------

::

          brk, sbrk - change data segment size


---------------------------------------------------------

::

          #include <unistd.h>

          int brk(void *addr);
          void *sbrk(intptr_t increment);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          brk(), sbrk():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
                      || ((_XOPEN_SOURCE >= 500) &&
                          ! (_POSIX_C_SOURCE >= 200112L))
              From glibc 2.12 to 2.19:
                  _BSD_SOURCE || _SVID_SOURCE
                      || ((_XOPEN_SOURCE >= 500) &&
                          ! (_POSIX_C_SOURCE >= 200112L))
              Before glibc 2.12:
                  _BSD_SOURCE || _SVID_SOURCE || _XOPEN_SOURCE >= 500


---------------------------------------------------------------

::

          brk() and sbrk() change the location of the program break, which
          defines the end of the process's data segment (i.e., the program
          break is the first location after the end of the uninitialized
          data segment).  Increasing the program break has the effect of
          allocating memory to the process; decreasing the break
          deallocates memory.

          brk() sets the end of the data segment to the value specified by
          addr, when that value is reasonable, the system has enough
          memory, and the process does not exceed its maximum data size
          (see setrlimit(2)).

          sbrk() increments the program's data space by increment bytes.
          Calling sbrk() with an increment of 0 can be used to find the
          current location of the program break.


-----------------------------------------------------------------

::

          On success, brk() returns zero.  On error, -1 is returned, and
          errno is set to ENOMEM.

          On success, sbrk() returns the previous program break.  (If the
          break was increased, then this value is a pointer to the start of
          the newly allocated memory).  On error, (void *) -1 is returned,
          and errno is set to ENOMEM.


-------------------------------------------------------------------

::

          4.3BSD; SUSv1, marked LEGACY in SUSv2, removed in POSIX.1-2001.


---------------------------------------------------

::

          Avoid using brk() and sbrk(): the malloc(3) memory allocation
          package is the portable and comfortable way of allocating memory.

          Various systems use various types for the argument of sbrk().
          Common are int, ssize_t, ptrdiff_t, intptr_t.

      C library/kernel differences
          The return value described above for brk() is the behavior
          provided by the glibc wrapper function for the Linux brk() system
          call.  (On most other implementations, the return value from
          brk() is the same; this return value was also specified in
          SUSv2.)  However, the actual Linux system call returns the new
          program break on success.  On failure, the system call returns
          the current break.  The glibc wrapper function does some work
          (i.e., checks whether the new break is less than addr) to provide
          the 0 and -1 return values described above.

          On Linux, sbrk() is implemented as a library function that uses
          the brk() system call, and does some internal bookkeeping so that
          it can return the old break value.


---------------------------------------------------------

::

          execve(2), getrlimit(2), end(3), malloc(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                         BRK(2)

--------------

Pages that refer to this page:
`getrlimit(2) <../man2/getrlimit.2.html>`__, 
`mlock(2) <../man2/mlock.2.html>`__, 
`mmap(2) <../man2/mmap.2.html>`__, 
`mremap(2) <../man2/mremap.2.html>`__, 
`prctl(2) <../man2/prctl.2.html>`__, 
`shmop(2) <../man2/shmop.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`alloca(3) <../man3/alloca.3.html>`__, 
`end(3) <../man3/end.3.html>`__, 
`malloc(3) <../man3/malloc.3.html>`__, 
`malloc_hook(3) <../man3/malloc_hook.3.html>`__, 
`malloc_trim(3) <../man3/malloc_trim.3.html>`__, 
`mallopt(3) <../man3/mallopt.3.html>`__, 
`posix_memalign(3) <../man3/posix_memalign.3.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`cpuset(7) <../man7/cpuset.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/brk.2.license.html>`__

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
