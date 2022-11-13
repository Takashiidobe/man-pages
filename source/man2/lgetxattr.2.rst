.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getxattr(2) — Linux manual page
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
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETXATTR(2)             Linux Programmer's Manual            GETXATTR(2)

NAME
-------------------------------------------------

::

          getxattr, lgetxattr, fgetxattr - retrieve an extended attribute
          value


---------------------------------------------------------

::

          #include <sys/xattr.h>

          ssize_t getxattr(const char *path, const char *name,
                           void *value, size_t size);
          ssize_t lgetxattr(const char *path, const char *name,
                           void *value, size_t size);
          ssize_t fgetxattr(int fd, const char *name,
                           void *value, size_t size);


---------------------------------------------------------------

::

          Extended attributes are name:value pairs associated with inodes
          (files, directories, symbolic links, etc.).  They are extensions
          to the normal attributes which are associated with all inodes in
          the system (i.e., the stat(2) data).  A complete overview of
          extended attributes concepts can be found in xattr(7).

          getxattr() retrieves the value of the extended attribute
          identified by name and associated with the given path in the
          filesystem.  The attribute value is placed in the buffer pointed
          to by value; size specifies the size of that buffer.  The return
          value of the call is the number of bytes placed in value.

          lgetxattr() is identical to getxattr(), except in the case of a
          symbolic link, where the link itself is interrogated, not the
          file that it refers to.

          fgetxattr() is identical to getxattr(), only the open file
          referred to by fd (as returned by open(2)) is interrogated in
          place of path.

          An extended attribute name is a null-terminated string.  The name
          includes a namespace prefix; there may be several, disjoint
          namespaces associated with an individual inode.  The value of an
          extended attribute is a chunk of arbitrary textual or binary data
          that was assigned using setxattr(2).

          If size is specified as zero, these calls return the current size
          of the named extended attribute (and leave value unchanged).
          This can be used to determine the size of the buffer that should
          be supplied in a subsequent call.  (But, bear in mind that there
          is a possibility that the attribute value may change between the
          two calls, so that it is still necessary to check the return
          status from the second call.)


-----------------------------------------------------------------

::

          On success, these calls return a nonnegative value which is the
          size (in bytes) of the extended attribute value.  On failure, -1
          is returned and errno is set to indicate the error.


-----------------------------------------------------

::

          E2BIG  The size of the attribute value is larger than the maximum
                 size allowed; the attribute cannot be retrieved.  This can
                 happen on filesystems that support very large attribute
                 values such as NFSv4, for example.

          ENODATA
                 The named attribute does not exist, or the process has no
                 access to this attribute.

          ENOTSUP
                 Extended attributes are not supported by the filesystem,
                 or are disabled.

          ERANGE The size of the value buffer is too small to hold the
                 result.

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

          See listxattr(2).


---------------------------------------------------------

::

          getfattr(1), setfattr(1), listxattr(2), open(2), removexattr(2),
          setxattr(2), stat(2), symlink(7), xattr(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                    GETXATTR(2)

--------------

Pages that refer to this page:
`listxattr(2) <../man2/listxattr.2.html>`__, 
`open(2) <../man2/open.2.html>`__, 
`removexattr(2) <../man2/removexattr.2.html>`__, 
`setxattr(2) <../man2/setxattr.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`symlink(7) <../man7/symlink.7.html>`__, 
`xattr(7) <../man7/xattr.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/getxattr.2.license.html>`__

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
