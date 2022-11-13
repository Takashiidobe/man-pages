.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cacheflush(2) — Linux manual page
=================================

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
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CACHEFLUSH(2)           Linux Programmer's Manual          CACHEFLUSH(2)

NAME
-------------------------------------------------

::

          cacheflush - flush contents of instruction and/or data cache


---------------------------------------------------------

::

          #include <sys/cachectl.h>

          int cacheflush(void *addr, int nbytes, int cache);

          Note: On some architectures, there is no glibc wrapper for this
          system call; see NOTES.


---------------------------------------------------------------

::

          cacheflush() flushes the contents of the indicated cache(s) for
          the user addresses in the range addr to (addr+nbytes-1).  cache
          may be one of:

          ICACHE Flush the instruction cache.

          DCACHE Write back to memory and invalidate the affected valid
                 cache lines.

          BCACHE Same as (ICACHE|DCACHE).


-----------------------------------------------------------------

::

          cacheflush() returns 0 on success.  On error, it returns -1 and
          sets errno to indicate the error.


-----------------------------------------------------

::

          EFAULT Some or all of the address range addr to (addr+nbytes-1)
                 is not accessible.

          EINVAL cache is not one of ICACHE, DCACHE, or BCACHE (but see
                 BUGS).


-------------------------------------------------------------------

::

          Historically, this system call was available on all MIPS UNIX
          variants including RISC/os, IRIX, Ultrix, NetBSD, OpenBSD, and
          FreeBSD (and also on some non-UNIX MIPS operating systems), so
          that the existence of this call in MIPS operating systems is a
          de-facto standard.

      Caveat
          cacheflush() should not be used in programs intended to be
          portable.  On Linux, this call first appeared on the MIPS
          architecture, but nowadays, Linux provides a cacheflush() system
          call on some other architectures, but with different arguments.


---------------------------------------------------

::

      Architecture-specific variants
          Glibc provides a wrapper for this system call, with the prototype
          shown in SYNOPSIS, for the following architectures: ARC, CSKY,
          MIPS, and NIOS2.

          On some other architectures, Linux provides this system call,
          with different arguments:

          M68K:
                 int cacheflush(unsigned long addr, int scope, int cache,
                                unsigned long len);

          SH:
                 int cacheflush(unsigned long addr, unsigned long len, int op);

          NDS32:
                 int cacheflush(unsigned int start, unsigned int end, int cache);

          On the above architectures, glibc does not provide a wrapper for
          this system call; call it using syscall(2).

      GCC alternative
          Unless you need the finer grained control that this system call
          provides, you probably want to use the GCC built-in function
          __builtin___clear_cache(), which provides a portable interface
          across platforms supported by GCC and compatible compilers:

              void __builtin___clear_cache(void *begin, void *end);

          On platforms that don't require instruction cache flushes,
          __builtin___clear_cache() has no effect.

          Note: On some GCC-compatible compilers, the prototype for this
          built-in function uses char * instead of void * for the
          parameters.


-------------------------------------------------

::

          Linux kernels older than version 2.6.11 ignore the addr and
          nbytes arguments, making this function fairly expensive.
          Therefore, the whole cache is always flushed.

          This function always behaves as if BCACHE has been passed for the
          cache argument and does not do any error checking on the cache
          argument.

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                  CACHEFLUSH(2)

--------------

Pages that refer to this page: `syscalls(2) <../man2/syscalls.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/cacheflush.2.license.html>`__

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
