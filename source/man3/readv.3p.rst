.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

readv(3p) — Linux manual page
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

   READV(3P)               POSIX Programmer's Manual              READV(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          readv — read a vector


---------------------------------------------------------

::

          #include <sys/uio.h>

          ssize_t readv(int fildes, const struct iovec *iov, int iovcnt);


---------------------------------------------------------------

::

          The readv() function shall be equivalent to read(), except as
          described below. The readv() function shall place the input data
          into the iovcnt buffers specified by the members of the iov
          array: iov[0], iov[1], ..., iov[iovcnt-1].  The iovcnt argument
          is valid if greater than 0 and less than or equal to {IOV_MAX}.

          Each iovec entry specifies the base address and length of an area
          in memory where data should be placed. The readv() function shall
          always fill an area completely before proceeding to the next.

          Upon successful completion, readv() shall mark for update the
          last data access timestamp of the file.


-----------------------------------------------------------------

::

          Refer to read(3p).


-----------------------------------------------------

::

          Refer to read(3p).

          In addition, the readv() function shall fail if:

          EINVAL The sum of the iov_len values in the iov array overflowed
                 an ssize_t.

          The readv() function may fail if:

          EINVAL The iovcnt argument was less than or equal to 0, or
                 greater than {IOV_MAX}.

          The following sections are informative.


---------------------------------------------------------

::

      Reading Data into an Array
          The following example reads data from the file associated with
          the file descriptor fd into the buffers specified by members of
          the iov array.

              #include <sys/types.h>
              #include <sys/uio.h>
              #include <unistd.h>
              ...
              ssize_t bytes_read;
              int fd;
              char buf0[20];
              char buf1[30];
              char buf2[40];
              int iovcnt;
              struct iovec iov[3];

              iov[0].iov_base = buf0;
              iov[0].iov_len = sizeof(buf0);
              iov[1].iov_base = buf1;
              iov[1].iov_len = sizeof(buf1);
              iov[2].iov_base = buf2;
              iov[2].iov_len = sizeof(buf2);
              ...
              iovcnt = sizeof(iov) / sizeof(struct iovec);

              bytes_read = readv(fd, iov, iovcnt);
              ...


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          Refer to read(3p).


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          read(3p), writev(3p)

          The Base Definitions volume of POSIX.1‐2017, sys_uio.h(0p)


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

   IEEE/The Open Group               2017                         READV(3P)

--------------

Pages that refer to this page:
`sys_uio.h(0p) <../man0/sys_uio.h.0p.html>`__, 
`read(3p) <../man3/read.3p.html>`__, 
`writev(3p) <../man3/writev.3p.html>`__

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
