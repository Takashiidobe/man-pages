.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dirname(3p) — Linux manual page
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

   DIRNAME(3P)             POSIX Programmer's Manual            DIRNAME(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          dirname — report the parent directory name of a file pathname


---------------------------------------------------------

::

          #include <libgen.h>

          char *dirname(char *path);


---------------------------------------------------------------

::

          The dirname() function shall take a pointer to a character string
          that contains a pathname, and return a pointer to a string that
          is a pathname of the parent directory of that file. The dirname()
          function shall not perform pathname resolution; the result shall
          not be affected by whether or not path exists or by its file
          type. Trailing '/' characters in the path that are not also
          leading '/' characters shall not be counted as part of the path.

          If path does not contain a '/', then dirname() shall return a
          pointer to the string ".".  If path is a null pointer or points
          to an empty string, dirname() shall return a pointer to the
          string ".".

          The dirname() function may modify the string pointed to by path,
          and may return a pointer to static storage that may then be
          overwritten by a subsequent call to dirname().

          The dirname() function need not be thread-safe.


-----------------------------------------------------------------

::

          The dirname() function shall return a pointer to a string as
          described above.

          The dirname() function may modify the string pointed to by path,
          and may return a pointer to internal storage. The returned
          pointer might be invalidated or the storage might be overwritten
          by a subsequent call to dirname().  The returned pointer might
          also be invalidated if the calling thread is terminated.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          The following code fragment reads a pathname, changes the current
          working directory to the parent directory, and opens the file.

              char *path = NULL, *pathcopy;
              size_t buflen = 0;
              ssize_t linelen = 0;
              int fd;

              linelen = getline(&path, &buflen, stdin);

              path[linelen-1] = 0;
              pathcopy = strdup(path);
              if (chdir(dirname(pathcopy)) < 0) {
                  ...
              }
              if ((fd = open(basename(path), O_RDONLY)) >= 0) {
                  ...
                  close (fd);
              }
              ...
              free (pathcopy);
              free (path);

          The EXAMPLES section of the basename() function (see
          basename(3p)) includes a table showing examples of the results of
          processing several sample pathnames by the basename() and
          dirname() functions and by the basename and dirname utilities.


---------------------------------------------------------------------------

::

          The dirname() and basename() functions together yield a complete
          pathname. The expression dirname(path) obtains the pathname of
          the directory where basename(path) is found.

          Since the meaning of the leading "//" is implementation-defined,
          dirname("//foo) may return either "//" or '/' (but nothing else).


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          basename(3p)

          The Base Definitions volume of POSIX.1‐2017, libgen.h(0p)

          The Shell and Utilities volume of POSIX.1‐2017, basename(1p),
          dirname(1p)


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

   IEEE/The Open Group               2017                       DIRNAME(3P)

--------------

Pages that refer to this page:
`libgen.h(0p) <../man0/libgen.h.0p.html>`__, 
`basename(1p) <../man1/basename.1p.html>`__, 
`dirname(1p) <../man1/dirname.1p.html>`__, 
`basename(3p) <../man3/basename.3p.html>`__

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
