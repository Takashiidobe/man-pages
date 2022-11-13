.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

aio_fsync(3) — Linux manual page
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
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   AIO_FSYNC(3)            Linux Programmer's Manual           AIO_FSYNC(3)

NAME
-------------------------------------------------

::

          aio_fsync - asynchronous file synchronization


---------------------------------------------------------

::

          #include <aio.h>

          int aio_fsync(int op, struct aiocb *aiocbp);

          Link with -lrt.


---------------------------------------------------------------

::

          The aio_fsync() function does a sync on all outstanding
          asynchronous I/O operations associated with aiocbp->aio_fildes.
          (See aio(7) for a description of the aiocb structure.)

          More precisely, if op is O_SYNC, then all currently queued I/O
          operations shall be completed as if by a call of fsync(2), and if
          op is O_DSYNC, this call is the asynchronous analog of
          fdatasync(2).

          Note that this is a request only; it does not wait for I/O
          completion.

          Apart from aio_fildes, the only field in the structure pointed to
          by aiocbp that is used by this call is the aio_sigevent field (a
          sigevent structure, described in sigevent(7)), which indicates
          the desired type of asynchronous notification at completion.  All
          other fields are ignored.


-----------------------------------------------------------------

::

          On success (the sync request was successfully queued) this
          function returns 0.  On error, -1 is returned, and errno is set
          to indicate the error.


-----------------------------------------------------

::

          EAGAIN Out of resources.

          EBADF  aio_fildes is not a valid file descriptor open for
                 writing.

          EINVAL Synchronized I/O is not supported for this file, or op is
                 not O_SYNC or O_DSYNC.

          ENOSYS aio_fsync() is not implemented.


---------------------------------------------------------

::

          The aio_fsync() function is available since glibc 2.1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │aio_fsync()                           │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------------

::

          aio_cancel(3), aio_error(3), aio_read(3), aio_return(3),
          aio_suspend(3), aio_write(3), lio_listio(3), aio(7), sigevent(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                   AIO_FSYNC(3)

--------------

Pages that refer to this page:
`aio_cancel(3) <../man3/aio_cancel.3.html>`__, 
`aio_error(3) <../man3/aio_error.3.html>`__, 
`aio_read(3) <../man3/aio_read.3.html>`__, 
`aio_return(3) <../man3/aio_return.3.html>`__, 
`aio_suspend(3) <../man3/aio_suspend.3.html>`__, 
`aio_write(3) <../man3/aio_write.3.html>`__, 
`lio_listio(3) <../man3/lio_listio.3.html>`__, 
`aio(7) <../man7/aio.7.html>`__, 
`sigevent(7) <../man7/sigevent.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/aio_fsync.3.license.html>`__

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
