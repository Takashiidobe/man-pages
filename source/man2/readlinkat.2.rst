.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

readlink(2) — Linux manual page
===============================

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

   READLINK(2)             Linux Programmer's Manual            READLINK(2)

NAME
-------------------------------------------------

::

          readlink, readlinkat - read value of a symbolic link


---------------------------------------------------------

::

          #include <unistd.h>

          ssize_t readlink(const char *restrict pathname, char *restrict buf,
                           size_t bufsiz);

          #include <fcntl.h>            /* Definition of AT_* constants */
          #include <unistd.h>

          ssize_t readlinkat(int dirfd, const char *restrict pathname,
                           char *restrict buf, size_t bufsiz);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          readlink():
              _XOPEN_SOURCE >= 500 || _POSIX_C_SOURCE >= 200112L
                  || /* Glibc <= 2.19: */ _BSD_SOURCE

          readlinkat():
              Since glibc 2.10:
                  _POSIX_C_SOURCE >= 200809L
              Before glibc 2.10:
                  _ATFILE_SOURCE


---------------------------------------------------------------

::

          readlink() places the contents of the symbolic link pathname in
          the buffer buf, which has size bufsiz.  readlink() does not
          append a terminating null byte to buf.  It will (silently)
          truncate the contents (to a length of bufsiz characters), in case
          the buffer is too small to hold all of the contents.

      readlinkat()
          The readlinkat() system call operates in exactly the same way as
          readlink(), except for the differences described here.

          If the pathname given in pathname is relative, then it is
          interpreted relative to the directory referred to by the file
          descriptor dirfd (rather than relative to the current working
          directory of the calling process, as is done by readlink() for a
          relative pathname).

          If pathname is relative and dirfd is the special value AT_FDCWD,
          then pathname is interpreted relative to the current working
          directory of the calling process (like readlink()).

          If pathname is absolute, then dirfd is ignored.

          Since Linux 2.6.39, pathname can be an empty string, in which
          case the call operates on the symbolic link referred to by dirfd
          (which should have been obtained using open(2) with the O_PATH
          and O_NOFOLLOW flags).

          See openat(2) for an explanation of the need for readlinkat().


-----------------------------------------------------------------

::

          On success, these calls return the number of bytes placed in buf.
          (If the returned value equals bufsiz, then truncation may have
          occurred.)  On error, -1 is returned and errno is set to indicate
          the error.


-----------------------------------------------------

::

          EACCES Search permission is denied for a component of the path
                 prefix.  (See also path_resolution(7).)

          EBADF  (readlinkat()) pathname is relative but dirfd is neither
                 AT_FDCWD nor a valid file descriptor.

          EFAULT buf extends outside the process's allocated address space.

          EINVAL bufsiz is not positive.

          EINVAL The named file (i.e., the final filename component of
                 pathname) is not a symbolic link.

          EIO    An I/O error occurred while reading from the filesystem.

          ELOOP  Too many symbolic links were encountered in translating
                 the pathname.

          ENAMETOOLONG
                 A pathname, or a component of a pathname, was too long.

          ENOENT The named file does not exist.

          ENOMEM Insufficient kernel memory was available.

          ENOTDIR
                 A component of the path prefix is not a directory.

          ENOTDIR
                 (readlinkat()) pathname is relative and dirfd is a file
                 descriptor referring to a file other than a directory.


---------------------------------------------------------

::

          readlinkat() was added to Linux in kernel 2.6.16; library support
          was added to glibc in version 2.4.


-------------------------------------------------------------------

::

          readlink(): 4.4BSD (readlink() first appeared in 4.2BSD),
          POSIX.1-2001, POSIX.1-2008.

          readlinkat(): POSIX.1-2008.


---------------------------------------------------

