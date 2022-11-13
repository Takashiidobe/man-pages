.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

numa(7) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NUMA(7)                 Linux Programmer's Manual                NUMA(7)

NAME
-------------------------------------------------

::

          numa - overview of Non-Uniform Memory Architecture


---------------------------------------------------------------

::

          Non-Uniform Memory Access (NUMA) refers to multiprocessor systems
          whose memory is divided into multiple memory nodes.  The access
          time of a memory node depends on the relative locations of the
          accessing CPU and the accessed node.  (This contrasts with a
          symmetric multiprocessor system, where the access time for all of
          the memory is the same for all CPUs.)  Normally, each CPU on a
          NUMA system has a local memory node whose contents can be
          accessed faster than the memory in the node local to another CPU
          or the memory on a bus shared by all CPUs.

      NUMA system calls
          The Linux kernel implements the following NUMA-related system
          calls: get_mempolicy(2), mbind(2), migrate_pages(2),
          move_pages(2), and set_mempolicy(2).  However, applications
          should normally use the interface provided by libnuma; see
          "Library Support" below.

      /proc/[number]/numa_maps (since Linux 2.6.14)
          This file displays information about a process's NUMA memory
          policy and allocation.

          Each line contains information about a memory range used by the
          process, displaying—among other information—the effective memory
          policy for that memory range and on which nodes the pages have
          been allocated.

          numa_maps is a read-only file.  When /proc/<pid>/numa_maps is
          read, the kernel will scan the virtual address space of the
          process and report how memory is used.  One line is displayed for
          each unique memory range of the process.

          The first field of each line shows the starting address of the
          memory range.  This field allows a correlation with the contents
          of the /proc/<pid>/maps file, which contains the end address of
          the range and other information, such as the access permissions
          and sharing.

          The second field shows the memory policy currently in effect for
          the memory range.  Note that the effective policy is not
          necessarily the policy installed by the process for that memory
          range.  Specifically, if the process installed a "default" policy
          for that range, the effective policy for that range will be the
          process policy, which may or may not be "default".

          The rest of the line contains information about the pages
          allocated in the memory range, as follows:

          N<node>=<nr_pages>
                 The number of pages allocated on <node>.  <nr_pages>
                 includes only pages currently mapped by the process.  Page
                 migration and memory reclaim may have temporarily unmapped
                 pages associated with this memory range.  These pages may
                 show up again only after the process has attempted to
                 reference them.  If the memory range represents a shared
                 memory area or file mapping, other processes may currently
                 have additional pages mapped in a corresponding memory
                 range.

          file=<filename>
                 The file backing the memory range.  If the file is mapped
                 as private, write accesses may have generated COW (Copy-
                 On-Write) pages in this memory range.  These pages are
                 displayed as anonymous pages.

          heap   Memory range is used for the heap.

          stack  Memory range is used for the stack.

          huge   Huge memory range.  The page counts shown are huge pages
                 and not regular sized pages.

          anon=<pages>
                 The number of anonymous page in the range.

          dirty=<pages>
                 Number of dirty pages.

          mapped=<pages>
                 Total number of mapped pages, if different from dirty and
                 anon pages.

          mapmax=<count>
                 Maximum mapcount (number of processes mapping a single
                 page) encountered during the scan.  This may be used as an
                 indicator of the degree of sharing occurring in a given
                 memory range.

          swapcache=<count>
                 Number of pages that have an associated entry on a swap
                 device.

          active=<pages>
                 The number of pages on the active list.  This field is
                 shown only if different from the number of pages in this
                 range.  This means that some inactive pages exist in the
                 memory range that may be removed from memory by the
                 swapper soon.

          writeback=<pages>
                 Number of pages that are currently being written out to
                 disk.


-------------------------------------------------------------------

::

          No standards govern NUMA interfaces.


---------------------------------------------------

::

          The Linux NUMA system calls and /proc interface are available
          only if the kernel was configured and built with the CONFIG_NUMA
          option.

      Library support
          Link with -lnuma to get the system call definitions.  libnuma and
          the required <numaif.h> header are available in the numactl
          package.

          However, applications should not use these system calls directly.
          Instead, the higher level interface provided by the numa(3)
          functions in the numactl package is recommended.  The numactl
          package is available at 
          ⟨ftp://oss.sgi.com/www/projects/libnuma/download/⟩.  The package
          is also included in some Linux distributions.  Some distributions
          include the development library and header in the separate
          numactl-devel package.


---------------------------------------------------------

::

          get_mempolicy(2), mbind(2), move_pages(2), set_mempolicy(2),
          numa(3), cpuset(7), numactl(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                        NUMA(7)

--------------

Pages that refer to this page:
`get_mempolicy(2) <../man2/get_mempolicy.2.html>`__, 
`mbind(2) <../man2/mbind.2.html>`__, 
`migrate_pages(2) <../man2/migrate_pages.2.html>`__, 
`move_pages(2) <../man2/move_pages.2.html>`__, 
`set_mempolicy(2) <../man2/set_mempolicy.2.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`cpuset(7) <../man7/cpuset.7.html>`__

--------------

`Copyright and license for this manual
page <../man7/numa.7.license.html>`__

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
