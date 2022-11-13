.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

migrate_pages(2) — Linux manual page
====================================

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

   MIGRATE_PAGES(2)        Linux Programmer's Manual       MIGRATE_PAGES(2)

NAME
-------------------------------------------------

::

          migrate_pages - move all pages in a process to another set of
          nodes


---------------------------------------------------------

::

          #include <numaif.h>

          long migrate_pages(int pid, unsigned long maxnode,
                             const unsigned long *old_nodes,
                             const unsigned long *new_nodes);

          Note: There is no glibc wrapper for this system call; see NOTES.

          Link with -lnuma.


---------------------------------------------------------------

::

          migrate_pages() attempts to move all pages of the process pid
          that are in memory nodes old_nodes to the memory nodes in
          new_nodes.  Pages not located in any node in old_nodes will not
          be migrated.  As far as possible, the kernel maintains the
          relative topology relationship inside old_nodes during the
          migration to new_nodes.

          The old_nodes and new_nodes arguments are pointers to bit masks
          of node numbers, with up to maxnode bits in each mask.  These
          masks are maintained as arrays of unsigned long integers (in the
          last long integer, the bits beyond those specified by maxnode are
          ignored).  The maxnode argument is the maximum node number in the
          bit mask plus one (this is the same as in mbind(2), but different
          from select(2)).

          The pid argument is the ID of the process whose pages are to be
          moved.  To move pages in another process, the caller must be
          privileged (CAP_SYS_NICE) or the real or effective user ID of the
          calling process must match the real or saved-set user ID of the
          target process.  If pid is 0, then migrate_pages() moves pages of
          the calling process.

          Pages shared with another process will be moved only if the
          initiating process has the CAP_SYS_NICE privilege.


-----------------------------------------------------------------

::

          On success migrate_pages() returns the number of pages that could
          not be moved (i.e., a return of zero means that all pages were
          successfully moved).  On error, it returns -1, and sets errno to
          indicate the error.


-----------------------------------------------------

::

          EFAULT Part or all of the memory range specified by
                 old_nodes/new_nodes and maxnode points outside your
                 accessible address space.

          EINVAL The value specified by maxnode exceeds a kernel-imposed
                 limit.  Or, old_nodes or new_nodes specifies one or more
                 node IDs that are greater than the maximum supported node
                 ID.  Or, none of the node IDs specified by new_nodes are
                 on-line and allowed by the process's current cpuset
                 context, or none of the specified nodes contain memory.

          EPERM  Insufficient privilege (CAP_SYS_NICE) to move pages of the
                 process specified by pid, or insufficient privilege
                 (CAP_SYS_NICE) to access the specified target nodes.

          ESRCH  No process matching pid could be found.


---------------------------------------------------------

::

          The migrate_pages() system call first appeared on Linux in
          version 2.6.16.


-------------------------------------------------------------------

::

          This system call is Linux-specific.


---------------------------------------------------

::

          Glibc does not provide a wrapper for this system call.  For
          information on library support, see numa(7).

          Use get_mempolicy(2) with the MPOL_F_MEMS_ALLOWED flag to obtain
          the set of nodes that are allowed by the calling process's
          cpuset.  Note that this information is subject to change at any
          time by manual or automatic reconfiguration of the cpuset.

          Use of migrate_pages() may result in pages whose location (node)
          violates the memory policy established for the specified
          addresses (see mbind(2)) and/or the specified process (see
          set_mempolicy(2)).  That is, memory policy does not constrain the
          destination nodes used by migrate_pages().

          The <numaif.h> header is not included with glibc, but requires
          installing libnuma-devel or a similar package.


---------------------------------------------------------

::

          get_mempolicy(2), mbind(2), set_mempolicy(2), numa(3),
          numa_maps(5), cpuset(7), numa(7), migratepages(8), numastat(8)

          Documentation/vm/page_migration.rst in the Linux kernel source
          tree

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22               MIGRATE_PAGES(2)

--------------

Pages that refer to this page: `swapon(2) <../man2/swapon.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`numa(3) <../man3/numa.3.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`numa(7) <../man7/numa.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/migrate_pages.2.license.html>`__

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