::

          In versions of glibc up to and including glibc 2.4, the return
          type of readlink() was declared as int.  Nowadays, the return
          type is declared as ssize_t, as (newly) required in POSIX.1-2001.

          Using a statically sized buffer might not provide enough room for
          the symbolic link contents.  The required size for the buffer can
          be obtained from the stat.st_size value returned by a call to
          lstat(2) on the link.  However, the number of bytes written by
          readlink() and readlinkat() should be checked to make sure that
          the size of the symbolic link did not increase between the calls.
          Dynamically allocating the buffer for readlink() and readlinkat()
          also addresses a common portability problem when using PATH_MAX
          for the buffer size, as this constant is not guaranteed to be
          defined per POSIX if the system does not have such limit.

      Glibc notes
          On older kernels where readlinkat() is unavailable, the glibc
          wrapper function falls back to the use of readlink().  When
          pathname is a relative pathname, glibc constructs a pathname
          based on the symbolic link in /proc/self/fd that corresponds to
          the dirfd argument.


---------------------------------------------------------

::

          The following program allocates the buffer needed by readlink()
          dynamically from the information provided by lstat(2), falling
          back to a buffer of size PATH_MAX in cases where lstat(2) reports
          a size of zero.

          #include <sys/types.h>
          #include <sys/stat.h>
          #include <limits.h>
          #include <stdio.h>
          #include <stdlib.h>
          #include <unistd.h>

          int
          main(int argc, char *argv[])
          {
              struct stat sb;
              char *buf;
              ssize_t nbytes, bufsiz;

              if (argc != 2) {
                  fprintf(stderr, "Usage: %s <pathname>\n", argv[0]);
                  exit(EXIT_FAILURE);
              }

              if (lstat(argv[1], &sb) == -1) {
                  perror("lstat");
                  exit(EXIT_FAILURE);
              }

              /* Add one to the link size, so that we can determine whether
                 the buffer returned by readlink() was truncated. */

              bufsiz = sb.st_size + 1;

              /* Some magic symlinks under (for example) /proc and /sys
                 report 'st_size' as zero. In that case, take PATH_MAX as
                 a "good enough" estimate. */

              if (sb.st_size == 0)
                  bufsiz = PATH_MAX;

              buf = malloc(bufsiz);
              if (buf == NULL) {
                  perror("malloc");
                  exit(EXIT_FAILURE);
              }

              nbytes = readlink(argv[1], buf, bufsiz);
              if (nbytes == -1) {
                  perror("readlink");
                  exit(EXIT_FAILURE);
              }

              /* Print only 'nbytes' of 'buf', as it doesn't contain a terminating
                 null byte ('\0'). */
              printf("'%s' points to '%.*s'\n", argv[1], (int) nbytes, buf);

              /* If the return value was equal to the buffer size, then the
                 the link target was larger than expected (perhaps because the
                 target was changed between the call to lstat() and the call to
                 readlink()). Warn the user that the returned target may have
                 been truncated. */

              if (nbytes == bufsiz)
                  printf("(Returned buffer may have been truncated)\n");

              free(buf);
              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          readlink(1), lstat(2), stat(2), symlink(2), realpath(3),
          path_resolution(7), symlink(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-08-27                    READLINK(2)

--------------

Pages that refer to this page:
`readlink(1) <../man1/readlink.1.html>`__, 
`realpath(1) <../man1/realpath.1.html>`__, 
`mount(2) <../man2/mount.2.html>`__, 
`open(2) <../man2/open.2.html>`__, 
`open_by_handle_at(2) <../man2/open_by_handle_at.2.html>`__, 
`ptrace(2) <../man2/ptrace.2.html>`__, 
`read(2) <../man2/read.2.html>`__,  `stat(2) <../man2/stat.2.html>`__, 
`statx(2) <../man2/statx.2.html>`__, 
`symlink(2) <../man2/symlink.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`canonicalize_file_name(3) <../man3/canonicalize_file_name.3.html>`__, 
`handle(3) <../man3/handle.3.html>`__, 
`realpath(3) <../man3/realpath.3.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`namespaces(7) <../man7/namespaces.7.html>`__, 
`path_resolution(7) <../man7/path_resolution.7.html>`__, 
`pid_namespaces(7) <../man7/pid_namespaces.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`symlink(7) <../man7/symlink.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`lsof(8) <../man8/lsof.8.html>`__, 
`mount(8) <../man8/mount.8.html>`__, 
`umount(8) <../man8/umount.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/readlink.2.license.html>`__

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
