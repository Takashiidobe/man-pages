.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

s390_pci_mmio_write(2) — Linux manual page
==========================================

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

   S390_PCI_MMIO_WRITE(2)     System Calls Manual    S390_PCI_MMIO_WRITE(2)

NAME
-------------------------------------------------

::

          s390_pci_mmio_write, s390_pci_mmio_read - transfer data to/from
          PCI MMIO memory page


---------------------------------------------------------

::

          #include <sys/syscall.h>      /* Definition of SYS_* constants */
          #include <unistd.h>

          int syscall(SYS_s390_pci_mmio_write, unsigned long mmio_addr,
                                 const void *user_buffer, size_t length);
          int syscall(SYS_s390_pci_mmio_read, unsigned long mmio_addr,
                                 void *user_buffer, size_t length);

          Note: glibc provides no wrappers for these system calls,
          necessitating the use of syscall(2).


---------------------------------------------------------------

::

          The s390_pci_mmio_write() system call writes length bytes of data
          from the user-space buffer user_buffer to the PCI MMIO memory
          location specified by mmio_addr.  The s390_pci_mmio_read() system
          call reads length bytes of data from the PCI MMIO memory location
          specified by mmio_addr to the user-space buffer user_buffer.

          These system calls must be used instead of the simple assignment
          or data-transfer operations that are used to access the PCI MMIO
          memory areas mapped to user space on the Linux System z platform.
          The address specified by mmio_addr must belong to a PCI MMIO
          memory page mapping in the caller's address space, and the data
          being written or read must not cross a page boundary.  The length
          value cannot be greater than the system page size.


-----------------------------------------------------------------

::

          On success, s390_pci_mmio_write() and s390_pci_mmio_read() return
          0.  On failure, -1 is returned and errno is set to indicate the
          error.


-----------------------------------------------------

::

          EFAULT The address in mmio_addr is invalid.

          EFAULT user_buffer does not point to a valid location in the
                 caller's address space.

          EINVAL Invalid length argument.

          ENODEV PCI support is not enabled.

          ENOMEM Insufficient memory.


---------------------------------------------------------

::

          These system calls are available since Linux 3.19.


-------------------------------------------------------------------

::

          This Linux-specific system call is available only on the s390
          architecture.  The required PCI support is available beginning
          with System z EC12.


---------------------------------------------------------

::

          syscall(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux Programmer's Manual      2021-03-22         S390_PCI_MMIO_WRITE(2)

--------------

Pages that refer to this page: `syscalls(2) <../man2/syscalls.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/s390_pci_mmio_write.2.license.html>`__

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
