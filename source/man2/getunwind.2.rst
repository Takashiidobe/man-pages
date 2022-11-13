.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getunwind(2) — Linux manual page
================================

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

   GETUNWIND(2)            Linux Programmer's Manual           GETUNWIND(2)

NAME
-------------------------------------------------

::

          getunwind - copy the unwind data to caller's buffer


---------------------------------------------------------

::

          #include <linux/unwind.h>
          #include <sys/syscall.h>      /* Definition of SYS_* constants */
          #include <unistd.h>

          long syscall(SYS_getunwind, void *buf, size_t buf_size);

          Note: glibc provides no wrapper for getunwind(), necessitating
          the use of syscall(2).


---------------------------------------------------------------

::

          Note: this system call is obsolete.

          The IA-64-specific getunwind() system call copies the kernel's
          call frame unwind data into the buffer pointed to by buf and
          returns the size of the unwind data; this data describes the gate
          page (kernel code that is mapped into user space).

          The size of the buffer buf is specified in buf_size.  The data is
          copied only if buf_size is greater than or equal to the size of
          the unwind data and buf is not NULL; otherwise, no data is
          copied, and the call succeeds, returning the size that would be
          needed to store the unwind data.

          The first part of the unwind data contains an unwind table.  The
          rest contains the associated unwind information, in no particular
          order.  The unwind table contains entries of the following form:

              u64 start;      (64-bit address of start of function)
              u64 end;        (64-bit address of end of function)
              u64 info;       (BUF-relative offset to unwind info)

          An entry whose start value is zero indicates the end of the
          table.  For more information about the format, see the IA-64
          Software Conventions and Runtime Architecture manual.


-----------------------------------------------------------------

::

          On success, getunwind() returns the size of the unwind data.  On
          error, -1 is returned and errno is set to indicate the error.


-----------------------------------------------------

::

          getunwind() fails with the error EFAULT if the unwind info can't
          be stored in the space specified by buf.


---------------------------------------------------------

::

          This system call is available since Linux 2.4.


-------------------------------------------------------------------

::

          This system call is Linux-specific, and is available only on the
          IA-64 architecture.


---------------------------------------------------

::

          This system call has been deprecated.  The modern way to obtain
          the kernel's unwind data is via the vdso(7).


---------------------------------------------------------

::

          getauxval(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                   GETUNWIND(2)

--------------

Pages that refer to this page: `syscalls(2) <../man2/syscalls.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/getunwind.2.license.html>`__

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
