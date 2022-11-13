.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lseek(2) — Linux manual page
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

   LSEEK(2)                Linux Programmer's Manual               LSEEK(2)

NAME
-------------------------------------------------

::

          lseek - reposition read/write file offset


---------------------------------------------------------

::

          #include <unistd.h>

          off_t lseek(int fd, off_t offset, int whence);


---------------------------------------------------------------

::

          lseek() repositions the file offset of the open file description
          associated with the file descriptor fd to the argument offset
          according to the directive whence as follows:

          SEEK_SET
                 The file offset is set to offset bytes.

          SEEK_CUR
                 The file offset is set to its current location plus offset
                 bytes.

          SEEK_END
                 The file offset is set to the size of the file plus offset
                 bytes.

          lseek() allows the file offset to be set beyond the end of the
          file (but this does not change the size of the file).  If data is
          later written at this point, subsequent reads of the data in the
          gap (a "hole") return null bytes ('\0') until data is actually
          written into the gap.

      Seeking file data and holes
          Since version 3.1, Linux supports the following additional values
          for whence:

          SEEK_DATA
                 Adjust the file offset to the next location in the file
                 greater than or equal to offset containing data.  If
                 offset points to data, then the file offset is set to
                 offset.

          SEEK_HOLE
                 Adjust the file offset to the next hole in the file
                 greater than or equal to offset.  If offset points into
                 the middle of a hole, then the file offset is set to
                 offset.  If there is no hole past offset, then the file
                 offset is adjusted to the end of the file (i.e., there is
                 an implicit hole at the end of any file).

          In both of the above cases, lseek() fails if offset points past
          the end of the file.

          These operations allow applications to map holes in a sparsely
          allocated file.  This can be useful for applications such as file
          backup tools, which can save space when creating backups and
          preserve holes, if they have a mechanism for discovering holes.

          For the purposes of these operations, a hole is a sequence of
          zeros that (normally) has not been allocated in the underlying
          file storage.  However, a filesystem is not obliged to report
          holes, so these operations are not a guaranteed mechanism for
          mapping the storage space actually allocated to a file.
          (Furthermore, a sequence of zeros that actually has been written
          to the underlying storage may not be reported as a hole.)  In the
          simplest implementation, a filesystem can support the operations
          by making SEEK_HOLE always return the offset of the end of the
          file, and making SEEK_DATA always return offset (i.e., even if
          the location referred to by offset is a hole, it can be
          considered to consist of data that is a sequence of zeros).

          The _GNU_SOURCE feature test macro must be defined in order to
          obtain the definitions of SEEK_DATA and SEEK_HOLE from
          <unistd.h>.

          The SEEK_HOLE and SEEK_DATA operations are supported for the
          following filesystems:

          *  Btrfs (since Linux 3.1)

          *  OCFS (since Linux 3.2)

          *  XFS (since Linux 3.5)

          *  ext4 (since Linux 3.8)

          *  tmpfs(5) (since Linux 3.8)

          *  NFS (since Linux 3.18)

          *  FUSE (since Linux 4.5)

          *  GFS2 (since Linux 4.15)


-----------------------------------------------------------------

::

          Upon successful completion, lseek() returns the resulting offset
          location as measured in bytes from the beginning of the file.  On
          error, the value (off_t) -1 is returned and errno is set to
          indicate the error.


-----------------------------------------------------

::

          EBADF  fd is not an open file descriptor.

          EINVAL whence is not valid.  Or: the resulting file offset would
                 be negative, or beyond the end of a seekable device.

          ENXIO  whence is SEEK_DATA or SEEK_HOLE, and offset is beyond the
                 end of the file, or whence is SEEK_DATA and offset is
                 within a hole at the end of the file.

          EOVERFLOW
                 The resulting file offset cannot be represented in an
                 off_t.

          ESPIPE fd is associated with a pipe, socket, or FIFO.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.

          SEEK_DATA and SEEK_HOLE are nonstandard extensions also present
          in Solaris, FreeBSD, and DragonFly BSD; they are proposed for
          inclusion in the next POSIX revision (Issue 8).


---------------------------------------------------

::

          See open(2) for a discussion of the relationship between file
          descriptors, open file descriptions, and files.

          If the O_APPEND file status flag is set on the open file
          description, then a write(2) always moves the file offset to the
          end of the file, regardless of the use of lseek().

          The off_t data type is a signed integer data type specified by
          POSIX.1.

          Some devices are incapable of seeking and POSIX does not specify
          which devices must support lseek().

          On Linux, using lseek() on a terminal device fails with the error
          ESPIPE.


---------------------------------------------------------

::

          dup(2), fallocate(2), fork(2), open(2), fseek(3), lseek64(3),
          posix_fallocate(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                       LSEEK(2)

--------------

Pages that refer to this page:
`copy_file_range(2) <../man2/copy_file_range.2.html>`__, 
`dup(2) <../man2/dup.2.html>`__, 
`llseek(2) <../man2/llseek.2.html>`__, 
`open(2) <../man2/open.2.html>`__, 
`pread(2) <../man2/pread.2.html>`__, 
`read(2) <../man2/read.2.html>`__, 
`readahead(2) <../man2/readahead.2.html>`__, 
`readv(2) <../man2/readv.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`write(2) <../man2/write.2.html>`__, 
`fseek(3) <../man3/fseek.3.html>`__, 
`getdirentries(3) <../man3/getdirentries.3.html>`__, 
`lseek64(3) <../man3/lseek64.3.html>`__, 
`posix_fallocate(3) <../man3/posix_fallocate.3.html>`__, 
`seekdir(3) <../man3/seekdir.3.html>`__, 
`stdin(3) <../man3/stdin.3.html>`__, 
`cpuid(4) <../man4/cpuid.4.html>`__, 
`proc(5) <../man5/proc.5.html>`__,  `pipe(7) <../man7/pipe.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`spufs(7) <../man7/spufs.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`user_namespaces(7) <../man7/user_namespaces.7.html>`__, 
`xfs_io(8) <../man8/xfs_io.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/lseek.2.license.html>`__

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
