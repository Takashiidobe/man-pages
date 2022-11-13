.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

readlink(3p) — Linux manual page
================================

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

   READLINK(3P)            POSIX Programmer's Manual           READLINK(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          readlink, readlinkat — read the contents of a symbolic link


---------------------------------------------------------

::

          #include <unistd.h>

          ssize_t readlink(const char *restrict path, char *restrict buf,
              size_t bufsize);

          #include <fcntl.h>

          ssize_t readlinkat(int fd, const char *restrict path,
              char *restrict buf, size_t bufsize);


---------------------------------------------------------------

::

          The readlink() function shall place the contents of the symbolic
          link referred to by path in the buffer buf which has size
          bufsize.  If the number of bytes in the symbolic link is less
          than bufsize, the contents of the remainder of buf are
          unspecified. If the buf argument is not large enough to contain
          the link content, the first bufsize bytes shall be placed in buf.

          If the value of bufsize is greater than {SSIZE_MAX}, the result
          is implementation-defined.

          Upon successful completion, readlink() shall mark for update the
          last data access timestamp of the symbolic link.

          The readlinkat() function shall be equivalent to the readlink()
          function except in the case where path specifies a relative path.
          In this case the symbolic link whose content is read is relative
          to the directory associated with the file descriptor fd instead
          of the current working directory. If the access mode of the open
          file description associated with the file descriptor is not
          O_SEARCH, the function shall check whether directory searches are
          permitted using the current permissions of the directory
          underlying the file descriptor. If the access mode is O_SEARCH,
          the function shall not perform the check.

          If readlinkat() is passed the special value AT_FDCWD in the fd
          parameter, the current working directory shall be used and the
          behavior shall be identical to a call to readlink().


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return the
          count of bytes placed in the buffer. Otherwise, these functions
          shall return a value of -1, leave the buffer unchanged, and set
          errno to indicate the error.


-----------------------------------------------------

::

          These functions shall fail if:

          EACCES Search permission is denied for a component of the path
                 prefix of path.

          EINVAL The path argument names a file that is not a symbolic
                 link.

          EIO    An I/O error occurred while reading from the file system.

          ELOOP  A loop exists in symbolic links encountered during
                 resolution of the path argument.

          ENAMETOOLONG
                 The length of a component of a pathname is longer than
                 {NAME_MAX}.

          ENOENT A component of path does not name an existing file or path
                 is an empty string.

          ENOTDIR
                 A component of the path prefix names an existing file that
                 is neither a directory nor a symbolic link to a directory,
                 or the path argument contains at least one non-<slash>
                 character and ends with one or more trailing <slash>
                 characters and the last pathname component names an
                 existing file that is neither a directory nor a symbolic
                 link to a directory.

          The readlinkat() function shall fail if:

          EACCES The access mode of the open file description associated
                 with fd is not O_SEARCH and the permissions of the
                 directory underlying fd do not permit directory searches.

          EBADF  The path argument does not specify an absolute path and
                 the fd argument is neither AT_FDCWD nor a valid file
                 descriptor open for reading or searching.

          ENOTDIR
                 The path argument is not an absolute path and fd is a file
                 descriptor associated with a non-directory file.

          These functions may fail if:

          ELOOP  More than {SYMLOOP_MAX} symbolic links were encountered
                 during resolution of the path argument.

          ENAMETOOLONG
                 The length of a pathname exceeds {PATH_MAX}, or pathname
                 resolution of a symbolic link produced an intermediate
                 result with a length that exceeds {PATH_MAX}.

          The following sections are informative.


---------------------------------------------------------

::

      Reading the Name of a Symbolic Link
          The following example shows how to read the name of a symbolic
          link named /modules/pass1.

              #include <unistd.h>

              char buf[1024];
              ssize_t len;
              ...
              if ((len = readlink("/modules/pass1", buf, sizeof(buf)-1)) != -1)
                  buf[len] = '\0';


---------------------------------------------------------------------------

::

          Conforming applications should not assume that the returned
          contents of the symbolic link are null-terminated.


-----------------------------------------------------------

::

          The type associated with bufsiz is a size_t in order to be
          consistent with both the ISO C standard and the definition of
          read().  The behavior specified for readlink() when bufsiz is
          zero represents historical practice. For this case, the standard
          developers considered a change whereby readlink() would return
          the number of non-null bytes contained in the symbolic link with
          the buffer buf remaining unchanged; however, since the stat
          structure member st_size value can be used to determine the size
          of buffer necessary to contain the contents of the symbolic link
          as returned by readlink(), this proposal was rejected, and the
          historical practice retained.

          The purpose of the readlinkat() function is to read the content
          of symbolic links in directories other than the current working
          directory without exposure to race conditions.  Any part of the
          path of a file could be changed in parallel to a call to
          readlink(), resulting in unspecified behavior. By opening a file
          descriptor for the target directory and using the readlinkat()
          function it can be guaranteed that the symbolic link read is
          located relative to the desired directory.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          fstatat(3p), symlink(3p)

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

   IEEE/The Open Group               2017                      READLINK(3P)

--------------

Pages that refer to this page:
`unistd.h(0p) <../man0/unistd.h.0p.html>`__, 
`fstatat(3p) <../man3/fstatat.3p.html>`__, 
`symlink(3p) <../man3/symlink.3p.html>`__

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
