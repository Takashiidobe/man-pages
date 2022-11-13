.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stdin(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STDIN(3)                Linux Programmer's Manual               STDIN(3)

NAME
-------------------------------------------------

::

          stdin, stdout, stderr - standard I/O streams


---------------------------------------------------------

::

          #include <stdio.h>

          extern FILE *stdin;
          extern FILE *stdout;
          extern FILE *stderr;


---------------------------------------------------------------

::

          Under normal circumstances every UNIX program has three streams
          opened for it when it starts up, one for input, one for output,
          and one for printing diagnostic or error messages.  These are
          typically attached to the user's terminal (see tty(4)) but might
          instead refer to files or other devices, depending on what the
          parent process chose to set up.  (See also the "Redirection"
          section of sh(1).)

          The input stream is referred to as "standard input"; the output
          stream is referred to as "standard output"; and the error stream
          is referred to as "standard error".  These terms are abbreviated
          to form the symbols used to refer to these files, namely stdin,
          stdout, and stderr.

          Each of these symbols is a stdio(3) macro of type pointer to
          FILE, and can be used with functions like fprintf(3) or fread(3).

          Since FILEs are a buffering wrapper around UNIX file descriptors,
          the same underlying files may also be accessed using the raw UNIX
          file interface, that is, the functions like read(2) and lseek(2).

          On program startup, the integer file descriptors associated with
          the streams stdin, stdout, and stderr are 0, 1, and 2,
          respectively.  The preprocessor symbols STDIN_FILENO,
          STDOUT_FILENO, and STDERR_FILENO are defined with these values in
          <unistd.h>.  (Applying freopen(3) to one of these streams can
          change the file descriptor number associated with the stream.)

          Note that mixing use of FILEs and raw file descriptors can
          produce unexpected results and should generally be avoided.  (For
          the masochistic among you: POSIX.1, section 8.2.3, describes in
          detail how this interaction is supposed to work.)  A general rule
          is that file descriptors are handled in the kernel, while stdio
          is just a library.  This means for example, that after an
          exec(3), the child inherits all open file descriptors, but all
          old streams have become inaccessible.

          Since the symbols stdin, stdout, and stderr are specified to be
          macros, assigning to them is nonportable.  The standard streams
          can be made to refer to different files with help of the library
          function freopen(3), specially introduced to make it possible to
          reassign stdin, stdout, and stderr.  The standard streams are
          closed by a call to exit(3) and by normal program termination.


-------------------------------------------------------------------

::

          The stdin, stdout, and stderr macros conform to C89 and this
          standard also stipulates that these three streams shall be open
          at program startup.


---------------------------------------------------

::

          The stream stderr is unbuffered.  The stream stdout is line-
          buffered when it points to a terminal.  Partial lines will not
          appear until fflush(3) or exit(3) is called, or a newline is
          printed.  This can produce unexpected results, especially with
          debugging output.  The buffering mode of the standard streams (or
          any other stream) can be changed using the setbuf(3) or
          setvbuf(3) call.  Note that in case stdin is associated with a
          terminal, there may also be input buffering in the terminal
          driver, entirely unrelated to stdio buffering.  (Indeed, normally
          terminal input is line buffered in the kernel.)  This kernel
          input handling can be modified using calls like tcsetattr(3); see
          also stty(1), and termios(3).


---------------------------------------------------------

::

          csh(1), sh(1), open(2), fopen(3), stdio(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2017-09-15                       STDIN(3)

--------------

Pages that refer to this page: `intro(1) <../man1/intro.1.html>`__, 
`stdio(3) <../man3/stdio.3.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`pam_exec(8) <../man8/pam_exec.8.html>`__

--------------

`Copyright and license for this manual
page <../man3/stdin.3.license.html>`__

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
