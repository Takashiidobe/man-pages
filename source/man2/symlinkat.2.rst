.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

symlink(2) — Linux manual page
==============================

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

   SYMLINK(2)              Linux Programmer's Manual             SYMLINK(2)

NAME
-------------------------------------------------

::

          symlink, symlinkat - make a new name for a file


---------------------------------------------------------

::

          #include <unistd.h>

          int symlink(const char *target, const char *linkpath);

          #include <fcntl.h>           /* Definition of AT_* constants */
          #include <unistd.h>

          int symlinkat(const char *target, int newdirfd, const char *linkpath);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          symlink():
              _XOPEN_SOURCE >= 500 || _POSIX_C_SOURCE >= 200112L
                  || /* Glibc <= 2.19: */ _BSD_SOURCE

          symlinkat():
              Since glibc 2.10:
                  _POSIX_C_SOURCE >= 200809L
              Before glibc 2.10:
                  _ATFILE_SOURCE


---------------------------------------------------------------

::

          symlink() creates a symbolic link named linkpath which contains
          the string target.

          Symbolic links are interpreted at run time as if the contents of
          the link had been substituted into the path being followed to
          find a file or directory.

          Symbolic links may contain ..  path components, which (if used at
          the start of the link) refer to the parent directories of that in
          which the link resides.

          A symbolic link (also known as a soft link) may point to an
          existing file or to a nonexistent one; the latter case is known
          as a dangling link.

          The permissions of a symbolic link are irrelevant; the ownership
          is ignored when following the link, but is checked when removal
          or renaming of the link is requested and the link is in a
          directory with the sticky bit (S_ISVTX) set.

          If linkpath exists, it will not be overwritten.

      symlinkat()
          The symlinkat() system call operates in exactly the same way as
          symlink(), except for the differences described here.

          If the pathname given in linkpath is relative, then it is
          interpreted relative to the directory referred to by the file
          descriptor newdirfd (rather than relative to the current working
          directory of the calling process, as is done by symlink() for a
          relative pathname).

          If linkpath is relative and newdirfd is the special value
          AT_FDCWD, then linkpath is interpreted relative to the current
          working directory of the calling process (like symlink()).

          If linkpath is absolute, then newdirfd is ignored.

          See openat(2) for an explanation of the need for symlinkat().


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EACCES Write access to the directory containing linkpath is
                 denied, or one of the directories in the path prefix of
                 linkpath did not allow search permission.  (See also
                 path_resolution(7).)

          EBADF  (symlinkat()) linkpath is relative but newdirfd is neither
                 AT_FDCWD nor a valid file descriptor.

          EDQUOT The user's quota of resources on the filesystem has been
                 exhausted.  The resources could be inodes or disk blocks,
                 depending on the filesystem implementation.

          EEXIST linkpath already exists.

          EFAULT target or linkpath points outside your accessible address
                 space.

          EIO    An I/O error occurred.

          ELOOP  Too many symbolic links were encountered in resolving
                 linkpath.

          ENAMETOOLONG
                 target or linkpath was too long.

          ENOENT A directory component in linkpath does not exist or is a
                 dangling symbolic link, or target or linkpath is an empty
                 string.

          ENOENT (symlinkat()) linkpath is a relative pathname and newdirfd
                 refers to a directory that has been deleted.

          ENOMEM Insufficient kernel memory was available.

          ENOSPC The device containing the file has no room for the new
                 directory entry.

          ENOTDIR
                 A component used as a directory in linkpath is not, in
                 fact, a directory.

          ENOTDIR
                 (symlinkat()) linkpath is relative and newdirfd is a file
                 descriptor referring to a file other than a directory.

          EPERM  The filesystem containing linkpath does not support the
                 creation of symbolic links.

          EROFS  linkpath is on a read-only filesystem.


---------------------------------------------------------

::

          symlinkat() was added to Linux in kernel 2.6.16; library support
          was added to glibc in version 2.4.


-------------------------------------------------------------------

::

          symlink(): SVr4, 4.3BSD, POSIX.1-2001, POSIX.1-2008.

          symlinkat(): POSIX.1-2008.


---------------------------------------------------

::

          No checking of target is done.

          Deleting the name referred to by a symbolic link will actually
          delete the file (unless it also has other hard links).  If this
          behavior is not desired, use link(2).

      Glibc notes
          On older kernels where symlinkat() is unavailable, the glibc
          wrapper function falls back to the use of symlink().  When
          linkpath is a relative pathname, glibc constructs a pathname
          based on the symbolic link in /proc/self/fd that corresponds to
          the newdirfd argument.


---------------------------------------------------------

::

          ln(1), namei(1), lchown(2), link(2), lstat(2), open(2),
          readlink(2), rename(2), unlink(2), path_resolution(7), symlink(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-08-27                     SYMLINK(2)

--------------

Pages that refer to this page: `ln(1) <../man1/ln.1.html>`__, 
`fcntl(2) <../man2/fcntl.2.html>`__, 
`link(2) <../man2/link.2.html>`__,  `open(2) <../man2/open.2.html>`__, 
`readlink(2) <../man2/readlink.2.html>`__, 
`rename(2) <../man2/rename.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`inotify(7) <../man7/inotify.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`symlink(7) <../man7/symlink.7.html>`__, 
`mount(8) <../man8/mount.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/symlink.2.license.html>`__

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
