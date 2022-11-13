.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

paste(1p) — Linux manual page
=============================

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

   PASTE(1P)               POSIX Programmer's Manual              PASTE(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          paste — merge corresponding or subsequent lines of files


---------------------------------------------------------

::

          paste [-s] [-d list] file...


---------------------------------------------------------------

::

          The paste utility shall concatenate the corresponding lines of
          the given input files, and write the resulting lines to standard
          output.

          The default operation of paste shall concatenate the
          corresponding lines of the input files. The <newline> of every
          line except the line from the last input file shall be replaced
          with a <tab>.

          If an end-of-file condition is detected on one or more input
          files, but not all input files, paste shall behave as though
          empty lines were read from the files on which end-of-file was
          detected, unless the -s option is specified.


-------------------------------------------------------

::

          The paste utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following options shall be supported:

          -d list   Unless a <backslash> character appears in list, each
                    character in list is an element specifying a delimiter
                    character. If a <backslash> character appears in list,
                    the <backslash> character and one or more characters
                    following it are an element specifying a delimiter
                    character as described below. These elements specify
                    one or more delimiters to use, instead of the default
                    <tab>, to replace the <newline> of the input lines. The
                    elements in list shall be used circularly; that is,
                    when the list is exhausted the first element from the
                    list is reused. When the -s option is specified:

                     *  The last <newline> in a file shall not be modified.

                     *  The delimiter shall be reset to the first element
                        of list after each file operand is processed.

                    When the -s option is not specified:

                     *  The <newline> characters in the file specified by
                        the last file operand shall not be modified.

                     *  The delimiter shall be reset to the first element
                        of list each time a line is processed from each
                        file.

                    If a <backslash> character appears in list, it and the
                    character following it shall be used to represent the
                    following delimiter characters:

                    \n    <newline>.

                    \t    <tab>.

                    \\    <backslash> character.

                    \0    Empty string (not a null character). If '\0' is
                          immediately followed by the character 'x', the
                          character 'X', or any character defined by the
                          LC_CTYPE digit keyword (see the Base Definitions
                          volume of POSIX.1‐2017, Chapter 7, Locale), the
                          results are unspecified.

                    If any other characters follow the <backslash>, the
                    results are unspecified.

          -s        Concatenate all of the lines from each input file into
                    one line of output per file, in command line order. The
                    <newline> of every line except the last line in each
                    input file shall be replaced with a <tab>, unless
                    otherwise specified by the -d option. If an input file
                    is empty, the output line corresponding to that file
                    shall consist of only a <newline> character.


---------------------------------------------------------

::

          The following operand shall be supported:

          file      A pathname of an input file. If '-' is specified for
                    one or more of the files, the standard input shall be
                    used; the standard input shall be read one line at a
                    time, circularly, for each instance of '-'.
                    Implementations shall support pasting of at least 12
                    file operands.


---------------------------------------------------

::

          The standard input shall be used only if one or more file
          operands is '-'.  See the INPUT FILES section.


---------------------------------------------------------------

::

          The input files shall be text files, except that line lengths
          shall be unlimited.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          paste:

          LANG      Provide a default value for the internationalization
                    variables that are unset or null. (See the Base
                    Definitions volume of POSIX.1‐2017, Section 8.2,
                    Internationalization Variables the precedence of
                    internationalization variables used to determine the
                    values of locale categories.)

          LC_ALL    If set to a non-empty string value, override the values
                    of all the other internationalization variables.

          LC_CTYPE  Determine the locale for the interpretation of
                    sequences of bytes of text data as characters (for
                    example, single-byte as opposed to multi-byte
                    characters in arguments and input files).

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

          Concatenated lines of input files shall be separated by the <tab>
          (or other characters under the control of the -d option) and
          terminated by a <newline>.


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

          If one or more input files cannot be opened when the -s option is
          not specified, a diagnostic message shall be written to standard
          error, but no output is written to standard output. If the -s
          option is specified, the paste utility shall provide the default
          behavior described in Section 1.4, Utility Description Defaults.

          The following sections are informative.


---------------------------------------------------------------------------

::

          When the escape sequences of the list option-argument are used in
          a shell script, they must be quoted; otherwise, the shell treats
          the <backslash> as a special character.

          Conforming applications should only use the specific
          <backslash>-escaped delimiters presented in this volume of
          POSIX.1‐2017. Historical implementations treat '\x', where 'x' is
          not in this list, as 'x', but future implementations are free to
          expand this list to recognize other common escapes similar to
          those accepted by printf and other standard utilities.

          Most of the standard utilities work on text files. The cut
          utility can be used to turn files with arbitrary line lengths
          into a set of text files containing the same data. The paste
          utility can be used to create (or recreate) files with arbitrary
          line lengths. For example, if file contains long lines:

              cut -b 1-500 -n file > file1
              cut -b 501- -n file > file2

          creates file1 (a text file) with lines no longer than 500 bytes
          (plus the <newline>) and file2 that contains the remainder of the
          data from file.  Note that file2 is not a text file if there are
          lines in file that are longer than 500 + {LINE_MAX} bytes. The
          original file can be recreated from file1 and file2 using the
          command:

              paste -d "\0" file1 file2 > file

          The commands:

              paste -d "\0" ...
              paste -d "" ...

          are not necessarily equivalent; the latter is not specified by
          this volume of POSIX.1‐2017 and may result in an error. The
          construct '\0' is used to mean ``no separator'' because
          historical versions of paste did not follow the syntax
          guidelines, and the command:

              paste -d"" ...

          could not be handled properly by getopt().


---------------------------------------------------------

::

           1. Write out a directory in four columns:

                  ls | paste - - - -

           2. Combine pairs of lines from a file into single lines:

                  paste -s -d "\t\n" file


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 1.4, Utility Description Defaults, cut(1p), grep(1p),
          pr(1p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 7, Locale,
          Chapter 8, Environment Variables, Section 12.2, Utility Syntax
          Guidelines


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

   IEEE/The Open Group               2017                         PASTE(1P)

--------------

Pages that refer to this page: `cut(1p) <../man1/cut.1p.html>`__

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
