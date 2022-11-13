.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fsync(2) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FSYNC(2)                Linux Programmer's Manual               FSYNC(2)

NAME
-------------------------------------------------

::

          fsync, fdatasync - synchronize a file's in-core state with
          storage device


---------------------------------------------------------

::

          #include <unistd.h>

          int fsync(int fd);

          int fdatasync(int fd);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          fsync():
              Glibc 2.16 and later:
                  No feature test macros need be defined
              Glibc up to and including 2.15:
                  _BSD_SOURCE || _XOPEN_SOURCE
                      || /* Since glibc 2.8: */ _POSIX_C_SOURCE >= 200112L

          fdatasync():
              _POSIX_C_SOURCE >= 199309L || _XOPEN_SOURCE >= 500


---------------------------------------------------------------

::

          fsync() transfers ("flushes") all modified in-core data of (i.e.,
          modified buffer cache pages for) the file referred to by the file
          descriptor fd to the disk device (or other permanent storage
          device) so that all changed information can be retrieved even if
          the system crashes or is rebooted.  This includes writing through
          or flushing a disk cache if present.  The call blocks until the
          device reports that the transfer has completed.

          As well as flushing the file data, fsync() also flushes the
          metadata information associated with the file (see inode(7)).

          Calling fsync() does not necessarily ensure that the entry in the
          directory containing the file has also reached disk.  For that an
          explicit fsync() on a file descriptor for the directory is also
          needed.

          fdatasync() is similar to fsync(), but does not flush modified
          metadata unless that metadata is needed in order to allow a
          subsequent data retrieval to be correctly handled.  For example,
          changes to st_atime or st_mtime (respectively, time of last
          access and time of last modification; see inode(7)) do not
          require flushing because they are not necessary for a subsequent
          data read to be handled correctly.  On the other hand, a change
          to the file size (st_size, as made by say ftruncate(2)), would
          require a metadata flush.

          The aim of fdatasync() is to reduce disk activity for
          applications that do not require all metadata to be synchronized
          with the disk.


-----------------------------------------------------------------

::

          On success, these system calls return zero.  On error, -1 is
          returned, and errno is set to indicate the error.


-----------------------------------------------------

::

          EBADF  fd is not a valid open file descriptor.

          EIO    An error occurred during synchronization.  This error may
                 relate to data written to some other file descriptor on
                 the same file.  Since Linux 4.13, errors from write-back
                 will be reported to all file descriptors that might have
                 written the data which triggered the error.  Some
                 filesystems (e.g., NFS) keep close track of which data
                 came through which file descriptor, and give more precise
                 reporting.  Other filesystems (e.g., most local
                 filesystems) will report errors to all file descriptors
                 that were open on the file when the error was recorded.

          ENOSPC Disk space was exhausted while synchronizing.

          EROFS, EINVAL
                 fd is bound to a special file (e.g., a pipe, FIFO, or
                 socket) which does not support synchronization.

          ENOSPC, EDQUOT
                 fd is bound to a file on NFS or another filesystem which
                 does not allocate space at the time of a write(2) system
                 call, and some previous write failed due to insufficient
                 storage space.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, 4.3BSD.

          On POSIX systems on which fdatasync() is available,
          _POSIX_SYNCHRONIZED_IO is defined in <unistd.h> to a value
          greater than 0.  (See also sysconf(3).)


---------------------------------------------------

::

          On some UNIX systems (but not Linux), fd must be a writable file
          descriptor.

          In Linux 2.2 and earlier, fdatasync() is equivalent to fsync(),
          and so has no performance advantage.

          The fsync() implementations in older kernels and lesser used
          filesystems do not know how to flush disk caches.  In these cases
          disk caches need to be disabled using hdparm(8) or sdparm(8) to
          guarantee safe operation.


---------------------------------------------------------

::

          sync(1), bdflush(2), open(2), posix_fadvise(2), pwritev(2),
          sync(2), sync_file_range(2), fflush(3), fileno(3), hdparm(8),
          mount(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                       FSYNC(2)

--------------

Pages that refer to this page: `sync(1) <../man1/sync.1.html>`__, 
`bdflush(2) <../man2/bdflush.2.html>`__, 
`close(2) <../man2/close.2.html>`__, 
`mount(2) <../man2/mount.2.html>`__, 
`open(2) <../man2/open.2.html>`__, 
`posix_fadvise(2) <../man2/posix_fadvise.2.html>`__, 
`statx(2) <../man2/statx.2.html>`__, 
`sync(2) <../man2/sync.2.html>`__, 
`sync_file_range(2) <../man2/sync_file_range.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`write(2) <../man2/write.2.html>`__, 
`aio_error(3) <../man3/aio_error.3.html>`__, 
`aio_fsync(3) <../man3/aio_fsync.3.html>`__, 
`aio_return(3) <../man3/aio_return.3.html>`__, 
`dbopen(3) <../man3/dbopen.3.html>`__, 
`fclose(3) <../man3/fclose.3.html>`__, 
`fflush(3) <../man3/fflush.3.html>`__, 
`cups-files.conf(5) <../man5/cups-files.conf.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`aio(7) <../man7/aio.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`mount(8) <../man8/mount.8.html>`__, 
`sfdisk(8) <../man8/sfdisk.8.html>`__, 
`xfs_io(8) <../man8/xfs_io.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/fsync.2.license.html>`__

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
