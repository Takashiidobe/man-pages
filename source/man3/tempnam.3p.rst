.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tempnam(3p) — Linux manual page
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

   TEMPNAM(3P)             POSIX Programmer's Manual            TEMPNAM(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          tempnam — create a name for a temporary file


---------------------------------------------------------

::

          #include <stdio.h>

          char *tempnam(const char *dir, const char *pfx);


---------------------------------------------------------------

::

          The tempnam() function shall generate a pathname that may be used
          for a temporary file.

          The tempnam() function allows the user to control the choice of a
          directory. The dir argument points to the name of the directory
          in which the file is to be created. If dir is a null pointer or
          points to a string which is not a name for an appropriate
          directory, the path prefix defined as P_tmpdir in the <stdio.h>
          header shall be used. If that directory is not accessible, an
          implementation-defined directory may be used.

          Many applications prefer their temporary files to have certain
          initial letter sequences in their names. The pfx argument should
          be used for this. This argument may be a null pointer or point to
          a string of up to five bytes to be used as the beginning of the
          filename.

          Some implementations of tempnam() may use tmpnam() internally. On
          such implementations, if called more than {TMP_MAX} times in a
          single process, the behavior is implementation-defined.


-----------------------------------------------------------------

::

          Upon successful completion, tempnam() shall allocate space for a
          string, put the generated pathname in that space, and return a
          pointer to it. The pointer shall be suitable for use in a
          subsequent call to free().  Otherwise, it shall return a null
          pointer and set errno to indicate the error.


-----------------------------------------------------

::

          The tempnam() function shall fail if:

          ENOMEM Insufficient storage space is available.

          The following sections are informative.


---------------------------------------------------------

::

      Generating a Pathname
          The following example generates a pathname for a temporary file
          in directory /tmp, with the prefix file.  After the pathname has
          been created, the call to free() deallocates the space used to
          store the pathname.

              #include <stdio.h>
              #include <stdlib.h>
              ...
              const char *directory = "/tmp";
              const char *fileprefix = "file";
              char *file;

              file = tempnam(directory, fileprefix);
              free(file);


---------------------------------------------------------------------------

::

          This function only creates pathnames. It is the application's
          responsibility to create and remove the files. Between the time a
          pathname is created and the file is opened, it is possible for
          some other process to create a file with the same name.
          Applications may find tmpfile() more useful.

          Applications should use the tmpfile(), mkdtemp(), or mkstemp()
          functions instead of the obsolescent tempnam() function.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The tempnam() function may be removed in a future version.


---------------------------------------------------------

::

          fopen(3p), free(3p), mkdtemp(3p), open(3p), tmpfile(3p),
          tmpnam(3p), unlink(3p)

          The Base Definitions volume of POSIX.1‐2017, stdio.h(0p)


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

   IEEE/The Open Group               2017                       TEMPNAM(3P)

--------------

Pages that refer to this page:
`stdio.h(0p) <../man0/stdio.h.0p.html>`__, 
`tmpnam(3p) <../man3/tmpnam.3p.html>`__

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
