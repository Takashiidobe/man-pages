.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

read(1p) — Linux manual page
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

   READ(1P)                POSIX Programmer's Manual               READ(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          read — read from standard input into shell variables


---------------------------------------------------------

::

          read [-r] var...


---------------------------------------------------------------

::

          The read utility shall read a single logical line from standard
          input into one or more shell variables.

          By default, unless the -r option is specified, <backslash> shall
          act as an escape character. An unescaped <backslash> shall
          preserve the literal value of the following character, with the
          exception of a <newline>.  If a <newline> follows the
          <backslash>, the read utility shall interpret this as line
          continuation. The <backslash> and <newline> shall be removed
          before splitting the input into fields. All other unescaped
          <backslash> characters shall be removed after splitting the input
          into fields.

          If standard input is a terminal device and the invoking shell is
          interactive, read shall prompt for a continuation line when it
          reads an input line ending with a <backslash> <newline>, unless
          the -r option is specified.

          The terminating <newline> (if any) shall be removed from the
          input and the results shall be split into fields as in the shell
          for the results of parameter expansion (see Section 2.6.5, Field
          Splitting); the first field shall be assigned to the first
          variable var, the second field to the second variable var, and so
          on. If there are fewer fields than there are var operands, the
          remaining vars shall be set to empty strings. If there are fewer
          vars than fields, the last var shall be set to a value comprising
          the following elements:

           *  The field that corresponds to the last var in the normal
              assignment sequence described above

           *  The delimiter(s) that follow the field corresponding to the
              last var

           *  The remaining fields and their delimiters, with trailing IFS
              white space ignored

          The setting of variables specified by the var operands shall
          affect the current shell execution environment; see Section 2.12,
          Shell Execution Environment.  If it is called in a subshell or
          separate utility execution environment, such as one of the
          following:

              (read foo)
              nohup read ...
              find . -exec read ... \;

          it shall not affect the shell variables in the caller's
          environment.


-------------------------------------------------------

::

          The read utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following option is supported:

          -r        Do not treat a <backslash> character in any special
                    way. Consider each <backslash> to be part of the input
                    line.


---------------------------------------------------------

::

          The following operand shall be supported:

          var       The name of an existing or nonexisting shell variable.


---------------------------------------------------

::

          The standard input shall be a text file.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          read:

          IFS       Determine the internal field separators used to delimit
                    fields; see Section 2.5.3, Shell Variables.

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

          PS2       Provide the prompt string that an interactive shell
                    shall write to standard error when a line ending with a
                    <backslash> <newline> is read and the -r option was not
                    specified.


-------------------------------------------------------------------------------

::

          Default.


-----------------------------------------------------

::

          Not used.


-----------------------------------------------------

::

          The standard error shall be used for diagnostic messages and
          prompts for continued input.


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

          >0    End-of-file was detected or an error occurred.


-------------------------------------------------------------------------------------

::

          Default.

          The following sections are informative.


---------------------------------------------------------------------------

::

          The -r option is included to enable read to subsume the purpose
          of the line utility, which is not included in POSIX.1‐2008.


---------------------------------------------------------

::

          The following command:

              while read -r xx yy
              do
                  printf "%s %s\n$yy$xx"
              done < input_file

          prints a file with the first field of each line moved to the end
          of the line.


-----------------------------------------------------------

::

          The read utility historically has been a shell built-in. It was
          separated off into its own utility to take advantage of the
          richer description of functionality introduced by this volume of
          POSIX.1‐2017.

          Since read affects the current shell execution environment, it is
          generally provided as a shell regular built-in. If it is called
          in a subshell or separate utility execution environment, such as
          one of the following:

              (read foo)
              nohup read ...
              find . -exec read ... \;

          it does not affect the shell variables in the environment of the
          caller.

          Although the standard input is required to be a text file, and
          therefore will always end with a <newline> (unless it is an empty
          file), the processing of continuation lines when the -r option is
          not used can result in the input not ending with a <newline>.
          This occurs if the last line of the input file ends with a
          <backslash> <newline>.  It is for this reason that ``if any'' is
          used in ``The terminating <newline> (if any) shall be removed
          from the input'' in the description.  It is not a relaxation of
          the requirement for standard input to be a text file.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Chapter 2, Shell Command Language

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

   IEEE/The Open Group               2017                          READ(1P)

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
