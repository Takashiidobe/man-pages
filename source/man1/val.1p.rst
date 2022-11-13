.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

val(1p) — Linux manual page
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

   VAL(1P)                 POSIX Programmer's Manual                VAL(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          val — validate SCCS files (DEVELOPMENT)


---------------------------------------------------------

::

          val -

          val [-s] [-m name] [-r SID] [-y type] file...


---------------------------------------------------------------

::

          The val utility shall determine whether the specified file is an
          SCCS file meeting the characteristics specified by the options.


-------------------------------------------------------

::

          The val utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines, except
          that the usage of the '-' operand is not strictly as intended by
          the guidelines (that is, reading options and operands from
          standard input).

          The following options shall be supported:

          -m name   Specify a name, which is compared with the SCCS %M%
                    keyword in file; see get(1p).

          -r SID    Specify a SID (SCCS Identification String), an SCCS
                    delta number. A check shall be made to determine
                    whether the SID is ambiguous (for example, -r 1 is
                    ambiguous because it physically does not exist but
                    implies 1.1, 1.2, and so on, which may exist) or
                    invalid (for example, -r 1.0 or -r 1.1.0 are invalid
                    because neither case can exist as a valid delta
                    number).  If the SID is valid and not ambiguous, a
                    check shall be made to determine whether it actually
                    exists.

          -s        Silence the diagnostic message normally written to
                    standard output for any error that is detected while
                    processing each named file on a given command line.

          -y type   Specify a type, which shall be compared with the SCCS
                    %Y% keyword in file; see get(1p).


---------------------------------------------------------

::

          The following operands shall be supported:

          file      A pathname of an existing SCCS file. If exactly one
                    file operand appears, and it is '-', the standard input
                    shall be read: each line shall be independently
                    processed as if it were a command line argument list.
                    (However, the line is not subjected to any of the shell
                    word expansions, such as parameter expansion or quote
                    removal.)


---------------------------------------------------

::

          The standard input shall be a text file used only when the file
          operand is specified as '-'.


---------------------------------------------------------------

::

          Any SCCS files processed shall be files of an unspecified format.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          val:

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
                    standard error, and informative messages written to
                    standard output.

          NLSPATH   Determine the location of message catalogs for the
                    processing of LC_MESSAGES.


-------------------------------------------------------------------------------

::

          Default.


-----------------------------------------------------

::

          The standard output shall consist of informative messages about
          either:

           1. Each file processed

           2. Each command line read from standard input

          If the standard input is not used, for each file operand yielding
          a discrepancy, the output line shall have the following format:

              "%s: %s\n", <pathname>, <unspecified string>

          If the standard input is used, for each input line yielding a
          discrepancy, the output shall have the following format:

              "%s\n\n %s: %s\n", <input>, <pathname>, <unspecified string>

          where <input> is the input line minus its terminating <newline>.


-----------------------------------------------------

::

          Not used.


-----------------------------------------------------------------

::

          None.


---------------------------------------------------------------------------------

::

          None.


---------------------------------------------------------------

::

          The 8-bit code returned by val shall be a disjunction of the
          possible errors; that is, it can be interpreted as a bit string
          where set bits are interpreted as follows:

          0x80   =   Missing file argument.
          0x40   =   Unknown or duplicate option.
          0x20   =   Corrupted SCCS file.
          0x10   =   Cannot open file or file not SCCS.
          0x08   =   SID is invalid or ambiguous.
          0x04   =   SID does not exist.
          0x02   =   %Y%, -y mismatch.
          0x01   =   %M%, -m mismatch.

          Note that val can process two or more files on a given command
          line and can process multiple command lines (when reading the
          standard input). In these cases an aggregate code shall be
          returned: a logical OR of the codes generated for each command
          line and file processed.


-------------------------------------------------------------------------------------

::

          Default.

          The following sections are informative.


---------------------------------------------------------------------------

::

          Since the val exit status sets the 0x80 bit, shell applications
          checking "$?" cannot tell if it terminated due to a missing file
          argument or receipt of a signal.


---------------------------------------------------------

::

          In a directory with three SCCS files—s.x (of t type ``text''),
          s.y, and s.z (a corrupted file)—the following command could
          produce the output shown:

              val - <<EOF
              -y source s.x
              -m y s.y
              s.z
              EOF
              -y source s.x

                  s.x: %Y%, -y mismatch
              s.z

                  s.z: corrupted SCCS file


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          admin(1p), delta(1p), get(1p), prs(1p)

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

   IEEE/The Open Group               2017                           VAL(1P)

--------------

Pages that refer to this page: `sccs(1p) <../man1/sccs.1p.html>`__

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
