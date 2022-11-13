.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ftw(3p) — Linux manual page
===========================

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

   FTW(3P)                 POSIX Programmer's Manual                FTW(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          ftw — traverse (walk) a file tree


---------------------------------------------------------

::

          #include <ftw.h>

          int ftw(const char *path, int (*fn)(const char *,
              const struct stat *ptr, int flag), int ndirs);


---------------------------------------------------------------

::

          The ftw() function shall recursively descend the directory
          hierarchy rooted in path.  For each object in the hierarchy,
          ftw() shall call the function pointed to by fn, passing it a
          pointer to a null-terminated character string containing the name
          of the object, a pointer to a stat structure containing
          information about the object, filled in as if stat() or lstat()
          had been called to retrieve the information. Possible values of
          the integer, defined in the <ftw.h> header, are:

          FTW_D     For a directory.

          FTW_DNR   For a directory that cannot be read.

          FTW_F     For a non-directory file.

          FTW_SL    For a symbolic link (but see also FTW_NS below).

          FTW_NS    For an object other than a symbolic link on which
                    stat() could not successfully be executed. If the
                    object is a symbolic link and stat() failed, it is
                    unspecified whether ftw() passes FTW_SL or FTW_NS to
                    the user-supplied function.

          If the integer is FTW_DNR, descendants of that directory shall
          not be processed. If the integer is FTW_NS, the stat structure
          contains undefined values. An example of an object that would
          cause FTW_NS to be passed to the function pointed to by fn would
          be a file in a directory with read but without execute (search)
          permission.

          The ftw() function shall visit a directory before visiting any of
          its descendants.

          The ftw() function shall use at most one file descriptor for each
          level in the tree.

          The argument ndirs should be in the range [1,{OPEN_MAX}].

          The tree traversal shall continue until either the tree is
          exhausted, an invocation of fn returns a non-zero value, or some
          error, other than [EACCES], is detected within ftw().

          The ndirs argument shall specify the maximum number of directory
          streams or file descriptors or both available for use by ftw()
          while traversing the tree. When ftw() returns it shall close any
          directory streams and file descriptors it uses not counting any
          opened by the application-supplied fn function.

          The results are unspecified if the application-supplied fn
          function does not preserve the current working directory.

          The ftw() function need not be thread-safe.


-----------------------------------------------------------------

::

          If the tree is exhausted, ftw() shall return 0. If the function
          pointed to by fn returns a non-zero value, ftw() shall stop its
          tree traversal and return whatever value was returned by the
          function pointed to by fn.  If ftw() detects an error, it shall
          return -1 and set errno to indicate the error.

          If ftw() encounters an error other than [EACCES] (see FTW_DNR and
          FTW_NS above), it shall return -1 and set errno to indicate the
          error. The external variable errno may contain any error value
          that is possible when a directory is opened or when one of the
          stat functions is executed on a directory or file.


-----------------------------------------------------

::

          The ftw() function shall fail if:

          EACCES Search permission is denied for any component of path or
                 read permission is denied for path.

          ELOOP  A loop exists in symbolic links encountered during
                 resolution of the path argument.

          ENAMETOOLONG
                 The length of a component of a pathname is longer than
                 {NAME_MAX}.

          ENOENT A component of path does not name an existing file or path
                 is an empty string.

          ENOTDIR
                 A component of path names an existing file that is neither
                 a directory nor a symbolic link to a directory.

          EOVERFLOW
                 A field in the stat structure cannot be represented
                 correctly in the current programming environment for one
                 or more files found in the file hierarchy.

          The ftw() function may fail if:

          EINVAL The value of the ndirs argument is invalid.

          ELOOP  More than {SYMLOOP_MAX} symbolic links were encountered
                 during resolution of the path argument.

          ENAMETOOLONG
                 The length of a pathname exceeds {PATH_MAX}, or pathname
                 resolution of a symbolic link produced an intermediate
                 result with a length that exceeds {PATH_MAX}.

          In addition, if the function pointed to by fn encounters system
          errors, errno may be set accordingly.

          The following sections are informative.


---------------------------------------------------------

::

      Walking a Directory Structure
          The following example walks the current directory structure,
          calling the fn function for every directory entry, using at most
          10 file descriptors:

              #include <ftw.h>
              ...
              if (ftw(".", fn, 10) != 0) {
                  perror("ftw"); exit(2);
              }


---------------------------------------------------------------------------

::

          The ftw() function may allocate dynamic storage during its
          operation. If ftw() is forcibly terminated, such as by longjmp()
          or siglongjmp() being executed by the function pointed to by fn
          or an interrupt routine, ftw() does not have a chance to free
          that storage, so it remains permanently allocated. A safe way to
          handle interrupts is to store the fact that an interrupt has
          occurred, and arrange to have the function pointed to by fn
          return a non-zero value at its next invocation.

          Applications should use the nftw() function instead of the
          obsolescent ftw() function.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The ftw() function may be removed in a future version.


---------------------------------------------------------

::

          fdopendir(3p), fstatat(3p), longjmp(3p), nftw(3p), siglongjmp(3p)

          The Base Definitions volume of POSIX.1‐2017, ftw.h(0p),
          sys_stat.h(0p)


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

   IEEE/The Open Group               2017                           FTW(3P)

--------------

Pages that refer to this page: `ftw.h(0p) <../man0/ftw.h.0p.html>`__

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
