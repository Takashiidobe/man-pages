.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

process_madvise(2) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PROCESS_MADVISE(2)      Linux Programmer's Manual     PROCESS_MADVISE(2)

NAME
-------------------------------------------------

::

          process_madvise - give advice about use of memory to a process


---------------------------------------------------------

::

          #include <sys/mman.h>      /* Definition of MADV_* constants */
          #include <sys/syscall.h>   /* Definition of SYS_* constants */
          #include <sys/uio.h>       /* Definition of struct iovec type */
          #include <unistd.h>

          ssize_t syscall(SYS_process_madvise, int pidfd,
                          const struct iovec *iovec, size_t vlen, int advice,
                          unsigned int flags);

          Note: glibc provides no wrapper for process_madvise(),
          necessitating the use of syscall(2).


---------------------------------------------------------------

::

          The process_madvise() system call is used to give advice or
          directions to the kernel about the address ranges of another
          process or of the calling process.  It provides the advice for
          the address ranges described by iovec and vlen.  The goal of such
          advice is to improve system or application performance.

          The pidfd argument is a PID file descriptor (see pidfd_open(2))
          that specifies the process to which the advice is to be applied.

          The pointer iovec points to an array of iovec structures, defined
          in <sys/uio.h> as:

              struct iovec {
                  void  *iov_base;    /* Starting address */
                  size_t iov_len;     /* Length of region */
              };

          The iovec structure describes address ranges beginning at
          iov_base address and with the size of iov_len bytes.

          The vlen specifies the number of elements in the iovec structure.
          This value must be less than or equal to IOV_MAX (defined in
          <limits.h> or accessible via the call sysconf(_SC_IOV_MAX)).

          The advice argument is one of the following values:

          MADV_COLD
                 See madvise(2).

          MADV_PAGEOUT
                 See madvise(2).

          The flags argument is reserved for future use; currently, this
          argument must be specified as 0.

          The vlen and iovec arguments are checked before applying any
          advice.  If vlen is too big, or iovec is invalid, then an error
          will be returned immediately and no advice will be applied.

          The advice might be applied to only a part of iovec if one of its
          elements points to an invalid memory region in the remote
          process.  No further elements will be processed beyond that
          point.  (See the discussion regarding partial advice in RETURN
          VALUE.)

          Permission to apply advice to another process is governed by a
          ptrace access mode PTRACE_MODE_READ_REALCREDS check (see
          ptrace(2)); in addition, because of the performance implications
          of applying the advice, the caller must have the CAP_SYS_ADMIN
          capability.


-----------------------------------------------------------------

::

          On success, process_madvise() returns the number of bytes
          advised.  This return value may be less than the total number of
          requested bytes, if an error occurred after some iovec elements
          were already processed.  The caller should check the return value
          to determine whether a partial advice occurred.

          On error, -1 is returned and errno is set to indicate the error.


-----------------------------------------------------

::

          EBADF  pidfd is not a valid PID file descriptor.

          EFAULT The memory described by iovec is outside the accessible
                 address space of the process referred to by pidfd.

          EINVAL flags is not 0.

          EINVAL The sum of the iov_len values of iovec overflows a ssize_t
                 value.

          EINVAL vlen is too large.

          ENOMEM Could not allocate memory for internal copies of the iovec
                 structures.

          EPERM  The caller does not have permission to access the address
                 space of the process pidfd.

          ESRCH  The target process does not exist (i.e., it has terminated
                 and been waited on).


---------------------------------------------------------

::

          This system call first appeared in Linux 5.10.  Support for this
          system call is optional, depending on the setting of the
          CONFIG_ADVISE_SYSCALLS configuration option.


-------------------------------------------------------------------

::

          The process_madvise() system call is Linux-specific.


---------------------------------------------------------

::

          madvise(2), pidfd_open(2), process_vm_readv(2),
          process_vm_write(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-06-20             PROCESS_MADVISE(2)

--------------

Pages that refer to this page: `madvise(2) <../man2/madvise.2.html>`__, 
`pidfd_open(2) <../man2/pidfd_open.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/process_madvise.2.license.html>`__

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
