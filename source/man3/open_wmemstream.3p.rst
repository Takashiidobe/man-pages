.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

open_memstream(3p) — Linux manual page
======================================

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

   OPEN_MEMSTREAM(3P)      POSIX Programmer's Manual     OPEN_MEMSTREAM(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          open_memstream, open_wmemstream — open a dynamic memory buffer
          stream


---------------------------------------------------------

::

          #include <stdio.h>

          FILE *open_memstream(char **bufp, size_t *sizep);

          #include <wchar.h>

          FILE *open_wmemstream(wchar_t **bufp, size_t *sizep);


---------------------------------------------------------------

::

          The open_memstream() and open_wmemstream() functions shall create
          an I/O stream associated with a dynamically allocated memory
          buffer. The stream shall be opened for writing and shall be
          seekable.

          The stream associated with a call to open_memstream() shall be
          byte-oriented.

          The stream associated with a call to open_wmemstream() shall be
          wide-oriented.

          The stream shall maintain a current position in the allocated
          buffer and a current buffer length. The position shall be
          initially set to zero (the start of the buffer). Each write to
          the stream shall start at the current position and move this
          position by the number of successfully written bytes for
          open_memstream() or the number of successfully written wide
          characters for open_wmemstream().  The length shall be initially
          set to zero. If a write moves the position to a value larger than
          the current length, the current length shall be set to this
          position. In this case a null character for open_memstream() or a
          null wide character for open_wmemstream() shall be appended to
          the current buffer. For both functions the terminating null is
          not included in the calculation of the buffer length.

          After a successful fflush() or fclose(), the pointer referenced
          by bufp shall contain the address of the buffer, and the variable
          pointed to by sizep shall contain the smaller of the current
          buffer length and the number of bytes for open_memstream(), or
          the number of wide characters for open_wmemstream(), between the
          beginning of the buffer and the current file position indicator.

          After a successful fflush() the pointer referenced by bufp and
          the variable referenced by sizep remain valid only until the next
          write operation on the stream or a call to fclose().

          After a successful fclose(), the pointer referenced by bufp can
          be passed to free().


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return a
          pointer to the object controlling the stream. Otherwise, a null
          pointer shall be returned, and errno shall be set to indicate the
          error.


-----------------------------------------------------

::

          These functions shall fail if:

          EMFILE {STREAM_MAX} streams are currently open in the calling
                 process.

          These functions may fail if:

          EINVAL bufp or sizep are NULL.

          EMFILE {FOPEN_MAX} streams are currently open in the calling
                 process.

          ENOMEM Memory for the stream or the buffer could not be
                 allocated.

          The following sections are informative.


---------------------------------------------------------

::

              #include <stdio.h>
              #include <stdlib.h>

              int
              main (void)
              {
                  FILE *stream;
                  char *buf;
                  size_t len;
                  off_t eob;

                  stream = open_memstream (&buf, &len);
                  if (stream == NULL)
                      /* handle error */ ;
                  fprintf (stream, "hello my world");
                  fflush (stream);
                  printf ("buf=%s, len=%zu\n", buf, len);
                  eob = ftello(stream);
                  fseeko (stream, 0, SEEK_SET);
                  fprintf (stream, "good-bye");
                  fseeko (stream, eob, SEEK_SET);
                  fclose (stream);
                  printf ("buf=%s, len=%zu\n", buf, len);
                  free (buf);
                  return 0;
              }

          This program produces the following output:

              buf=hello my world, len=14
              buf=good-bye world, len=14


---------------------------------------------------------------------------

::

          The buffer created by these functions should be freed by the
          application after closing the stream, by means of a call to
          free().


-----------------------------------------------------------

::

          These functions are similar to fmemopen() except that the memory
          is always allocated dynamically by the function, and the stream
          is opened only for output.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          fclose(3p), fdopen(3p), fflush(3p), fmemopen(3p), fopen(3p),
          free(3p), freopen(3p)

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

   IEEE/The Open Group               2017                OPEN_MEMSTREAM(3P)

--------------

Pages that refer to this page:
`stdio.h(0p) <../man0/stdio.h.0p.html>`__, 
`wchar.h(0p) <../man0/wchar.h.0p.html>`__, 
`fclose(3p) <../man3/fclose.3p.html>`__, 
`fdopen(3p) <../man3/fdopen.3p.html>`__, 
`fflush(3p) <../man3/fflush.3p.html>`__, 
`fmemopen(3p) <../man3/fmemopen.3p.html>`__, 
`fopen(3p) <../man3/fopen.3p.html>`__, 
`freopen(3p) <../man3/freopen.3p.html>`__

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
