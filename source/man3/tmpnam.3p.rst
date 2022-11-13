.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tmpnam(3p) — Linux manual page
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

   TMPNAM(3P)              POSIX Programmer's Manual             TMPNAM(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          tmpnam — create a name for a temporary file


---------------------------------------------------------

::

          #include <stdio.h>

          char *tmpnam(char *s);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The tmpnam() function shall generate a string that is a valid
          pathname that does not name an existing file. The function is
          potentially capable of generating {TMP_MAX} different strings,
          but any or all of them may already be in use by existing files
          and thus not be suitable return values.

          The tmpnam() function generates a different string each time it
          is called from the same process, up to {TMP_MAX} times. If it is
          called more than {TMP_MAX} times, the behavior is implementation-
          defined.

          The implementation shall behave as if no function defined in this
          volume of POSIX.1‐2017, except tempnam(), calls tmpnam().

          The tmpnam() function need not be thread-safe if called with a
          NULL parameter.


-----------------------------------------------------------------

::

          Upon successful completion, tmpnam() shall return a pointer to a
          string. If no suitable string can be generated, the tmpnam()
          function shall return a null pointer.

          If the argument s is a null pointer, tmpnam() shall leave its
          result in an internal static object and return a pointer to that
          object. Subsequent calls to tmpnam() may modify the same object.
          If the argument s is not a null pointer, it is presumed to point
          to an array of at least L_tmpnam chars; tmpnam() shall write its
          result in that array and shall return the argument as its value.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

      Generating a Pathname
          The following example generates a unique pathname and stores it
          in the array pointed to by ptr.

              #include <stdio.h>
              ...
              char pathname[L_tmpnam+1];
              char *ptr;

              ptr = tmpnam(pathname);


---------------------------------------------------------------------------

::

          This function only creates pathnames. It is the application's
          responsibility to create and remove the files.

          Between the time a pathname is created and the file is opened, it
          is possible for some other process to create a file with the same
          name.  Applications may find tmpfile() more useful.

          Applications should use the tmpfile(), mkstemp(), or mkdtemp()
          functions instead of the obsolescent tmpnam() function.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The tmpnam() function may be removed in a future version.


---------------------------------------------------------

::

          fopen(3p), open(3p), mkdtemp(3p), tempnam(3p), tmpfile(3p),
          unlink(3p)

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

   IEEE/The Open Group               2017                        TMPNAM(3P)

--------------

Pages that refer to this page:
`stdio.h(0p) <../man0/stdio.h.0p.html>`__, 
`mkdtemp(3p) <../man3/mkdtemp.3p.html>`__, 
`tempnam(3p) <../man3/tempnam.3p.html>`__, 
`tmpfile(3p) <../man3/tmpfile.3p.html>`__

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
