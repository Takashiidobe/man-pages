.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rename(3p) — Linux manual page
==============================

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

   RENAME(3P)              POSIX Programmer's Manual             RENAME(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          rename, renameat — rename file


---------------------------------------------------------

::

          #include <stdio.h>

          int rename(const char *old, const char *new);

          #include <fcntl.h>

          int renameat(int oldfd, const char *old, int newfd,
              const char *new);


---------------------------------------------------------------

::

          For rename(): The functionality described on this reference page
          is aligned with the ISO C standard. Any conflict between the
          requirements described here and the ISO C standard is
          unintentional. This volume of POSIX.1‐2017 defers to the ISO C
          standard.

          The rename() function shall change the name of a file. The old
          argument points to the pathname of the file to be renamed. The
          new argument points to the new pathname of the file.  If the new
          argument does not resolve to an existing directory entry for a
          file of type directory and the new argument contains at least one
          non-<slash> character and ends with one or more trailing <slash>
          characters after all symbolic links have been processed, rename()
          shall fail.

          If either the old or new argument names a symbolic link, rename()
          shall operate on the symbolic link itself, and shall not resolve
          the last component of the argument. If the old argument and the
          new argument resolve to either the same existing directory entry
          or different directory entries for the same existing file,
          rename() shall return successfully and perform no other action.

          If the old argument points to the pathname of a file that is not
          a directory, the new argument shall not point to the pathname of
          a directory. If the link named by the new argument exists, it
          shall be removed and old renamed to new.  In this case, a link
          named new shall remain visible to other threads throughout the
          renaming operation and refer either to the file referred to by
          new or old before the operation began. Write access permission is
          required for both the directory containing old and the directory
          containing new.

          If the old argument points to the pathname of a directory, the
          new argument shall not point to the pathname of a file that is
          not a directory. If the directory named by the new argument
          exists, it shall be removed and old renamed to new.  In this
          case, a link named new shall exist throughout the renaming
          operation and shall refer either to the directory referred to by
          new or old before the operation began. If new names an existing
          directory, it shall be required to be an empty directory.

          If either pathname argument refers to a path whose final
          component is either dot or dot-dot, rename() shall fail.

          If the old argument points to a pathname of a symbolic link, the
          symbolic link shall be renamed. If the new argument points to a
          pathname of a symbolic link, the symbolic link shall be removed.

          The old pathname shall not name an ancestor directory of the new
          pathname. Write access permission is required for the directory
          containing old and the directory containing new.  If the old
          argument points to the pathname of a directory, write access
          permission may be required for the directory named by old, and,
          if it exists, the directory named by new.

          If the link named by the new argument exists and the file's link
          count becomes 0 when it is removed and no process has the file
          open, the space occupied by the file shall be freed and the file
          shall no longer be accessible. If one or more processes have the
          file open when the last link is removed, the link shall be
          removed before rename() returns, but the removal of the file
          contents shall be postponed until all references to the file are
          closed.

          Upon successful completion, rename() shall mark for update the
          last data modification and last file status change timestamps of
          the parent directory of each file.

          If the rename() function fails for any reason other than [EIO],
          any file named by new shall be unaffected.

          The renameat() function shall be equivalent to the rename()
          function except in the case where either old or new specifies a
          relative path. If old is a relative path, the file to be renamed
          is located relative to the directory associated with the file
          descriptor oldfd instead of the current working directory. If new
          is a relative path, the same happens only relative to the
          directory associated with newfd.  If the access mode of the open
          file description associated with the file descriptor is not
          O_SEARCH, the function shall check whether directory searches are
          permitted using the current permissions of the directory
          underlying the file descriptor. If the access mode is O_SEARCH,
          the function shall not perform the check.

          If renameat() is passed the special value AT_FDCWD in the oldfd
          or newfd parameter, the current working directory shall be used
          in the determination of the file for the respective path
          parameter.


-----------------------------------------------------------------

::

          Upon successful completion, the rename() function shall return 0.
          Otherwise, it shall return -1, errno shall be set to indicate the
          error, and neither the file named by old nor the file named by
          new shall be changed or created.

          Upon successful completion, the renameat() function shall return
          0. Otherwise, it shall return -1 and set errno to indicate the
          error.


-----------------------------------------------------

