.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fsetpos(3p) — Linux manual page
===============================

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

   FSETPOS(3P)             POSIX Programmer's Manual            FSETPOS(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fsetpos — set current file position


---------------------------------------------------------

::

          #include <stdio.h>

          int fsetpos(FILE *stream, const fpos_t *pos);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The fsetpos() function shall set the file position and state
          indicators for the stream pointed to by stream according to the
          value of the object pointed to by pos, which the application
          shall ensure is a value obtained from an earlier call to
          fgetpos() on the same stream. If a read or write error occurs,
          the error indicator for the stream shall be set and fsetpos()
          fails.

          A successful call to the fsetpos() function shall clear the end-
          of-file indicator for the stream and undo any effects of ungetc()
          on the same stream. After an fsetpos() call, the next operation
          on an update stream may be either input or output.

          The behavior of fsetpos() on devices which are incapable of
          seeking is implementation-defined.  The value of the file offset
          associated with such a device is undefined.

          The fsetpos() function shall not change the setting of errno if
          successful.


-----------------------------------------------------------------

::

          The fsetpos() function shall return 0 if it succeeds; otherwise,
          it shall return a non-zero value and set errno to indicate the
          error.


-----------------------------------------------------

::

          The fsetpos() function shall fail if, either the stream is
          unbuffered or the stream's buffer needed to be flushed, and the
          call to fsetpos() causes an underlying lseek() or write() to be
          invoked, and:

          EAGAIN The O_NONBLOCK flag is set for the file descriptor and the
                 thread would be delayed in the write operation.

          EBADF  The file descriptor underlying the stream file is not open
                 for writing or the stream's buffer needed to be flushed
                 and the file is not open.

          EFBIG  An attempt was made to write a file that exceeds the
                 maximum file size.

          EFBIG  An attempt was made to write a file that exceeds the file
                 size limit of the process.

          EFBIG  The file is a regular file and an attempt was made to
                 write at or beyond the offset maximum associated with the
                 corresponding stream.

          EINTR  The write operation was terminated due to the receipt of a
                 signal, and no data was transferred.

          EIO    A physical I/O error has occurred, or the process is a
                 member of a background process group attempting to perform
                 a write() to its controlling terminal, TOSTOP is set, the
                 calling thread is not blocking SIGTTOU, the process is not
                 ignoring SIGTTOU, and the process group of the process is
                 orphaned.  This error may also be returned under
                 implementation-defined conditions.

          ENOSPC There was no free space remaining on the device containing
                 the file.

          EPIPE  An attempt was made to write to a pipe or FIFO that is not
                 open for reading by any process; a SIGPIPE signal shall
                 also be sent to the thread.

          ESPIPE The file descriptor underlying stream is associated with a
                 pipe, FIFO, or socket.

          The fsetpos() function may fail if:

          ENXIO  A request was made of a nonexistent device, or the request
                 was outside the capabilities of the device.

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

          Section 2.5, Standard I/O Streams, fopen(3p), ftell(3p),
          lseek(3p), rewind(3p), ungetc(3p), write(3p)

          The Base Definitions volume of POSIX.1‐2017, stdio.h(0p)


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

   IEEE/The Open Group               2017                       FSETPOS(3P)

--------------

Pages that refer to this page:
`stdio.h(0p) <../man0/stdio.h.0p.html>`__, 
`fseek(3p) <../man3/fseek.3p.html>`__, 
`ungetc(3p) <../man3/ungetc.3p.html>`__, 
`ungetwc(3p) <../man3/ungetwc.3p.html>`__

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
