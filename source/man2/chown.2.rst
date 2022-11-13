.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

chown(2) — Linux manual page
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
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CHOWN(2)                Linux Programmer's Manual               CHOWN(2)

NAME
-------------------------------------------------

::

          chown, fchown, lchown, fchownat - change ownership of a file


---------------------------------------------------------

::

          #include <unistd.h>

          int chown(const char *pathname, uid_t owner, gid_t group);
          int fchown(int fd, uid_t owner, gid_t group);
          int lchown(const char *pathname, uid_t owner, gid_t group);

          #include <fcntl.h>           /* Definition of AT_* constants */
          #include <unistd.h>

          int fchownat(int dirfd, const char *pathname,
                       uid_t owner, gid_t group, int flags);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          fchown(), lchown():
              /* Since glibc 2.12: */ _POSIX_C_SOURCE >= 200809L
                  || _XOPEN_SOURCE >= 500
                  || /* Glibc <= 2.19: */ _BSD_SOURCE

          fchownat():
              Since glibc 2.10:
                  _POSIX_C_SOURCE >= 200809L
              Before glibc 2.10:
                  _ATFILE_SOURCE


---------------------------------------------------------------

::

          These system calls change the owner and group of a file.  The
          chown(), fchown(), and lchown() system calls differ only in how
          the file is specified:

          * chown() changes the ownership of the file specified by
            pathname, which is dereferenced if it is a symbolic link.

          * fchown() changes the ownership of the file referred to by the
            open file descriptor fd.

          * lchown() is like chown(), but does not dereference symbolic
            links.

          Only a privileged process (Linux: one with the CAP_CHOWN
          capability) may change the owner of a file.  The owner of a file
          may change the group of the file to any group of which that owner
          is a member.  A privileged process (Linux: with CAP_CHOWN) may
          change the group arbitrarily.

          If the owner or group is specified as -1, then that ID is not
          changed.

          When the owner or group of an executable file is changed by an
          unprivileged user, the S_ISUID and S_ISGID mode bits are cleared.
          POSIX does not specify whether this also should happen when root
          does the chown(); the Linux behavior depends on the kernel
          version, and since Linux 2.2.13, root is treated like other
          users.  In case of a non-group-executable file (i.e., one for
          which the S_IXGRP bit is not set) the S_ISGID bit indicates
          mandatory locking, and is not cleared by a chown().

          When the owner or group of an executable file is changed (by any
          user), all capability sets for the file are cleared.

      fchownat()
          The fchownat() system call operates in exactly the same way as
          chown(), except for the differences described here.

          If the pathname given in pathname is relative, then it is
          interpreted relative to the directory referred to by the file
          descriptor dirfd (rather than relative to the current working
          directory of the calling process, as is done by chown() for a
          relative pathname).

          If pathname is relative and dirfd is the special value AT_FDCWD,
          then pathname is interpreted relative to the current working
          directory of the calling process (like chown()).

          If pathname is absolute, then dirfd is ignored.

          The flags argument is a bit mask created by ORing together 0 or
          more of the following values;

          AT_EMPTY_PATH (since Linux 2.6.39)
                 If pathname is an empty string, operate on the file
                 referred to by dirfd (which may have been obtained using
                 the open(2) O_PATH flag).  In this case, dirfd can refer
                 to any type of file, not just a directory.  If dirfd is
                 AT_FDCWD, the call operates on the current working
                 directory.  This flag is Linux-specific; define
                 _GNU_SOURCE to obtain its definition.

          AT_SYMLINK_NOFOLLOW
                 If pathname is a symbolic link, do not dereference it:
                 instead operate on the link itself, like lchown().  (By
                 default, fchownat() dereferences symbolic links, like
                 chown().)

          See openat(2) for an explanation of the need for fchownat().


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          Depending on the filesystem, errors other than those listed below
          can be returned.

          The more general errors for chown() are listed below.

          EACCES Search permission is denied on a component of the path
                 prefix.  (See also path_resolution(7).)

          EBADF  (fchown()) fd is not a valid open file descriptor.

          EBADF  (fchownat()) pathname is relative but dirfd is neither
                 AT_FDCWD nor a valid file descriptor.

          EFAULT pathname points outside your accessible address space.

          EINVAL (fchownat()) Invalid flag specified in flags.

          EIO    (fchown()) A low-level I/O error occurred while modifying
                 the inode.

          ELOOP  Too many symbolic links were encountered in resolving
                 pathname.

          ENAMETOOLONG
                 pathname is too long.

          ENOENT The file does not exist.

          ENOMEM Insufficient kernel memory was available.

          ENOTDIR
                 A component of the path prefix is not a directory.

          ENOTDIR
                 (fchownat()) pathname is relative and dirfd is a file
                 descriptor referring to a file other than a directory.

          EPERM  The calling process did not have the required permissions
                 (see above) to change owner and/or group.

          EPERM  The file is marked immutable or append-only.  (See
                 ioctl_iflags(2).)

          EROFS  The named file resides on a read-only filesystem.


---------------------------------------------------------

::

          fchownat() was added to Linux in kernel 2.6.16; library support
          was added to glibc in version 2.4.


-------------------------------------------------------------------

::

          chown(), fchown(), lchown(): 4.4BSD, SVr4, POSIX.1-2001,
          POSIX.1-2008.

          The 4.4BSD version can be used only by the superuser (that is,
          ordinary users cannot give away files).

          fchownat(): POSIX.1-2008.


