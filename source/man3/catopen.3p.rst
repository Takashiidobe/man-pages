.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

catopen(3p) — Linux manual page
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

   CATOPEN(3P)             POSIX Programmer's Manual            CATOPEN(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          catopen — open a message catalog


---------------------------------------------------------

::

          #include <nl_types.h>

          nl_catd catopen(const char *name, int oflag);


---------------------------------------------------------------

::

          The catopen() function shall open a message catalog and return a
          message catalog descriptor. The name argument specifies the name
          of the message catalog to be opened. If name contains a '/', then
          name specifies a pathname for the message catalog. Otherwise, the
          environment variable NLSPATH is used with name substituted for
          the %N conversion specification (see the Base Definitions volume
          of POSIX.1‐2017, Chapter 8, Environment Variables); if NLSPATH
          exists in the environment when the process starts, then if the
          process has appropriate privileges, the behavior of catopen() is
          undefined. If NLSPATH does not exist in the environment, or if a
          message catalog cannot be found in any of the components
          specified by NLSPATH, then an implementation-defined default path
          shall be used. This default may be affected by the setting of
          LC_MESSAGES if the value of oflag is NL_CAT_LOCALE, or the LANG
          environment variable if oflag is 0.

          A message catalog descriptor shall remain valid in a process
          until that process closes it, or a successful call to one of the
          exec functions. A change in the setting of the LC_MESSAGES
          category may invalidate existing open catalogs.

          If a file descriptor is used to implement message catalog
          descriptors, the FD_CLOEXEC flag shall be set; see <fcntl.h>.

          If the value of the oflag argument is 0, the LANG environment
          variable is used to locate the catalog without regard to the
          LC_MESSAGES category. If the oflag argument is NL_CAT_LOCALE, the
          LC_MESSAGES category is used to locate the message catalog (see
          the Base Definitions volume of POSIX.1‐2017, Section 8.2,
          Internationalization Variables).


-----------------------------------------------------------------

::

          Upon successful completion, catopen() shall return a message
          catalog descriptor for use on subsequent calls to catgets() and
          catclose().  Otherwise, catopen() shall return (nl_catd) -1 and
          set errno to indicate the error.


-----------------------------------------------------

::

          The catopen() function may fail if:

          EACCES Search permission is denied for the component of the path
                 prefix of the message catalog or read permission is denied
                 for the message catalog.

          EMFILE All file descriptors available to the process are
                 currently open.

          ENAMETOOLONG
                 The length of a component of a pathname is longer than
                 {NAME_MAX}.

          ENAMETOOLONG
                 The length of a pathname exceeds {PATH_MAX}, or pathname
                 resolution of a symbolic link produced an intermediate
                 result with a length that exceeds {PATH_MAX}.

          ENFILE Too many files are currently open in the system.

          ENOENT The message catalog does not exist or the name argument
                 points to an empty string.

          ENOMEM Insufficient storage space is available.

          ENOTDIR
                 A component of the path prefix of the message catalog
                 names an existing file that is neither a directory nor a
                 symbolic link to a directory, or the pathname of the
                 message catalog contains at least one non-<slash>
                 character and ends with one or more trailing <slash>
                 characters and the last pathname component names an
                 existing file that is neither a directory nor a symbolic
                 link to a directory.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          Some implementations of catopen() use malloc() to allocate space
          for internal buffer areas. The catopen() function may fail if
          there is insufficient storage space available to accommodate
          these buffers.

          Conforming applications must assume that message catalog
          descriptors are not valid after a call to one of the exec
          functions.

          Application developers should be aware that guidelines for the
          location of message catalogs have not yet been developed.
          Therefore they should take care to avoid conflicting with
          catalogs used by other applications and the standard utilities.

          To be sure that messages produced by an application running with
          appropriate privileges cannot be used by an attacker setting an
          unexpected value for NLSPATH in the environment to confuse a
          system administrator, such applications should use pathnames
          containing a '/' to get defined behavior when using catopen() to
          open a message catalog.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          catclose(3p), catgets(3p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 8,
          Environment Variables, fcntl.h(0p), nl_types.h(0p),


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

   IEEE/The Open Group               2017                       CATOPEN(3P)

--------------

Pages that refer to this page:
`nl_types.h(0p) <../man0/nl_types.h.0p.html>`__, 
`catclose(3p) <../man3/catclose.3p.html>`__, 
`catgets(3p) <../man3/catgets.3p.html>`__, 
`setlocale(3p) <../man3/setlocale.3p.html>`__

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
