.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strings(1p) — Linux manual page
===============================

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

   STRINGS(1P)             POSIX Programmer's Manual            STRINGS(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          strings — find printable strings in files


---------------------------------------------------------

::

          strings [-a] [-t format] [-n number] [file...]


---------------------------------------------------------------

::

          The strings utility shall look for printable strings in regular
          files and shall write those strings to standard output. A
          printable string is any sequence of four (by default) or more
          printable characters terminated by a <newline> or NUL character.
          Additional implementation-defined strings may be written; see
          localedef.

          If the first argument is '-', the results are unspecified.


-------------------------------------------------------

::

          The strings utility shall conform to the Base Definitions volume
          of POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines, except
          for the unspecified usage of '-'.

          The following options shall be supported:

          -a        Scan files in their entirety. If -a is not specified,
                    it is implementation-defined what portion of each file
                    is scanned for strings.

          -n number Specify the minimum string length, where the number
                    argument is a positive decimal integer. The default
                    shall be 4.

          -t format Write each string preceded by its byte offset from the
                    start of the file. The format shall be dependent on the
                    single character used as the format option-argument:

                    d     The offset shall be written in decimal.

                    o     The offset shall be written in octal.

                    x     The offset shall be written in hexadecimal.


---------------------------------------------------------

::

          The following operand shall be supported:

          file      A pathname of a regular file to be used as input. If no
                    file operand is specified, the strings utility shall
                    read from the standard input.


---------------------------------------------------

::

          See the INPUT FILES section.


---------------------------------------------------------------

::

          The input files named by the utility arguments or the standard
          input shall be regular files of any format.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          strings:

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
                    characters in arguments and input files) and to
                    identify printable strings.

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

          Strings found shall be written to the standard output, one per
          line.

          When the -t option is not specified, the format of the output
          shall be:

              "%s", <string>

          With the -t o option, the format of the output shall be:

              "%o %s", <byte offset>, <string>

          With the -t x option, the format of the output shall be:

              "%x %s", <byte offset>, <string>

          With the -t d option, the format of the output shall be:

              "%d %s", <byte offset>, <string>


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

          By default the data area (as opposed to the text, ``bss'', or
          header areas) of a binary executable file is scanned.
          Implementations document which areas are scanned.

          Some historical implementations do not require NUL or <newline>
          terminators for strings to permit those languages that do not use
          NUL as a string terminator to have their strings written.


---------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          Apart from rationalizing the option syntax and slight
          difficulties with object and executable binary files, strings is
          specified to match historical practice closely. The -a and -n
          options were introduced to replace the non-conforming - and
          -number options. These options are no longer specified by
          POSIX.1‐2008 but may be present in some implementations.

          The -o option historically means different things on different
          implementations. Some use it to mean ``offset in decimal'', while
          others use it as ``offset in octal''. Instead of trying to decide
          which way would be least objectionable, the -t option was added.
          It was originally named -O to mean ``offset'', but was changed to
          -t to be consistent with od.

          The ISO C standard function isprint() is restricted to a domain
          of unsigned char.  This volume of POSIX.1‐2017 requires
          implementations to write strings as defined by the current
          locale.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          localedef(1p), nm(1p)

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

   IEEE/The Open Group               2017                       STRINGS(1P)

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
