.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

compress(1p) — Linux manual page
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

   COMPRESS(1P)            POSIX Programmer's Manual           COMPRESS(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          compress — compress data


---------------------------------------------------------

::

          compress [-fv] [-b bits] [file...]

          compress [-cfv] [-b bits] [file]


---------------------------------------------------------------

::

          The compress utility shall attempt to reduce the size of the
          named files by using adaptive Lempel-Ziv coding algorithm.

          Note:  Lempel-Ziv is US Patent 4464650, issued to William
                 Eastman, Abraham Lempel, Jacob Ziv, Martin Cohn on August
                 7th, 1984, and assigned to Sperry Corporation.

                    Lempel-Ziv-Welch compression is covered by US Patent
                    4558302, issued to Terry A. Welch on December 10th,
                    1985, and assigned to Sperry Corporation.

          On systems not supporting adaptive Lempel-Ziv coding algorithm,
          the input files shall not be changed and an error value greater
          than two shall be returned. Except when the output is to the
          standard output, each file shall be replaced by one with the
          extension .Z.  If the invoking process has appropriate
          privileges, the ownership, modes, access time, and modification
          time of the original file are preserved. If appending the .Z to
          the filename would make the name exceed {NAME_MAX} bytes, the
          command shall fail. If no files are specified, the standard input
          shall be compressed to the standard output.


-------------------------------------------------------

::

          The compress utility shall conform to the Base Definitions volume
          of POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following options shall be supported:

          -b bits   Specify the maximum number of bits to use in a code.
                    For a conforming application, the bits argument shall
                    be:

                        9 <= bits <= 14

                    The implementation may allow bits values of greater
                    than 14. The default is 14, 15, or 16.

          -c        Cause compress to write to the standard output; the
                    input file is not changed, and no .Z files are created.

          -f        Force compression of file, even if it does not actually
                    reduce the size of the file, or if the corresponding
                    file.Z file already exists. If the -f option is not
                    given, and the process is not running in the
                    background, the user is prompted as to whether an
                    existing file.Z file should be overwritten. If the
                    response is affirmative, the existing file will be
                    overwritten.

          -v        Write the percentage reduction of each file to standard
                    error.


---------------------------------------------------------

::

          The following operand shall be supported:

          file      A pathname of a file to be compressed.


---------------------------------------------------

::

          The standard input shall be used only if no file operands are
          specified, or if a file operand is '-'.


---------------------------------------------------------------

::

          If file operands are specified, the input files contain the data
          to be compressed.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          compress:

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
                    elements used in the extended regular expression
                    defined for the yesexpr locale keyword in the
                    LC_MESSAGES category.

          LC_CTYPE  Determine the locale for the interpretation of
                    sequences of bytes of text data as characters (for
                    example, single-byte as opposed to multi-byte
                    characters in arguments), the behavior of character
                    classes used in the extended regular expression defined
                    for the yesexpr locale keyword in the LC_MESSAGES
                    category.

          LC_MESSAGES
                    Determine the locale used to process affirmative
                    responses, and the locale used to affect the format and
                    contents of diagnostic messages, prompts, and the
                    output from the -v option written to standard error.

          NLSPATH   Determine the location of message catalogs for the
                    processing of LC_MESSAGES.


-------------------------------------------------------------------------------

::

          Default.


-----------------------------------------------------

::

          If no file operands are specified, or if a file operand is '-',
          or if the -c option is specified, the standard output contains
          the compressed output.


-----------------------------------------------------

::

          The standard error shall be used only for diagnostic and prompt
          messages and the output from -v.


-----------------------------------------------------------------

::

          The output files shall contain the compressed output. The format
          of compressed files is unspecified and interchange of such files
          between implementations (including access via unspecified file
          sharing mechanisms) is not required by POSIX.1‐2008.


---------------------------------------------------------------------------------

::

          None.


---------------------------------------------------------------

::

          The following exit values shall be returned:

           0    Successful completion.

           1    An error occurred.

           2    One or more files were not compressed because they would
                have increased in size (and the -f option was not
                specified).

          >2    An error occurred.


-------------------------------------------------------------------------------------

::

          The input file shall remain unmodified.

          The following sections are informative.


---------------------------------------------------------------------------

::

          The amount of compression obtained depends on the size of the
          input, the number of bits per code, and the distribution of
          common substrings. Typically, text such as source code or English
          is reduced by 50‐60%. Compression is generally much better than
          that achieved by Huffman coding or adaptive Huffman coding
          (compact), and takes less time to compute.

          Although compress strictly follows the default actions upon
          receipt of a signal or when an error occurs, some unexpected
          results may occur. In some implementations it is likely that a
          partially compressed file is left in place, alongside its
          uncompressed input file. Since the general operation of compress
          is to delete the uncompressed file only after the .Z file has
          been successfully filled, an application should always carefully
          check the exit status of compress before arbitrarily deleting
          files that have like-named neighbors with .Z suffixes.

          The limit of 14 on the bits option-argument is to achieve
          portability to all systems (within the restrictions imposed by
          the lack of an explicit published file format). Some
          implementations based on 16-bit architectures cannot support 15
          or 16-bit uncompression.


---------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          uncompress(1p), zcat(1p)

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

   IEEE/The Open Group               2017                      COMPRESS(1P)

--------------

Pages that refer to this page:
`uncompress(1p) <../man1/uncompress.1p.html>`__, 
`zcat(1p) <../man1/zcat.1p.html>`__

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
