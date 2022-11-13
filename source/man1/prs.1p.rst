.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

prs(1p) — Linux manual page
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

   PRS(1P)                 POSIX Programmer's Manual                PRS(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          prs — print an SCCS file (DEVELOPMENT)


---------------------------------------------------------

::

          prs [-a] [-d dataspec] [-r[SID]] file...

          prs [-e|-l] -c cutoff [-d dataspec] file...

          prs [-e|-l] -r[SID] [-d dataspec] file...


---------------------------------------------------------------

::

          The prs utility shall write to standard output parts or all of an
          SCCS file in a user-supplied format.


-------------------------------------------------------

::

          The prs utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines, except
          that the -r option has an optional option-argument. This optional
          option-argument cannot be presented as a separate argument. The
          following options shall be supported:

          -d dataspec
                    Specify the output data specification. The dataspec
                    shall be a string consisting of SCCS file data keywords
                    (see Data Keywords) interspersed with optional user-
                    supplied text.

          -r[SID]   Specify the SCCS identification string (SID) of a delta
                    for which information is desired. If no SID option-
                    argument is specified, the SID of the most recently
                    created delta shall be assumed.

          -e        Request information for all deltas created earlier than
                    and including the delta designated via the -r option or
                    the date-time given by the -c option.

          -l        Request information for all deltas created later than
                    and including the delta designated via the -r option or
                    the date-time given by the -c option.

          -c cutoff Indicate the cutoff date-time, in the form:

                        YY[MM[DD[HH[MM[SS]]]]]

                    For the YY component, values in the range [69,99] shall
                    refer to years 1969 to 1999 inclusive, and values in
                    the range [00,68] shall refer to years 2000 to 2068
                    inclusive.

                    Note:  It is expected that in a future version of this
                           standard the default century inferred from a
                           2-digit year will change. (This would apply to
                           all commands accepting a 2-digit year as input.)

                    No changes (deltas) to the SCCS file that were created
                    after the specified cutoff date-time shall be included
                    in the output. Units omitted from the date-time default
                    to their maximum possible values; for example, -c 7502
                    is equivalent to -c 750228235959.

          -a        Request writing of information for both removed—that
                    is, delta type=R (see rmdel(1p))—and existing—that is,
                    delta type=D,—deltas. If the -a option is not
                    specified, information for existing deltas only shall
                    be provided.


---------------------------------------------------------

::

          The following operand shall be supported:

          file      A pathname of an existing SCCS file or a directory. If
                    file is a directory, the prs utility shall behave as
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

          The standard input shall be a text file used only when the file
          operand is specified as '-'.  Each line of the text file shall be
          interpreted as an SCCS pathname.


---------------------------------------------------------------

