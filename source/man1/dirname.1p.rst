.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dirname(1p) — Linux manual page
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

   DIRNAME(1P)             POSIX Programmer's Manual            DIRNAME(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          dirname — return the directory portion of a pathname


---------------------------------------------------------

::

          dirname string


---------------------------------------------------------------

::

          The string operand shall be treated as a pathname, as defined in
          the Base Definitions volume of POSIX.1‐2017, Section 3.271,
          Pathname.  The string string shall be converted to the name of
          the directory containing the filename corresponding to the last
          pathname component in string, performing actions equivalent to
          the following steps in order:

           1. If string is //, skip steps 2 to 5.

           2. If string consists entirely of <slash> characters, string
              shall be set to a single <slash> character. In this case,
              skip steps 3 to 8.

           3. If there are any trailing <slash> characters in string, they
              shall be removed.

           4. If there are no <slash> characters remaining in string,
              string shall be set to a single <period> character. In this
              case, skip steps 5 to 8.

           5. If there are any trailing non-<slash> characters in string,
              they shall be removed.

           6. If the remaining string is //, it is implementation-defined
              whether steps 7 and 8 are skipped or processed.

           7. If there are any trailing <slash> characters in string, they
              shall be removed.

           8. If the remaining string is empty, string shall be set to a
              single <slash> character.

          The resulting string shall be written to standard output.


-------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          The following operand shall be supported:

          string    A string.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          dirname:

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

          The dirname utility shall write a line to the standard output in
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

          The EXAMPLES section of the basename() function (see the System
          Interfaces volume of POSIX.1‐2017, basename(3p)) includes a table
          showing examples of the results of processing several sample
          pathnames by the basename() and dirname() functions and by the
          basename and dirname utilities.

          See also the examples for the basename utility.


-----------------------------------------------------------

::

          The behaviors of basename and dirname in this volume of
          POSIX.1‐2017 have been coordinated so that when string is a valid
          pathname:

              $(basename -- "string")

          would be a valid filename for the file in the directory:

              $(dirname -- "string")

          This would not work for the versions of these utilities in early
          proposals due to the way processing of trailing <slash>
          characters was specified. Consideration was given to leaving
          processing unspecified if there were trailing <slash> characters,
          but this cannot be done; the Base Definitions volume of
          POSIX.1‐2017, Section 3.271, Pathname allows trailing <slash>
          characters. The basename and dirname utilities have to specify
          consistent handling for all valid pathnames.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.5, Parameters and Variables, basename(1p)

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

   IEEE/The Open Group               2017                       DIRNAME(1P)

--------------

Pages that refer to this page:
`basename(1p) <../man1/basename.1p.html>`__, 
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
