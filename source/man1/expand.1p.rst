.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

expand(1p) — Linux manual page
==============================

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

   EXPAND(1P)              POSIX Programmer's Manual             EXPAND(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          expand — convert tabs to spaces


---------------------------------------------------------

::

          expand [-t tablist] [file...]


---------------------------------------------------------------

::

          The expand utility shall write files or the standard input to the
          standard output with <tab> characters replaced with one or more
          <space> characters needed to pad to the next tab stop. Any
          <backspace> characters shall be copied to the output and cause
          the column position count for tab stop calculations to be
          decremented; the column position count shall not be decremented
          below zero.


-------------------------------------------------------

::

          The expand utility shall conform to the Base Definitions volume
          of POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following option shall be supported:

          -t tablist
                    Specify the tab stops. The application shall ensure
                    that the argument tablist consists of either a single
                    positive decimal integer or a list of tabstops. If a
                    single number is given, tabs shall be set that number
                    of column positions apart instead of the default 8.

                    If a list of tabstops is given, the application shall
                    ensure that it consists of a list of two or more
                    positive decimal integers, separated by <blank> or
                    <comma> characters, in ascending order. The <tab>
                    characters shall be set at those specific column
                    positions. Each tab stop N shall be an integer value
                    greater than zero, and the list is in strictly
                    ascending order. This is taken to mean that, from the
                    start of a line of output, tabbing to position N shall
                    cause the next character output to be in the (N+1)th
                    column position on that line.

                    In the event of expand having to process a <tab> at a
                    position beyond the last of those specified in a
                    multiple tab-stop list, the <tab> shall be replaced by
                    a single <space> in the output.


---------------------------------------------------------

::

          The following operand shall be supported:

          file      The pathname of a text file to be used as input.


---------------------------------------------------

::

          See the INPUT FILES section.


---------------------------------------------------------------

::

          Input files shall be text files.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          expand:

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
          <tab> characters converted into the appropriate number of <space>
          characters.


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

           0    Successful completion

          >0    An error occurred.


-------------------------------------------------------------------------------------

::

          The expand utility shall terminate with an error message and non-
          zero exit status upon encountering difficulties accessing one of
          the file operands.

          The following sections are informative.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The expand utility is useful for preprocessing text files (before
          sorting, looking at specific columns, and so on) that contain
          <tab> characters.

          See the Base Definitions volume of POSIX.1‐2017, Section 3.103,
          Column Position.

          The tablist option-argument consists of integers in ascending
          order. Utility Syntax Guideline 8 mandates that expand shall
          accept the integers (within the single argument) separated using
          either <comma> or <blank> characters.

          Earlier versions of this standard allowed the following form in
          the SYNOPSIS:

              expand [-tabstop][-tab1,tab2,...,tabn][file ...]

          This form is no longer specified by POSIX.1‐2008 but may be
          present in some implementations.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          tabs(1p), unexpand(1p)

          The Base Definitions volume of POSIX.1‐2017, Section 3.103,
          Column Position, Chapter 8, Environment Variables, Section 12.2,
          Utility Syntax Guidelines


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

   IEEE/The Open Group               2017                        EXPAND(1P)

--------------

Pages that refer to this page: `pr(1p) <../man1/pr.1p.html>`__, 
`tabs(1p) <../man1/tabs.1p.html>`__, 
`unexpand(1p) <../man1/unexpand.1p.html>`__

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
