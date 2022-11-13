.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

io_setup(2) — Linux manual page
===============================

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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IO_SETUP(2)             Linux Programmer's Manual            IO_SETUP(2)

NAME
-------------------------------------------------

::

          io_setup - create an asynchronous I/O context


---------------------------------------------------------

::

          #include <linux/aio_abi.h>          /* Defines needed types */

          long io_setup(unsigned int nr_events, aio_context_t *ctx_idp);

          Note: There is no glibc wrapper for this system call; see NOTES.


---------------------------------------------------------------

::

          Note: this page describes the raw Linux system call interface.
          The wrapper function provided by libaio uses a different type for
          the ctx_idp argument.  See NOTES.

          The io_setup() system call creates an asynchronous I/O context
          suitable for concurrently processing nr_events operations.  The
          ctx_idp argument must not point to an AIO context that already
          exists, and must be initialized to 0 prior to the call.  On
          successful creation of the AIO context, *ctx_idp is filled in
          with the resulting handle.


-----------------------------------------------------------------

::

          On success, io_setup() returns 0.  For the failure return, see
          NOTES.


-----------------------------------------------------

::

          EAGAIN The specified nr_events exceeds the limit of available
                 events, as defined in /proc/sys/fs/aio-max-nr (see
                 proc(5)).

          EFAULT An invalid pointer is passed for ctx_idp.

          EINVAL ctx_idp is not initialized, or the specified nr_events
                 exceeds internal limits.  nr_events should be greater than
                 0.

          ENOMEM Insufficient kernel resources are available.

          ENOSYS io_setup() is not implemented on this architecture.


---------------------------------------------------------

::

          The asynchronous I/O system calls first appeared in Linux 2.5.


-------------------------------------------------------------------

::

          io_setup() is Linux-specific and should not be used in programs
          that are intended to be portable.


---------------------------------------------------

::

          Glibc does not provide a wrapper for this system call.  You could
          invoke it using syscall(2).  But instead, you probably want to
          use the io_setup() wrapper function provided by libaio.

          Note that the libaio wrapper function uses a different type
          (io_context_t *) for the ctx_idp argument.  Note also that the
          libaio wrapper does not follow the usual C library conventions
          for indicating errors: on error it returns a negated error number
          (the negative of one of the values listed in ERRORS).  If the
          system call is invoked via syscall(2), then the return value
          follows the usual conventions for indicating an error: -1, with
          errno set to a (positive) value that indicates the error.


---------------------------------------------------------

::

          io_cancel(2), io_destroy(2), io_getevents(2), io_submit(2),
          aio(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                    IO_SETUP(2)

--------------

Pages that refer to this page: `fork(2) <../man2/fork.2.html>`__, 
`io_cancel(2) <../man2/io_cancel.2.html>`__, 
`io_destroy(2) <../man2/io_destroy.2.html>`__, 
`io_getevents(2) <../man2/io_getevents.2.html>`__, 
`io_submit(2) <../man2/io_submit.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`aio(7) <../man7/aio.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/io_setup.2.license.html>`__

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
