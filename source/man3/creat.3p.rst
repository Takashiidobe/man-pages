.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

creat(3p) — Linux manual page
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

   CREAT(3P)               POSIX Programmer's Manual              CREAT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          creat — create a new file or rewrite an existing one


---------------------------------------------------------

::

          #include <sys/stat.h>
          #include <fcntl.h>

          int creat(const char *path, mode_t mode);


---------------------------------------------------------------

::

          The creat() function shall behave as if it is implemented as
          follows:

              int creat(const char *path, mode_t mode)
              {
                  return open(path, O_WRONLY|O_CREAT|O_TRUNC, mode);
              }


-----------------------------------------------------------------

::

          Refer to open(3p).


-----------------------------------------------------

::

          Refer to open(3p).

          The following sections are informative.


---------------------------------------------------------

::

      Creating a File
          The following example creates the file /tmp/file with read and
          write permissions for the file owner and read permission for
          group and others. The resulting file descriptor is assigned to
          the fd variable.

              #include <fcntl.h>
              ...
              int fd;
              mode_t mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH;
              char *pathname = "/tmp/file";
              ...
              fd = creat(pathname, mode);
              ...


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The creat() function is redundant. Its services are also provided
          by the open() function. It has been included primarily for
          historical purposes since many existing applications depend on
          it. It is best considered a part of the C binding rather than a
          function that should be provided in other languages.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          mknod(3p), open(3p)

          The Base Definitions volume of POSIX.1‐2017, fcntl.h(0p),
          sys_stat.h(0p), sys_types.h(0p)


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

   IEEE/The Open Group               2017                         CREAT(3P)

--------------

Pages that refer to this page:
`fcntl.h(0p) <../man0/fcntl.h.0p.html>`__, 
`pax(1p) <../man1/pax.1p.html>`__, 
`touch(1p) <../man1/touch.1p.html>`__, 
`fchmod(3p) <../man3/fchmod.3p.html>`__, 
`fopen(3p) <../man3/fopen.3p.html>`__, 
`fstatvfs(3p) <../man3/fstatvfs.3p.html>`__, 
`lockf(3p) <../man3/lockf.3p.html>`__, 
`mknod(3p) <../man3/mknod.3p.html>`__, 
`open(3p) <../man3/open.3p.html>`__, 
`posix_fallocate(3p) <../man3/posix_fallocate.3p.html>`__, 
`umask(3p) <../man3/umask.3p.html>`__, 
`write(3p) <../man3/write.3p.html>`__

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
