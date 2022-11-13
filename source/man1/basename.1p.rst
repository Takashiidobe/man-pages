.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

basename(1p) — Linux manual page
================================

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

   BASENAME(1P)            POSIX Programmer's Manual           BASENAME(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          basename — return non-directory portion of a pathname


---------------------------------------------------------

::

          basename string [suffix]


---------------------------------------------------------------

::

          The string operand shall be treated as a pathname, as defined in
          the Base Definitions volume of POSIX.1‐2017, Section 3.271,
          Pathname.  The string string shall be converted to the filename
          corresponding to the last pathname component in string and then
          the suffix string suffix, if present, shall be removed. This
          shall be done by performing actions equivalent to the following
          steps in order:

           1. If string is a null string, it is unspecified whether the
              resulting string is '.'  or a null string. In either case,
              skip steps 2 through 6.

           2. If string is "//", it is implementation-defined whether steps
              3 to 6 are skipped or processed.

           3. If string consists entirely of <slash> characters, string
              shall be set to a single <slash> character. In this case,
              skip steps 4 to 6.

           4. If there are any trailing <slash> characters in string, they
              shall be removed.

           5. If there are any <slash> characters remaining in string, the
              prefix of string up to and including the last <slash>
              character in string shall be removed.

           6. If the suffix operand is present, is not identical to the
              characters remaining in string, and is identical to a suffix
              of the characters remaining in string, the suffix suffix
              shall be removed from string.  Otherwise, string is not
              modified by this step. It shall not be considered an error if
              suffix is not found in string.

          The resulting string shall be written to standard output.


-------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          The following operands shall be supported:

          string    A string.

          suffix    A string.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          basename:

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

          The basename utility shall write a line to the standard output in
          the following format:

              "%s\n", <resulting string>


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

          The definition of pathname specifies implementation-defined
          behavior for pathnames starting with two <slash> characters.
          Therefore, applications shall not arbitrarily add <slash>
          characters to the beginning of a pathname unless they can ensure
          that there are more or less than two or are prepared to deal with
          the implementation-defined consequences.


---------------------------------------------------------

::

          If the string string is a valid pathname:

              $(basename -- "string")

          produces a filename that could be used to open the file named by
          string in the directory returned by:

              $(dirname -- "string")

          If the string string is not a valid pathname, the same algorithm
          is used, but the result need not be a valid filename. The
          basename utility is not expected to make any judgements about the
          validity of string as a pathname; it just follows the specified
          algorithm to produce a result string.

          The following shell script compiles /usr/src/cmd/cat.c and moves
          the output to a file named cat in the current directory when
          invoked with the argument /usr/src/cmd/cat or with the argument
          /usr/src/cmd/cat.c:

              c99 -- "$(dirname -- "$1")/$(basename -- "$1" .c).c" &&
              mv a.out "$(basename -- "$1" .c)"

          The EXAMPLES section of the basename() function (see the System
          Interfaces volume of POSIX.1‐2017, basename(3p)) includes a table
          showing examples of the results of processing several sample
          pathnames by the basename() and dirname() functions and by the
          basename and dirname utilities.


-----------------------------------------------------------

::

          The behaviors of basename and dirname have been coordinated so
          that when string is a valid pathname:

              $(basename -- "string")

          would be a valid filename for the file in the directory:

              $(dirname -- "string")

          This would not work for the early proposal versions of these
          utilities due to the way it specified handling of trailing
          <slash> characters.

          Since the definition of pathname specifies implementation-defined
          behavior for pathnames starting with two <slash> characters, this
          volume of POSIX.1‐2017 specifies similar implementation-defined
          behavior for the basename and dirname utilities.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.5, Parameters and Variables, dirname(1p)

          The Base Definitions volume of POSIX.1‐2017, Section 3.271,
          Pathname, Chapter 8, Environment Variables

          The System Interfaces volume of POSIX.1‐2017, basename(3p),
          dirname(3p)


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

   IEEE/The Open Group               2017                      BASENAME(1P)

--------------

Pages that refer to this page:
`dirname(1p) <../man1/dirname.1p.html>`__, 
`basename(3p) <../man3/basename.3p.html>`__, 
`dirname(3p) <../man3/dirname.3p.html>`__

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
