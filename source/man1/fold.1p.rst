.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fold(1p) — Linux manual page
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

   FOLD(1P)                POSIX Programmer's Manual               FOLD(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          fold — filter for folding lines


---------------------------------------------------------

::

          fold [-bs] [-w width] [file...]


---------------------------------------------------------------

::

          The fold utility is a filter that shall fold lines from its input
          files, breaking the lines to have a maximum of width column
          positions (or bytes, if the -b option is specified). Lines shall
          be broken by the insertion of a <newline> such that each output
          line (referred to later in this section as a segment) is the
          maximum width possible that does not exceed the specified number
          of column positions (or bytes). A line shall not be broken in the
          middle of a character. The behavior is undefined if width is less
          than the number of columns any single character in the input
          would occupy.

          If the <carriage-return>, <backspace>, or <tab> characters are
          encountered in the input, and the -b option is not specified,
          they shall be treated specially:

          <backspace>
                    The current count of line width shall be decremented by
                    one, although the count never shall become negative.
                    The fold utility shall not insert a <newline>
                    immediately before or after any <backspace>, unless the
                    following character has a width greater than 1 and
                    would cause the line width to exceed width.

          <carriage-return>
                    The current count of line width shall be set to zero.
                    The fold utility shall not insert a <newline>
                    immediately before or after any <carriage-return>.

          <tab>     Each <tab> encountered shall advance the column
                    position pointer to the next tab stop. Tab stops shall
                    be at each column position n such that n modulo 8
                    equals 1.


-------------------------------------------------------

::

          The fold utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following options shall be supported:

          -b        Count width in bytes rather than column positions.

          -s        If a segment of a line contains a <blank> within the
                    first width column positions (or bytes), break the line
                    after the last such <blank> meeting the width
                    constraints. If there is no <blank> meeting the
                    requirements, the -s option shall have no effect for
                    that output segment of the input line.

          -w width  Specify the maximum line length, in column positions
                    (or bytes if -b is specified). The results are
                    unspecified if width is not a positive decimal number.
                    The default value shall be 80.


---------------------------------------------------------

::

          The following operand shall be supported:

          file      A pathname of a text file to be folded. If no file
                    operands are specified, the standard input shall be
                    used.


---------------------------------------------------

::

          The standard input shall be used if no file operands are
          specified, and shall be used if a file operand is '-' and the
          implementation treats the '-' as meaning standard input.
          Otherwise, the standard input shall not be used.  See the INPUT
          FILES section.


---------------------------------------------------------------

::

          If the -b option is specified, the input files shall be text
          files except that the lines are not limited to {LINE_MAX} bytes
          in length. If the -b option is not specified, the input files
          shall be text files.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          fold:

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
                    characters in arguments and input files), and for the
                    determination of the width in column positions each
                    character would occupy on a constant-width font output
                    device.

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

          The standard output shall be a file containing a sequence of
          characters whose order shall be preserved from the input files,
          possibly with inserted <newline> characters.


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

           0    All input files were processed successfully.

          >0    An error occurred.


-------------------------------------------------------------------------------------

::

          Default.

          The following sections are informative.


---------------------------------------------------------------------------

::

          The cut and fold utilities can be used to create text files out
          of files with arbitrary line lengths. The cut utility should be
          used when the number of lines (or records) needs to remain
          constant. The fold utility should be used when the contents of
          long lines need to be kept contiguous.

          The fold utility is frequently used to send text files to
          printers that truncate, rather than fold, lines wider than the
          printer is able to print (usually 80 or 132 column positions).


---------------------------------------------------------

::

          An example invocation that submits a file of possibly long lines
          to the printer (under the assumption that the user knows the line
          width of the printer to be assigned by lp):

              fold -w 132 bigfile | lp


-----------------------------------------------------------

::

          Although terminal input in canonical processing mode requires the
          erase character (frequently set to <backspace>) to erase the
          previous character (not byte or column position), terminal output
          is not buffered and is extremely difficult, if not impossible, to
          parse correctly; the interpretation depends entirely on the
          physical device that actually displays/prints/stores the output.
          In all known internationalized implementations, the utilities
          producing output for mixed column-width output assume that a
          <backspace> character backs up one column position and outputs
          enough <backspace> characters to return to the start of the
          character when <backspace> is used to provide local line motions
          to support underlining and emboldening operations. Since fold
          without the -b option is dealing with these same constraints,
          <backspace> is always treated as backing up one column position
          rather than backing up one character.

          Historical versions of the fold utility assumed 1 byte was one
          character and occupied one column position when written out. This
          is no longer always true. Since the most common usage of fold is
          believed to be folding long lines for output to limited-length
          output devices, this capability was preserved as the default
          case. The -b option was added so that applications could fold
          files with arbitrary length lines into text files that could then
          be processed by the standard utilities. Note that although the
          width for the -b option is in bytes, a line is never split in the
          middle of a character.  (It is unspecified what happens if a
          width is specified that is too small to hold a single character
          found in the input followed by a <newline>.)

          The tab stops are hardcoded to be every eighth column to meet
          historical practice. No new method of specifying other tab stops
          was invented.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          cut(1p)

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

   IEEE/The Open Group               2017                          FOLD(1P)

--------------

Pages that refer to this page: `cut(1p) <../man1/cut.1p.html>`__, 
`id(1p) <../man1/id.1p.html>`__

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
