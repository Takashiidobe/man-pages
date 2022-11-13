.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

unlink(2) — Linux manual page
=============================

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

   UNLINK(2)               Linux Programmer's Manual              UNLINK(2)

NAME
-------------------------------------------------

::

          unlink, unlinkat - delete a name and possibly the file it refers
          to


---------------------------------------------------------

::

          #include <unistd.h>

          int unlink(const char *pathname);

          #include <fcntl.h>           /* Definition of AT_* constants */
          #include <unistd.h>

          int unlinkat(int dirfd, const char *pathname, int flags);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          unlinkat():
              Since glibc 2.10:
                  _POSIX_C_SOURCE >= 200809L
              Before glibc 2.10:
                  _ATFILE_SOURCE


---------------------------------------------------------------

::

          unlink() deletes a name from the filesystem.  If that name was
          the last link to a file and no processes have the file open, the
          file is deleted and the space it was using is made available for
          reuse.

          If the name was the last link to a file but any processes still
          have the file open, the file will remain in existence until the
          last file descriptor referring to it is closed.

          If the name referred to a symbolic link, the link is removed.

          If the name referred to a socket, FIFO, or device, the name for
          it is removed but processes which have the object open may
          continue to use it.

      unlinkat()
          The unlinkat() system call operates in exactly the same way as
          either unlink() or rmdir(2) (depending on whether or not flags
          includes the AT_REMOVEDIR flag) except for the differences
          described here.

          If the pathname given in pathname is relative, then it is
          interpreted relative to the directory referred to by the file
          descriptor dirfd (rather than relative to the current working
          directory of the calling process, as is done by unlink() and
          rmdir(2) for a relative pathname).

          If the pathname given in pathname is relative and dirfd is the
          special value AT_FDCWD, then pathname is interpreted relative to
          the current working directory of the calling process (like
          unlink() and rmdir(2)).

          If the pathname given in pathname is absolute, then dirfd is
          ignored.

          flags is a bit mask that can either be specified as 0, or by
          ORing together flag values that control the operation of
          unlinkat().  Currently, only one such flag is defined:

          AT_REMOVEDIR
                 By default, unlinkat() performs the equivalent of unlink()
                 on pathname.  If the AT_REMOVEDIR flag is specified, then
                 performs the equivalent of rmdir(2) on pathname.

          See openat(2) for an explanation of the need for unlinkat().


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EACCES Write access to the directory containing pathname is not
                 allowed for the process's effective UID, or one of the
                 directories in pathname did not allow search permission.
                 (See also path_resolution(7).)

          EBUSY  The file pathname cannot be unlinked because it is being
                 used by the system or another process; for example, it is
                 a mount point or the NFS client software created it to
                 represent an active but otherwise nameless inode ("NFS
                 silly renamed").

          EFAULT pathname points outside your accessible address space.

          EIO    An I/O error occurred.

          EISDIR pathname refers to a directory.  (This is the non-POSIX
                 value returned by Linux since 2.1.132.)

          ELOOP  Too many symbolic links were encountered in translating
                 pathname.

          ENAMETOOLONG
                 pathname was too long.

          ENOENT A component in pathname does not exist or is a dangling
                 symbolic link, or pathname is empty.

          ENOMEM Insufficient kernel memory was available.

          ENOTDIR
                 A component used as a directory in pathname is not, in
                 fact, a directory.

          EPERM  The system does not allow unlinking of directories, or
                 unlinking of directories requires privileges that the
                 calling process doesn't have.  (This is the POSIX
                 prescribed error return; as noted above, Linux returns
                 EISDIR for this case.)

          EPERM (Linux only)
                 The filesystem does not allow unlinking of files.

          EPERM or EACCES
                 The directory containing pathname has the sticky bit
                 (S_ISVTX) set and the process's effective UID is neither
                 the UID of the file to be deleted nor that of the
                 directory containing it, and the process is not privileged
                 (Linux: does not have the CAP_FOWNER capability).

          EPERM  The file to be unlinked is marked immutable or append-
                 only.  (See ioctl_iflags(2).)

          EROFS  pathname refers to a file on a read-only filesystem.

          The same errors that occur for unlink() and rmdir(2) can also
          occur for unlinkat().  The following additional errors can occur
          for unlinkat():

          EBADF  pathname is relative but dirfd is neither AT_FDCWD nor a
                 valid file descriptor.

          EINVAL An invalid flag value was specified in flags.

          EISDIR pathname refers to a directory, and AT_REMOVEDIR was not
                 specified in flags.

          ENOTDIR
                 pathname is relative and dirfd is a file descriptor
                 referring to a file other than a directory.


---------------------------------------------------------

::

          unlinkat() was added to Linux in kernel 2.6.16; library support
          was added to glibc in version 2.4.


-------------------------------------------------------------------

::

          unlink(): SVr4, 4.3BSD, POSIX.1-2001, POSIX.1-2008.

          unlinkat(): POSIX.1-2008.


---------------------------------------------------

::

      Glibc notes
          On older kernels where unlinkat() is unavailable, the glibc
          wrapper function falls back to the use of unlink() or rmdir(2).
          When pathname is a relative pathname, glibc constructs a pathname
          based on the symbolic link in /proc/self/fd that corresponds to
          the dirfd argument.


-------------------------------------------------

::

          Infelicities in the protocol underlying NFS can cause the
          unexpected disappearance of files which are still being used.


---------------------------------------------------------

::

          rm(1), unlink(1), chmod(2), link(2), mknod(2), open(2),
          rename(2), rmdir(2), mkfifo(3), remove(3), path_resolution(7),
          symlink(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-08-27                      UNLINK(2)

--------------

Pages that refer to this page: `rm(1) <../man1/rm.1.html>`__, 
`unlink(1) <../man1/unlink.1.html>`__, 
`chmod(2) <../man2/chmod.2.html>`__, 
`close(2) <../man2/close.2.html>`__, 
`fcntl(2) <../man2/fcntl.2.html>`__, 
`link(2) <../man2/link.2.html>`__, 
`mkdir(2) <../man2/mkdir.2.html>`__, 
`mknod(2) <../man2/mknod.2.html>`__, 
`open(2) <../man2/open.2.html>`__, 
`rename(2) <../man2/rename.2.html>`__, 
`rmdir(2) <../man2/rmdir.2.html>`__, 
`symlink(2) <../man2/symlink.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`getcwd(3) <../man3/getcwd.3.html>`__, 
`remove(3) <../man3/remove.3.html>`__, 
`shm_open(3) <../man3/shm_open.3.html>`__, 
`inotify(7) <../man7/inotify.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`symlink(7) <../man7/symlink.7.html>`__, 
`unix(7) <../man7/unix.7.html>`__,  `lsof(8) <../man8/lsof.8.html>`__, 
`mount(8) <../man8/mount.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/unlink.2.license.html>`__

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
