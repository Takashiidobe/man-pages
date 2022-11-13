.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cflow(1p) — Linux manual page
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

   CFLOW(1P)               POSIX Programmer's Manual              CFLOW(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          cflow — generate a C-language flowgraph (DEVELOPMENT)


---------------------------------------------------------

::

          cflow [-r] [-d num] [-D name[=def]]... [-i incl] [-I dir]...
              [-U dir]... file...


---------------------------------------------------------------

::

          The cflow utility shall analyze a collection of object files or
          assembler, C-language, lex, or yacc source files, and attempt to
          build a graph, written to standard output, charting the external
          references.


-------------------------------------------------------

::

          The cflow utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines, except
          that the order of the -D, -I, and -U options (which are identical
          to their interpretation by c99) is significant.

          The following options shall be supported:

          -d num    Indicate the depth at which the flowgraph is cut off.
                    The application shall ensure that the argument num is a
                    decimal integer. By default this is a very large number
                    (typically greater than 32000). Attempts to set the
                    cut-off depth to a non-positive integer shall be
                    ignored.

          -i incl   Increase the number of included symbols. The incl
                    option-argument is one of the following characters:

                    x     Include external and static data symbols. The
                          default shall be to include only functions in the
                          flowgraph.

                    _     (Underscore) Include names that begin with an
                          <underscore>.  The default shall be to exclude
                          these functions (and data if -i x is used).

          -r        Reverse the caller:callee relationship, producing an
                    inverted listing showing the callers of each function.
                    The listing shall also be sorted in lexicographical
                    order by callee.


---------------------------------------------------------

::

          The following operand is supported:

          file      The pathname of a file for which a graph is to be
                    generated.  Filenames suffixed by .l shall shall be
                    taken to be lex input, .y as yacc input, .c as c99
                    input, and .i as the output of c99 -E.  Such files
                    shall be processed as appropriate, determined by their
                    suffix.

                    Files suffixed by .s (conventionally assembler source)
                    may have more limited information extracted from them.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          The input files shall be object files or assembler, C-language,
          lex, or yacc source files.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          cflow:

          LANG      Provide a default value for the internationalization
                    variables that are unset or null. (See the Base
                    Definitions volume of POSIX.1‐2017, Section 8.2,
                    Internationalization Variables for the precedence of
                    internationalization variables used to determine the
                    values of locale categories.)

          LC_ALL    If set to a non-empty string value, override the values
                    of all the other internationalization variables.

          LC_COLLATE
                    Determine the locale for the ordering of the output
                    when the -r option is used.

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

          The flowgraph written to standard output shall be formatted as
          follows:

              "%d %s:%s\n", <reference number>, <global>, <definition>

          Each line of output begins with a reference (that is, line)
          number, followed by indentation of at least one column position
          per level.  This is followed by the name of the global, a
          <colon>, and its definition. Normally globals are only functions
          not defined as an external or beginning with an <underscore>; see
          the OPTIONS section for the -i inclusion option. For information
          extracted from C-language source, the definition consists of an
          abstract type declaration (for example, char *) and, delimited by
          angle brackets, the name of the source file and the line number
          where the definition was found. Definitions extracted from object
          files indicate the filename and location counter under which the
          symbol appeared (for example, text).

          Once a definition of a name has been written, subsequent
          references to that name contain only the reference number of the
          line where the definition can be found. For undefined references,
          only "<>" shall be written.


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

          Files produced by lex and yacc cause the reordering of line
          number declarations, and this can confuse cflow.  To obtain
          proper results, the input of yacc or lex must be directed to
          cflow.


---------------------------------------------------------

::

          Given the following in file.c:

              int i;
              int f();
              int g();
              int h();
              int
              main()
              {
                  f();
                  g();
                  f();
              }
              int
              f()
              {
                  i = h();
              }

          The command:

              cflow -i x file.c

          produces the output:

              1 main: int(), <file.c 6>
              2    f: int(), <file.c 13>
              3        h: <>
              4        i: int, <file.c 1>
              5    g: <>


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          c99(1p), lex(1p), yacc(1p)

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

   IEEE/The Open Group               2017                         CFLOW(1P)

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
