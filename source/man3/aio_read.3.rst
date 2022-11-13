.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

aio_read(3) — Linux manual page
===============================

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
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   AIO_READ(3)             Linux Programmer's Manual            AIO_READ(3)

NAME
-------------------------------------------------

::

          aio_read - asynchronous read


---------------------------------------------------------

::

          #include <aio.h>

          int aio_read(struct aiocb *aiocbp);

          Link with -lrt.


---------------------------------------------------------------

::

          The aio_read() function queues the I/O request described by the
          buffer pointed to by aiocbp.  This function is the asynchronous
          analog of read(2).  The arguments of the call

              read(fd, buf, count)

          correspond (in order) to the fields aio_fildes, aio_buf, and
          aio_nbytes of the structure pointed to by aiocbp.  (See aio(7)
          for a description of the aiocb structure.)

          The data is read starting at the absolute position
          aiocbp->aio_offset, regardless of the file offset.  After the
          call, the value of the file offset is unspecified.

          The "asynchronous" means that this call returns as soon as the
          request has been enqueued; the read may or may not have completed
          when the call returns.  One tests for completion using
          aio_error(3).  The return status of a completed I/O operation can
          be obtained by aio_return(3).  Asynchronous notification of I/O
          completion can be obtained by setting aiocbp->aio_sigevent
          appropriately; see sigevent(7) for details.

          If _POSIX_PRIORITIZED_IO is defined, and this file supports it,
          then the asynchronous operation is submitted at a priority equal
          to that of the calling process minus aiocbp->aio_reqprio.

          The field aiocbp->aio_lio_opcode is ignored.

          No data is read from a regular file beyond its maximum offset.


-----------------------------------------------------------------

::

          On success, 0 is returned.  On error, the request is not
          enqueued, -1 is returned, and errno is set to indicate the error.
          If an error is detected only later, it will be reported via
          aio_return(3) (returns status -1) and aio_error(3) (error status—
          whatever one would have gotten in errno, such as EBADF).


-----------------------------------------------------

::

          EAGAIN Out of resources.

          EBADF  aio_fildes is not a valid file descriptor open for
                 reading.

          EINVAL One or more of aio_offset, aio_reqprio, or aio_nbytes are
                 invalid.

          ENOSYS aio_read() is not implemented.

          EOVERFLOW
                 The file is a regular file, we start reading before end-
                 of-file and want at least one byte, but the starting
                 position is past the maximum offset for this file.


---------------------------------------------------------

::

          The aio_read() function is available since glibc 2.1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │aio_read()                            │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          It is a good idea to zero out the control block before use.  The
          control block must not be changed while the read operation is in
          progress.  The buffer area being read into must not be accessed
          during the operation or undefined results may occur.  The memory
          areas involved must remain valid.

          Simultaneous I/O operations specifying the same aiocb structure
          produce undefined results.


---------------------------------------------------------

::

          See aio(7).


---------------------------------------------------------

::

          aio_cancel(3), aio_error(3), aio_fsync(3), aio_return(3),
          aio_suspend(3), aio_write(3), lio_listio(3), aio(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                    AIO_READ(3)

--------------

Pages that refer to this page: `clone(2) <../man2/clone.2.html>`__, 
`execve(2) <../man2/execve.2.html>`__, 
`fork(2) <../man2/fork.2.html>`__, 
`aio_cancel(3) <../man3/aio_cancel.3.html>`__, 
`aio_error(3) <../man3/aio_error.3.html>`__, 
`aio_fsync(3) <../man3/aio_fsync.3.html>`__, 
`aio_return(3) <../man3/aio_return.3.html>`__, 
`aio_suspend(3) <../man3/aio_suspend.3.html>`__, 
`aio_write(3) <../man3/aio_write.3.html>`__, 
`lio_listio(3) <../man3/lio_listio.3.html>`__, 
`aio(7) <../man7/aio.7.html>`__, 
`sigevent(7) <../man7/sigevent.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/aio_read.3.license.html>`__

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
