.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

io_getevents(2) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
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

   IO_GETEVENTS(2)         Linux Programmer's Manual        IO_GETEVENTS(2)

NAME
-------------------------------------------------

::

          io_getevents - read asynchronous I/O events from the completion
          queue


---------------------------------------------------------

::

          #include <linux/aio_abi.h>    /* Definition of *io_* types */
          #include <sys/syscall.h>      /* Definition of SYS_* constants */
          #include <unistd.h>

          int syscall(SYS_io_getevents, aio_context_t ctx_id,
                      long min_nr, long nr, struct io_event *events,
                      struct timespec *timeout);

          Note: glibc provides no wrapper for io_getevents(), necessitating
          the use of syscall(2).


---------------------------------------------------------------

::

          Note: this page describes the raw Linux system call interface.
          The wrapper function provided by libaio uses a different type for
          the ctx_id argument.  See NOTES.

          The io_getevents() system call attempts to read at least min_nr
          events and up to nr events from the completion queue of the AIO
          context specified by ctx_id.

          The timeout argument specifies the amount of time to wait for
          events, and is specified as a relative timeout in a structure of
          the following form:

              struct timespec {
                  time_t tv_sec;      /* seconds */
                  long   tv_nsec;     /* nanoseconds [0 .. 999999999] */
              };

          The specified time will be rounded up to the system clock
          granularity and is guaranteed not to expire early.

          Specifying timeout as NULL means block indefinitely until at
          least min_nr events have been obtained.


-----------------------------------------------------------------

::

          On success, io_getevents() returns the number of events read.
          This may be 0, or a value less than min_nr, if the timeout
          expired.  It may also be a nonzero value less than min_nr, if the
          call was interrupted by a signal handler.

          For the failure return, see NOTES.


-----------------------------------------------------

::

          EFAULT Either events or timeout is an invalid pointer.

          EINTR  Interrupted by a signal handler; see signal(7).

          EINVAL ctx_id is invalid.  min_nr is out of range or nr is out of
                 range.

          ENOSYS io_getevents() is not implemented on this architecture.


---------------------------------------------------------

::

          The asynchronous I/O system calls first appeared in Linux 2.5.


-------------------------------------------------------------------

::

          io_getevents() is Linux-specific and should not be used in
          programs that are intended to be portable.


---------------------------------------------------

::

          You probably want to use the io_getevents() wrapper function
          provided by libaio.

          Note that the libaio wrapper function uses a different type
          (io_context_t) for the ctx_id argument.  Note also that the
          libaio wrapper does not follow the usual C library conventions
          for indicating errors: on error it returns a negated error number
          (the negative of one of the values listed in ERRORS).  If the
          system call is invoked via syscall(2), then the return value
          follows the usual conventions for indicating an error: -1, with
          errno set to a (positive) value that indicates the error.


-------------------------------------------------

::

          An invalid ctx_id may cause a segmentation fault instead of
          generating the error EINVAL.


---------------------------------------------------------

::

          io_cancel(2), io_destroy(2), io_setup(2), io_submit(2), aio(7),
          time(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                IO_GETEVENTS(2)

--------------

Pages that refer to this page:
`io_cancel(2) <../man2/io_cancel.2.html>`__, 
`io_destroy(2) <../man2/io_destroy.2.html>`__, 
`io_setup(2) <../man2/io_setup.2.html>`__, 
`io_submit(2) <../man2/io_submit.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`aio(7) <../man7/aio.7.html>`__,  `signal(7) <../man7/signal.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/io_getevents.2.license.html>`__

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
