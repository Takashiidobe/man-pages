.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

aio_suspend(3p) — Linux manual page
===================================

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

   AIO_SUSPEND(3P)         POSIX Programmer's Manual        AIO_SUSPEND(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          aio_suspend — wait for an asynchronous I/O request


---------------------------------------------------------

::

          #include <aio.h>

          int aio_suspend(const struct aiocb *const list[], int nent,
              const struct timespec *timeout);


---------------------------------------------------------------

::

          The aio_suspend() function shall suspend the calling thread until
          at least one of the asynchronous I/O operations referenced by the
          list argument has completed, until a signal interrupts the
          function, or, if timeout is not NULL, until the time interval
          specified by timeout has passed. If any of the aiocb structures
          in the list correspond to completed asynchronous I/O operations
          (that is, the error status for the operation is not equal to
          [EINPROGRESS]) at the time of the call, the function shall return
          without suspending the calling thread. The list argument is an
          array of pointers to asynchronous I/O control blocks.  The nent
          argument indicates the number of elements in the array. Each
          aiocb structure pointed to has been used in initiating an
          asynchronous I/O request via aio_read(), aio_write(), or
          lio_listio().  This array may contain null pointers, which are
          ignored. If this array contains pointers that refer to aiocb
          structures that have not been used in submitting asynchronous
          I/O, the effect is undefined.

          If the time interval indicated in the timespec structure pointed
          to by timeout passes before any of the I/O operations referenced
          by list are completed, then aio_suspend() shall return with an
          error.  If the Monotonic Clock option is supported, the clock
          that shall be used to measure this time interval shall be the
          CLOCK_MONOTONIC clock.


-----------------------------------------------------------------

::

          If the aio_suspend() function returns after one or more
          asynchronous I/O operations have completed, the function shall
          return zero. Otherwise, the function shall return a value of -1
          and set errno to indicate the error.

          The application may determine which asynchronous I/O completed by
          scanning the associated error and return status using aio_error()
          and aio_return(), respectively.


-----------------------------------------------------

::

          The aio_suspend() function shall fail if:

          EAGAIN No asynchronous I/O indicated in the list referenced by
                 list completed in the time interval indicated by timeout.

          EINTR  A signal interrupted the aio_suspend() function. Note
                 that, since each asynchronous I/O operation may possibly
                 provoke a signal when it completes, this error return may
                 be caused by the completion of one (or more) of the very
                 I/O operations being awaited.

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

          aio_read(3p), aio_write(3p), lio_listio(3p)

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

   IEEE/The Open Group               2017                   AIO_SUSPEND(3P)

--------------

Pages that refer to this page: `aio.h(0p) <../man0/aio.h.0p.html>`__

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
