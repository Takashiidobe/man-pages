.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rmdir(2) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RMDIR(2)                Linux Programmer's Manual               RMDIR(2)

NAME
-------------------------------------------------

::

          rmdir - delete a directory


---------------------------------------------------------

::

          #include <unistd.h>

          int rmdir(const char *pathname);


---------------------------------------------------------------

::

          rmdir() deletes a directory, which must be empty.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EACCES Write access to the directory containing pathname was not
                 allowed, or one of the directories in the path prefix of
                 pathname did not allow search permission.  (See also
                 path_resolution(7).)

          EBUSY  pathname is currently in use by the system or some process
                 that prevents its removal.  On Linux, this means pathname
                 is currently used as a mount point or is the root
                 directory of the calling process.

          EFAULT pathname points outside your accessible address space.

          EINVAL pathname has .  as last component.

          ELOOP  Too many symbolic links were encountered in resolving
                 pathname.

          ENAMETOOLONG
                 pathname was too long.

          ENOENT A directory component in pathname does not exist or is a
                 dangling symbolic link.

          ENOMEM Insufficient kernel memory was available.

          ENOTDIR
                 pathname, or a component used as a directory in pathname,
                 is not, in fact, a directory.

          ENOTEMPTY
                 pathname contains entries other than . and .. ; or,
                 pathname has ..  as its final component.  POSIX.1 also
                 allows EEXIST for this condition.

          EPERM  The directory containing pathname has the sticky bit
                 (S_ISVTX) set and the process's effective user ID is
                 neither the user ID of the file to be deleted nor that of
                 the directory containing it, and the process is not
                 privileged (Linux: does not have the CAP_FOWNER
                 capability).

          EPERM  The filesystem containing pathname does not support the
                 removal of directories.

          EROFS  pathname refers to a directory on a read-only filesystem.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.


-------------------------------------------------

::

          Infelicities in the protocol underlying NFS can cause the
          unexpected disappearance of directories which are still being
          used.


---------------------------------------------------------

::

          rm(1), rmdir(1), chdir(2), chmod(2), mkdir(2), rename(2),
          unlink(2), unlinkat(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                       RMDIR(2)

--------------

Pages that refer to this page: `rmdir(1) <../man1/rmdir.1.html>`__, 
`fanotify_mark(2) <../man2/fanotify_mark.2.html>`__, 
`fcntl(2) <../man2/fcntl.2.html>`__, 
`mkdir(2) <../man2/mkdir.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`unlink(2) <../man2/unlink.2.html>`__, 
`remove(3) <../man3/remove.3.html>`__, 
`cpuset(7) <../man7/cpuset.7.html>`__, 
`mount_namespaces(7) <../man7/mount_namespaces.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`symlink(7) <../man7/symlink.7.html>`__, 
`mount(8) <../man8/mount.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/rmdir.2.license.html>`__

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
