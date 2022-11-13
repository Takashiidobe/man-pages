.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fmemopen(3p) — Linux manual page
================================

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

   FMEMOPEN(3P)            POSIX Programmer's Manual           FMEMOPEN(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fmemopen — open a memory buffer stream


---------------------------------------------------------

::

          #include <stdio.h>

          FILE *fmemopen(void *restrict buf, size_t size,
              const char *restrict mode);


---------------------------------------------------------------

::

          The fmemopen() function shall associate the buffer given by the
          buf and size arguments with a stream. The buf argument shall be
          either a null pointer or point to a buffer that is at least size
          bytes long.

          The mode argument points to a string. If the string is one of the
          following, the stream shall be opened in the indicated mode.
          Otherwise, the behavior is undefined.

          r       Open the stream for reading.

          w       Open the stream for writing.

          a       Append; open the stream for writing at the first null
                  byte.

          r+      Open the stream for update (reading and writing).

          w+      Open the stream for update (reading and writing).
                  Truncate the buffer contents.

          a+      Append; open the stream for update (reading and writing);
                  the initial position is at the first null byte.

          Implementations shall accept all mode strings allowed by fopen(),
          but the use of the character 'b' shall produce implementation-
          defined results, where the resulting FILE * need not behave the
          same as if 'b' were omitted.

          If a null pointer is specified as the buf argument, fmemopen()
          shall allocate size bytes of memory as if by a call to malloc().
          This buffer shall be automatically freed when the stream is
          closed.  Because this feature is only useful when the stream is
          opened for updating (because there is no way to get a pointer to
          the buffer) the fmemopen() call may fail if the mode argument
          does not include a '+'.

          The stream shall maintain a current position in the buffer. This
          position shall be initially set to either the beginning of the
          buffer (for r and w modes) or to the first null byte in the
          buffer (for a modes). If no null byte is found in append mode,
          the initial position shall be set to one byte after the end of
          the buffer.

          If buf is a null pointer, the initial position shall always be
          set to the beginning of the buffer.

          The stream shall also maintain the size of the current buffer
          contents; use of fseek() or fseeko() on the stream with SEEK_END
          shall seek relative to this size. For modes r and r+ the size
          shall be set to the value given by the size argument. For modes w
          and w+ the initial size shall be zero and for modes a and a+ the
          initial size shall be:

           *  Zero, if buf is a null pointer

           *  The position of the first null byte in the buffer, if one is
              found

           *  The value of the size argument, if buf is not a null pointer
              and no null byte is found

          A read operation on the stream shall not advance the current
          buffer position beyond the current buffer size. Reaching the
          buffer size in a read operation shall count as ``end-of-file''.
          Null bytes in the buffer shall have no special meaning for reads.
          The read operation shall start at the current buffer position of
          the stream.

          A write operation shall start either at the current position of
          the stream (if mode has not specified 'a' as the first character)
          or at the current size of the stream (if mode had 'a' as the
          first character). If the current position at the end of the write
          is larger than the current buffer size, the current buffer size
          shall be set to the current position. A write operation on the
          stream shall not advance the current buffer size beyond the size
          given in the size argument.

          When a stream open for writing is flushed or closed, a null byte
          shall be written at the current position or at the end of the
          buffer, depending on the size of the contents. If a stream open
          for update is flushed or closed and the last write has advanced
          the current buffer size, a null byte shall be written at the end
          of the buffer if it fits.

          An attempt to seek a memory buffer stream to a negative position
          or to a position larger than the buffer size given in the size
          argument shall fail.


-----------------------------------------------------------------

::

          Upon successful completion, fmemopen() shall return a pointer to
          the object controlling the stream. Otherwise, a null pointer
          shall be returned, and errno shall be set to indicate the error.


-----------------------------------------------------

::

          The fmemopen() function shall fail if:

          EMFILE {STREAM_MAX} streams are currently open in the calling
                 process.

          The fmemopen() function may fail if:

          EINVAL The value of the mode argument is not valid.

          EINVAL The buf argument is a null pointer and the mode argument
                 does not include a '+' character.

          EINVAL The size argument specifies a buffer size of zero and the
                 implementation does not support this.

          ENOMEM The buf argument is a null pointer and the allocation of a
                 buffer of length size has failed.

          EMFILE {FOPEN_MAX} streams are currently open in the calling
                 process.

          The following sections are informative.


---------------------------------------------------------

::

              #include <stdio.h>
              #include <string.h>

              static char buffer[] = "foobar";

              int
              main (void)
              {
                  int ch;
                  FILE *stream;

                  stream = fmemopen(buffer, strlen (buffer), "r");
                  if (stream == NULL)
                      /* handle error */;

                  while ((ch = fgetc(stream)) != EOF)
                      printf("Got %c\n", ch);

                  fclose(stream);
                  return (0);
              }

          This program produces the following output:

              Got f
              Got o
              Got o
              Got b
              Got a
              Got r


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          This interface has been introduced to eliminate many of the
          errors encountered in the construction of strings, notably
          overflowing of strings. This interface prevents overflow.


---------------------------------------------------------------------------

::

          A future version of this standard may mandate specific behavior
          when the mode argument includes 'b'.

          A future version of this standard may require support of zero-
          length buffer streams explicitly.


---------------------------------------------------------

::

          fdopen(3p), fopen(3p), freopen(3p), fseek(3p), malloc(3p),
          open_memstream(3p)

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

   IEEE/The Open Group               2017                      FMEMOPEN(3P)

--------------

Pages that refer to this page:
`stdio.h(0p) <../man0/stdio.h.0p.html>`__, 
`fclose(3p) <../man3/fclose.3p.html>`__, 
`fdopen(3p) <../man3/fdopen.3p.html>`__, 
`fflush(3p) <../man3/fflush.3p.html>`__, 
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
