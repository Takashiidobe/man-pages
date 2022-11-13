.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mkdir(2) — Linux manual page
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

   MKDIR(2)                Linux Programmer's Manual               MKDIR(2)

NAME
-------------------------------------------------

::

          mkdir, mkdirat - create a directory


---------------------------------------------------------

::

          #include <sys/stat.h>

          int mkdir(const char *pathname, mode_t mode);

          #include <fcntl.h>           /* Definition of AT_* constants */
          #include <sys/stat.h>

          int mkdirat(int dirfd, const char *pathname, mode_t mode);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          mkdirat():
              Since glibc 2.10:
                  _POSIX_C_SOURCE >= 200809L
              Before glibc 2.10:
                  _ATFILE_SOURCE


---------------------------------------------------------------

::

          mkdir() attempts to create a directory named pathname.

          The argument mode specifies the mode for the new directory (see
          inode(7)).  It is modified by the process's umask in the usual
          way: in the absence of a default ACL, the mode of the created
          directory is (mode & ~umask & 0777).  Whether other mode bits are
          honored for the created directory depends on the operating
          system.  For Linux, see NOTES below.

          The newly created directory will be owned by the effective user
          ID of the process.  If the directory containing the file has the
          set-group-ID bit set, or if the filesystem is mounted with BSD
          group semantics (mount -o bsdgroups or, synonymously mount -o
          grpid), the new directory will inherit the group ownership from
          its parent; otherwise it will be owned by the effective group ID
          of the process.

          If the parent directory has the set-group-ID bit set, then so
          will the newly created directory.

      mkdirat()
          The mkdirat() system call operates in exactly the same way as
          mkdir(), except for the differences described here.

          If the pathname given in pathname is relative, then it is
          interpreted relative to the directory referred to by the file
          descriptor dirfd (rather than relative to the current working
          directory of the calling process, as is done by mkdir() for a
          relative pathname).

          If pathname is relative and dirfd is the special value AT_FDCWD,
          then pathname is interpreted relative to the current working
          directory of the calling process (like mkdir()).

          If pathname is absolute, then dirfd is ignored.

          See openat(2) for an explanation of the need for mkdirat().


-----------------------------------------------------------------

::

          mkdir() and mkdirat() return zero on success.  On error, -1 is
          returned and errno is set to indicate the error.


-----------------------------------------------------

::

          EACCES The parent directory does not allow write permission to
                 the process, or one of the directories in pathname did not
                 allow search permission.  (See also path_resolution(7).)

          EBADF  (mkdirat()) pathname is relative but dirfd is neither
                 AT_FDCWD nor a valid file descriptor.

          EDQUOT The user's quota of disk blocks or inodes on the
                 filesystem has been exhausted.

          EEXIST pathname already exists (not necessarily as a directory).
                 This includes the case where pathname is a symbolic link,
                 dangling or not.

          EFAULT pathname points outside your accessible address space.

          EINVAL The final component ("basename") of the new directory's
                 pathname is invalid (e.g., it contains characters not
                 permitted by the underlying filesystem).

          ELOOP  Too many symbolic links were encountered in resolving
                 pathname.

          EMLINK The number of links to the parent directory would exceed
                 LINK_MAX.

          ENAMETOOLONG
                 pathname was too long.

          ENOENT A directory component in pathname does not exist or is a
                 dangling symbolic link.

          ENOMEM Insufficient kernel memory was available.

          ENOSPC The device containing pathname has no room for the new
                 directory.

          ENOSPC The new directory cannot be created because the user's
                 disk quota is exhausted.

          ENOTDIR
                 A component used as a directory in pathname is not, in
                 fact, a directory.

          ENOTDIR
                 (mkdirat()) pathname is relative and dirfd is a file
                 descriptor referring to a file other than a directory.

          EPERM  The filesystem containing pathname does not support the
                 creation of directories.

          EROFS  pathname refers to a file on a read-only filesystem.


---------------------------------------------------------

::

          mkdirat() was added to Linux in kernel 2.6.16; library support
          was added to glibc in version 2.4.


-------------------------------------------------------------------

::

          mkdir(): SVr4, BSD, POSIX.1-2001, POSIX.1-2008.

          mkdirat(): POSIX.1-2008.


---------------------------------------------------

::

          Under Linux, apart from the permission bits, the S_ISVTX mode bit
          is also honored.

          There are many infelicities in the protocol underlying NFS.  Some
          of these affect mkdir().

      Glibc notes
          On older kernels where mkdirat() is unavailable, the glibc
          wrapper function falls back to the use of mkdir().  When pathname
          is a relative pathname, glibc constructs a pathname based on the
          symbolic link in /proc/self/fd that corresponds to the dirfd
          argument.


---------------------------------------------------------

::

          mkdir(1), chmod(2), chown(2), mknod(2), mount(2), rmdir(2),
          stat(2), umask(2), unlink(2), acl(5), path_resolution(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-08-27                       MKDIR(2)

--------------

Pages that refer to this page: `mkdir(1) <../man1/mkdir.1.html>`__, 
`chmod(2) <../man2/chmod.2.html>`__, 
`chown(2) <../man2/chown.2.html>`__, 
`fanotify_mark(2) <../man2/fanotify_mark.2.html>`__, 
`fcntl(2) <../man2/fcntl.2.html>`__, 
`mknod(2) <../man2/mknod.2.html>`__, 
`open(2) <../man2/open.2.html>`__, 
`rmdir(2) <../man2/rmdir.2.html>`__, 
`seccomp_unotify(2) <../man2/seccomp_unotify.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`umask(2) <../man2/umask.2.html>`__, 
`mkdtemp(3) <../man3/mkdtemp.3.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`cpuset(7) <../man7/cpuset.7.html>`__, 
`inotify(7) <../man7/inotify.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`mount(8) <../man8/mount.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/mkdir.2.license.html>`__

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
