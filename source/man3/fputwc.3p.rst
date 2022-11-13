.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fputwc(3p) — Linux manual page
==============================

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

   FPUTWC(3P)              POSIX Programmer's Manual             FPUTWC(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fputwc — put a wide-character code on a stream


---------------------------------------------------------

::

          #include <stdio.h>
          #include <wchar.h>

          wint_t fputwc(wchar_t wc, FILE *stream);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The fputwc() function shall write the character corresponding to
          the wide-character code wc to the output stream pointed to by
          stream, at the position indicated by the associated file-position
          indicator for the stream (if defined), and advances the indicator
          appropriately. If the file cannot support positioning requests,
          or if the stream was opened with append mode, the character is
          appended to the output stream. If an error occurs while writing
          the character, the shift state of the output file is left in an
          undefined state.

          The last data modification and last file status change timestamps
          of the file shall be marked for update between the successful
          execution of fputwc() and the next successful completion of a
          call to fflush() or fclose() on the same stream or a call to
          exit() or abort().

          The fputwc() function shall not change the setting of errno if
          successful.


-----------------------------------------------------------------

::

          Upon successful completion, fputwc() shall return wc.  Otherwise,
          it shall return WEOF, the error indicator for the stream shall be
          set, and errno shall be set to indicate the error.


-----------------------------------------------------

::

          The fputwc() function shall fail if either the stream is
          unbuffered or data in the stream's buffer needs to be written,
          and:

          EAGAIN The O_NONBLOCK flag is set for the file descriptor
                 underlying stream and the thread would be delayed in the
                 write operation.

          EBADF  The file descriptor underlying stream is not a valid file
                 descriptor open for writing.

          EFBIG  An attempt was made to write to a file that exceeds the
                 maximum file size or the file size limit of the process.

          EFBIG  The file is a regular file and an attempt was made to
                 write at or beyond the offset maximum associated with the
                 corresponding stream.

          EILSEQ The wide-character code wc does not correspond to a valid
                 character.

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

          The fputwc() function may fail if:

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
          setbuf(3p), ulimit(3p)

          The Base Definitions volume of POSIX.1‐2017, stdio.h(0p),
          wchar.h(0p)


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

   IEEE/The Open Group               2017                        FPUTWC(3P)

--------------

Pages that refer to this page:
`wchar.h(0p) <../man0/wchar.h.0p.html>`__, 
`fprintf(3p) <../man3/fprintf.3p.html>`__, 
`fputws(3p) <../man3/fputws.3p.html>`__, 
`fwprintf(3p) <../man3/fwprintf.3p.html>`__, 
`putwc(3p) <../man3/putwc.3p.html>`__, 
`putwchar(3p) <../man3/putwchar.3p.html>`__

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
