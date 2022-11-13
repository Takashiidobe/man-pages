.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

aio.h(0p) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
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

   aio.h(0P)               POSIX Programmer's Manual              aio.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          aio.h — asynchronous input and output


---------------------------------------------------------

::

          #include <aio.h>


---------------------------------------------------------------

::

          The <aio.h> header shall define the aiocb structure, which shall
          include at least the following members:

              int             aio_fildes     File descriptor.
              off_t           aio_offset     File offset.
              volatile void  *aio_buf        Location of buffer.
              size_t          aio_nbytes     Length of transfer.
              int             aio_reqprio    Request priority offset.
              struct sigevent aio_sigevent   Signal number and value.
              int             aio_lio_opcode Operation to be performed.

          The <aio.h> header shall define the off_t, pthread_attr_t,
          size_t, and ssize_t types as described in <sys/types.h>.

          The <aio.h> header shall define the struct timespec structure as
          described in <time.h>.

          The <aio.h> header shall define the sigevent structure and sigval
          union as described in signal.h(0p).

          The <aio.h> header shall define the following symbolic constants:

          AIO_ALLDONE   A return value indicating that none of the
                        requested operations could be canceled since they
                        are already complete.

          AIO_CANCELED  A return value indicating that all requested
                        operations have been canceled.

          AIO_NOTCANCELED
                        A return value indicating that some of the
                        requested operations could not be canceled since
                        they are in progress.

          LIO_NOP       A lio_listio() element operation option indicating
                        that no transfer is requested.

          LIO_NOWAIT    A lio_listio() synchronization operation indicating
                        that the calling thread is to continue execution
                        while the lio_listio() operation is being
                        performed, and no notification is given when the
                        operation is complete.

          LIO_READ      A lio_listio() element operation option requesting
                        a read.

          LIO_WAIT      A lio_listio() synchronization operation indicating
                        that the calling thread is to suspend until the
                        lio_listio() operation is complete.

          LIO_WRITE     A lio_listio() element operation option requesting
                        a write.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided.

              int      aio_cancel(int, struct aiocb *);
              int      aio_error(const struct aiocb *);
              int      aio_fsync(int, struct aiocb *);
              int      aio_read(struct aiocb *);
              ssize_t  aio_return(struct aiocb *);
              int      aio_suspend(const struct aiocb *const [], int,
                           const struct timespec *);
              int      aio_write(struct aiocb *);
              int      lio_listio(int, struct aiocb *restrict const [restrict], int,
                           struct sigevent *restrict);

          Inclusion of the <aio.h> header may make visible symbols defined
          in the headers <fcntl.h>, <signal.h>, and <time.h>.

          The following sections are informative.


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

          fcntl.h(0p), signal.h(0p), sys_types.h(0p), time.h(0p)

          The System Interfaces volume of POSIX.1‐2017, aio_cancel(3p),
          aio_error(3p), aio_fsync(3p), aio_read(3p), aio_return(3p),
          aio_suspend(3p), aio_write(3p), fsync(3p), lio_listio(3p),
          lseek(3p), read(3p), write(3p)


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

   IEEE/The Open Group               2017                         aio.h(0P)

--------------

Pages that refer to this page:
`aio_cancel(3p) <../man3/aio_cancel.3p.html>`__, 
`aio_error(3p) <../man3/aio_error.3p.html>`__, 
`aio_fsync(3p) <../man3/aio_fsync.3p.html>`__, 
`aio_read(3p) <../man3/aio_read.3p.html>`__, 
`aio_return(3p) <../man3/aio_return.3p.html>`__, 
`aio_suspend(3p) <../man3/aio_suspend.3p.html>`__, 
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
