.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cat(1p) — Linux manual page
===========================

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

   CAT(1P)                 POSIX Programmer's Manual                CAT(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          cat — concatenate and print files


---------------------------------------------------------

::

          cat [-u] [file...]


---------------------------------------------------------------

::

          The cat utility shall read files in sequence and shall write
          their contents to the standard output in the same sequence.


-------------------------------------------------------

::

          The cat utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following option shall be supported:

          -u        Write bytes from the input file to the standard output
                    without delay as each is read.


---------------------------------------------------------

::

          The following operand shall be supported:

          file      A pathname of an input file. If no file operands are
                    specified, the standard input shall be used. If a file
                    is '-', the cat utility shall read from the standard
                    input at that point in the sequence. The cat utility
                    shall not close and reopen standard input when it is
                    referenced in this way, but shall accept multiple
                    occurrences of '-' as a file operand.


---------------------------------------------------

::

          The standard input shall be used only if no file operands are
          specified, or if a file operand is '-'.  See the INPUT FILES
          section.


---------------------------------------------------------------

::

          The input files can be any file type.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          cat:

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

          The standard output shall contain the sequence of bytes read from
          the input files. Nothing else shall be written to the standard
          output.  If the standard output is a regular file, and is the
          same file as any of the input file operands, the implementation
          may treat this as an error.


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

           0    All input files were output successfully.

          >0    An error occurred.


-------------------------------------------------------------------------------------

::

          Default.

          The following sections are informative.


---------------------------------------------------------------------------

::

          The -u option has value in prototyping non-blocking reads from
          FIFOs. The intent is to support the following sequence:

              mkfifo foo
              cat -u foo > /dev/tty13 &
              cat -u > foo

          It is unspecified whether standard output is or is not buffered
          in the default case. This is sometimes of interest when standard
          output is associated with a terminal, since buffering may delay
          the output. The presence of the -u option guarantees that
          unbuffered I/O is available. It is implementation-defined whether
          the cat utility buffers output if the -u option is not specified.
          Traditionally, the -u option is implemented using the equivalent
          of the setvbuf() function defined in the System Interfaces volume
          of POSIX.1‐2017.


---------------------------------------------------------

::

          The following command:

              cat myfile

          writes the contents of the file myfile to standard output.

          The following command:

              cat doc1 doc2 > doc.all

          concatenates the files doc1 and doc2 and writes the result to
          doc.all.

          Because of the shell language mechanism used to perform output
          redirection, a command such as this:

              cat doc doc.end > doc

          causes the original data in doc to be lost before cat even begins
          execution. This is true whether the cat command fails with an
          error or silently succeeds (the specification allows both
          behaviors). In order to append the contents of doc.end without
          losing the original contents of doc, this command should be used
          instead:

              cat doc.end >> doc

          The command:

              cat start - middle - end > file

          when standard input is a terminal, gets two arbitrary pieces of
          input from the terminal with a single invocation of cat.  Note,
          however, that if standard input is a regular file, this would be
          equivalent to the command:

              cat start - middle /dev/null end > file

          because the entire contents of the file would be consumed by cat
          the first time '-' was used as a file operand and an end-of-file
          condition would be detected immediately when '-' was referenced
          the second time.


-----------------------------------------------------------

::

          Historical versions of the cat utility include the -e, -t, and
          -v, options which permit the ends of lines, <tab> characters, and
          invisible characters, respectively, to be rendered visible in the
          output. The standard developers omitted these options because
          they provide too fine a degree of control over what is made
          visible, and similar output can be obtained using a command such
          as:

              sed -n l pathname

          The latter also has the advantage that its output is unambiguous,
          whereas the output of historical cat -etv is not.

          The -s option was omitted because it corresponds to different
          functions in BSD and System V-based systems. The BSD -s option to
          squeeze blank lines can be accomplished by the shell script shown
          in the following example:

              sed -n '
              # Write non-empty lines.
              /./   {
                    p
                    d
                    }
              # Write a single empty line, then look for more empty lines.
              /^$/  p
              # Get next line, discard the held <newline> (empty line),
              # and look for more empty lines.
              :Empty
              /^$/  {
                    N
                    s/.//
                    b Empty
                    }
              # Write the non-empty line before going back to search
              # for the first in a set of empty lines.
                    p
              '

          The System V -s option to silence error messages can be
          accomplished by redirecting the standard error. Note that the BSD
          documentation for cat uses the term ``blank line'' to mean the
          same as the POSIX ``empty line'': a line consisting only of a
          <newline>.

          The BSD -n option was omitted because similar functionality can
          be obtained from the -n option of the pr utility.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          more(1p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 8,
          Environment Variables, Section 12.2, Utility Syntax Guidelines

          The System Interfaces volume of POSIX.1‐2017, setvbuf(3p)


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

   IEEE/The Open Group               2017                           CAT(1P)

--------------

Pages that refer to this page: `tee(1p) <../man1/tee.1p.html>`__

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
