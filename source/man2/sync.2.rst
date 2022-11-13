.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sync(2) — Linux manual page
===========================

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
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYNC(2)                 Linux Programmer's Manual                SYNC(2)

NAME
-------------------------------------------------

::

          sync, syncfs - commit filesystem caches to disk


---------------------------------------------------------

::

          #include <unistd.h>

          void sync(void);

          int syncfs(int fd);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          sync():
              _XOPEN_SOURCE >= 500
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE

          syncfs():
              _GNU_SOURCE


---------------------------------------------------------------

::

          sync() causes all pending modifications to filesystem metadata
          and cached file data to be written to the underlying filesystems.

          syncfs() is like sync(), but synchronizes just the filesystem
          containing file referred to by the open file descriptor fd.


-----------------------------------------------------------------

::

          syncfs() returns 0 on success; on error, it returns -1 and sets
          errno to indicate the error.


-----------------------------------------------------

::

          sync() is always successful.

          syncfs() can fail for at least the following reasons:

          EBADF  fd is not a valid file descriptor.

          EIO    An error occurred during synchronization.  This error may
                 relate to data written to any file on the filesystem, or
                 on metadata related to the filesystem itself.

          ENOSPC Disk space was exhausted while synchronizing.

          ENOSPC, EDQUOT
                 Data was written to a file on NFS or another filesystem
                 which does not allocate space at the time of a write(2)
                 system call, and some previous write failed due to
                 insufficient storage space.


---------------------------------------------------------

::

          syncfs() first appeared in Linux 2.6.39; library support was
          added to glibc in version 2.14.


-------------------------------------------------------------------

::

          sync(): POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.

          syncfs() is Linux-specific.


---------------------------------------------------

::

          Since glibc 2.2.2, the Linux prototype for sync() is as listed
          above, following the various standards.  In glibc 2.2.1 and
          earlier, it was "int sync(void)", and sync() always returned 0.

          According to the standard specification (e.g., POSIX.1-2001),
          sync() schedules the writes, but may return before the actual
          writing is done.  However Linux waits for I/O completions, and
          thus sync() or syncfs() provide the same guarantees as fsync()
          called on every file in the system or filesystem respectively.

          In mainline kernel versions prior to 5.8, syncfs() will fail only
          when passed a bad file descriptor (EBADF).  Since Linux 5.8,
          syncfs() will also report an error if one or more inodes failed
          to be written back since the last syncfs() call.


-------------------------------------------------

::

          Before version 1.3.20 Linux did not wait for I/O to complete
          before returning.


---------------------------------------------------------

::

          sync(1), fdatasync(2), fsync(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                        SYNC(2)

--------------

Pages that refer to this page: `sync(1) <../man1/sync.1.html>`__, 
`bdflush(2) <../man2/bdflush.2.html>`__, 
`fsync(2) <../man2/fsync.2.html>`__, 
`mount(2) <../man2/mount.2.html>`__, 
`reboot(2) <../man2/reboot.2.html>`__, 
`sync_file_range(2) <../man2/sync_file_range.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`fclose(3) <../man3/fclose.3.html>`__, 
`fflush(3) <../man3/fflush.3.html>`__, 
`nfs(5) <../man5/nfs.5.html>`__, 
`ctrlaltdel(8) <../man8/ctrlaltdel.8.html>`__, 
`fsck.minix(8) <../man8/fsck.minix.8.html>`__, 
`mke2fs(8) <../man8/mke2fs.8.html>`__, 
`mount(8) <../man8/mount.8.html>`__, 
`xfs_io(8) <../man8/xfs_io.8.html>`__, 
`xfs_quota(8) <../man8/xfs_quota.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/sync.2.license.html>`__

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
