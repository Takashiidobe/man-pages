.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

io_destroy(2) — Linux manual page
=================================

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

   IO_DESTROY(2)           Linux Programmer's Manual          IO_DESTROY(2)

NAME
-------------------------------------------------

::

          io_destroy - destroy an asynchronous I/O context


---------------------------------------------------------

::

          #include <linux/aio_abi.h>    /* Definition of aio_context_t */
          #include <sys/syscall.h>      /* Definition of SYS_* constants */
          #include <unistd.h>

          int syscall(SYS_io_destroy, aio_context_t ctx_id);

          Note: glibc provides no wrapper for io_destroy(), necessitating
          the use of syscall(2).


---------------------------------------------------------------

::

          Note: this page describes the raw Linux system call interface.
          The wrapper function provided by libaio uses a different type for
          the ctx_id argument.  See NOTES.

          The io_destroy() system call will attempt to cancel all
          outstanding asynchronous I/O operations against ctx_id, will
          block on the completion of all operations that could not be
          canceled, and will destroy the ctx_id.


-----------------------------------------------------------------

::

          On success, io_destroy() returns 0.  For the failure return, see
          NOTES.


-----------------------------------------------------

::

          EFAULT The context pointed to is invalid.

          EINVAL The AIO context specified by ctx_id is invalid.

          ENOSYS io_destroy() is not implemented on this architecture.


---------------------------------------------------------

::

          The asynchronous I/O system calls first appeared in Linux 2.5.


-------------------------------------------------------------------

::

          io_destroy() is Linux-specific and should not be used in programs
          that are intended to be portable.


---------------------------------------------------

::

          You probably want to use the io_destroy() wrapper function
          provided by libaio.

          Note that the libaio wrapper function uses a different type
          (io_context_t) for the ctx_id argument.  Note also that the
          libaio wrapper does not follow the usual C library conventions
          for indicating errors: on error it returns a negated error number
          (the negative of one of the values listed in ERRORS).  If the
          system call is invoked via syscall(2), then the return value
          follows the usual conventions for indicating an error: -1, with
          errno set to a (positive) value that indicates the error.


---------------------------------------------------------

::

          io_cancel(2), io_getevents(2), io_setup(2), io_submit(2), aio(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                  IO_DESTROY(2)

--------------

Pages that refer to this page:
`io_cancel(2) <../man2/io_cancel.2.html>`__, 
`io_getevents(2) <../man2/io_getevents.2.html>`__, 
`io_setup(2) <../man2/io_setup.2.html>`__, 
`io_submit(2) <../man2/io_submit.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`aio(7) <../man7/aio.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/io_destroy.2.license.html>`__

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
