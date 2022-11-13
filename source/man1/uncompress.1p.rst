.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

uncompress(1p) — Linux manual page
==================================

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

   UNCOMPRESS(1P)          POSIX Programmer's Manual         UNCOMPRESS(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          uncompress — expand compressed data


---------------------------------------------------------

::

          uncompress [-cfv] [file...]


---------------------------------------------------------------

::

          The uncompress utility shall restore files to their original
          state after they have been compressed using the compress utility.
          If no files are specified, the standard input shall be
          uncompressed to the standard output. If the invoking process has
          appropriate privileges, the ownership, modes, access time, and
          modification time of the original file shall be preserved.

          This utility shall support the uncompressing of any files
          produced by the compress utility on the same implementation. For
          files produced by compress on other systems, uncompress supports
          9 to 14-bit compression (see compress(1p), -b); it is
          implementation-defined whether values of -b greater than 14 are
          supported.


-------------------------------------------------------

::

          The uncompress utility shall conform to the Base Definitions
          volume of POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines,
          except that Guideline 1 does apply since the utility name has ten
          letters.

          The following options shall be supported:

          -c        Write to standard output; no files are changed.

          -f        Do not prompt for overwriting files. Except when run in
                    the background, if -f is not given the user shall be
                    prompted as to whether an existing file should be
                    overwritten. If the standard input is not a terminal
                    and -f is not given, uncompress shall write a
                    diagnostic message to standard error and exit with a
                    status greater than zero.

          -v        Write messages to standard error concerning the
                    expansion of each file.


---------------------------------------------------------

::

          The following operand shall be supported:

          file      A pathname of a file. If file already has the .Z suffix
                    specified, it shall be used as the input file and the
                    output file shall be named file with the .Z suffix
                    removed. Otherwise, file shall be used as the name of
                    the output file and file with the .Z suffix appended
                    shall be used as the input file.


---------------------------------------------------

::

          The standard input shall be used only if no file operands are
          specified, or if a file operand is '-'.


---------------------------------------------------------------

::

          Input files shall be in the format produced by the compress
          utility.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          uncompress:

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

          When there are no file operands or the -c option is specified,
          the uncompressed output is written to standard output.


-----------------------------------------------------

::

          Prompts shall be written to the standard error output under the
          conditions specified in the DESCRIPTION and OPTIONS sections. The
          prompts shall contain the file pathname, but their format is
          otherwise unspecified. Otherwise, the standard error output shall
          be used only for diagnostic messages.


-----------------------------------------------------------------

::

          Output files are the same as the respective input files to
          compress.


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

          The input file remains unmodified.

          The following sections are informative.


---------------------------------------------------------------------------

::

          The limit of 14 on the compress -b bits argument is to achieve
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

          compress(1p), zcat(1p)

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

   IEEE/The Open Group               2017                    UNCOMPRESS(1P)

--------------

Pages that refer to this page:
`compress(1p) <../man1/compress.1p.html>`__, 
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
