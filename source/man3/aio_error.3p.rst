.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

aio_error(3p) — Linux manual page
=================================

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

   AIO_ERROR(3P)           POSIX Programmer's Manual          AIO_ERROR(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          aio_error — retrieve errors status for an asynchronous I/O
          operation


---------------------------------------------------------

::

          #include <aio.h>

          int aio_error(const struct aiocb *aiocbp);


---------------------------------------------------------------

::

          The aio_error() function shall return the error status associated
          with the aiocb structure referenced by the aiocbp argument. The
          error status for an asynchronous I/O operation is the errno value
          that would be set by the corresponding read(), write(),
          fdatasync(), or fsync() operation. If the operation has not yet
          completed, then the error status shall be equal to [EINPROGRESS].

          If the aiocb structure pointed to by aiocbp is not associated
          with an operation that has been scheduled, the results are
          undefined.


-----------------------------------------------------------------

::

          If the asynchronous I/O operation has completed successfully,
          then 0 shall be returned. If the asynchronous operation has
          completed unsuccessfully, then the error status, as described for
          read(), write(), fdatasync(), and fsync(), shall be returned. If
          the asynchronous I/O operation has not yet completed, then
          [EINPROGRESS] shall be returned.

          If the aio_error() function fails, it shall return -1 and set
          errno to indicate the error.


-----------------------------------------------------

::

          The aio_error() function may fail if:

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

          aio_cancel(3p), aio_fsync(3p), aio_read(3p), aio_return(3p),
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

   IEEE/The Open Group               2017                     AIO_ERROR(3P)

--------------

Pages that refer to this page: `aio.h(0p) <../man0/aio.h.0p.html>`__, 
`aio_fsync(3p) <../man3/aio_fsync.3p.html>`__, 
`aio_read(3p) <../man3/aio_read.3p.html>`__, 
`aio_return(3p) <../man3/aio_return.3p.html>`__, 
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
