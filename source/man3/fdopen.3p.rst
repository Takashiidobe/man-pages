.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fdopen(3p) — Linux manual page
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

   FDOPEN(3P)              POSIX Programmer's Manual             FDOPEN(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fdopen — associate a stream with a file descriptor


---------------------------------------------------------

::

          #include <stdio.h>

          FILE *fdopen(int fildes, const char *mode);


---------------------------------------------------------------

::

          The fdopen() function shall associate a stream with a file
          descriptor.

          The mode argument is a character string having one of the
          following values:

          r or rb       Open a file for reading.

          w or wb       Open a file for writing.

          a or ab       Open a file for writing at end-of-file.

          r+ or rb+ or r+b
                        Open a file for update (reading and writing).

          w+ or wb+ or w+b
                        Open a file for update (reading and writing).

          a+ or ab+ or a+b
                        Open a file for update (reading and writing) at
                        end-of-file.

          The meaning of these flags is exactly as specified in fopen(),
          except that modes beginning with w shall not cause truncation of
          the file.

          Additional values for the mode argument may be supported by an
          implementation.

          The application shall ensure that the mode of the stream as
          expressed by the mode argument is allowed by the file access mode
          of the open file description to which fildes refers. The file
          position indicator associated with the new stream is set to the
          position indicated by the file offset associated with the file
          descriptor.

          The error and end-of-file indicators for the stream shall be
          cleared.  The fdopen() function may cause the last data access
          timestamp of the underlying file to be marked for update.

          If fildes refers to a shared memory object, the result of the
          fdopen() function is unspecified.

          If fildes refers to a typed memory object, the result of the
          fdopen() function is unspecified.

          The fdopen() function shall preserve the offset maximum
          previously set for the open file description corresponding to
          fildes.


-----------------------------------------------------------------

::

          Upon successful completion, fdopen() shall return a pointer to a
          stream; otherwise, a null pointer shall be returned and errno set
          to indicate the error.


-----------------------------------------------------

::

          The fdopen() function shall fail if:

          EMFILE {STREAM_MAX} streams are currently open in the calling
                 process.

          The fdopen() function may fail if:

          EBADF  The fildes argument is not a valid file descriptor.

          EINVAL The mode argument is not a valid mode.

          EMFILE {FOPEN_MAX} streams are currently open in the calling
                 process.

          ENOMEM Insufficient space to allocate a buffer.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          File descriptors are obtained from calls like open(), dup(),
          creat(), or pipe(), which open files but do not return streams.


-----------------------------------------------------------

::

          The file descriptor may have been obtained from open(), creat(),
          pipe(), dup(), fcntl(), or socket(); inherited through fork(),
          posix_spawn(), or exec; or perhaps obtained by other means.

          The meanings of the mode arguments of fdopen() and fopen()
          differ. With fdopen(), open for write (w or w+) does not
          truncate, and append (a or a+) cannot create for writing. The
          mode argument formats that include a b are allowed for
          consistency with the ISO C standard function fopen().  The b has
          no effect on the resulting stream. Although not explicitly
          required by this volume of POSIX.1‐2017, a good implementation of
          append (a) mode would cause the O_APPEND flag to be set.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.5.1, Interaction of File Descriptors and Standard I/O
          Streams, fclose(3p), fmemopen(3p), fopen(3p), open(3p),
          open_memstream(3p), posix_spawn(3p), socket(3p)

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

   IEEE/The Open Group               2017                        FDOPEN(3P)

--------------

Pages that refer to this page:
`stdio.h(0p) <../man0/stdio.h.0p.html>`__, 
`fileno(3p) <../man3/fileno.3p.html>`__, 
`fmemopen(3p) <../man3/fmemopen.3p.html>`__, 
`fopen(3p) <../man3/fopen.3p.html>`__, 
`freopen(3p) <../man3/freopen.3p.html>`__, 
`open_memstream(3p) <../man3/open_memstream.3p.html>`__

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
