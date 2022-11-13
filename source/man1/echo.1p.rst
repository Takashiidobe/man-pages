.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

echo(1p) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `OPERANDS <#OPERANDS>`__ \|       |                                   |
| `STDIN <#STDIN>`__ \|             |                                   |
| `INPUT FILES <#INPUT_FILES>`__ \| |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \|                                |                                   |
| `ASYNCHRONOUS                     |                                   |
|  EVENTS <#ASYNCHRONOUS_EVENTS>`__ |                                   |
| \| `STDOUT <#STDOUT>`__ \|        |                                   |
| `STDERR <#STDERR>`__ \|           |                                   |
| `OUTPUT FILES <#OUTPUT_FILES>`__  |                                   |
| \|                                |                                   |
| `EXTENDED DESCR                   |                                   |
| IPTION <#EXTENDED_DESCRIPTION>`__ |                                   |
| \| `EXIT STATUS <#EXIT_STATUS>`__ |                                   |
| \|                                |                                   |
| `CONSEQUENCES OF ER               |                                   |
| RORS <#CONSEQUENCES_OF_ERRORS>`__ |                                   |
| \|                                |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `RATIONALE <#RATIONALE>`__ \|     |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ECHO(1P)                POSIX Programmer's Manual               ECHO(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          echo — write arguments to standard output


---------------------------------------------------------

::

          echo [string...]


---------------------------------------------------------------

::

          The echo utility writes its arguments to standard output,
          followed by a <newline>.  If there are no arguments, only the
          <newline> is written.


-------------------------------------------------------

::

          The echo utility shall not recognize the "--" argument in the
          manner specified by Guideline 10 of the Base Definitions volume
          of POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines; "--"
          shall be recognized as a string operand.

          Implementations shall not support any options.


---------------------------------------------------------

::

          The following operands shall be supported:

          string    A string to be written to standard output. If the first
                    operand is -n, or if any of the operands contain a
                    <backslash> character, the results are implementation-
                    defined.

                    On XSI-conformant systems, if the first operand is -n,
                    it shall be treated as a string, not an option. The
                    following character sequences shall be recognized on
                    XSI-conformant systems within any of the arguments:

                    \a      Write an <alert>.

                    \b      Write a <backspace>.

                    \c      Suppress the <newline> that otherwise follows
                            the final argument in the output. All
                            characters following the '\c' in the arguments
                            shall be ignored.

                    \f      Write a <form-feed>.

                    \n      Write a <newline>.

                    \r      Write a <carriage-return>.

                    \t      Write a <tab>.

                    \v      Write a <vertical-tab>.

                    \\      Write a <backslash> character.

                    \0num   Write an 8-bit value that is the zero, one,
                            two, or three-digit octal number num.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          echo:

          LANG      Provide a default value for the internationalization
                    variables that are unset or null. (See the Base
                    Definitions volume of POSIX.1‐2017, Section 8.2,
                    Internationalization Variables for the precedence of
                    internationalization variables used to determine the
                    values of locale categories.)

          LC_ALL    If set to a non-empty string value, override the values
                    of all the other internationalization variables.

          LC_CTYPE  Determine the locale for the interpretation of
                    sequences of bytes of text data as characters (for
                    example, single-byte as opposed to multi-byte
                    characters in arguments).

          LC_MESSAGES
                    Determine the locale that should be used to affect the
                    format and contents of diagnostic messages written to
                    standard error.

          NLSPATH   Determine the location of message catalogs for the
                    processing of LC_MESSAGES.


-------------------------------------------------------------------------------

::

          Default.


-----------------------------------------------------

::

          The echo utility arguments shall be separated by single <space>
          characters and a <newline> character shall follow the last
          argument.  Output transformations shall occur based on the escape
          sequences in the input. See the OPERANDS section.


-----------------------------------------------------

::

          The standard error shall be used only for diagnostic messages.


-----------------------------------------------------------------

::

          None.


---------------------------------------------------------------------------------

::

          None.


---------------------------------------------------------------

::

          The following exit values shall be returned:

           0    Successful completion.

          >0    An error occurred.


-------------------------------------------------------------------------------------

::

          Default.

          The following sections are informative.


---------------------------------------------------------------------------

::

          It is not possible to use echo portably across all POSIX systems
          unless both -n (as the first argument) and escape sequences are
          omitted.

          The printf utility can be used portably to emulate any of the
          traditional behaviors of the echo utility as follows (assuming
          that IFS has its standard value or is unset):

           *  The historic System V echo and the requirements on XSI
              implementations in this volume of POSIX.1‐2017 are equivalent
              to:

                  printf "%b\n$*"

           *  The BSD echo is equivalent to:

                  if [ "X$1" = "X-n" ]
                  then
                      shift
                      printf "%s$*"
                  else
                      printf "%s\n$*"
                  fi

          New applications are encouraged to use printf instead of echo.


---------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The echo utility has not been made obsolescent because of its
          extremely widespread use in historical applications. Conforming
          applications that wish to do prompting without <newline>
          characters or that could possibly be expecting to echo a -n,
          should use the printf utility derived from the Ninth Edition
          system.

          As specified, echo writes its arguments in the simplest of ways.
          The two different historical versions of echo vary in fatally
          incompatible ways.

          The BSD echo checks the first argument for the string -n which
          causes it to suppress the <newline> that would otherwise follow
          the final argument in the output.

          The System V echo does not support any options, but allows escape
          sequences within its operands, as described for XSI
          implementations in the OPERANDS section.

          The echo utility does not support Utility Syntax Guideline 10
          because historical applications depend on echo to echo all of its
          arguments, except for the -n option in the BSD version.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          printf(1p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 8,
          Environment Variables, Section 12.2, Utility Syntax Guidelines


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

   IEEE/The Open Group               2017                          ECHO(1P)

--------------

Pages that refer to this page: `printf(1p) <../man1/printf.1p.html>`__, 
`sh(1p) <../man1/sh.1p.html>`__,  `xargs(1p) <../man1/xargs.1p.html>`__

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
