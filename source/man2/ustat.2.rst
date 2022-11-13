.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ustat(2) — Linux manual page
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

   USTAT(2)                Linux Programmer's Manual               USTAT(2)

NAME
-------------------------------------------------

::

          ustat - get filesystem statistics


---------------------------------------------------------

::

          #include <sys/types.h>
          #include <unistd.h>    /* libc[45] */
          #include <ustat.h>     /* glibc2 */

          int ustat(dev_t dev, struct ustat *ubuf);


---------------------------------------------------------------

::

          ustat() returns information about a mounted filesystem.  dev is a
          device number identifying a device containing a mounted
          filesystem.  ubuf is a pointer to a ustat structure that contains
          the following members:

              daddr_t f_tfree;      /* Total free blocks */
              ino_t   f_tinode;     /* Number of free inodes */
              char    f_fname[6];   /* Filsys name */
              char    f_fpack[6];   /* Filsys pack name */

          The last two fields, f_fname and f_fpack, are not implemented and
          will always be filled with null bytes ('\0').


-----------------------------------------------------------------

::

          On success, zero is returned and the ustat structure pointed to
          by ubuf will be filled in.  On error, -1 is returned, and errno
          is set to indicate the error.


-----------------------------------------------------

::

          EFAULT ubuf points outside of your accessible address space.

          EINVAL dev does not refer to a device containing a mounted
                 filesystem.

          ENOSYS The mounted filesystem referenced by dev does not support
                 this operation, or any version of Linux before 1.3.16.


---------------------------------------------------------

::

          Since version 2.28, glibc no longer provides a wrapper for this
          system call.


-------------------------------------------------------------------

::

          SVr4.


---------------------------------------------------

::

          ustat() is deprecated and has been provided only for
          compatibility.  All new programs should use statfs(2) instead.

      HP-UX notes
          The HP-UX version of the ustat structure has an additional field,
          f_blksize, that is unknown elsewhere.  HP-UX warns: For some
          filesystems, the number of free inodes does not change.  Such
          filesystems will return -1 in the field f_tinode.  For some
          filesystems, inodes are dynamically allocated.  Such filesystems
          will return the current number of free inodes.


---------------------------------------------------------

::

          stat(2), statfs(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                       USTAT(2)

--------------

Pages that refer to this page: `syscalls(2) <../man2/syscalls.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/ustat.2.license.html>`__

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
