.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tmpfs(5) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TMPFS(5)                Linux Programmer's Manual               TMPFS(5)

NAME
-------------------------------------------------

::

          tmpfs - a virtual memory filesystem


---------------------------------------------------------------

::

          The tmpfs facility allows the creation of filesystems whose
          contents reside in virtual memory.  Since the files on such
          filesystems typically reside in RAM, file access is extremely
          fast.

          The filesystem is automatically created when mounting a
          filesystem with the type tmpfs via a command such as the
          following:

              $ sudo mount -t tmpfs -o size=10M tmpfs /mnt/mytmpfs

          A tmpfs filesystem has the following properties:

          *  The filesystem can employ swap space when physical memory
             pressure demands it.

          *  The filesystem consumes only as much physical memory and swap
             space as is required to store the current contents of the
             filesystem.

          *  During a remount operation (mount -o remount), the filesystem
             size can be changed (without losing the existing contents of
             the filesystem).

          If a tmpfs filesystem is unmounted, its contents are discarded
          (lost).

      Mount options
          The tmpfs filesystem supports the following mount options:

          size=bytes
                 Specify an upper limit on the size of the filesystem.  The
                 size is given in bytes, and rounded up to entire pages.

                 The size may have a k, m, or g suffix for Ki, Mi, Gi
                 (binary kilo (kibi), binary mega (mebi), and binary giga
                 (gibi)).

                 The size may also have a % suffix to limit this instance
                 to a percentage of physical RAM.

                 The default, when neither size nor nr_blocks is specified,
                 is size=50%.

          nr_blocks=blocks
                 The same as size, but in blocks of PAGE_CACHE_SIZE.

                 Blocks may be specified with k, m, or g suffixes like
                 size, but not a % suffix.

          nr_inodes=inodes
                 The maximum number of inodes for this instance.  The
                 default is half of the number of your physical RAM pages,
                 or (on a machine with highmem) the number of lowmem RAM
                 pages, whichever is smaller.

                 Inodes may be specified with k, m, or g suffixes like
                 size, but not a % suffix.

          mode=mode
                 Set initial permissions of the root directory.

          gid=gid (since Linux 2.5.7)
                 Set the initial group ID of the root directory.

          uid=uid (since Linux 2.5.7)
                 Set the initial user ID of the root directory.

          huge=huge_option (since Linux 4.7.0)
                 Set the huge table memory allocation policy for all files
                 in this instance (if CONFIG_TRANSPARENT_HUGE_PAGECACHE is
                 enabled).

                 The huge_option value is one of the following:

                 never  Do not allocate huge pages.  This is the default.

                 always Attempt to allocate huge pages every time a new
                        page is needed.

                 within_size
                        Only allocate huge page if it will be fully within
                        i_size.  Also respect fadvise(2)/madvise(2) hints

                 advise Only allocate huge pages if requested with
                        fadvise(2)/madvise(2).

                 deny   For use in emergencies, to force the huge option
                        off from all mounts.

                 force  Force the huge option on for all mounts; useful for
                        testing.

          mpol=mpol_option (since Linux 2.6.15)
                 Set the NUMA memory allocation policy for all files in
                 this instance (if CONFIG_NUMA is enabled).

                 The mpol_option value is one of the following:

                 default
                        Use the process allocation policy (see
                        set_mempolicy(2)).

                 prefer:node
                        Preferably allocate memory from the given node.

                 bind:nodelist
                        Allocate memory only from nodes in nodelist.

                 interleave
                        Allocate from each node in turn.

                 interleave:nodelist
                        Allocate from each node of in turn.

                 local  Preferably allocate memory from the local node.

                 In the above, nodelist is a comma-separated list of
                 decimal numbers and ranges that specify NUMA nodes.  A
                 range is a pair of hyphen-separated decimal numbers, the
                 smallest and largest node numbers in the range.  For
                 example, mpol=bind:0-3,5,7,9-15.


---------------------------------------------------------

::

          The tmpfs facility was added in Linux 2.4, as a successor to the
          older ramfs facility, which did not provide limit checking or
          allow for the use of swap space.


---------------------------------------------------

::

          In order for user-space tools and applications to create tmpfs
          filesystems, the kernel must be configured with the CONFIG_TMPFS
          option.

          The tmpfs filesystem supports extended attributes (see xattr(7)),
          but user extended attributes are not permitted.

          An internal shared memory filesystem is used for System V shared
          memory (shmget(2)) and shared anonymous mappings (mmap(2) with
          the MAP_SHARED and MAP_ANONYMOUS flags).  This filesystem is
          available regardless of whether the kernel was configured with
          the CONFIG_TMPFS option.

          A tmpfs filesystem mounted at /dev/shm is used for the
          implementation of POSIX shared memory (shm_overview(7)) and POSIX
          semaphores (sem_overview(7)).

          The amount of memory consumed by all tmpfs filesystems is shown
          in the Shmem field of /proc/meminfo and in the shared field
          displayed by free(1).

          The tmpfs facility was formerly called shmfs.


---------------------------------------------------------

::

          df(1), du(1), memfd_create(2), mmap(2), set_mempolicy(2),
          shm_open(3), mount(8)

          The kernel source files Documentation/filesystems/tmpfs.txt and
          Documentation/admin-guide/mm/transhuge.rst.

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                       TMPFS(5)

--------------

Pages that refer to this page:
`fallocate(2) <../man2/fallocate.2.html>`__, 
`fanotify_mark(2) <../man2/fanotify_mark.2.html>`__, 
`ioctl_userfaultfd(2) <../man2/ioctl_userfaultfd.2.html>`__, 
`lseek(2) <../man2/lseek.2.html>`__, 
`madvise(2) <../man2/madvise.2.html>`__, 
`memfd_create(2) <../man2/memfd_create.2.html>`__, 
`mmap(2) <../man2/mmap.2.html>`__, 
`remap_file_pages(2) <../man2/remap_file_pages.2.html>`__, 
`seccomp_unotify(2) <../man2/seccomp_unotify.2.html>`__, 
`swapon(2) <../man2/swapon.2.html>`__, 
`shm_open(3) <../man3/shm_open.3.html>`__, 
`filesystems(5) <../man5/filesystems.5.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`sysfs(5) <../man5/sysfs.5.html>`__, 
`cgroups(7) <../man7/cgroups.7.html>`__, 
`keyrings(7) <../man7/keyrings.7.html>`__, 
`shm_overview(7) <../man7/shm_overview.7.html>`__, 
`user_namespaces(7) <../man7/user_namespaces.7.html>`__, 
`mount(8) <../man8/mount.8.html>`__, 
`systemd-fstab-generator(8) <../man8/systemd-fstab-generator.8.html>`__

--------------

`Copyright and license for this manual
page <../man5/tmpfs.5.license.html>`__

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
