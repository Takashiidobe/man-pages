.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

split(1p) — Linux manual page
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

   SPLIT(1P)               POSIX Programmer's Manual              SPLIT(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          split — split a file into pieces


---------------------------------------------------------

::

          split [-l line_count] [-a suffix_length] [file [name]]

          split -b n[k|m] [-a suffix_length] [file [name]]


---------------------------------------------------------------

::

          The split utility shall read an input file and write zero or more
          output files.  The default size of each output file shall be 1000
          lines. The size of the output files can be modified by
          specification of the -b or -l options. Each output file shall be
          created with a unique suffix. The suffix shall consist of exactly
          suffix_length lowercase letters from the POSIX locale. The
          letters of the suffix shall be used as if they were a base-26
          digit system, with the first suffix to be created consisting of
          all 'a' characters, the second with a 'b' replacing the last 'a',
          and so on, until a name of all 'z' characters is created. By
          default, the names of the output files shall be 'x', followed by
          a two-character suffix from the character set as described above,
          starting with "aa", "ab", "ac", and so on, and continuing until
          the suffix "zz", for a maximum of 676 files.

          If the number of files required exceeds the maximum allowed by
          the suffix length provided, such that the last allowable file
          would be larger than the requested size, the split utility shall
          fail after creating the last file with a valid suffix; split
          shall not delete the files it created with valid suffixes. If the
          file limit is not exceeded, the last file created shall contain
          the remainder of the input file, and may be smaller than the
          requested size. If the input is an empty file, no output file
          shall be created and this shall not be considered to be an error.


-------------------------------------------------------

::

          The split utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following options shall be supported:

          -a suffix_length
                    Use suffix_length letters to form the suffix portion of
                    the filenames of the split file. If -a is not
                    specified, the default suffix length shall be two. If
                    the sum of the name operand and the suffix_length
                    option-argument would create a filename exceeding
                    {NAME_MAX} bytes, an error shall result; split shall
                    exit with a diagnostic message and no files shall be
                    created.

          -b n      Split a file into pieces n bytes in size.

          -b nk     Split a file into pieces n*1024 bytes in size.

          -b nm     Split a file into pieces n*1048576 bytes in size.

          -l line_count
                    Specify the number of lines in each resulting file
                    piece. The line_count argument is an unsigned decimal
                    integer. The default is 1000. If the input does not end
                    with a <newline>, the partial line shall be included in
                    the last output file.


---------------------------------------------------------

::

          The following operands shall be supported:

          file      The pathname of the ordinary file to be split. If no
                    input file is given or file is '-', the standard input
                    shall be used.

          name      The prefix to be used for each of the files resulting
                    from the split operation. If no name argument is given,
                    'x' shall be used as the prefix of the output files.
                    The combined length of the basename of prefix and
                    suffix_length cannot exceed {NAME_MAX} bytes. See the
                    OPTIONS section.


---------------------------------------------------

::

          See the INPUT FILES section.


---------------------------------------------------------------

::

          Any file can be used as input.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          split:

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

          Not used.


-----------------------------------------------------

::

          The standard error shall be used only for diagnostic messages.


-----------------------------------------------------------------

::

          The output files contain portions of the original input file;
          otherwise, unchanged.


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

          None.


---------------------------------------------------------

::

          In the following examples foo is a text file that contains 5000
          lines.

           1. Create five files, xaa, xab, xac, xad, and xae:

                  split foo

           2. Create five files, but the suffixed portion of the created
              files consists of three letters, xaaa, xaab, xaac, xaad, and
              xaae:

                  split -a 3 foo

           3. Create three files with four-letter suffixes and a supplied
              prefix, bar_aaaa, bar_aaab, and bar_aaac:

                  split -a 4 -l 2000 foo bar_

           4. Create as many files as are necessary to contain at most
              20*1024 bytes, each with the default prefix of x and a five-
              letter suffix:

                  split -a 5 -b 20k foo


-----------------------------------------------------------

::

          The -b option was added to provide a mechanism for splitting
          files other than by lines. While most uses of the -b option are
          for transmitting files over networks, some believed it would have
          additional uses.

          The -a option was added to overcome the limitation of being able
          to create only 676 files.

          Consideration was given to deleting this utility, using the
          rationale that the functionality provided by this utility is
          available via the csplit utility (see csplit(1p)).  Upon
          reconsideration of the purpose of the User Portability Utilities
          option, it was decided to retain both this utility and the csplit
          utility because users use both utilities and have historical
          expectations of their behavior. Furthermore, the splitting on
          byte boundaries in split cannot be duplicated with the historical
          csplit.

          The text ``split shall not delete the files it created with valid
          suffixes'' would normally be assumed, but since the related
          utility, csplit, does delete files under some circumstances, the
          historical behavior of split is made explicit to avoid
          misinterpretation.

          Earlier versions of this standard allowed a -line_count option.
          This form is no longer specified by POSIX.1‐2008 but may be
          present in some implementations.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          csplit(1p)

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

   IEEE/The Open Group               2017                         SPLIT(1P)

--------------

Pages that refer to this page: `csplit(1p) <../man1/csplit.1p.html>`__

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
