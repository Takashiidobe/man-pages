.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

symlink(3p) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYMLINK(3P)             POSIX Programmer's Manual            SYMLINK(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          symlink, symlinkat — make a symbolic link


---------------------------------------------------------

::

          #include <unistd.h>

          int symlink(const char *path1, const char *path2);

          #include <fcntl.h>

          int symlinkat(const char *path1, int fd, const char *path2);


---------------------------------------------------------------

::

          The symlink() function shall create a symbolic link called path2
          that contains the string pointed to by path1 (path2 is the name
          of the symbolic link created, path1 is the string contained in
          the symbolic link).

          The string pointed to by path1 shall be treated only as a string
          and shall not be validated as a pathname.

          If the symlink() function fails for any reason other than [EIO],
          any file named by path2 shall be unaffected.

          If path2 names a symbolic link, symlink() shall fail and set
          errno to [EEXIST].

          The symbolic link's user ID shall be set to the process'
          effective user ID. The symbolic link's group ID shall be set to
          the group ID of the parent directory or to the effective group ID
          of the process. Implementations shall provide a way to initialize
          the symbolic link's group ID to the group ID of the parent
          directory. Implementations may, but need not, provide an
          implementation-defined way to initialize the symbolic link's
          group ID to the effective group ID of the calling process.

          The values of the file mode bits for the created symbolic link
          are unspecified. All interfaces specified by POSIX.1‐2008 shall
          behave as if the contents of symbolic links can always be read,
          except that the value of the file mode bits returned in the
          st_mode field of the stat structure is unspecified.

          Upon successful completion, symlink() shall mark for update the
          last data access, last data modification, and last file status
          change timestamps of the symbolic link. Also, the last data
          modification and last file status change timestamps of the
          directory that contains the new entry shall be marked for update.

          The symlinkat() function shall be equivalent to the symlink()
          function except in the case where path2 specifies a relative
          path. In this case the symbolic link is created relative to the
          directory associated with the file descriptor fd instead of the
          current working directory. If the access mode of the open file
          description associated with the file descriptor is not O_SEARCH,
          the function shall check whether directory searches are permitted
          using the current permissions of the directory underlying the
          file descriptor. If the access mode is O_SEARCH, the function
          shall not perform the check.

          If symlinkat() is passed the special value AT_FDCWD in the fd
          parameter, the current working directory shall be used and the
          behavior shall be identical to a call to symlink().


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return 0.
          Otherwise, these functions shall return -1 and set errno to
          indicate the error.


-----------------------------------------------------

::

          These functions shall fail if:

          EACCES Write permission is denied in the directory where the
                 symbolic link is being created, or search permission is
                 denied for a component of the path prefix of path2.

          EEXIST The path2 argument names an existing file.

          EIO    An I/O error occurs while reading from or writing to the
                 file system.

          ELOOP  A loop exists in symbolic links encountered during
                 resolution of the path2 argument.

          ENAMETOOLONG
                 The length of a component of the pathname specified by the
                 path2 argument is longer than {NAME_MAX} or the length of
                 the path1 argument is longer than {SYMLINK_MAX}.

          ENOENT A component of the path prefix of path2 does not name an
                 existing file or path2 is an empty string.

          ENOENT or ENOTDIR
                 The path2 argument contains at least one non-<slash>
                 character and ends with one or more trailing <slash>
                 characters. If path2 without the trailing <slash>
                 characters would name an existing file, an [ENOENT] error
                 shall not occur.

          ENOSPC The directory in which the entry for the new symbolic link
                 is being placed cannot be extended because no space is
                 left on the file system containing the directory, or the
                 new symbolic link cannot be created because no space is
                 left on the file system which shall contain the link, or
                 the file system is out of file-allocation resources.

          ENOTDIR
                 A component of the path prefix of path2 names an existing
                 file that is neither a directory nor a symbolic link to a
                 directory.

          EROFS  The new symbolic link would reside on a read-only file
                 system.

          The symlinkat() function shall fail if:

          EACCES The access mode of the open file description associated
                 with fd is not O_SEARCH and the permissions of the
                 directory underlying fd do not permit directory searches.

          EBADF  The path2 argument does not specify an absolute path and
                 the fd argument is neither AT_FDCWD nor a valid file
                 descriptor open for reading or searching.

          ENOTDIR
                 The path2 argument is not an absolute path and fd is a
                 file descriptor associated with a non-directory file.

          These functions may fail if:

          ELOOP  More than {SYMLOOP_MAX} symbolic links were encountered
                 during resolution of the path2 argument.

          ENAMETOOLONG
                 The length of the path2 argument exceeds {PATH_MAX} or
                 pathname resolution of a symbolic link in the path2
                 argument produced an intermediate result with a length
                 that exceeds {PATH_MAX}.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          Like a hard link, a symbolic link allows a file to have multiple
          logical names. The presence of a hard link guarantees the
          existence of a file, even after the original name has been
          removed. A symbolic link provides no such assurance; in fact, the
          file named by the path1 argument need not exist when the link is
          created. A symbolic link can cross file system boundaries.

          Normal permission checks are made on each component of the
          symbolic link pathname during its resolution.


-----------------------------------------------------------

::

          The purpose of the symlinkat() function is to create symbolic
          links in directories other than the current working directory
          without exposure to race conditions. Any part of the path of a
          file could be changed in parallel to a call to symlink(),
          resulting in unspecified behavior. By opening a file descriptor
          for the target directory and using the symlinkat() function it
          can be guaranteed that the created symbolic link is located
          relative to the desired directory.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          fdopendir(3p), fstatat(3p), lchown(3p), link(3p), open(3p),
          readlink(3p), rename(3p), unlink(3p)

          The Base Definitions volume of POSIX.1‐2017, fcntl.h(0p),
          unistd.h(0p)


-----------------------------------------------------------

::

          Portions of this text are reprinted and reproduced in electronic
          form from IEEE Std 1003.1-2017, Standard for Information
          Technology -- Portable Operating System Interface (POSIX), The
          Open Group Base Specifications Issue 7, 2018 Edition, Copyright
          (C) 2018 by the Institute of Electrical and Electronics
          Engineers, Inc and The Open Group.  In the event of any
          discrepancy between this version and the original IEEE and The
          Open Group Standard, the original IEEE and The Open Group
          Standard is the referee document. The original Standard can be
          obtained online at http://www.opengroup.org/unix/online.html .

          Any typographical or formatting errors that appear in this page
          are most likely to have been introduced during the conversion of
          the source files to man page format. To report such errors, see
          https://www.kernel.org/doc/man-pages/reporting_bugs.html .

   IEEE/The Open Group               2017                       SYMLINK(3P)

--------------

Pages that refer to this page:
`unistd.h(0p) <../man0/unistd.h.0p.html>`__, 
`fdopendir(3p) <../man3/fdopendir.3p.html>`__, 
`fstatat(3p) <../man3/fstatat.3p.html>`__, 
`lchown(3p) <../man3/lchown.3p.html>`__, 
`link(3p) <../man3/link.3p.html>`__, 
`open(3p) <../man3/open.3p.html>`__, 
`readdir(3p) <../man3/readdir.3p.html>`__, 
`readlink(3p) <../man3/readlink.3p.html>`__, 
`rename(3p) <../man3/rename.3p.html>`__, 
`unlink(3p) <../man3/unlink.3p.html>`__

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
