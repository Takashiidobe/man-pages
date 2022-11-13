.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

realpath(3p) — Linux manual page
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

   REALPATH(3P)            POSIX Programmer's Manual           REALPATH(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          realpath — resolve a pathname


---------------------------------------------------------

::

          #include <stdlib.h>

          char *realpath(const char *restrict file_name,
              char *restrict resolved_name);


---------------------------------------------------------------

::

          The realpath() function shall derive, from the pathname pointed
          to by file_name, an absolute pathname that resolves to the same
          directory entry, whose resolution does not involve '.', '..', or
          symbolic links. If resolved_name is a null pointer, the generated
          pathname shall be stored as a null-terminated string in a buffer
          allocated as if by a call to malloc().  Otherwise, if {PATH_MAX}
          is defined as a constant in the <limits.h> header, then the
          generated pathname shall be stored as a null-terminated string,
          up to a maximum of {PATH_MAX} bytes, in the buffer pointed to by
          resolved_name.

          If resolved_name is not a null pointer and {PATH_MAX} is not
          defined as a constant in the <limits.h> header, the behavior is
          undefined.


-----------------------------------------------------------------

::

          Upon successful completion, realpath() shall return a pointer to
          the buffer containing the resolved name.  Otherwise, realpath()
          shall return a null pointer and set errno to indicate the error.

          If the resolved_name argument is a null pointer, the pointer
          returned by realpath() can be passed to free().

          If the resolved_name argument is not a null pointer and the
          realpath() function fails, the contents of the buffer pointed to
          by resolved_name are undefined.


-----------------------------------------------------

::

          The realpath() function shall fail if:

          EACCES Search permission was denied for a component of the path
                 prefix of file_name.

          EINVAL The file_name argument is a null pointer.

          EIO    An error occurred while reading from the file system.

          ELOOP  A loop exists in symbolic links encountered during
                 resolution of the file_name argument.

          ENAMETOOLONG
                 The length of a component of a pathname is longer than
                 {NAME_MAX}.

          ENOENT A component of file_name does not name an existing file or
                 file_name points to an empty string.

          ENOTDIR
                 A component of the path prefix names an existing file that
                 is neither a directory nor a symbolic link to a directory,
                 or the file_name argument contains at least one
                 non-<slash> character and ends with one or more trailing
                 <slash> characters and the last pathname component names
                 an existing file that is neither a directory nor a
                 symbolic link to a directory.

          The realpath() function may fail if:

          EACCES The file_name argument does not begin with a <slash> and
                 none of the symbolic links (if any) processed during
                 pathname resolution of file_name had contents that began
                 with a <slash>, and either search permission was denied
                 for the current directory or read or search permission was
                 denied for a directory above the current directory in the
                 file hierarchy.

          ELOOP  More than {SYMLOOP_MAX} symbolic links were encountered
                 during resolution of the file_name argument.

          ENAMETOOLONG
                 The length of a pathname exceeds {PATH_MAX}, or pathname
                 resolution of a symbolic link produced an intermediate
                 result with a length that exceeds {PATH_MAX}.

          ENOMEM Insufficient storage space is available.

          The following sections are informative.


---------------------------------------------------------

::

      Generating an Absolute Pathname
          The following example generates an absolute pathname for the file
          identified by the symlinkpath argument. The generated pathname is
          stored in the buffer pointed to by actualpath.

              #include <stdlib.h>
              ...
              char *symlinkpath = "/tmp/symlink/file";
              char *actualpath;

              actualpath = realpath(symlinkpath, NULL);
              if (actualpath != NULL)
              {
                  ... use actualpath ...

                  free(actualpath);
              }
              else
              {
                  ... handle error ...
              }


---------------------------------------------------------------------------

::

          For functions that allocate memory as if by malloc(), the
          application should release such memory when it is no longer
          required by a call to free().  For realpath(), this is the return
          value.


-----------------------------------------------------------

::

          Since realpath() has no length argument, if {PATH_MAX} is not
          defined as a constant in <limits.h>, applications have no way of
          determining how large a buffer they need to allocate for it to be
          safe to pass to realpath().  A {PATH_MAX} value obtained from a
          prior pathconf() call is out-of-date by the time realpath() is
          called. Hence the only reliable way to use realpath() when
          {PATH_MAX} is not defined in <limits.h> is to pass a null pointer
          for resolved_name so that realpath() will allocate a buffer of
          the necessary size.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          fpathconf(3p), free(3p), getcwd(3p), sysconf(3p)

          The Base Definitions volume of POSIX.1‐2017, limits.h(0p),
          stdlib.h(0p)


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

   IEEE/The Open Group               2017                      REALPATH(3P)

--------------

Pages that refer to this page:
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__

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
