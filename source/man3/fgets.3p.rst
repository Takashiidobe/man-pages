.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fgets(3p) — Linux manual page
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

   FGETS(3P)               POSIX Programmer's Manual              FGETS(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fgets — get a string from a stream


---------------------------------------------------------

::

          #include <stdio.h>

          char *fgets(char *restrict s, int n, FILE *restrict stream);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The fgets() function shall read bytes from stream into the array
          pointed to by s until n-1 bytes are read, or a <newline> is read
          and transferred to s, or an end-of-file condition is encountered.
          A null byte shall be written immediately after the last byte read
          into the array.  If the end-of-file condition is encountered
          before any bytes are read, the contents of the array pointed to
          by s shall not be changed.

          The fgets() function may mark the last data access timestamp of
          the file associated with stream for update. The last data access
          timestamp shall be marked for update by the first successful
          execution of fgetc(), fgets(), fread(), fscanf(), getc(),
          getchar(), getdelim(), getline(), gets(), or scanf() using stream
          that returns data not supplied by a prior call to ungetc().


-----------------------------------------------------------------

::

          Upon successful completion, fgets() shall return s.  If the
          stream is at end-of-file, the end-of-file indicator for the
          stream shall be set and fgets() shall return a null pointer.  If
          a read error occurs, the error indicator for the stream shall be
          set, fgets() shall return a null pointer, and shall set errno to
          indicate the error.


-----------------------------------------------------

::

          Refer to fgetc(3p).

          The following sections are informative.


---------------------------------------------------------

::

      Reading Input
          The following example uses fgets() to read lines of input. It
          assumes that the file it is reading is a text file and that lines
          in this text file are no longer than 16384 (or {LINE_MAX} if it
          is less than 16384 on the implementation where it is running)
          bytes long. (Note that the standard utilities have no line length
          limit if sysconf(_SC_LINE_MAX) returns -1 without setting errno.
          This example assumes that sysconf(_SC_LINE_MAX) will not fail.)

              #include <limits.h>
              #include <stdio.h>
              #include <unistd.h>
              #define MYLIMIT 16384

              char *line;
              int line_max;
              if (LINE_MAX >= MYLIMIT) {
                  // Use maximum line size of MYLIMIT. If LINE_MAX is
                  // bigger than our limit, sysconf() cannot report a
                  // smaller limit.
                  line_max = MYLIMIT;
              } else {
                  long limit = sysconf(_SC_LINE_MAX);
                  line_max = (limit < 0 || limit > MYLIMIT) ? MYLIMIT : (int)limit;
              }

              // line_max + 1 leaves room for the null byte added by fgets().
              line = malloc(line_max + 1);
              if (line == NULL) {
                  // out of space
                  ...
                  return error;
              }

              while (fgets(line, line_max + 1, fp) != NULL) {
                  // Verify that a full line has been read ...
                  // If not, report an error or prepare to treat the
                  // next time through the loop as a read of a
                  // continuation of the current line.
                  ...
                  // Process line ...
                  ...
              }
              free(line);
              ...


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

          Section 2.5, Standard I/O Streams, fgetc(3p), fopen(3p),
          fread(3p), fscanf(3p), getc(3p), getchar(3p), getdelim(3p),
          gets(3p), ungetc(3p)

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

   IEEE/The Open Group               2017                         FGETS(3P)

--------------

Pages that refer to this page:
`stdio.h(0p) <../man0/stdio.h.0p.html>`__, 
`fgetc(3p) <../man3/fgetc.3p.html>`__, 
`getdelim(3p) <../man3/getdelim.3p.html>`__, 
`gets(3p) <../man3/gets.3p.html>`__

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
