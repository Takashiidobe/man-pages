.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stdio(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STDIO(3)                Linux Programmer's Manual               STDIO(3)

NAME
-------------------------------------------------

::

          stdio - standard input/output library functions


---------------------------------------------------------

::

          #include <stdio.h>

          FILE *stdin;
          FILE *stdout;
          FILE *stderr;


---------------------------------------------------------------

::

          The standard I/O library provides a simple and efficient buffered
          stream I/O interface.  Input and output is mapped into logical
          data streams and the physical I/O characteristics are concealed.
          The functions and macros are listed below; more information is
          available from the individual man pages.

          A stream is associated with an external file (which may be a
          physical device) by opening a file, which may involve creating a
          new file.  Creating an existing file causes its former contents
          to be discarded.  If a file can support positioning requests
          (such as a disk file, as opposed to a terminal), then a file
          position indicator associated with the stream is positioned at
          the start of the file (byte zero), unless the file is opened with
          append mode.  If append mode is used, it is unspecified whether
          the position indicator will be placed at the start or the end of
          the file.  The position indicator is maintained by subsequent
          reads, writes, and positioning requests.  All input occurs as if
          the characters were read by successive calls to the fgetc(3)
          function; all output takes place as if all characters were
          written by successive calls to the fputc(3) function.

          A file is disassociated from a stream by closing the file.
          Output streams are flushed (any unwritten buffer contents are
          transferred to the host environment) before the stream is
          disassociated from the file.  The value of a pointer to a FILE
          object is indeterminate after a file is closed (garbage).

          A file may be subsequently reopened, by the same or another
          program execution, and its contents reclaimed or modified (if it
          can be repositioned at the start).  If the main function returns
          to its original caller, or the exit(3) function is called, all
          open files are closed (hence all output streams are flushed)
          before program termination.  Other methods of program
          termination, such as abort(3) do not bother about closing files
          properly.

          At program startup, three text streams are predefined and need
          not be opened explicitly: standard input (for reading
          conventional input), standard output (for writing conventional
          output), and standard error (for writing diagnostic output).
          These streams are abbreviated stdin, stdout, and stderr.  When
          opened, the standard error stream is not fully buffered; the
          standard input and output streams are fully buffered if and only
          if the streams do not refer to an interactive device.

          Output streams that refer to terminal devices are always line
          buffered by default; pending output to such streams is written
          automatically whenever an input stream that refers to a terminal
          device is read.  In cases where a large amount of computation is
          done after printing part of a line on an output terminal, it is
          necessary to fflush(3) the standard output before going off and
          computing so that the output will appear.

          The stdio library is a part of the library libc and routines are
          automatically loaded as needed by cc(1).  The SYNOPSIS sections
          of the following manual pages indicate which include files are to
          be used, what the compiler declaration for the function looks
          like and which external variables are of interest.

          The following are defined as macros; these names may not be
          reused without first removing their current definitions with
          #undef: BUFSIZ, EOF, FILENAME_MAX, FOPEN_MAX, L_cuserid,
          L_ctermid, L_tmpnam, NULL, SEEK_END, SEEK_SET, SEEK_CUR, TMP_MAX,
          clearerr, feof, ferror, fileno, getc, getchar, putc, putchar,
          stderr, stdin, stdout.  Function versions of the macro functions
          feof, ferror, clearerr, fileno, getc, getchar, putc, and putchar
          exist and will be used if the macros definitions are explicitly
          removed.

      List of functions
          Function         Description
          ──────────────────────────────────────────────────────────────────
          clearerr(3)      check and reset stream status
          fclose(3)        close a stream
          fdopen(3)        stream open functions
          feof(3)          check and reset stream status
          ferror(3)        check and reset stream status
          fflush(3)        flush a stream
          fgetc(3)         get next character or word from input stream
          fgetpos(3)       reposition a stream
          fgets(3)         get a line from a stream
          fileno(3)        return the integer descriptor of the argument
                           stream
          fopen(3)         stream open functions
          fprintf(3)       formatted output conversion
          fpurge(3)        flush a stream
          fputc(3)         output a character or word to a stream
          fputs(3)         output a line to a stream
          fread(3)         binary stream input/output
          freopen(3)       stream open functions
          fscanf(3)        input format conversion
          fseek(3)         reposition a stream
          fsetpos(3)       reposition a stream
          ftell(3)         reposition a stream
          fwrite(3)        binary stream input/output
          getc(3)          get next character or word from input stream
          getchar(3)       get next character or word from input stream
          gets(3)          get a line from a stream
          getw(3)          get next character or word from input stream
          mktemp(3)        make temporary filename (unique)
          perror(3)        system error messages
          printf(3)        formatted output conversion
          putc(3)          output a character or word to a stream
          putchar(3)       output a character or word to a stream
          puts(3)          output a line to a stream
          putw(3)          output a character or word to a stream
          remove(3)        remove directory entry
          rewind(3)        reposition a stream
          scanf(3)         input format conversion
          setbuf(3)        stream buffering operations
          setbuffer(3)     stream buffering operations
          setlinebuf(3)    stream buffering operations
          setvbuf(3)       stream buffering operations
          sprintf(3)       formatted output conversion
          sscanf(3)        input format conversion
          strerror(3)      system error messages

          sys_errlist(3)   system error messages
          sys_nerr(3)      system error messages
          tempnam(3)       temporary file routines
          tmpfile(3)       temporary file routines
          tmpnam(3)        temporary file routines
          ungetc(3)        un-get character from input stream
          vfprintf(3)      formatted output conversion
          vfscanf(3)       input format conversion
          vprintf(3)       formatted output conversion
          vscanf(3)        input format conversion
          vsprintf(3)      formatted output conversion
          vsscanf(3)       input format conversion


-------------------------------------------------------------------

::

          The stdio library conforms to C89.


---------------------------------------------------------

::

          close(2), open(2), read(2), write(2), stdout(3),
          unlocked_stdio(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                       STDIO(3)

--------------

Pages that refer to this page: `pmsnap(1) <../man1/pmsnap.1.html>`__, 
`\_exit(2) <../man2/_exit.2.html>`__, 
`fcntl(2) <../man2/fcntl.2.html>`__, 
`vfork(2) <../man2/vfork.2.html>`__, 
`curs_addch(3x) <../man3/curs_addch.3x.html>`__, 
`exit(3) <../man3/exit.3.html>`__, 
`ferror(3) <../man3/ferror.3.html>`__, 
`fileno(3) <../man3/fileno.3.html>`__, 
`popen(3) <../man3/popen.3.html>`__, 
`printf(3) <../man3/printf.3.html>`__, 
`stdin(3) <../man3/stdin.3.html>`__, 
`unlocked_stdio(3) <../man3/unlocked_stdio.3.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/stdio.3.license.html>`__

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
