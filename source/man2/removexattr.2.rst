.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

removexattr(2) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   REMOVEXATTR(2)          Linux Programmer's Manual         REMOVEXATTR(2)

NAME
-------------------------------------------------

::

          removexattr, lremovexattr, fremovexattr - remove an extended
          attribute


---------------------------------------------------------

::

          #include <sys/xattr.h>

          int removexattr(const char *path, const char *name);
          int lremovexattr(const char *path, const char *name);
          int fremovexattr(int fd, const char *name);


---------------------------------------------------------------

::

          Extended attributes are name:value pairs associated with inodes
          (files, directories, symbolic links, etc.).  They are extensions
          to the normal attributes which are associated with all inodes in
          the system (i.e., the stat(2) data).  A complete overview of
          extended attributes concepts can be found in xattr(7).

          removexattr() removes the extended attribute identified by name
          and associated with the given path in the filesystem.

          lremovexattr() is identical to removexattr(), except in the case
          of a symbolic link, where the extended attribute is removed from
          the link itself, not the file that it refers to.

          fremovexattr() is identical to removexattr(), only the extended
          attribute is removed from the open file referred to by fd (as
          returned by open(2)) in place of path.

          An extended attribute name is a null-terminated string.  The name
          includes a namespace prefix; there may be several, disjoint
          namespaces associated with an individual inode.


-----------------------------------------------------------------

::

          On success, zero is returned.  On failure, -1 is returned and
          errno is set to indicate the error.


-----------------------------------------------------

::

          ENODATA
                 The named attribute does not exist.

          ENOTSUP
                 Extended attributes are not supported by the filesystem,
                 or are disabled.

          In addition, the errors documented in stat(2) can also occur.


---------------------------------------------------------

::

          These system calls have been available on Linux since kernel 2.4;
          glibc support is provided since version 2.3.


-------------------------------------------------------------------

::

          These system calls are Linux-specific.


---------------------------------------------------------

::

          getfattr(1), setfattr(1), getxattr(2), listxattr(2), open(2),
          setxattr(2), stat(2), symlink(7), xattr(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                 REMOVEXATTR(2)

--------------

Pages that refer to this page:
`getxattr(2) <../man2/getxattr.2.html>`__, 
`listxattr(2) <../man2/listxattr.2.html>`__, 
`setxattr(2) <../man2/setxattr.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`symlink(7) <../man7/symlink.7.html>`__, 
`xattr(7) <../man7/xattr.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/removexattr.2.license.html>`__

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
