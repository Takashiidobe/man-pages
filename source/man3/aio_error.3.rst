.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

aio_error(3) — Linux manual page
================================

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

   AIO_ERROR(3)            Linux Programmer's Manual           AIO_ERROR(3)

NAME
-------------------------------------------------

::

          aio_error - get error status of asynchronous I/O operation


---------------------------------------------------------

::

          #include <aio.h>

          int aio_error(const struct aiocb *aiocbp);

          Link with -lrt.


---------------------------------------------------------------

::

          The aio_error() function returns the error status for the
          asynchronous I/O request with control block pointed to by aiocbp.
          (See aio(7) for a description of the aiocb structure.)


-----------------------------------------------------------------

::

          This function returns one of the following:

          *  EINPROGRESS, if the request has not been completed yet.

          *  ECANCELED, if the request was canceled.

          *  0, if the request completed successfully.

          *  A positive error number, if the asynchronous I/O operation
             failed.  This is the same value that would have been stored in
             the errno variable in the case of a synchronous read(2),
             write(2), fsync(2), or fdatasync(2) call.


-----------------------------------------------------

::

          EINVAL aiocbp does not point at a control block for an
                 asynchronous I/O request of which the return status (see
                 aio_return(3)) has not been retrieved yet.

          ENOSYS aio_error() is not implemented.


---------------------------------------------------------

::

          The aio_error() function is available since glibc 2.1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │aio_error()                           │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------------

::

          See aio(7).


---------------------------------------------------------

::

          aio_cancel(3), aio_fsync(3), aio_read(3), aio_return(3),
          aio_suspend(3), aio_write(3), lio_listio(3), aio(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                   AIO_ERROR(3)

--------------

Pages that refer to this page:
`aio_cancel(3) <../man3/aio_cancel.3.html>`__, 
`aio_fsync(3) <../man3/aio_fsync.3.html>`__, 
`aio_read(3) <../man3/aio_read.3.html>`__, 
`aio_return(3) <../man3/aio_return.3.html>`__, 
`aio_suspend(3) <../man3/aio_suspend.3.html>`__, 
`aio_write(3) <../man3/aio_write.3.html>`__, 
`lio_listio(3) <../man3/lio_listio.3.html>`__, 
`aio(7) <../man7/aio.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/aio_error.3.license.html>`__

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
