.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fopen(3p) — Linux manual page
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

   FOPEN(3P)               POSIX Programmer's Manual              FOPEN(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fopen — open a stream


---------------------------------------------------------

::

          #include <stdio.h>

          FILE *fopen(const char *restrict pathname, const char *restrict mode);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The fopen() function shall open the file whose pathname is the
          string pointed to by pathname, and associates a stream with it.

          The mode argument points to a string. If the string is one of the
          following, the file shall be opened in the indicated mode.
          Otherwise, the behavior is undefined.

          r or rb       Open file for reading.

          w or wb       Truncate to zero length or create file for writing.

          a or ab       Append; open or create file for writing at end-of-
                        file.

          r+ or rb+ or r+b
                        Open file for update (reading and writing).

          w+ or wb+ or w+b
                        Truncate to zero length or create file for update.

          a+ or ab+ or a+b
                        Append; open or create file for update, writing at
                        end-of-file.

          The character 'b' shall have no effect, but is allowed for ISO C
          standard conformance.  Opening a file with read mode (r as the
          first character in the mode argument) shall fail if the file does
          not exist or cannot be read.

          Opening a file with append mode (a as the first character in the
          mode argument) shall cause all subsequent writes to the file to
          be forced to the then current end-of-file, regardless of
          intervening calls to fseek().

          When a file is opened with update mode ('+' as the second or
          third character in the mode argument), both input and output may
          be performed on the associated stream. However, the application
          shall ensure that output is not directly followed by input
          without an intervening call to fflush() or to a file positioning
          function (fseek(), fsetpos(), or rewind()), and input is not
          directly followed by output without an intervening call to a file
          positioning function, unless the input operation encounters end-
          of-file.

          When opened, a stream is fully buffered if and only if it can be
          determined not to refer to an interactive device. The error and
          end-of-file indicators for the stream shall be cleared.

          If mode is w, wb, a, ab, w+, wb+, w+b, a+, ab+, or a+b, and the
          file did not previously exist, upon successful completion,
          fopen() shall mark for update the last data access, last data
          modification, and last file status change timestamps of the file
          and the last file status change and last data modification
          timestamps of the parent directory.

          If mode is w, wb, a, ab, w+, wb+, w+b, a+, ab+, or a+b, and the
          file did not previously exist, the fopen() function shall create
          a file as if it called the creat() function with a value
          appropriate for the path argument interpreted from pathname and a
          value of S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH |
          S_IWOTH for the mode argument.

          If mode is w, wb, w+, wb+, or w+b, and the file did previously
          exist, upon successful completion, fopen() shall mark for update
          the last data modification and last file status change timestamps
          of the file.

          After a successful call to the fopen() function, the orientation
          of the stream shall be cleared, the encoding rule shall be
          cleared, and the associated mbstate_t object shall be set to
          describe an initial conversion state.

          The file descriptor associated with the opened stream shall be
          allocated and opened as if by a call to open() with the following
          flags:

                   ┌─────────────────┬───────────────────────────┐
                   │  fopen() Mode   │       open() Flags        │
                   ├─────────────────┼───────────────────────────┤
                   │r or rb          │ O_RDONLY                  │
                   │w or wb          │ O_WRONLY|O_CREAT|O_TRUNC  │
                   │a or ab          │ O_WRONLY|O_CREAT|O_APPEND │
                   │r+ or rb+ or r+b │ O_RDWR                    │
                   │w+ or wb+ or w+b │ O_RDWR|O_CREAT|O_TRUNC    │
                   │a+ or ab+ or a+b │ O_RDWR|O_CREAT|O_APPEND   │
                   └─────────────────┴───────────────────────────┘


-----------------------------------------------------------------

::

          Upon successful completion, fopen() shall return a pointer to the
          object controlling the stream. Otherwise, a null pointer shall be
          returned, and errno shall be set to indicate the error.


-----------------------------------------------------

