.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

aio_suspend(3) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   AIO_SUSPEND(3)          Linux Programmer's Manual         AIO_SUSPEND(3)

NAME
-------------------------------------------------

::

          aio_suspend - wait for asynchronous I/O operation or timeout


---------------------------------------------------------

::

          #include <aio.h>

          int aio_suspend(const struct aiocb *const aiocb_list[], int nitems,
                          const struct timespec *restrict timeout);

          Link with -lrt.


---------------------------------------------------------------

::

          The aio_suspend() function suspends the calling thread until one
          of the following occurs:

          *  One or more of the asynchronous I/O requests in the list
             aiocb_list has completed.

          *  A signal is delivered.

          *  timeout is not NULL and the specified time interval has
             passed.  (For details of the timespec structure, see
             nanosleep(2).)

          The nitems argument specifies the number of items in aiocb_list.
          Each item in the list pointed to by aiocb_list must be either
          NULL (and then is ignored), or a pointer to a control block on
          which I/O was initiated using aio_read(3), aio_write(3), or
          lio_listio(3).  (See aio(7) for a description of the aiocb
          structure.)

          If CLOCK_MONOTONIC is supported, this clock is used to measure
          the timeout interval (see clock_gettime(2)).


-----------------------------------------------------------------

::

          If this function returns after completion of one of the I/O
          requests specified in aiocb_list, 0 is returned.  Otherwise, -1
          is returned, and errno is set to indicate the error.


-----------------------------------------------------

::

          EAGAIN The call timed out before any of the indicated operations
                 had completed.

          EINTR  The call was ended by signal (possibly the completion
                 signal of one of the operations we were waiting for); see
                 signal(7).

          ENOSYS aio_suspend() is not implemented.


---------------------------------------------------------

::

          The aio_suspend() function is available since glibc 2.1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │aio_suspend()                         │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.

          POSIX doesn't specify the parameters to be restrict; that is
          specific to glibc.


---------------------------------------------------

::

          One can achieve polling by using a non-NULL timeout that
          specifies a zero time interval.

          If one or more of the asynchronous I/O operations specified in
          aiocb_list has already completed at the time of the call to
          aio_suspend(), then the call returns immediately.

          To determine which I/O operations have completed after a
          successful return from aio_suspend(), use aio_error(3) to scan
          the list of aiocb structures pointed to by aiocb_list.


-------------------------------------------------

::

          The glibc implementation of aio_suspend() is not async-signal-
          safe, in violation of the requirements of POSIX.1.


---------------------------------------------------------

::

          aio_cancel(3), aio_error(3), aio_fsync(3), aio_read(3),
          aio_return(3), aio_write(3), lio_listio(3), aio(7), time(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                 AIO_SUSPEND(3)

--------------

Pages that refer to this page:
`aio_cancel(3) <../man3/aio_cancel.3.html>`__, 
`aio_error(3) <../man3/aio_error.3.html>`__, 
`aio_fsync(3) <../man3/aio_fsync.3.html>`__, 
`aio_read(3) <../man3/aio_read.3.html>`__, 
`aio_return(3) <../man3/aio_return.3.html>`__, 
`aio_write(3) <../man3/aio_write.3.html>`__, 
`lio_listio(3) <../man3/lio_listio.3.html>`__, 
`aio(7) <../man7/aio.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/aio_suspend.3.license.html>`__

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
