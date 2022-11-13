.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fread(3p) — Linux manual page
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

   FREAD(3P)               POSIX Programmer's Manual              FREAD(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fread — binary input


---------------------------------------------------------

::

          #include <stdio.h>

          size_t fread(void *restrict ptr, size_t size, size_t nitems,
              FILE *restrict stream);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The fread() function shall read into the array pointed to by ptr
          up to nitems elements whose size is specified by size in bytes,
          from the stream pointed to by stream.  For each object, size
          calls shall be made to the fgetc() function and the results
          stored, in the order read, in an array of unsigned char exactly
          overlaying the object. The file position indicator for the stream
          (if defined) shall be advanced by the number of bytes
          successfully read. If an error occurs, the resulting value of the
          file position indicator for the stream is unspecified. If a
          partial element is read, its value is unspecified.

          The fread() function may mark the last data access timestamp of
          the file associated with stream for update. The last data access
          timestamp shall be marked for update by the first successful
          execution of fgetc(), fgets(), fread(), fscanf(), getc(),
          getchar(), getdelim(), getline(), gets(), or scanf() using stream
          that returns data not supplied by a prior call to ungetc().


-----------------------------------------------------------------

::

          Upon successful completion, fread() shall return the number of
          elements successfully read which is less than nitems only if a
          read error or end-of-file is encountered. If size or nitems is 0,
          fread() shall return 0 and the contents of the array and the
          state of the stream remain unchanged. Otherwise, if a read error
          occurs, the error indicator for the stream shall be set, and
          errno shall be set to indicate the error.


-----------------------------------------------------

::

          Refer to fgetc(3p).

          The following sections are informative.


---------------------------------------------------------

::

      Reading from a Stream
          The following example transfers a single 100-byte fixed length
          record from the fp stream into the array pointed to by buf.

              #include <stdio.h>
              ...
              size_t elements_read;
              char buf[100];
              FILE *fp;
              ...
              elements_read = fread(buf, sizeof(buf), 1, fp);
              ...

          If a read error occurs, elements_read will be zero but the number
          of bytes read from the stream could be anything from zero to
          sizeof(buf)-1.

          The following example reads multiple single-byte elements from
          the fp stream into the array pointed to by buf.

              #include <stdio.h>
              ...
              size_t bytes_read;
              char buf[100];
              FILE *fp;
              ...
              bytes_read = fread(buf, 1, sizeof(buf), fp);
              ...

          If a read error occurs, bytes_read will contain the number of
          bytes read from the stream.


---------------------------------------------------------------------------

::

          The ferror() or feof() functions must be used to distinguish
          between an error condition and an end-of-file condition.

          Because of possible differences in element length and byte
          ordering, files written using fwrite() are application-dependent,
          and possibly cannot be read using fread() by a different
          application or by the same application on a different processor.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.5, Standard I/O Streams, feof(3p), ferror(3p),
          fgetc(3p), fopen(3p), fscanf(3p), getc(3p), gets(3p)

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

   IEEE/The Open Group               2017                         FREAD(3P)

--------------

Pages that refer to this page:
`stdio.h(0p) <../man0/stdio.h.0p.html>`__, 
`fgetc(3p) <../man3/fgetc.3p.html>`__, 
`fgets(3p) <../man3/fgets.3p.html>`__, 
`fgetws(3p) <../man3/fgetws.3p.html>`__, 
`stdin(3p) <../man3/stdin.3p.html>`__

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
