.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

comm(1p) — Linux manual page
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

   COMM(1P)                POSIX Programmer's Manual               COMM(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          comm — select or reject lines common to two files


---------------------------------------------------------

::

          comm [-123] file1 file2


---------------------------------------------------------------

::

          The comm utility shall read file1 and file2, which should be
          ordered in the current collating sequence, and produce three text
          columns as output: lines only in file1, lines only in file2, and
          lines in both files.

          If the lines in both files are not ordered according to the
          collating sequence of the current locale, the results are
          unspecified.

          If the collating sequence of the current locale does not have a
          total ordering of all characters (see the Base Definitions volume
          of POSIX.1‐2017, Section 7.3.2, LC_COLLATE) and any lines from
          the input files collate equally but are not identical, comm
          should treat them as different lines but may treat them as being
          the same. If it treats them as different, comm should expect them
          to be ordered according to a further byte-by-byte comparison
          using the collating sequence for the POSIX locale and if they are
          not ordered in this way, the output of comm can identify such
          lines as being both unique to file1 and unique to file2 instead
          of being in both files.


-------------------------------------------------------

::

          The comm utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following options shall be supported:

          -1        Suppress the output column of lines unique to file1.

          -2        Suppress the output column of lines unique to file2.

          -3        Suppress the output column of lines duplicated in file1
                    and file2.


---------------------------------------------------------

::

          The following operands shall be supported:

          file1     A pathname of the first file to be compared. If file1
                    is '-', the standard input shall be used.

          file2     A pathname of the second file to be compared. If file2
                    is '-', the standard input shall be used.

          If both file1 and file2 refer to standard input or to the same
          FIFO special, block special, or character special file, the
          results are undefined.


---------------------------------------------------

::

          The standard input shall be used only if one of the file1 or
          file2 operands refers to standard input. See the INPUT FILES
          section.


---------------------------------------------------------------

::

          The input files shall be text files.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          comm:

          LANG      Provide a default value for the internationalization
                    variables that are unset or null. (See the Base
                    Definitions volume of POSIX.1‐2017, Section 8.2,
                    Internationalization Variables for the precedence of
                    internationalization variables used to determine the
                    values of locale categories.)

          LC_ALL    If set to a non-empty string value, override the values
                    of all the other internationalization variables.

          LC_COLLATE
                    Determine the locale for the collating sequence comm
                    expects to have been used when the input files were
                    sorted.

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

          The comm utility shall produce output depending on the options
          selected. If the -1, -2, and -3 options are all selected, comm
          shall write nothing to standard output.

          If the -1 option is not selected, lines contained only in file1
          shall be written using the format:

              "%s\n", <line in file1>

          If the -2 option is not selected, lines contained only in file2
          are written using the format:

              "%s%s\n", <lead>, <line in file2>

          where the string <lead> is as follows:

          <tab>     The -1 option is not selected.

          null string
                    The -1 option is selected.

          If the -3 option is not selected, lines contained in both files
          shall be written using the format:

              "%s%s\n", <lead>, <line in both>

          where the string <lead> is as follows:

          <tab><tab>
                    Neither the -1 nor the -2 option is selected.

          <tab>     Exactly one of the -1 and -2 options is selected.

          null string
                    Both the -1 and -2 options are selected.

          If the input files were ordered according to the collating
          sequence of the current locale, the lines written shall be in the
          collating sequence of the current locale. If the input files
          contained any lines that collated equally but were not identical
          and within each file those lines were ordered according to a
          further byte-by-byte comparison using the collating sequence for
          the POSIX locale, and comm treated them as different lines, then
          lines written that collate equally but are not identical should
          be ordered according to a further byte-by-byte comparison using
          the collating sequence for the POSIX locale.


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

           0    All input files were successfully output as specified.

          >0    An error occurred.


-------------------------------------------------------------------------------------

::

          Default.

          The following sections are informative.


---------------------------------------------------------------------------

::

          If the input files are not properly presorted, the output of comm
          might not be useful.

          When using comm to process pathnames, it is recommended that
          LC_ALL, or at least LC_CTYPE and LC_COLLATE, are set to POSIX or
          C in the environment, since pathnames can contain byte sequences
          that do not form valid characters in some locales, in which case
          the utility's behavior would be undefined. In the POSIX locale
          each byte is a valid single-byte character, and therefore this
          problem is avoided.

          If the collating sequence of the current locale does not have a
          total ordering of all characters, this can affect the behavior of
          comm in the following ways:

           *  If comm treats lines as being the same only if they are
              identical, some lines can be misleadingly identified as being
              both unique to file1 and unique to file2.

           *  If comm treats lines as being the same if they collate
              equally and a line from file1 collates equally with a line
              from file2 but is not identical to it, one of the lines is
              misleadingly identified as being in both files and the other
              is not written to the output at all.

          Such problems can be avoided by forcing the use of the POSIX
          locale; for example, the following identifies lines in both file1
          and file2:

              LC_ALL=POSIX sort file1 > file1.posix
              LC_ALL=POSIX sort file2 > file2.posix
              LC_ALL=POSIX comm -12 file1.posix file2.posix | sort

          The final sort re-sorts the output of comm according to the
          collating sequence of the original locale. Doing this might be
          difficult if more than one column is output and leading <blank>s
          cannot be ignored.


---------------------------------------------------------

::

          If a file named xcu contains a sorted list of the utilities in
          this volume of POSIX.1‐2017, a file named xpg3 contains a sorted
          list of the utilities specified in the X/Open Portability Guide,
          Issue 3, and a file named svid89 contains a sorted list of the
          utilities in the System V Interface Definition Third Edition:

              comm -23 xcu xpg3 | comm -23 - svid89

          would print a list of utilities in this volume of POSIX.1‐2017
          not specified by either of the other documents:

              comm -12 xcu xpg3 | comm -12 - svid89

          would print a list of utilities specified by all three documents,
          and:

              comm -12 xpg3 svid89 | comm -23 - xcu

          would print a list of utilities specified by both XPG3 and the
          SVID, but not specified in this volume of POSIX.1‐2017.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          A future version of this standard may require that if any lines
          from the input files collate equally but are not identical, then
          comm treats them as different lines and expects them to be
          ordered according to a further byte-by-byte comparison using the
          collating sequence for the POSIX locale.

          A future version of this standard may require that if the input
          files contained any lines that collated equally but were not
          identical and within each file those lines were ordered according
          to a further byte-by-byte comparison using the collating sequence
          for the POSIX locale, then lines written that collate equally but
          are not identical are ordered according to a further byte-by-byte
          comparison using the collating sequence for the POSIX locale.


---------------------------------------------------------

::

          cmp(1p), diff(1p), sort(1p), uniq(1p)

          The Base Definitions volume of POSIX.1‐2017, Section 7.3.2,
          LC_COLLATE, Chapter 8, Environment Variables, Section 12.2,
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

   IEEE/The Open Group               2017                          COMM(1P)

--------------

Pages that refer to this page: `cmp(1p) <../man1/cmp.1p.html>`__, 
`diff(1p) <../man1/diff.1p.html>`__, 
`join(1p) <../man1/join.1p.html>`__, 
`sort(1p) <../man1/sort.1p.html>`__, 
`uniq(1p) <../man1/uniq.1p.html>`__

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
