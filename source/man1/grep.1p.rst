.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

grep(1p) — Linux manual page
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

   GREP(1P)                POSIX Programmer's Manual               GREP(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          grep — search a file for a pattern


---------------------------------------------------------

::

          grep [-E|-F] [-c|-l|-q] [-insvx] -e pattern_list
              [-e pattern_list]... [-f pattern_file]... [file...]

          grep [-E|-F] [-c|-l|-q] [-insvx] [-e pattern_list]...
              -f pattern_file [-f pattern_file]... [file...]

          grep [-E|-F] [-c|-l|-q] [-insvx] pattern_list [file...]


---------------------------------------------------------------

::

          The grep utility shall search the input files, selecting lines
          matching one or more patterns; the types of patterns are
          controlled by the options specified. The patterns are specified
          by the -e option, -f option, or the pattern_list operand. The
          pattern_list's value shall consist of one or more patterns
          separated by <newline> characters; the pattern_file's contents
          shall consist of one or more patterns terminated by a <newline>
          character. By default, an input line shall be selected if any
          pattern, treated as an entire basic regular expression (BRE) as
          described in the Base Definitions volume of POSIX.1‐2017, Section
          9.3, Basic Regular Expressions, matches any part of the line
          excluding the terminating <newline>; a null BRE shall match every
          line. By default, each selected input line shall be written to
          the standard output.

          Regular expression matching shall be based on text lines. Since a
          <newline> separates or terminates patterns (see the -e and -f
          options below), regular expressions cannot contain a <newline>.
          Similarly, since patterns are matched against individual lines
          (excluding the terminating <newline> characters) of the input,
          there is no way for a pattern to match a <newline> found in the
          input.


-------------------------------------------------------

::

          The grep utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following options shall be supported:

          -E        Match using extended regular expressions.  Treat each
                    pattern specified as an ERE, as described in the Base
                    Definitions volume of POSIX.1‐2017, Section 9.4,
                    Extended Regular Expressions.  If any entire ERE
                    pattern matches some part of an input line excluding
                    the terminating <newline>, the line shall be matched. A
                    null ERE shall match every line.

          -F        Match using fixed strings. Treat each pattern specified
                    as a string instead of a regular expression. If an
                    input line contains any of the patterns as a contiguous
                    sequence of bytes, the line shall be matched.  A null
                    string shall match every line.

          -c        Write only a count of selected lines to standard
                    output.

          -e pattern_list
                    Specify one or more patterns to be used during the
                    search for input.  The application shall ensure that
                    patterns in pattern_list are separated by a <newline>.
                    A null pattern can be specified by two adjacent
                    <newline> characters in pattern_list.  Unless the -E or
                    -F option is also specified, each pattern shall be
                    treated as a BRE, as described in the Base Definitions
                    volume of POSIX.1‐2017, Section 9.3, Basic Regular
                    Expressions.  Multiple -e and -f options shall be
                    accepted by the grep utility. All of the specified
                    patterns shall be used when matching lines, but the
                    order of evaluation is unspecified.

          -f pattern_file
                    Read one or more patterns from the file named by the
                    pathname pattern_file.  Patterns in pattern_file shall
                    be terminated by a <newline>.  A null pattern can be
                    specified by an empty line in pattern_file.  Unless the
                    -E or -F option is also specified, each pattern shall
                    be treated as a BRE, as described in the Base
                    Definitions volume of POSIX.1‐2017, Section 9.3, Basic
                    Regular Expressions.

          -i        Perform pattern matching in searches without regard to
                    case; see the Base Definitions volume of POSIX.1‐2017,
                    Section 9.2, Regular Expression General Requirements.

          -l        (The letter ell.) Write only the names of files
                    containing selected lines to standard output. Pathnames
                    shall be written once per file searched. If the
                    standard input is searched, a pathname of
                    "(standardinput)" shall be written, in the POSIX
                    locale. In other locales, "standardinput" may be
                    replaced by something more appropriate in those
                    locales.

          -n        Precede each output line by its relative line number in
                    the file, each file starting at line 1. The line number
                    counter shall be reset for each file processed.

          -q        Quiet. Nothing shall be written to the standard output,
                    regardless of matching lines. Exit with zero status if
                    an input line is selected.

          -s        Suppress the error messages ordinarily written for
                    nonexistent or unreadable files. Other error messages
                    shall not be suppressed.

          -v        Select lines not matching any of the specified
                    patterns. If the -v option is not specified, selected
                    lines shall be those that match any of the specified
                    patterns.

          -x        Consider only input lines that use all characters in
                    the line excluding the terminating <newline> to match
                    an entire fixed string or regular expression to be
                    matching lines.


---------------------------------------------------------

::

          The following operands shall be supported:

          pattern_list
                    Specify one or more patterns to be used during the
                    search for input.  This operand shall be treated as if
                    it were specified as -e pattern_list.

          file      A pathname of a file to be searched for the patterns.
                    If no file operands are specified, the standard input
                    shall be used.


---------------------------------------------------

::

          The standard input shall be used if no file operands are
          specified, and shall be used if a file operand is '-' and the
          implementation treats the '-' as meaning standard input.
          Otherwise, the standard input shall not be used.  See the INPUT
          FILES section.


---------------------------------------------------------------

