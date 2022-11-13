.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

chmod(2) — Linux manual page
============================

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

   CHMOD(2)                Linux Programmer's Manual               CHMOD(2)

NAME
-------------------------------------------------

::

          chmod, fchmod, fchmodat - change permissions of a file


---------------------------------------------------------

::

          #include <sys/stat.h>

          int chmod(const char *pathname, mode_t mode);
          int fchmod(int fd, mode_t mode);

          #include <fcntl.h>           /* Definition of AT_* constants */
          #include <sys/stat.h>

          int fchmodat(int dirfd, const char *pathname, mode_t mode, int flags);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          fchmod():
              Since glibc 2.24:
                  _POSIX_C_SOURCE >= 199309L
              Glibc 2.19 to 2.23
                  _POSIX_C_SOURCE
              Glibc 2.16 to 2.19:
                  _BSD_SOURCE || _POSIX_C_SOURCE
              Glibc 2.12 to 2.16:
                  _BSD_SOURCE || _XOPEN_SOURCE >= 500
                      || _POSIX_C_SOURCE >= 200809L
              Glibc 2.11 and earlier:
                  _BSD_SOURCE || _XOPEN_SOURCE >= 500

          fchmodat():
              Since glibc 2.10:
                  _POSIX_C_SOURCE >= 200809L
              Before glibc 2.10:
                  _ATFILE_SOURCE


---------------------------------------------------------------

::

          The chmod() and fchmod() system calls change a file's mode bits.
          (The file mode consists of the file permission bits plus the set-
          user-ID, set-group-ID, and sticky bits.)  These system calls
          differ only in how the file is specified:

          * chmod() changes the mode of the file specified whose pathname
            is given in pathname, which is dereferenced if it is a symbolic
            link.

          * fchmod() changes the mode of the file referred to by the open
            file descriptor fd.

          The new file mode is specified in mode, which is a bit mask
          created by ORing together zero or more of the following:

          S_ISUID  (04000)
                 set-user-ID (set process effective user ID on execve(2))

          S_ISGID  (02000)
                 set-group-ID (set process effective group ID on execve(2);
                 mandatory locking, as described in fcntl(2); take a new
                 file's group from parent directory, as described in
                 chown(2) and mkdir(2))

          S_ISVTX  (01000)
                 sticky bit (restricted deletion flag, as described in
                 unlink(2))

          S_IRUSR  (00400)
                 read by owner

          S_IWUSR  (00200)
                 write by owner

          S_IXUSR  (00100)
                 execute/search by owner ("search" applies for directories,
                 and means that entries within the directory can be
                 accessed)

          S_IRGRP  (00040)
                 read by group

          S_IWGRP  (00020)
                 write by group

          S_IXGRP  (00010)
                 execute/search by group

          S_IROTH  (00004)
                 read by others

          S_IWOTH  (00002)
                 write by others

          S_IXOTH  (00001)
                 execute/search by others

          The effective UID of the calling process must match the owner of
          the file, or the process must be privileged (Linux: it must have
          the CAP_FOWNER capability).

          If the calling process is not privileged (Linux: does not have
          the CAP_FSETID capability), and the group of the file does not
          match the effective group ID of the process or one of its
          supplementary group IDs, the S_ISGID bit will be turned off, but
          this will not cause an error to be returned.

          As a security measure, depending on the filesystem, the set-user-
          ID and set-group-ID execution bits may be turned off if a file is
          written.  (On Linux, this occurs if the writing process does not
          have the CAP_FSETID capability.)  On some filesystems, only the
          superuser can set the sticky bit, which may have a special
          meaning.  For the sticky bit, and for set-user-ID and set-group-
          ID bits on directories, see inode(7).

          On NFS filesystems, restricting the permissions will immediately
          influence already open files, because the access control is done
          on the server, but open files are maintained by the client.
          Widening the permissions may be delayed for other clients if
          attribute caching is enabled on them.

      fchmodat()
          The fchmodat() system call operates in exactly the same way as
          chmod(), except for the differences described here.

          If the pathname given in pathname is relative, then it is
          interpreted relative to the directory referred to by the file
          descriptor dirfd (rather than relative to the current working
          directory of the calling process, as is done by chmod() for a
          relative pathname).

          If pathname is relative and dirfd is the special value AT_FDCWD,
          then pathname is interpreted relative to the current working
          directory of the calling process (like chmod()).

          If pathname is absolute, then dirfd is ignored.

          flags can either be 0, or include the following flag:

          AT_SYMLINK_NOFOLLOW
                 If pathname is a symbolic link, do not dereference it:
                 instead operate on the link itself.  This flag is not
                 currently implemented.

          See openat(2) for an explanation of the need for fchmodat().


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          Depending on the filesystem, errors other than those listed below
          can be returned.

          The more general errors for chmod() are listed below:

          EACCES Search permission is denied on a component of the path
                 prefix.  (See also path_resolution(7).)

          EBADF  (fchmod()) The file descriptor fd is not valid.

          EBADF  (fchmodat()) pathname is relative but dirfd is neither
                 AT_FDCWD nor a valid file descriptor.

          EFAULT pathname points outside your accessible address space.

          EINVAL (fchmodat()) Invalid flag specified in flags.

          EIO    An I/O error occurred.

          ELOOP  Too many symbolic links were encountered in resolving
                 pathname.

          ENAMETOOLONG
                 pathname is too long.

          ENOENT The file does not exist.

          ENOMEM Insufficient kernel memory was available.

          ENOTDIR
                 A component of the path prefix is not a directory.

          ENOTDIR
                 (fchmodat()) pathname is relative and dirfd is a file
                 descriptor referring to a file other than a directory.

          ENOTSUP
                 (fchmodat()) flags specified AT_SYMLINK_NOFOLLOW, which is
                 not supported.

          EPERM  The effective UID does not match the owner of the file,
                 and the process is not privileged (Linux: it does not have
                 the CAP_FOWNER capability).

          EPERM  The file is marked immutable or append-only.  (See
                 ioctl_iflags(2).)

          EROFS  The named file resides on a read-only filesystem.


