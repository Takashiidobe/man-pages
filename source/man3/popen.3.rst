.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

popen(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   POPEN(3)                Linux Programmer's Manual               POPEN(3)

NAME
-------------------------------------------------

::

          popen, pclose - pipe stream to or from a process


---------------------------------------------------------

::

          #include <stdio.h>

          FILE *popen(const char *command, const char *type);
          int pclose(FILE *stream);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          popen(), pclose():
              _POSIX_C_SOURCE >= 2
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          The popen() function opens a process by creating a pipe, forking,
          and invoking the shell.  Since a pipe is by definition
          unidirectional, the type argument may specify only reading or
          writing, not both; the resulting stream is correspondingly read-
          only or write-only.

          The command argument is a pointer to a null-terminated string
          containing a shell command line.  This command is passed to
          /bin/sh using the -c flag; interpretation, if any, is performed
          by the shell.

          The type argument is a pointer to a null-terminated string which
          must contain either the letter 'r' for reading or the letter 'w'
          for writing.  Since glibc 2.9, this argument can additionally
          include the letter 'e', which causes the close-on-exec flag
          (FD_CLOEXEC) to be set on the underlying file descriptor; see the
          description of the O_CLOEXEC flag in open(2) for reasons why this
          may be useful.

          The return value from popen() is a normal standard I/O stream in
          all respects save that it must be closed with pclose() rather
          than fclose(3).  Writing to such a stream writes to the standard
          input of the command; the command's standard output is the same
          as that of the process that called popen(), unless this is
          altered by the command itself.  Conversely, reading from the
          stream reads the command's standard output, and the command's
          standard input is the same as that of the process that called
          popen().

          Note that output popen() streams are block buffered by default.

          The pclose() function waits for the associated process to
          terminate and returns the exit status of the command as returned
          by wait4(2).


-----------------------------------------------------------------

::

          popen(): on success, returns a pointer to an open stream that can
          be used to read or write to the pipe; if the fork(2) or pipe(2)
          calls fail, or if the function cannot allocate memory, NULL is
          returned.

          pclose(): on success, returns the exit status of the command; if
          wait4(2) returns an error, or some other error is detected, -1 is
          returned.

          On failure, both functions set errno to indicate the error.


-----------------------------------------------------

::

          The popen() function does not set errno if memory allocation
          fails.  If the underlying fork(2) or pipe(2) fails, errno is set
          to indicate the error.  If the type argument is invalid, and this
          condition is detected, errno is set to EINVAL.

          If pclose() cannot obtain the child status, errno is set to
          ECHILD.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │popen(), pclose()                     │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.

          The 'e' value for type is a Linux extension.


---------------------------------------------------

::

          Note: carefully read Caveats in system(3).


-------------------------------------------------

::

          Since the standard input of a command opened for reading shares
          its seek offset with the process that called popen(), if the
          original process has done a buffered read, the command's input
          position may not be as expected.  Similarly, the output from a
          command opened for writing may become intermingled with that of
          the original process.  The latter can be avoided by calling
          fflush(3) before popen().

          Failure to execute the shell is indistinguishable from the
          shell's failure to execute command, or an immediate exit of the
          command.  The only hint is an exit status of 127.


---------------------------------------------------------

::

          sh(1), fork(2), pipe(2), wait4(2), fclose(3), fflush(3),
          fopen(3), stdio(3), system(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                       POPEN(3)

--------------

Pages that refer to this page: `gawk(1) <../man1/gawk.1.html>`__, 
`pipe(2) <../man2/pipe.2.html>`__, 
`getexeccon(3) <../man3/getexeccon.3.html>`__, 
`\__pmprocessexec(3) <../man3/__pmprocessexec.3.html>`__, 
`\__pmprocesspipe(3) <../man3/__pmprocesspipe.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/popen.3.license.html>`__

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
