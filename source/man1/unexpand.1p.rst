.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

unexpand(1p) — Linux manual page
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

   UNEXPAND(1P)            POSIX Programmer's Manual           UNEXPAND(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          unexpand — convert spaces to tabs


---------------------------------------------------------

::

          unexpand [-a|-t tablist] [file...]


---------------------------------------------------------------

::

          The unexpand utility shall copy files or standard input to
          standard output, converting <blank> characters at the beginning
          of each line into the maximum number of <tab> characters followed
          by the minimum number of <space> characters needed to fill the
          same column positions originally filled by the translated <blank>
          characters. By default, tabstops shall be set at every eighth
          column position. Each <backspace> shall be copied to the output,
          and shall cause the column position count for tab calculations to
          be decremented; the count shall never be decremented to a value
          less than one.


-------------------------------------------------------

::

          The unexpand utility shall conform to the Base Definitions volume
          of POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following options shall be supported:

          -a        In addition to translating <blank> characters at the
                    beginning of each line, translate all sequences of two
                    or more <blank> characters immediately preceding a tab
                    stop to the maximum number of <tab> characters followed
                    by the minimum number of <space> characters needed to
                    fill the same column positions originally filled by the
                    translated <blank> characters.

          -t tablist
                    Specify the tab stops. The application shall ensure
                    that the tablist option-argument is a single argument
                    consisting of a single positive decimal integer or
                    multiple positive decimal integers, separated by
                    <blank> or <comma> characters, in ascending order. If a
                    single number is given, tabs shall be set tablist
                    column positions apart instead of the default 8. If
                    multiple numbers are given, the tabs shall be set at
                    those specific column positions.

                    The application shall ensure that each tab-stop
                    position N is an integer value greater than zero, and
                    the list shall be in strictly ascending order. This is
                    taken to mean that, from the start of a line of output,
                    tabbing to position N shall cause the next character
                    output to be in the (N+1)th column position on that
                    line. When the -t option is not specified, the default
                    shall be the equivalent of specifying -t 8 (except for
                    the interaction with -a, described below).

                    No <space>-to-<tab> conversions shall occur for
                    characters at positions beyond the last of those
                    specified in a multiple tab-stop list.

                    When -t is specified, the presence or absence of the -a
                    option shall be ignored; conversion shall not be
                    limited to the processing of leading <blank>
                    characters.


---------------------------------------------------------

::

          The following operand shall be supported:

          file      A pathname of a text file to be used as input.


---------------------------------------------------

::

          See the INPUT FILES section.


---------------------------------------------------------------

::

          The input files shall be text files.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          unexpand:

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
                    characters in arguments and input files), the
                    processing of <tab> and <space> characters, and for the
                    determination of the width in column positions each
                    character would occupy on an output device.

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

          The standard output shall be equivalent to the input files with
          the specified <space>-to-<tab> conversions.


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

          One non-intuitive aspect of unexpand is its restriction to
          leading <space> characters when neither -a nor -t is specified.
          Users who always want to convert all <space> characters in a file
          can easily alias unexpand to use the -a or -t 8 option.


---------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          On several occasions, consideration was given to adding a -t
          option to the unexpand utility to complement the -t in expand
          (see expand(1p)).  The historical intent of unexpand was to
          translate multiple <blank> characters into tab stops, where tab
          stops were a multiple of eight column positions on most UNIX
          systems. An early proposal omitted -t because it seemed outside
          the scope of the User Portability Utilities option; it was not
          described in any of the base documents for IEEE Std 1003.2‐1992.
          However, hard-coding tab stops every eight columns was not
          suitable for the international community and broke historical
          precedents for some vendors in the FORTRAN community, so -t was
          restored in conjunction with the list of valid extension
          categories considered by the standard developers. Thus, unexpand
          is now the logical converse of expand.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          expand(1p), tabs(1p)

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

   IEEE/The Open Group               2017                      UNEXPAND(1P)

--------------

Pages that refer to this page: `expand(1p) <../man1/expand.1p.html>`__, 
`tabs(1p) <../man1/tabs.1p.html>`__

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