---------------------------------------------------

::

      Ownership of new files
          When a new file is created (by, for example, open(2) or
          mkdir(2)), its owner is made the same as the filesystem user ID
          of the creating process.  The group of the file depends on a
          range of factors, including the type of filesystem, the options
          used to mount the filesystem, and whether or not the set-group-ID
          mode bit is enabled on the parent directory.  If the filesystem
          supports the -o grpid (or, synonymously -o bsdgroups) and
          -o nogrpid (or, synonymously -o sysvgroups) mount(8) options,
          then the rules are as follows:

          * If the filesystem is mounted with -o grpid, then the group of a
            new file is made the same as that of the parent directory.

          * If the filesystem is mounted with -o nogrpid and the set-group-
            ID bit is disabled on the parent directory, then the group of a
            new file is made the same as the process's filesystem GID.

          * If the filesystem is mounted with -o nogrpid and the set-group-
            ID bit is enabled on the parent directory, then the group of a
            new file is made the same as that of the parent directory.

          As at Linux 4.12, the -o grpid and -o nogrpid mount options are
          supported by ext2, ext3, ext4, and XFS.  Filesystems that don't
          support these mount options follow the -o nogrpid rules.

      Glibc notes
          On older kernels where fchownat() is unavailable, the glibc
          wrapper function falls back to the use of chown() and lchown().
          When pathname is a relative pathname, glibc constructs a pathname
          based on the symbolic link in /proc/self/fd that corresponds to
          the dirfd argument.

      NFS
          The chown() semantics are deliberately violated on NFS
          filesystems which have UID mapping enabled.  Additionally, the
          semantics of all system calls which access the file contents are
          violated, because chown() may cause immediate access revocation
          on already open files.  Client side caching may lead to a delay
          between the time where ownership have been changed to allow
          access for a user and the time where the file can actually be
          accessed by the user on other clients.

      Historical details
          The original Linux chown(), fchown(), and lchown() system calls
          supported only 16-bit user and group IDs.  Subsequently, Linux
          2.4 added chown32(), fchown32(), and lchown32(), supporting
          32-bit IDs.  The glibc chown(), fchown(), and lchown() wrapper
          functions transparently deal with the variations across kernel
          versions.

          In versions of Linux prior to 2.1.81 (and distinct from 2.1.46),
          chown() did not follow symbolic links.  Since Linux 2.1.81,
          chown() does follow symbolic links, and there is a new system
          call lchown() that does not follow symbolic links.  Since Linux
          2.1.86, this new call (that has the same semantics as the old
          chown()) has got the same syscall number, and chown() got the
          newly introduced number.


---------------------------------------------------------

::

          The following program changes the ownership of the file named in
          its second command-line argument to the value specified in its
          first command-line argument.  The new owner can be specified
          either as a numeric user ID, or as a username (which is converted
          to a user ID by using getpwnam(3) to perform a lookup in the
          system password file).

      Program source
          #include <pwd.h>
          #include <stdio.h>
          #include <stdlib.h>
          #include <unistd.h>

          int
          main(int argc, char *argv[])
          {
              uid_t uid;
              struct passwd *pwd;
              char *endptr;

              if (argc != 3 || argv[1][0] == '\0') {
                  fprintf(stderr, "%s <owner> <file>\n", argv[0]);
                  exit(EXIT_FAILURE);
              }

              uid = strtol(argv[1], &endptr, 10);  /* Allow a numeric string */

              if (*endptr != '\0') {         /* Was not pure numeric string */
                  pwd = getpwnam(argv[1]);   /* Try getting UID for username */
                  if (pwd == NULL) {
                      perror("getpwnam");
                      exit(EXIT_FAILURE);
                  }

                  uid = pwd->pw_uid;
              }

              if (chown(argv[2], uid, -1) == -1) {
                  perror("chown");
                  exit(EXIT_FAILURE);
              }

              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          chgrp(1), chown(1), chmod(2), flock(2), path_resolution(7),
          symlink(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-08-27                       CHOWN(2)

--------------

Pages that refer to this page: `chgrp(1) <../man1/chgrp.1.html>`__, 
`chown(1) <../man1/chown.1.html>`__, 
`access(2) <../man2/access.2.html>`__, 
`chmod(2) <../man2/chmod.2.html>`__, 
`fcntl(2) <../man2/fcntl.2.html>`__, 
`mkdir(2) <../man2/mkdir.2.html>`__, 
`mknod(2) <../man2/mknod.2.html>`__, 
`mount_setattr(2) <../man2/mount_setattr.2.html>`__, 
`open(2) <../man2/open.2.html>`__, 
`open_by_handle_at(2) <../man2/open_by_handle_at.2.html>`__, 
`stat(2) <../man2/stat.2.html>`__, 
`statx(2) <../man2/statx.2.html>`__, 
`symlink(2) <../man2/symlink.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`euidaccess(3) <../man3/euidaccess.3.html>`__, 
`fpathconf(3) <../man3/fpathconf.3.html>`__, 
`shm_open(3) <../man3/shm_open.3.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`inode(7) <../man7/inode.7.html>`__, 
`inotify(7) <../man7/inotify.7.html>`__, 
`shm_overview(7) <../man7/shm_overview.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`spufs(7) <../man7/spufs.7.html>`__, 
`symlink(7) <../man7/symlink.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`unix(7) <../man7/unix.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/chown.2.license.html>`__

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
