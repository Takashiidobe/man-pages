.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

delta(1p) — Linux manual page
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

   DELTA(1P)               POSIX Programmer's Manual              DELTA(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          delta — make a delta (change) to an SCCS file (DEVELOPMENT)


---------------------------------------------------------

::

          delta [-nps] [-g list] [-m mrlist] [-r SID] [-y[comment]] file...


---------------------------------------------------------------

::

          The delta utility shall be used to permanently introduce into the
          named SCCS files changes that were made to the files retrieved by
          get (called the g-files, or generated files).


-------------------------------------------------------

::

          The delta utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines, except
          that the -y option has an optional option-argument. This optional
          option-argument shall not be presented as a separate argument.

          The following options shall be supported:

          -r SID    Uniquely identify which delta is to be made to the SCCS
                    file. The use of this option shall be necessary only if
                    two or more outstanding get commands for editing (get
                    -e) on the same SCCS file were done by the same person
                    (login name). The SID value specified with the -r
                    option can be either the SID specified on the get
                    command line or the SID to be made as reported by the
                    get utility; see get(1p).

          -s        Suppress the report to standard output of the activity
                    associated with each file.  See the STDOUT section.

          -n        Specify retention of the edited g-file (normally
                    removed at completion of delta processing).

          -g list   Specify a list (see get(1p) for the definition of list)
                    of deltas that shall be ignored when the file is
                    accessed at the change level (SID) created by this
                    delta.

          -m mrlist Specify a modification request (MR) number that the
                    application shall supply as the reason for creating the
                    new delta. This shall be used if the SCCS file has the
                    v flag set; see admin(1p).

                    If -m is not used and '-' is not specified as a file
                    argument, and the standard input is a terminal, the
                    prompt described in the STDOUT section shall be written
                    to standard output before the standard input is read;
                    if the standard input is not a terminal, no prompt
                    shall be issued.

                    MRs in a list shall be separated by <blank> characters
                    or escaped <newline> characters. An unescaped <newline>
                    shall terminate the MR list. The escape character is
                    <backslash>.

                    If the v flag has a value, it shall be taken to be the
                    name of a program which validates the correctness of
                    the MR numbers. If a non-zero exit status is returned
                    from the MR number validation program, the delta
                    utility shall terminate. (It is assumed that the MR
                    numbers were not all valid.)

          -y[comment]
                    Describe the reason for making the delta. The comment
                    shall be an arbitrary group of lines that would meet
                    the definition of a text file. Implementations shall
                    support comments from zero to 512 bytes and may support
                    longer values. A null string (specified as either -y,
                    -y"", or in response to a prompt for a comment) shall
                    be considered a valid comment.

                    If -y is not specified and '-' is not specified as a
                    file argument, and the standard input is a terminal,
                    the prompt described in the STDOUT section shall be
                    written to standard output before the standard input is
                    read; if the standard input is not a terminal, no
                    prompt shall be issued. An unescaped <newline> shall
                    terminate the comment text. The escape character is
                    <backslash>.

                    The -y option shall be required if the file operand is
                    specified as '-'.

          -p        Write (to standard output) the SCCS file differences
                    before and after the delta is applied in diff format;
                    see diff(1p).


---------------------------------------------------------

::

          The following operand shall be supported:

          file      A pathname of an existing SCCS file or a directory. If
                    file is a directory, the delta utility shall behave as
                    though each file in the directory were specified as a
                    named file, except that non-SCCS files (last component
                    of the pathname does not begin with s.)  and unreadable
                    files shall be silently ignored.

                    If exactly one file operand appears, and it is '-', the
                    standard input shall be read; each line of the standard
                    input shall be taken to be the name of an SCCS file to
                    be processed. Non-SCCS files and unreadable files shall
                    be silently ignored.


---------------------------------------------------

::

          The standard input shall be a text file used only in the
          following cases:

           *  To read an mrlist or a comment (see the -m and -y options).

           *  A file operand shall be specified as '-'.  In this case, the
              -y option must be used to specify the comment, and if the
              SCCS file has the v flag set, the -m option must also be used
              to specify the MR list.


---------------------------------------------------------------

::

          Input files shall be text files whose data is to be included in
          the SCCS files. If the first character of any line of an input
          file is <SOH> in the POSIX locale, the results are unspecified.
          If this file contains more than 99999 lines, the number of lines
          recorded in the header for this file shall be 99999 for this
          delta.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          delta:

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

          TZ        Determine the timezone in which the time and date are
                    written in the SCCS file. If the TZ variable is unset
                    or NULL, an unspecified system default timezone is
                    used.


-------------------------------------------------------------------------------

::

          If SIGINT is caught, temporary files shall be cleaned up and
          delta shall exit with a non-zero exit code. The standard action
          shall be taken for all other signals; see Section 1.4, Utility
          Description Defaults.


-----------------------------------------------------

::

          The standard output shall be used only for the following messages
          in the POSIX locale:

           *  Prompts (see the -m and -y options) in the following formats:

                  "MRs? "

                  "comments? "

              The MR prompt, if written, shall always precede the comments
              prompt.

           *  A report of each file's activities (unless the -s option is
              specified) in the following format:

                  "%s\n%d inserted\n%d deleted\n%d unchanged\n", <New SID>,
                      <number of lines inserted>, <number of lines deleted>,
                      <number of lines unchanged>


-----------------------------------------------------

::

          The standard error shall be used only for diagnostic messages.


-----------------------------------------------------------------

::

          Any SCCS files updated shall be files of an unspecified format.


---------------------------------------------------------------------------------

::

      System Date and Time
          When a delta is added to an SCCS file, the system date and time
          shall be recorded for the new delta. If a get is performed using
          an SCCS file with a date recorded apparently in the future, the
          behavior is unspecified.


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

          Problems can arise if the system date and time have been modified
          (for example, put forward and then back again, or unsynchronized
          clocks across a network) and can also arise when different values
          of the TZ environment variable are used.

          Problems of a similar nature can also arise for the operation of
          the get utility, which records the date and time in the file
          body.


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

          Section 1.4, Utility Description Defaults, admin(1p), diff(1p),
          get(1p), prs(1p), rmdel(1p)

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

   IEEE/The Open Group               2017                         DELTA(1P)

--------------

Pages that refer to this page: `admin(1p) <../man1/admin.1p.html>`__, 
`get(1p) <../man1/get.1p.html>`__,  `prs(1p) <../man1/prs.1p.html>`__, 
`rmdel(1p) <../man1/rmdel.1p.html>`__, 
`sact(1p) <../man1/sact.1p.html>`__, 
`sccs(1p) <../man1/sccs.1p.html>`__, 
`unget(1p) <../man1/unget.1p.html>`__, 
`val(1p) <../man1/val.1p.html>`__

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
