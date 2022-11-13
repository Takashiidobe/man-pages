.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

subpage_prot(2) — Linux manual page
===================================

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

   SUBPAGE_PROT(2)         Linux Programmer's Manual        SUBPAGE_PROT(2)

NAME
-------------------------------------------------

::

          subpage_prot - define a subpage protection for an address range


---------------------------------------------------------

::

          #include <sys/syscall.h>      /* Definition of SYS_* constants */
          #include <unistd.h>

          int syscall(SYS_subpage_prot, unsigned long addr, unsigned long len,
                      uint32_t *map);

          Note: glibc provides no wrapper for subpage_prot(), necessitating
          the use of syscall(2).


---------------------------------------------------------------

::

          The PowerPC-specific subpage_prot() system call provides the
          facility to control the access permissions on individual 4 kB
          subpages on systems configured with a page size of 64 kB.

          The protection map is applied to the memory pages in the region
          starting at addr and continuing for len bytes.  Both of these
          arguments must be aligned to a 64-kB boundary.

          The protection map is specified in the buffer pointed to by map.
          The map has 2 bits per 4 kB subpage; thus each 32-bit word
          specifies the protections of 16 4 kB subpages inside a 64 kB page
          (so, the number of 32-bit words pointed to by map should equate
          to the number of 64-kB pages specified by len).  Each 2-bit field
          in the protection map is either 0 to allow any access, 1 to
          prevent writes, or 2 or 3 to prevent all accesses.


-----------------------------------------------------------------

::

          On success, subpage_prot() returns 0.  Otherwise, one of the
          error codes specified below is returned.


-----------------------------------------------------

::

          EFAULT The buffer referred to by map is not accessible.

          EINVAL The addr or len arguments are incorrect.  Both of these
                 arguments must be aligned to a multiple of the system page
                 size, and they must not refer to a region outside of the
                 address space of the process or to a region that consists
                 of huge pages.

          ENOMEM Out of memory.


---------------------------------------------------------

::

          This system call is provided on the PowerPC architecture since
          Linux 2.6.25.  The system call is provided only if the kernel is
          configured with CONFIG_PPC_64K_PAGES.  No library support is
          provided.


-------------------------------------------------------------------

::

          This system call is Linux-specific.


---------------------------------------------------

::

          Normal page protections (at the 64-kB page level) also apply; the
          subpage protection mechanism is an additional constraint, so
          putting 0 in a 2-bit field won't allow writes to a page that is
          otherwise write-protected.

      Rationale
          This system call is provided to assist writing emulators that
          operate using 64-kB pages on PowerPC systems.  When emulating
          systems such as x86, which uses a smaller page size, the emulator
          can no longer use the memory-management unit (MMU) and normal
          system calls for controlling page protections.  (The emulator
          could emulate the MMU by checking and possibly remapping the
          address for each memory access in software, but that is slow.)
          The idea is that the emulator supplies an array of protection
          masks to apply to a specified range of virtual addresses.  These
          masks are applied at the level where hardware page-table entries
          (PTEs) are inserted into the hardware page table based on the
          Linux PTEs, so the Linux PTEs are not affected.  Implicit in this
          is that the regions of the address space that are protected are
          switched to use 4-kB hardware pages rather than 64-kB hardware
          pages (on machines with hardware 64-kB page support).


---------------------------------------------------------

::

          mprotect(2), syscall(2)

          Documentation/admin-guide/mm/hugetlbpage.rst in the Linux kernel
          source tree

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                SUBPAGE_PROT(2)

--------------

Pages that refer to this page: `syscalls(2) <../man2/syscalls.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/subpage_prot.2.license.html>`__

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