::

          Any SCCS files displayed are files of an unspecified format.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          prs:

          LANG      Provide a default value for the internationalization
                    variables that are unset or null. (See the Base
                    Definitions volume of POSIX.1‐2017, Section 8.2,
                    Internationalization Variables the precedence of
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

          The standard output shall be a text file whose format is
          dependent on the data keywords specified with the -d option.

      Data Keywords
          Data keywords specify which parts of an SCCS file shall be
          retrieved and output. All parts of an SCCS file have an
          associated data keyword. A data keyword may appear in a dataspec
          multiple times.

          The information written by prs shall consist of:

           1. The user-supplied text

           2. Appropriate values (extracted from the SCCS file) substituted
              for the recognized data keywords in the order of appearance
              in the dataspec

          The format of a data keyword value shall either be simple ('S'),
          in which keyword substitution is direct, or multi-line ('M').

          User-supplied text shall be any text other than recognized data
          keywords. A <tab> shall be specified by '\t' and <newline> by
          '\n'.  When the -r option is not specified, the default dataspec
          shall be:

              :PN::\n\n

          and the following dataspec shall be used for each selected delta:

              :Dt:\t:DL:\nMRs:\n:MR:COMMENTS:\n:C:

   ┌─────────────────────────────────────────────────────────────────────────────────────┐
   │                              SCCS File Data Keywords                                │
   ├────────┬────────────────────────────────┬──────────────┬───────────────────┬────────┤
   │Keyword │           Data Item            │ File Section │       Value       │ Format │
   ├────────┼────────────────────────────────┼──────────────┼───────────────────┼────────┤
   │:Dt:    │ Delta information              │ Delta Table  │ See below*        │   S    │
   │:DL:    │ Delta line statistics          │      "       │ :Li:/:Ld:/:Lu:    │   S    │
   │:Li:    │ Lines inserted by Delta        │      "       │ nnnnn***          │   S    │
   │:Ld:    │ Lines deleted by Delta         │      "       │ nnnnn***          │   S    │
   │:Lu:    │ Lines unchanged by Delta       │      "       │ nnnnn***          │   S    │
   │:DT:    │ Delta type                     │      "       │ D or R            │   S    │
   │:I:     │ SCCS ID string (SID)           │      "       │ See below**       │   S    │
   │:R:     │ Release number                 │      "       │ nnnn              │   S    │
   │:L:     │ Level number                   │      "       │ nnnn              │   S    │
   │:B:     │ Branch number                  │      "       │ nnnn              │   S    │
   │:S:     │ Sequence number                │      "       │ nnnn              │   S    │
   │:D:     │ Date delta created             │      "       │ :Dy:/:Dm:/:Dd:    │   S    │
   │:Dy:    │ Year delta created             │      "       │ nn                │   S    │
   │:Dm:    │ Month delta created            │      "       │ nn                │   S    │
   │:Dd:    │ Day delta created              │      "       │ nn                │   S    │
   │:T:     │ Time delta created             │      "       │ :Th:::Tm:::Ts:    │   S    │
   │:Th:    │ Hour delta created             │      "       │ nn                │   S    │
   │:Tm:    │ Minutes delta created          │      "       │ nn                │   S    │
   │:Ts:    │ Seconds delta created          │      "       │ nn                │   S    │
   │:P:     │ Programmer who created Delta   │      "       │ logname           │   S    │
   │:DS:    │ Delta sequence number          │      "       │ nnnn              │   S    │
   │:DP:    │ Predecessor Delta sequence     │      "       │ nnnn              │   S    │
   │        │ number                         │              │                   │        │
   │:DI:    │ Sequence number of deltas      │      "       │ :Dn:/:Dx:/:Dg:    │   S    │
   │        │ included, excluded, or ignored │              │                   │        │
   │:Dn:    │ Deltas included (sequence #)   │      "       │ :DS: :DS: ...     │   S    │
   │:Dx:    │ Deltas excluded (sequence #)   │      "       │ :DS: :DS: ...     │   S    │
   │:Dg:    │ Deltas ignored (sequence #)    │      "       │ :DS: :DS: ...     │   S    │
   │:MR:    │ MR numbers for delta           │      "       │ text              │   M    │
   │:C:     │ Comments for delta             │      "       │ text              │   M    │
   │:UN:    │ User names                     │  User Names  │ text              │   M    │
   │:FL:    │ Flag list                      │    Flags     │ text              │   M    │
   │:Y:     │ Module type flag               │      "       │ text              │   S    │
   │:MF:    │ MR validation flag             │      "       │ yes or no         │   S    │
   │:MP:    │ MR validation program name     │      "       │ text              │   S    │
   │:KF:    │ Keyword error, warning flag    │      "       │ yes or no         │   S    │
   │:KV:    │ Keyword validation string      │      "       │ text              │   S    │
   │:BF:    │ Branch flag                    │      "       │ yes or no         │   S    │
   │:J:     │ Joint edit flag                │      "       │ yes or no         │   S    │
   │:LK:    │ Locked releases                │      "       │ :R: ...           │   S    │
   │:Q:     │ User-defined keyword           │      "       │ text              │   S    │
   │:M:     │ Module name                    │      "       │ text              │   S    │
   │:FB:    │ Floor boundary                 │      "       │ :R:               │   S    │
   │:CB:    │ Ceiling boundary               │      "       │ :R:               │   S    │
   │:Ds:    │ Default SID                    │      "       │ :I:               │   S    │
   │:ND:    │ Null delta flag                │      "       │ yes or no         │   S    │
   │:FD:    │ File descriptive text          │   Comments   │ text              │   M    │
   │:BD:    │ Body                           │     Body     │ text              │   M    │
   │:GB:    │ Gotten body                    │      "       │ text              │   M    │
   │:W:     │ A form of what string          │     N/A      │ :Z::M:\t:I:       │   S    │
   │:A:     │ A form of what string          │     N/A      │ :Z::Y: :M: :I::Z: │   S    │
   │:Z:     │ what string delimiter          │     N/A      │ @(#)              │   S    │
   │:F:     │ SCCS filename                  │     N/A      │ text              │   S    │
   │:PN:    │ SCCS file pathname             │     N/A      │ text              │   S    │
   └────────┴────────────────────────────────┴──────────────┴───────────────────┴────────┘
          *     :Dt:=:DT: :I: :D: :T: :P: :DS: :DP:

          **    :R:.:L:.:B:.:S: if the delta is a branch delta (:BF:==yes)
                :R:.:L: if the delta is not a branch delta (:BF:==no)

          ***   The line statistics are capped at 99999. For example, if
                100000 lines were unchanged in a certain revision, :Lu:
                shall produce the value 99999.


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

          None.


---------------------------------------------------------

::

           1. The following example:

                  prs -d "User Names for :F: are:\n:UN:" s.file

              might write to standard output:

                  User Names for s.file are:
                  xyz
                  131
                  abc

           2. The following example:

                  prs -d "Delta for pgm :M:: :I: - :D: By :P:" -r s.file

              might write to standard output:

                  Delta for pgm main.c: 3.7 - 77/12/01 By cas

           3. As a special case:

                  prs s.file

              might write to standard output:

                  s.file:
                  <blank line>
                  D 1.1 77/12/01 00:00:00 cas 1 000000/00000/00000
                  MRs:
                  bl78-12345
                  bl79-54321
                  COMMENTS:
                  this is the comment line for s.file initial delta
                  <blank line>

              for each delta table entry of the D type. The only option
              allowed to be used with this special case is the -a option.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          admin(1p), delta(1p), get(1p), what(1p)

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

   IEEE/The Open Group               2017                           PRS(1P)

--------------

Pages that refer to this page: `admin(1p) <../man1/admin.1p.html>`__, 
`delta(1p) <../man1/delta.1p.html>`__, 
`get(1p) <../man1/get.1p.html>`__, 
`rmdel(1p) <../man1/rmdel.1p.html>`__, 
`sccs(1p) <../man1/sccs.1p.html>`__,  `val(1p) <../man1/val.1p.html>`__

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
