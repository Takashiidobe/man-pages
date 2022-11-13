.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fputc(3p) — Linux manual page
=============================

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

   FPUTC(3P)               POSIX Programmer's Manual              FPUTC(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fputc — put a byte on a stream


---------------------------------------------------------

::

          #include <stdio.h>

          int fputc(int c, FILE *stream);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The fputc() function shall write the byte specified by c
          (converted to an unsigned char) to the output stream pointed to
          by stream, at the position indicated by the associated file-
          position indicator for the stream (if defined), and shall advance
          the indicator appropriately.  If the file cannot support
          positioning requests, or if the stream was opened with append
          mode, the byte shall be appended to the output stream.

          The last data modification and last file status change timestamps
          of the file shall be marked for update between the successful
          execution of fputc() and the next successful completion of a call
          to fflush() or fclose() on the same stream or a call to exit() or
          abort().


-----------------------------------------------------------------

::

          Upon successful completion, fputc() shall return the value it has
          written. Otherwise, it shall return EOF, the error indicator for
          the stream shall be set, and errno shall be set to indicate the
          error.


-----------------------------------------------------

::

          The fputc() function shall fail if either the stream is
          unbuffered or the stream's buffer needs to be flushed, and:

          EAGAIN The O_NONBLOCK flag is set for the file descriptor
                 underlying stream and the thread would be delayed in the
                 write operation.

          EBADF  The file descriptor underlying stream is not a valid file
                 descriptor open for writing.

          EFBIG  An attempt was made to write to a file that exceeds the
                 maximum file size.

          EFBIG  An attempt was made to write to a file that exceeds the
                 file size limit of the process.

          EFBIG  The file is a regular file and an attempt was made to
                 write at or beyond the offset maximum.

          EINTR  The write operation was terminated due to the receipt of a
                 signal, and no data was transferred.

          EIO    A physical I/O error has occurred, or the process is a
                 member of a background process group attempting to write
                 to its controlling terminal, TOSTOP is set, the calling
                 thread is not blocking SIGTTOU, the process is not
                 ignoring SIGTTOU, and the process group of the process is
                 orphaned.  This error may also be returned under
                 implementation-defined conditions.

          ENOSPC There was no free space remaining on the device containing
                 the file.

          EPIPE  An attempt is made to write to a pipe or FIFO that is not
                 open for reading by any process. A SIGPIPE signal shall
                 also be sent to the thread.

          The fputc() function may fail if:

          ENOMEM Insufficient storage space is available.

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

          Section 2.5, Standard I/O Streams, ferror(3p), fopen(3p),
          getrlimit(3p), putc(3p), puts(3p), setbuf(3p), ulimit(3p)

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

   IEEE/The Open Group               2017                         FPUTC(3P)

--------------

Pages that refer to this page:
`stdio.h(0p) <../man0/stdio.h.0p.html>`__, 
`fprintf(3p) <../man3/fprintf.3p.html>`__, 
`fputs(3p) <../man3/fputs.3p.html>`__, 
`fwrite(3p) <../man3/fwrite.3p.html>`__, 
`perror(3p) <../man3/perror.3p.html>`__, 
`psiginfo(3p) <../man3/psiginfo.3p.html>`__, 
`putc(3p) <../man3/putc.3p.html>`__, 
`putchar(3p) <../man3/putchar.3p.html>`__, 
`puts(3p) <../man3/puts.3p.html>`__

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