---------------------------------------------------------

::

          fchmodat() was added to Linux in kernel 2.6.16; library support
          was added to glibc in version 2.4.


-------------------------------------------------------------------

::

          chmod(), fchmod(): 4.4BSD, SVr4, POSIX.1-2001i, POSIX.1-2008.

          fchmodat(): POSIX.1-2008.


---------------------------------------------------

::

      C library/kernel differences
          The GNU C library fchmodat() wrapper function implements the
          POSIX-specified interface described in this page.  This interface
          differs from the underlying Linux system call, which does not
          have a flags argument.

      Glibc notes
          On older kernels where fchmodat() is unavailable, the glibc
          wrapper function falls back to the use of chmod().  When pathname
          is a relative pathname, glibc constructs a pathname based on the
          symbolic link in /proc/self/fd that corresponds to the dirfd
          argument.


---------------------------------------------------------

::

          chmod(1), chown(2), execve(2), open(2), stat(2), inode(7),
          path_resolution(7), symlink(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-08-27                       CHMOD(2)

--------------

Pages that refer to this page: `chmod(1) <../man1/chmod.1.html>`__, 
`access(2) <../man2/access.2.html>`__, 
`chown(2) <../man2/chown.2.html>`__, 
`execve(2) <../man2/execve.2.html>`__, 
`fcntl(2) <../man2/fcntl.2.html>`__, 
`mkdir(2) <../man2/mkdir.2.html>`__, 
`mknod(2) <../man2/mknod.2.html>`__, 
`open(2) <../man2/open.2.html>`__, 
`rename(2) <../man2/rename.2.html>`__, 
`rmdir(2) <../man2/rmdir.2.html>`__, 
`stat(2) <../man2/stat.2.html>`__, 
`statx(2) <../man2/statx.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`umask(2) <../man2/umask.2.html>`__, 
`unlink(2) <../man2/unlink.2.html>`__, 
`euidaccess(3) <../man3/euidaccess.3.html>`__, 
`shm_open(3) <../man3/shm_open.3.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`inotify(7) <../man7/inotify.7.html>`__, 
`shm_overview(7) <../man7/shm_overview.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`spufs(7) <../man7/spufs.7.html>`__, 
`symlink(7) <../man7/symlink.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`unix(7) <../man7/unix.7.html>`__, 
`logrotate(8) <../man8/logrotate.8.html>`__, 
`xfs_db(8) <../man8/xfs_db.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/chmod.2.license.html>`__

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
