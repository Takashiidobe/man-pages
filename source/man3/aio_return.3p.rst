.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

aio_return(3p) — Linux manual page
==================================

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

   AIO_RETURN(3P)          POSIX Programmer's Manual         AIO_RETURN(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          aio_return — retrieve return status of an asynchronous I/O
          operation


---------------------------------------------------------

::

          #include <aio.h>

          ssize_t aio_return(struct aiocb *aiocbp);


---------------------------------------------------------------

::

          The aio_return() function shall return the return status
          associated with the aiocb structure referenced by the aiocbp
          argument. The return status for an asynchronous I/O operation is
          the value that would be returned by the corresponding read(),
          write(), or fsync() function call. If the error status for the
          operation is equal to [EINPROGRESS], then the return status for
          the operation is undefined. The aio_return() function may be
          called exactly once to retrieve the return status of a given
          asynchronous operation; thereafter, if the same aiocb structure
          is used in a call to aio_return() or aio_error(), an error may be
          returned. When the aiocb structure referred to by aiocbp is used
          to submit another asynchronous operation, then aio_return() may
          be successfully used to retrieve the return status of that
          operation.


-----------------------------------------------------------------

::

          If the asynchronous I/O operation has completed, then the return
          status, as described for read(), write(), and fsync(), shall be
          returned. If the asynchronous I/O operation has not yet
          completed, the results of aio_return() are undefined.

          If the aio_return() function fails, it shall return -1 and set
          errno to indicate the error.


-----------------------------------------------------

::

          The aio_return() function may fail if:

          EINVAL The aiocbp argument does not refer to an asynchronous
                 operation whose return status has not yet been retrieved.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          aio_cancel(3p), aio_error(3p), aio_fsync(3p), aio_read(3p),
          aio_write(3p), close(3p), exec(1p), exit(3p), fork(3p),
          lio_listio(3p), lseek(3p), read(3p)

          The Base Definitions volume of POSIX.1‐2017, aio.h(0p)


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

   IEEE/The Open Group               2017                    AIO_RETURN(3P)

--------------

Pages that refer to this page: `aio.h(0p) <../man0/aio.h.0p.html>`__, 
`aio_error(3p) <../man3/aio_error.3p.html>`__, 
`aio_fsync(3p) <../man3/aio_fsync.3p.html>`__, 
`aio_read(3p) <../man3/aio_read.3p.html>`__, 
`aio_write(3p) <../man3/aio_write.3p.html>`__, 
`lio_listio(3p) <../man3/lio_listio.3p.html>`__

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
