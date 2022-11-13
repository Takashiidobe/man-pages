.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

handle(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   HANDLE(3)               Library Functions Manual               HANDLE(3)

NAME
-------------------------------------------------

::

          path_to_handle, path_to_fshandle, fd_to_handle,
          handle_to_fshandle, open_by_handle, readlink_by_handle,
          attr_multi_by_handle, attr_list_by_handle, fssetdm_by_handle,
          free_handle, getparents_by_handle, getparentpaths_by_handle -
          file handle operations


-------------------------------------------------------------

::

          #include <sys/types.h>
          #include <xfs/handle.h>

          int path_to_handle(char *path, void **hanp, size_t *hlen);

          int path_to_fshandle(char *path, void **hanp, size_t *hlen);

          int fd_to_handle(int fd, void **hanp, size_t *hlen);

          int handle_to_fshandle(void *hanp, size_t hlen, void **fshanp,
                 size_t *fshlen);

          int open_by_handle(void *hanp, size_t hlen, int oflag);

          int readlink_by_handle(void *hanp, size_t hlen, void *buf, size_t
                 bs);

          int attr_multi_by_handle(void *hanp, size_t hlen, void *buf, int
                 rtrvcnt, int flags);

          int attr_list_by_handle(void *hanp, size_t hlen, char *buf,
                 size_t bufsiz, int flags, struct attrlist_cursor *cursor);

          int fssetdm_by_handle(void *hanp, size_t hlen, struct fsdmidata
                 *fssetdm);

          void free_handle(void *hanp, size_t hlen);

          int getparents_by_handle(void *hanp, size_t hlen, parent_t *buf,
                 size_t bufsiz, parent_cursor_t *cursor, unsigned int
                 *count, unsigned int *more);

          int getparentpaths_by_handle(void *hanp, size_t hlen, parent_t
                 *buf, size_t bufsiz, parent_cursor_t *cursor, unsigned int
                 *count, unsigned int *more);


---------------------------------------------------------------

::

          These functions provide a way to perform certain filesystem
          operations without using a file descriptor to access filesystem
          objects. They are intended for use by a limited set of system
          utilities such as backup programs. They are supported only by the
          XFS filesystem.  Link with the libhandle library to access these
          functions.

          A handle, hanp, uniquely identifies a filesystem object or an
          entire filesystem.  There is one and only one handle per
          filesystem or filesystem object.  Handles consist of some number
          of bytes. The size of a handle (i.e. the number of bytes
          comprising it) varies by the type of handle and may vary for
          different objects of the same type.  The content of a handle is
          opaque to applications.  Since handle sizes vary and their
          contents are opaque, handles are described by two quantities, a
          pointer (hanp) and a size (hlen).  The size, hlen, indicates the
          number of bytes in the handle which are pointed to by the
          pointer.

          The path_to_handle() function returns the handle for the object
          given by the path argument. If the final component of the path
          name is a symbolic link, the handle returned is that of the link
          itself.

          The path_to_fshandle() function returns the handle for the
          filesystem in which the object given by the path argument
          resides.

          The fd_to_handle() function returns the handle for the object
          referenced by the fd argument, which must be a valid file
          descriptor.

          The handle_to_fshandle() function returns the handle for the
          filesystem in which the object referenced by the handle given by
          the hanp and hlen arguments resides.

          The open_by_handle() function opens a file descriptor for the
          object referenced by a handle.  It is analogous and identical to
          open(2) with the exception of accepting handles instead of path
          names.

          The readlink_by_handle() function returns the contents of a
          symbolic link referenced by a handle.

          The attr_multi_by_handle() function manipulates multiple user
          attributes on a filesystem object.  It is analogous and identical
          to attr_multif(3) except that a handle is specified instead of a
          file descriptor.

          The attr_list_by_handle() function returns the names of the user
          attributes of a filesystem object.  It is analogous and identical
          to attr_listf(3) except that a handle is specified instead of a
          file descriptor.

          The fssetdm_by_handle() function sets the di_dmevmask and
          di_dmstate fields in an XFS on-disk inode. It is analogous to the
          XFS_IOC_FSSETDM xfsctl(3) command, except that a handle is
          specified instead of a file.

          The free_handle() function frees the storage allocated for
          handles returned by the following functions: path_to_handle(),
          path_to_fshandle(), fd_to_handle(), and handle_to_fshandle().

          The getparents_by_handle() function returns an array of parent_t
          structures for each hardlink to the inode represented by the
          given handle.  The parent structure encodes the parent inode
          number, generation number and the basename of the link.  This
          function is not operational on Linux.

          The getparentpaths_by_handle() function is identical to the
          getparents_by_handle() function except that instead of returning
          the basename it returns the path of the link up to the mount
          point.  This function is also not operational on Linux.


-----------------------------------------------------------------

::

          The function free_handle() has no failure indication. The other
          functions return the value 0 to the calling process if they
          succeed; otherwise, they return the value -1 and set errno to
          indicate the error.


-----------------------------------------------------

::

          EACCES Search permission was denied for a component of path.

          EBADF  fd is not a valid and open file descriptor.

          EFAULT An argument pointed to an invalid address.

          EINVAL path is in a filesystem that does not support these
                 functions.

          ELOOP  Too many symbolic links were encountered in translating
                 the path name.

          ENAMETOOLONG
                 A component of path or the entire length of path exceeds
                 filesystem limits.

          ENOENT A component of path does not exist.

          EPERM  The caller does not have sufficient privileges.


---------------------------------------------------------

::

          open(2), readlink(2), attr_multi(3), attr_list(3), xfsctl(3),
          xfs(5).

COLOPHON
---------------------------------------------------------

::

          This page is part of the xfsprogs (utilities for XFS filesystems)
          project.  Information about the project can be found at 
          ⟨http://xfs.org/⟩.  If you have a bug report for this manual page,
          send it to linux-xfs@vger.kernel.org.  This page was obtained
          from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-20.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                                                  HANDLE(3)

--------------

Pages that refer to this page: `xfsctl(3) <../man3/xfsctl.3.html>`__, 
`xfs(5) <../man5/xfs.5.html>`__

--------------

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
