.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

chdir(2) — Linux manual page
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

   CHDIR(2)                Linux Programmer's Manual               CHDIR(2)

NAME
-------------------------------------------------

::

          chdir, fchdir - change working directory


---------------------------------------------------------

::

          #include <unistd.h>

          int chdir(const char *path);
          int fchdir(int fd);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          fchdir():
              _XOPEN_SOURCE >= 500
                  || /* Since glibc 2.12: */ _POSIX_C_SOURCE >= 200809L
                  || /* Glibc up to and including 2.19: */ _BSD_SOURCE


---------------------------------------------------------------

::

          chdir() changes the current working directory of the calling
          process to the directory specified in path.

          fchdir() is identical to chdir(); the only difference is that the
          directory is given as an open file descriptor.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          Depending on the filesystem, other errors can be returned.  The
          more general errors for chdir() are listed below:

          EACCES Search permission is denied for one of the components of
                 path.  (See also path_resolution(7).)

          EFAULT path points outside your accessible address space.

          EIO    An I/O error occurred.

          ELOOP  Too many symbolic links were encountered in resolving
                 path.

          ENAMETOOLONG
                 path is too long.

          ENOENT The directory specified in path does not exist.

          ENOMEM Insufficient kernel memory was available.

          ENOTDIR
                 A component of path is not a directory.

          The general errors for fchdir() are listed below:

          EACCES Search permission was denied on the directory open on fd.

          EBADF  fd is not a valid file descriptor.

          ENOTDIR
                 fd does not refer to a directory.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4, 4.4BSD.


---------------------------------------------------

::

          The current working directory is the starting point for
          interpreting relative pathnames (those not starting with '/').

          A child process created via fork(2) inherits its parent's current
          working directory.  The current working directory is left
          unchanged by execve(2).


---------------------------------------------------------

::

          chroot(2), getcwd(3), path_resolution(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                       CHDIR(2)

--------------

Pages that refer to this page: `chroot(2) <../man2/chroot.2.html>`__, 
`clone(2) <../man2/clone.2.html>`__, 
`open(2) <../man2/open.2.html>`__, 
`pivot_root(2) <../man2/pivot_root.2.html>`__, 
`rmdir(2) <../man2/rmdir.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`unshare(2) <../man2/unshare.2.html>`__, 
`dirfd(3) <../man3/dirfd.3.html>`__,  `fts(3) <../man3/fts.3.html>`__, 
`ftw(3) <../man3/ftw.3.html>`__, 
`getcwd(3) <../man3/getcwd.3.html>`__, 
`cpuset(7) <../man7/cpuset.7.html>`__, 
`path_resolution(7) <../man7/path_resolution.7.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/chdir.2.license.html>`__

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