::

          The input files shall be text files.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          grep:

          LANG      Provide a default value for the internationalization
                    variables that are unset or null. (See the Base
                    Definitions volume of POSIX.1‐2017, Section 8.2,
                    Internationalization Variables for the precedence of
                    internationalization variables used to determine the
                    values of locale categories.)

          LC_ALL    If set to a non-empty string value, override the values
                    of all the other internationalization variables.

          LC_COLLATE
                    Determine the locale for the behavior of ranges,
                    equivalence classes, and multi-character collating
                    elements within regular expressions.

          LC_CTYPE  Determine the locale for the interpretation of
                    sequences of bytes of text data as characters (for
                    example, single-byte as opposed to multi-byte
                    characters in arguments and input files) and the
                    behavior of character classes within regular
                    expressions.

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

          If the -l option is in effect, the following shall be written for
          each file containing at least one selected input line:

              "%s\n", <file>

          Otherwise, if more than one file argument appears, and -q is not
          specified, the grep utility shall prefix each output line by:

              "%s:", <file>

          The remainder of each output line shall depend on the other
          options specified:

           *  If the -c option is in effect, the remainder of each output
              line shall contain:

                  "%d\n", <count>

           *  Otherwise, if -c is not in effect and the -n option is in
              effect, the following shall be written to standard output:

                  "%d:", <line number>

           *  Finally, the following shall be written to standard output:

                  "%s", <selected-line contents>


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

           0    One or more lines were selected.

           1    No lines were selected.

          >1    An error occurred.


-------------------------------------------------------------------------------------

::

          If the -q option is specified, the exit status shall be zero if
          an input line is selected, even if an error was detected.
          Otherwise, default actions shall be performed.

          The following sections are informative.


---------------------------------------------------------------------------

::

          Care should be taken when using characters in pattern_list that
          may also be meaningful to the command interpreter. It is safest
          to enclose the entire pattern_list argument in single-quotes:

              '...'

          The -e pattern_list option has the same effect as the
          pattern_list operand, but is useful when pattern_list begins with
          the <hyphen-minus> delimiter. It is also useful when it is more
          convenient to provide multiple patterns as separate arguments.

          Multiple -e and -f options are accepted and grep uses all of the
          patterns it is given while matching input text lines.  (Note that
          the order of evaluation is not specified. If an implementation
          finds a null string as a pattern, it is allowed to use that
          pattern first, matching every line, and effectively ignore any
          other patterns.)

          The -q option provides a means of easily determining whether or
          not a pattern (or string) exists in a group of files. When
          searching several files, it provides a performance improvement
          (because it can quit as soon as it finds the first match) and
          requires less care by the user in choosing the set of files to
          supply as arguments (because it exits zero if it finds a match
          even if grep detected an access or read error on earlier file
          operands).

          When using grep to process pathnames, it is recommended that
          LC_ALL, or at least LC_CTYPE and LC_COLLATE, are set to POSIX or
          C in the environment, since pathnames can contain byte sequences
          that do not form valid characters in some locales, in which case
          the utility's behavior would be undefined. In the POSIX locale
          each byte is a valid single-byte character, and therefore this
          problem is avoided.


---------------------------------------------------------

::

           1. To find all uses of the word "Posix" (in any case) in file
              text.mm and write with line numbers:

                  grep -i -n posix text.mm

           2. To find all empty lines in the standard input:

                  grep ^$

              or:

                  grep -v .

           3. Both of the following commands print all lines containing
              strings "abc" or "def" or both:

                  grep -E 'abc|def'

                  grep -F 'abc
                  def'

           4. Both of the following commands print all lines matching
              exactly "abc" or "def":

                  grep -E '^abc$|^def$'

                  grep -F -x 'abc
                  def'


-----------------------------------------------------------

::

          This grep has been enhanced in an upwards-compatible way to
          provide the exact functionality of the historical egrep and fgrep
          commands as well. It was the clear intention of the standard
          developers to consolidate the three greps into a single command.

          The old egrep and fgrep commands are likely to be supported for
          many years to come as implementation extensions, allowing
          historical applications to operate unmodified.

          Historical implementations usually silently ignored all but one
          of multiply-specified -e and -f options, but were not consistent
          as to which specification was actually used.

          The -b option was omitted from the OPTIONS section because block
          numbers are implementation-defined.

          The System V restriction on using - to mean standard input was
          omitted.

          A definition of action taken when given a null BRE or ERE is
          specified.  This is an error condition in some historical
          implementations.

          The -l option previously indicated that its use was undefined
          when no files were explicitly named. This behavior was historical
          and placed an unnecessary restriction on future implementations.
          It has been removed.

          The historical BSD grep -s option practice is easily duplicated
          by redirecting standard output to /dev/null.  The -s option
          required here is from System V.

          The -x option, historically available only with fgrep, is
          available here for all of the non-obsolescent versions.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          sed(1p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 8,
          Environment Variables, Chapter 9, Regular Expressions, Section
          12.2, Utility Syntax Guidelines


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

   IEEE/The Open Group               2017                          GREP(1P)

--------------

Pages that refer to this page: `awk(1p) <../man1/awk.1p.html>`__, 
`cut(1p) <../man1/cut.1p.html>`__, 
`paste(1p) <../man1/paste.1p.html>`__, 
`sed(1p) <../man1/sed.1p.html>`__

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