::

          The fopen() function shall fail if:

          EACCES Search permission is denied on a component of the path
                 prefix, or the file exists and the permissions specified
                 by mode are denied, or the file does not exist and write
                 permission is denied for the parent directory of the file
                 to be created.

          EINTR  A signal was caught during fopen().

          EISDIR The named file is a directory and mode requires write
                 access.

          ELOOP  A loop exists in symbolic links encountered during
                 resolution of the path argument.

          EMFILE All file descriptors available to the process are
                 currently open.

          EMFILE {STREAM_MAX} streams are currently open in the calling
                 process.

          ENAMETOOLONG
                 The length of a pathname exceeds {PATH_MAX}, or pathname
                 resolution of a symbolic link produced an intermediate
                 result with a length that exceeds {PATH_MAX}.

          ENFILE The maximum allowable number of files is currently open in
                 the system.

          ENOENT The mode string begins with 'r' and a component of
                 pathname does not name an existing file, or mode begins
                 with 'w' or 'a' and a component of the path prefix of
                 pathname does not name an existing file, or pathname is an
                 empty string.

          ENOENT or ENOTDIR
                 The pathname argument contains at least one non-<slash>
                 character and ends with one or more trailing <slash>
                 characters. If pathname without the trailing <slash>
                 characters would name an existing file, an [ENOENT] error
                 shall not occur.

          ENOSPC The directory or file system that would contain the new
                 file cannot be expanded, the file does not exist, and the
                 file was to be created.

          ENOTDIR
                 A component of the path prefix names an existing file that
                 is neither a directory nor a symbolic link to a directory,
                 or the pathname argument contains at least one non-<slash>
                 character and ends with one or more trailing <slash>
                 characters and the last pathname component names an
                 existing file that is neither a directory nor a symbolic
                 link to a directory.

          ENXIO  The named file is a character special or block special
                 file, and the device associated with this special file
                 does not exist.

          EOVERFLOW
                 The named file is a regular file and the size of the file
                 cannot be represented correctly in an object of type
                 off_t.

          EROFS  The named file resides on a read-only file system and mode
                 requires write access.

          The fopen() function may fail if:

          EINVAL The value of the mode argument is not valid.

          ELOOP  More than {SYMLOOP_MAX} symbolic links were encountered
                 during resolution of the path argument.

          EMFILE {FOPEN_MAX} streams are currently open in the calling
                 process.

          ENAMETOOLONG
                 The length of a component of a pathname is longer than
                 {NAME_MAX}.

          ENOMEM Insufficient storage space is available.

          ETXTBSY
                 The file is a pure procedure (shared text) file that is
                 being executed and mode requires write access.

          The following sections are informative.


---------------------------------------------------------

::

      Opening a File
          The following example tries to open the file named file for
          reading. The fopen() function returns a file pointer that is used
          in subsequent fgets() and fclose() calls. If the program cannot
          open the file, it just ignores it.

              #include <stdio.h>
              ...
              FILE *fp;
              ...
              void rgrep(const char *file)
              {
              ...
                  if ((fp = fopen(file, "r")) == NULL)
                      return;
              ...
              }


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

          Section 2.5, Standard I/O Streams, creat(3p), fclose(3p),
          fdopen(3p), fmemopen(3p), freopen(3p), open_memstream(3p)

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

   IEEE/The Open Group               2017                         FOPEN(3P)

--------------

Pages that refer to this page:
`stdio.h(0p) <../man0/stdio.h.0p.html>`__, 
`close(3p) <../man3/close.3p.html>`__, 
`fclose(3p) <../man3/fclose.3p.html>`__, 
`fdopen(3p) <../man3/fdopen.3p.html>`__, 
`feof(3p) <../man3/feof.3p.html>`__, 
`ferror(3p) <../man3/ferror.3p.html>`__, 
`fgetpos(3p) <../man3/fgetpos.3p.html>`__, 
`fgets(3p) <../man3/fgets.3p.html>`__, 
`fgetwc(3p) <../man3/fgetwc.3p.html>`__, 
`fgetws(3p) <../man3/fgetws.3p.html>`__, 
`fileno(3p) <../man3/fileno.3p.html>`__, 
`fmemopen(3p) <../man3/fmemopen.3p.html>`__, 
`fputc(3p) <../man3/fputc.3p.html>`__, 
`fputs(3p) <../man3/fputs.3p.html>`__, 
`fputwc(3p) <../man3/fputwc.3p.html>`__, 
`fputws(3p) <../man3/fputws.3p.html>`__, 
`fread(3p) <../man3/fread.3p.html>`__, 
`freopen(3p) <../man3/freopen.3p.html>`__, 
`fseek(3p) <../man3/fseek.3p.html>`__, 
`fsetpos(3p) <../man3/fsetpos.3p.html>`__, 
`ftell(3p) <../man3/ftell.3p.html>`__, 
`fwrite(3p) <../man3/fwrite.3p.html>`__, 
`lockf(3p) <../man3/lockf.3p.html>`__, 
`open_memstream(3p) <../man3/open_memstream.3p.html>`__, 
`puts(3p) <../man3/puts.3p.html>`__, 
`setbuf(3p) <../man3/setbuf.3p.html>`__, 
`setvbuf(3p) <../man3/setvbuf.3p.html>`__, 
`stdin(3p) <../man3/stdin.3p.html>`__, 
`tempnam(3p) <../man3/tempnam.3p.html>`__, 
`tmpfile(3p) <../man3/tmpfile.3p.html>`__, 
`tmpnam(3p) <../man3/tmpnam.3p.html>`__

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
