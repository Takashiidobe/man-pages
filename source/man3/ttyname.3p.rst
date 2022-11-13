.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ttyname(3p) — Linux manual page
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

   TTYNAME(3P)             POSIX Programmer's Manual            TTYNAME(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          ttyname, ttyname_r — find the pathname of a terminal


---------------------------------------------------------

::

          #include <unistd.h>

          char *ttyname(int fildes);
          int ttyname_r(int fildes, char *name, size_t namesize);


---------------------------------------------------------------

::

          The ttyname() function shall return a pointer to a string
          containing a null-terminated pathname of the terminal associated
          with file descriptor fildes.  The application shall not modify
          the string returned. The returned pointer might be invalidated or
          the string content might be overwritten by a subsequent call to
          ttyname().  The returned pointer and the string content might
          also be invalidated if the calling thread is terminated.

          The ttyname() function need not be thread-safe.

          The ttyname_r() function shall store the null-terminated pathname
          of the terminal associated with the file descriptor fildes in the
          character array referenced by name.  The array is namesize
          characters long and should have space for the name and the
          terminating null character. The maximum length of the terminal
          name shall be {TTY_NAME_MAX}.


-----------------------------------------------------------------

::

          Upon successful completion, ttyname() shall return a pointer to a
          string. Otherwise, a null pointer shall be returned and errno set
          to indicate the error.

          If successful, the ttyname_r() function shall return zero.
          Otherwise, an error number shall be returned to indicate the
          error.


-----------------------------------------------------

::

          The ttyname() function may fail if:

          EBADF  The fildes argument is not a valid file descriptor.

          ENOTTY The file associated with the fildes argument is not a
                 terminal.

          The ttyname_r() function may fail if:

          EBADF  The fildes argument is not a valid file descriptor.

          ENOTTY The file associated with the fildes argument is not a
                 terminal.

          ERANGE The value of namesize is smaller than the length of the
                 string to be returned including the terminating null
                 character.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The term ``terminal'' is used instead of the historical term
          ``terminal device'' in order to avoid a reference to an undefined
          term.

          The thread-safe version places the terminal name in a user-
          supplied buffer and returns a non-zero value if it fails. The
          non-thread-safe version may return the name in a static data area
          that may be overwritten by each call.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          The Base Definitions volume of POSIX.1‐2017, unistd.h(0p)


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

   IEEE/The Open Group               2017                       TTYNAME(3P)

--------------

Pages that refer to this page:
`unistd.h(0p) <../man0/unistd.h.0p.html>`__, 
`tty(1p) <../man1/tty.1p.html>`__, 
`ctermid(3p) <../man3/ctermid.3p.html>`__, 
`ptsname(3p) <../man3/ptsname.3p.html>`__

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
