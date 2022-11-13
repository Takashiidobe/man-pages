.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fgetwc(3p) — Linux manual page
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

   FGETWC(3P)              POSIX Programmer's Manual             FGETWC(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fgetwc — get a wide-character code from a stream


---------------------------------------------------------

::

          #include <stdio.h>
          #include <wchar.h>

          wint_t fgetwc(FILE *stream);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The fgetwc() function shall obtain the next character (if
          present) from the input stream pointed to by stream, convert that
          to the corresponding wide-character code, and advance the
          associated file position indicator for the stream (if defined).

          If an error occurs, the resulting value of the file position
          indicator for the stream is unspecified.

          The fgetwc() function may mark the last data access timestamp of
          the file associated with stream for update. The last data access
          timestamp shall be marked for update by the first successful
          execution of fgetwc(), fgetws(), fwscanf(), getwc(), getwchar(),
          vfwscanf(), vwscanf(), or wscanf() using stream that returns data
          not supplied by a prior call to ungetwc().

          The fgetwc() function shall not change the setting of errno if
          successful.


-----------------------------------------------------------------

::

          Upon successful completion, the fgetwc() function shall return
          the wide-character code of the character read from the input
          stream pointed to by stream converted to a type wint_t.  If the
          end-of-file indicator for the stream is set, or if the stream is
          at end-of-file, the end-of-file indicator for the stream shall be
          set and fgetwc() shall return WEOF. If a read error occurs, the
          error indicator for the stream shall be set, fgetwc() shall
          return WEOF, and shall set errno to indicate the error.  If an
          encoding error occurs, the error indicator for the stream shall
          be set, fgetwc() shall return WEOF, and shall set errno to
          indicate the error.


-----------------------------------------------------

::

          The fgetwc() function shall fail if data needs to be read and:

          EAGAIN The O_NONBLOCK flag is set for the file descriptor
                 underlying stream and the thread would be delayed in the
                 fgetwc() operation.

          EBADF  The file descriptor underlying stream is not a valid file
                 descriptor open for reading.

          EILSEQ The data obtained from the input stream does not form a
                 valid character.

          EINTR  The read operation was terminated due to the receipt of a
                 signal, and no data was transferred.

          EIO    A physical I/O error has occurred, or the process is in a
                 background process group attempting to read from its
                 controlling terminal, and either the calling thread is
                 blocking SIGTTIN or the process is ignoring SIGTTIN or the
                 process group of the process is orphaned.  This error may
                 also be generated for implementation-defined reasons.

          EOVERFLOW
                 The file is a regular file and an attempt was made to read
                 at or beyond the offset maximum associated with the
                 corresponding stream.

          The fgetwc() function may fail if:

          ENOMEM Insufficient storage space is available.

          ENXIO  A request was made of a nonexistent device, or the request
                 was outside the capabilities of the device.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The ferror() or feof() functions must be used to distinguish
          between an error condition and an end-of-file condition.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.5, Standard I/O Streams, feof(3p), ferror(3p),
          fopen(3p)

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

   IEEE/The Open Group               2017                        FGETWC(3P)

--------------

Pages that refer to this page:
`wchar.h(0p) <../man0/wchar.h.0p.html>`__, 
`fgetws(3p) <../man3/fgetws.3p.html>`__, 
`fscanf(3p) <../man3/fscanf.3p.html>`__, 
`fwscanf(3p) <../man3/fwscanf.3p.html>`__, 
`getwc(3p) <../man3/getwc.3p.html>`__, 
`getwchar(3p) <../man3/getwchar.3p.html>`__

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