::

          The rename() and renameat() functions shall fail if:

          EACCES A component of either path prefix denies search
                 permission; or one of the directories containing old or
                 new denies write permissions; or, write permission is
                 required and is denied for a directory pointed to by the
                 old or new arguments.

          EBUSY  The directory named by old or new is currently in use by
                 the system or another process, and the implementation
                 considers this an error.

          [EEXIST] or [ENOTEMPTY]
                      The link named by new is a directory that is not an
                      empty directory.

          EINVAL      The old pathname names an ancestor directory of the
                      new pathname, or either pathname argument contains a
                      final component that is dot or dot-dot.

          EIO         A physical I/O error has occurred.

          EISDIR      The new argument points to a directory and the old
                      argument points to a file that is not a directory.

          ELOOP       A loop exists in symbolic links encountered during
                      resolution of the path argument.

          EMLINK      The file named by old is a directory, and the link
                      count of the parent directory of new would exceed
                      {LINK_MAX}.

          ENAMETOOLONG
                      The length of a component of a pathname is longer
                      than {NAME_MAX}.

          ENOENT      The link named by old does not name an existing file,
                      a component of the path prefix of new does not exist,
                      or either old or new points to an empty string.

          ENOSPC      The directory that would contain new cannot be
                      extended.

          ENOTDIR     A component of either path prefix names an existing
                      file that is neither a directory nor a symbolic link
                      to a directory; or the old argument names a directory
                      and the new argument names a non-directory file; or
                      the old argument contains at least one non-<slash>
                      character and ends with one or more trailing <slash>
                      characters and the last pathname component names an
                      existing file that is neither a directory nor a
                      symbolic link to a directory; or the old argument
                      names an existing non-directory file and the new
                      argument names a nonexistent file, contains at least
                      one non-<slash> character, and ends with one or more
                      trailing <slash> characters; or the new argument
                      names an existing non-directory file, contains at
                      least one non-<slash> character, and ends with one or
                      more trailing <slash> characters.

          EPERM or EACCES
                      The S_ISVTX flag is set on the directory containing
                      the file referred to by old and the process does not
                      satisfy the criteria specified in the Base
                      Definitions volume of POSIX.1‐2017, Section 4.3,
                      Directory Protection with respect to old; or new
                      refers to an existing file, the S_ISVTX flag is set
                      on the directory containing this file, and the
                      process does not satisfy the criteria specified in
                      the Base Definitions volume of POSIX.1‐2017, Section
                      4.3, Directory Protection with respect to this file.

          EROFS       The requested operation requires writing in a
                      directory on a read-only file system.

          EXDEV       The links named by new and old are on different file
                      systems and the implementation does not support links
                      between file systems.

          In addition, the renameat() function shall fail if:

          EACCES The access mode of the open file description associated
                 with oldfd or newfd is not O_SEARCH and the permissions of
                 the directory underlying oldfd or newfd, respectively, do
                 not permit directory searches.

          EBADF  The old argument does not specify an absolute path and the
                 oldfd argument is neither AT_FDCWD nor a valid file
                 descriptor open for reading or searching, or the new
                 argument does not specify an absolute path and the newfd
                 argument is neither AT_FDCWD nor a valid file descriptor
                 open for reading or searching.

          ENOTDIR
                 The old or new argument is not an absolute path and oldfd
                 or newfd, respectively, is a file descriptor associated
                 with a non-directory file.

          The rename() and renameat() functions may fail if:

          EBUSY  The file named by the old or new arguments is a named
                 STREAM.

          ELOOP  More than {SYMLOOP_MAX} symbolic links were encountered
                 during resolution of the path argument.

          ENAMETOOLONG
                 The length of a pathname exceeds {PATH_MAX}, or pathname
                 resolution of a symbolic link produced an intermediate
                 result with a length that exceeds {PATH_MAX}.

          ETXTBSY
                 The file named by new exists and is the last directory
                 entry to a pure procedure (shared text) file that is being
                 executed.

          The following sections are informative.


---------------------------------------------------------

::

      Renaming a File
          The following example shows how to rename a file named
          /home/cnd/mod1 to /home/cnd/mod2.

              #include <stdio.h>

              int status;
              ...
              status = rename("/home/cnd/mod1", "/home/cnd/mod2");


---------------------------------------------------------------------------

::

          Some implementations mark for update the last file status change
          timestamp of renamed files and some do not. Applications which
          make use of the last file status change timestamp may behave
          differently with respect to renamed files unless they are
          designed to allow for either behavior.


-----------------------------------------------------------

::

          This rename() function is equivalent for regular files to that
          defined by the ISO C standard.  Its inclusion here expands that
          definition to include actions on directories and specifies
          behavior when the new parameter names a file that already exists.
          That specification requires that the action of the function be
          atomic.

          One of the reasons for introducing this function was to have a
          means of renaming directories while permitting implementations to
          prohibit the use of link() and unlink() with directories, thus
          constraining links to directories to those made by mkdir().

          The specification that if old and new refer to the same file is
          intended to guarantee that:

              rename("x", "x");

          does not remove the file.

          Renaming dot or dot-dot is prohibited in order to prevent
          cyclical file system paths.

          See also the descriptions of [ENOTEMPTY] and [ENAMETOOLONG] in
          rmdir() and [EBUSY] in unlink().  For a discussion of [EXDEV],
          see link().

          The purpose of the renameat() function is to rename files in
          directories other than the current working directory without
          exposure to race conditions. Any part of the path of a file could
          be changed in parallel to a call to rename(), resulting in
          unspecified behavior. By opening file descriptors for the source
          and target directories and using the renameat() function it can
          be guaranteed that that renamed file is located correctly and the
          resulting file is in the desired directory.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          link(3p), rmdir(3p), symlink(3p), unlink(3p)

          The Base Definitions volume of POSIX.1‐2017, Section 4.3,
          Directory Protection, fcntl.h(0p), stdio.h(0p)


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

   IEEE/The Open Group               2017                        RENAME(3P)

--------------

Pages that refer to this page:
`stdio.h(0p) <../man0/stdio.h.0p.html>`__, 
`mv(1p) <../man1/mv.1p.html>`__,  `link(3p) <../man3/link.3p.html>`__, 
`rmdir(3p) <../man3/rmdir.3p.html>`__, 
`symlink(3p) <../man3/symlink.3p.html>`__, 
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
