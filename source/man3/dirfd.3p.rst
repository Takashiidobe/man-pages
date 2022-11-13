.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dirfd(3p) — Linux manual page
=============================

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

   DIRFD(3P)               POSIX Programmer's Manual              DIRFD(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          dirfd — extract the file descriptor used by a DIR stream


---------------------------------------------------------

::

          #include <dirent.h>

          int dirfd(DIR *dirp);


---------------------------------------------------------------

::

          The dirfd() function shall return a file descriptor referring to
          the same directory as the dirp argument. This file descriptor
          shall be closed by a call to closedir().  If any attempt is made
          to close the file descriptor, or to modify the state of the
          associated description, other than by means of closedir(),
          readdir(), readdir_r(), rewinddir(), or seekdir(), the behavior
          is undefined.


-----------------------------------------------------------------

::

          Upon successful completion, the dirfd() function shall return an
          integer which contains a file descriptor for the stream pointed
          to by dirp.  Otherwise, it shall return -1 and shall set errno to
          indicate the error.


-----------------------------------------------------

::

          The dirfd() function may fail if:

          EINVAL The dirp argument does not refer to a valid directory
                 stream.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The dirfd() function is intended to be a mechanism by which an
          application may obtain a file descriptor to use for the fchdir()
          function.


-----------------------------------------------------------

::

          This interface was introduced because the Base Definitions volume
          of POSIX.1‐2017 does not make public the DIR data structure.
          Applications tend to use the fchdir() function on the file
          descriptor returned by this interface, and this has proven useful
          for security reasons; in particular, it is a better technique
          than others where directory names might change.

          The description uses the term ``a file descriptor'' rather than
          ``the file descriptor''. The implication intended is that an
          implementation that does not use an fd for opendir() could still
          open() the directory to implement the dirfd() function. Such a
          descriptor must be closed later during a call to closedir().

          If it is necessary to allocate an fd to be returned by dirfd(),
          it should be done at the time of a call to opendir().


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          closedir(3p), fchdir(3p), fdopendir(3p), fileno(3p), open(3p),
          readdir(3p)

          The Base Definitions volume of POSIX.1‐2017, dirent.h(0p)


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

   IEEE/The Open Group               2017                         DIRFD(3P)

--------------

Pages that refer to this page:
`dirent.h(0p) <../man0/dirent.h.0p.html>`__, 
`closedir(3p) <../man3/closedir.3p.html>`__, 
`fchdir(3p) <../man3/fchdir.3p.html>`__, 
`fdopendir(3p) <../man3/fdopendir.3p.html>`__, 
`fileno(3p) <../man3/fileno.3p.html>`__, 
`open(3p) <../man3/open.3p.html>`__, 
`readdir(3p) <../man3/readdir.3p.html>`__

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
