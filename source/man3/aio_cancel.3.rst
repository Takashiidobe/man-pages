.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

aio_cancel(3) — Linux manual page
=================================

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
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   AIO_CANCEL(3)           Linux Programmer's Manual          AIO_CANCEL(3)

NAME
-------------------------------------------------

::

          aio_cancel - cancel an outstanding asynchronous I/O request


---------------------------------------------------------

::

          #include <aio.h>

          int aio_cancel(int fd, struct aiocb *aiocbp);

          Link with -lrt.


---------------------------------------------------------------

::

          The aio_cancel() function attempts to cancel outstanding
          asynchronous I/O requests for the file descriptor fd.  If aiocbp
          is NULL, all such requests are canceled.  Otherwise, only the
          request described by the control block pointed to by aiocbp is
          canceled.  (See aio(7) for a description of the aiocb structure.)

          Normal asynchronous notification occurs for canceled requests
          (see aio(7) and sigevent(7)).  The request return status
          (aio_return(3)) is set to -1, and the request error status
          (aio_error(3)) is set to ECANCELED.  The control block of
          requests that cannot be canceled is not changed.

          If the request could not be canceled, then it will terminate in
          the usual way after performing the I/O operation.  (In this case,
          aio_error(3) will return the status EINPROGRESSS.)

          If aiocbp is not NULL, and fd differs from the file descriptor
          with which the asynchronous operation was initiated, unspecified
          results occur.

          Which operations are cancelable is implementation-defined.


-----------------------------------------------------------------

::

          The aio_cancel() function returns one of the following values:

          AIO_CANCELED
                 All requests were successfully canceled.

          AIO_NOTCANCELED
                 At least one of the requests specified was not canceled
                 because it was in progress.  In this case, one may check
                 the status of individual requests using aio_error(3).

          AIO_ALLDONE
                 All requests had already been completed before the call.

          -1     An error occurred.  The cause of the error can be found by
                 inspecting errno.


-----------------------------------------------------

::

          EBADF  fd is not a valid file descriptor.

          ENOSYS aio_cancel() is not implemented.


---------------------------------------------------------

::

          The aio_cancel() function is available since glibc 2.1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │aio_cancel()                          │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------------

::

          See aio(7).


---------------------------------------------------------

::

          aio_error(3), aio_fsync(3), aio_read(3), aio_return(3),
          aio_suspend(3), aio_write(3), lio_listio(3), aio(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                  AIO_CANCEL(3)

--------------

Pages that refer to this page:
`aio_error(3) <../man3/aio_error.3.html>`__, 
`aio_fsync(3) <../man3/aio_fsync.3.html>`__, 
`aio_read(3) <../man3/aio_read.3.html>`__, 
`aio_return(3) <../man3/aio_return.3.html>`__, 
`aio_suspend(3) <../man3/aio_suspend.3.html>`__, 
`aio_write(3) <../man3/aio_write.3.html>`__, 
`lio_listio(3) <../man3/lio_listio.3.html>`__, 
`aio(7) <../man7/aio.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/aio_cancel.3.license.html>`__

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
