.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getdelim(3p) — Linux manual page
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

   GETDELIM(3P)            POSIX Programmer's Manual           GETDELIM(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          getdelim, getline — read a delimited record from stream


---------------------------------------------------------

::

          #include <stdio.h>

          ssize_t getdelim(char **restrict lineptr, size_t *restrict n,
              int delimiter, FILE *restrict stream);
          ssize_t getline(char **restrict lineptr, size_t *restrict n,
              FILE *restrict stream);


---------------------------------------------------------------

::

          The getdelim() function shall read from stream until it
          encounters a character matching the delimiter character. The
          delimiter argument is an int, the value of which the application
          shall ensure is a character representable as an unsigned char of
          equal value that terminates the read process. If the delimiter
          argument has any other value, the behavior is undefined.

          The application shall ensure that *lineptr is a valid argument
          that could be passed to the free() function. If *n is non-zero,
          the application shall ensure that *lineptr either points to an
          object of size at least *n bytes, or is a null pointer.

          If *lineptr is a null pointer or if the object pointed to by
          *lineptr is of insufficient size, an object shall be allocated as
          if by malloc() or the object shall be reallocated as if by
          realloc(), respectively, such that the object is large enough to
          hold the characters to be written to it, including the
          terminating NUL, and *n shall be set to the new size. If the
          object was allocated, or if the reallocation operation moved the
          object, *lineptr shall be updated to point to the new object or
          new location.  The characters read, including any delimiter,
          shall be stored in the object, and a terminating NUL added when
          the delimiter or end-of-file is encountered.

          The getline() function shall be equivalent to the getdelim()
          function with the delimiter character equal to the <newline>
          character.

          The getdelim() and getline() functions may mark the last data
          access timestamp of the file associated with stream for update.
          The last data access timestamp shall be marked for update by the
          first successful execution of fgetc(), fgets(), fread(),
          fscanf(), getc(), getchar(), getdelim(), getline(), gets(), or
          scanf() using stream that returns data not supplied by a prior
          call to ungetc().


-----------------------------------------------------------------

::

          Upon successful completion, the getline() and getdelim()
          functions shall return the number of bytes written into the
          buffer, including the delimiter character if one was encountered
          before EOF, but excluding the terminating NUL character. If the
          end-of-file indicator for the stream is set, or if no characters
          were read and the stream is at end-of-file, the end-of-file
          indicator for the stream shall be set and the function shall
          return -1.  If an error occurs, the error indicator for the
          stream shall be set, and the function shall return -1 and set
          errno to indicate the error.


-----------------------------------------------------

::

          For the conditions under which the getdelim() and getline()
          functions shall fail and may fail, refer to fgetc(3p).

          In addition, these functions shall fail if:

          EINVAL lineptr or n is a null pointer.

          ENOMEM Insufficient memory is available.

          These functions may fail if:

          EOVERFLOW
                 The number of bytes to be written into the buffer,
                 including the delimiter character (if encountered), would
                 exceed {SSIZE_MAX}.

          The following sections are informative.


---------------------------------------------------------

::

              #include <stdio.h>
              #include <stdlib.h>

              int main(void)
              {
                  FILE *fp;
                  char *line = NULL;
                  size_t len = 0;
                  ssize_t read;
                  fp = fopen("/etc/motd", "r");
                  if (fp == NULL)
                      exit(1);
                  while ((read = getline(&line, &len, fp)) != -1) {
                      printf("Retrieved line of length %zu :\n", read);
                      printf("%s", line);
                  }
                  if (ferror(fp)) {
                      /* handle error */
                  }
                  free(line);
                  fclose(fp);
                  return 0;
              }


---------------------------------------------------------------------------

::

          Setting *lineptr to a null pointer and *n to zero are allowed and
          a recommended way to start parsing a file.

          The ferror() or feof() functions should be used to distinguish
          between an error condition and an end-of-file condition.

          Although a NUL terminator is always supplied after the line, note
          that strlen(*lineptr) will be smaller than the return value if
          the line contains embedded NUL characters.


-----------------------------------------------------------

::

          These functions are widely used to solve the problem that the
          fgets() function has with long lines. The functions automatically
          enlarge the target buffers if needed. These are especially useful
          since they reduce code needed for applications.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.5, Standard I/O Streams, fgetc(3p), fgets(3p),
          free(3p), malloc(3p), realloc(3p)

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

   IEEE/The Open Group               2017                      GETDELIM(3P)

--------------

Pages that refer to this page:
`stdio.h(0p) <../man0/stdio.h.0p.html>`__, 
`fgets(3p) <../man3/fgets.3p.html>`__, 
`getline(3p) <../man3/getline.3p.html>`__

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
