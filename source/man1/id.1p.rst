.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

id(1p) — Linux manual page
==========================

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

   ID(1P)                  POSIX Programmer's Manual                 ID(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          id — return user identity


---------------------------------------------------------

::

          id [user]

          id -G [-n] [user]

          id -g [-nr] [user]

          id -u [-nr] [user]


---------------------------------------------------------------

::

          If no user operand is provided, the id utility shall write the
          user and group IDs and the corresponding user and group names of
          the invoking process to standard output. If the effective and
          real IDs do not match, both shall be written. If multiple groups
          are supported by the underlying system (see the description of
          {NGROUPS_MAX} in the System Interfaces volume of POSIX.1‐2017),
          the supplementary group affiliations of the invoking process
          shall also be written.

          If a user operand is provided and the process has appropriate
          privileges, the user and group IDs of the selected user shall be
          written. In this case, effective IDs shall be assumed to be
          identical to real IDs. If the selected user has more than one
          allowable group membership listed in the group database, these
          shall be written in the same manner as the supplementary groups
          described in the preceding paragraph.


-------------------------------------------------------

::

          The id utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following options shall be supported:

          -G        Output all different group IDs (effective, real, and
                    supplementary) only, using the format "%u\n".  If there
                    is more than one distinct group affiliation, output
                    each such affiliation, using the format " %u", before
                    the <newline> is output.

          -g        Output only the effective group ID, using the format
                    "%u\n".

          -n        Output the name in the format "%s" instead of the
                    numeric ID using the format "%u".

          -r        Output the real ID instead of the effective ID.

          -u        Output only the effective user ID, using the format
                    "%u\n".


---------------------------------------------------------

::

          The following operand shall be supported:

          user      The login name for which information is to be written.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          id:

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
                    standard error and informative messages written to
                    standard output.

          NLSPATH   Determine the location of message catalogs for the
                    processing of LC_MESSAGES.


-------------------------------------------------------------------------------

::

          Default.


-----------------------------------------------------

::

          The following formats shall be used when the LC_MESSAGES locale
          category specifies the POSIX locale. In other locales, the
          strings uid, gid, euid, egid, and groups may be replaced with
          more appropriate strings corresponding to the locale.

              "uid=%u(%s) gid=%u(%s)\n", <real user ID>, <user-name>,
                  <real group ID>, <group-name>

          If the effective and real user IDs do not match, the following
          shall be inserted immediately before the '\n' character in the
          previous format:

              " euid=%u(%s)"

          with the following arguments added at the end of the argument
          list:

              <effective user ID>, <effective user-name>

          If the effective and real group IDs do not match, the following
          shall be inserted directly before the '\n' character in the
          format string (and after any addition resulting from the
          effective and real user IDs not matching):

              " egid=%u(%s)"

          with the following arguments added at the end of the argument
          list:

              <effective group-ID>, <effective group name>

          If the process has supplementary group affiliations or the
          selected user is allowed to belong to multiple groups, the first
          shall be added directly before the <newline> in the format
          string:

              " groups=%u(%s)"

          with the following arguments added at the end of the argument
          list:

              <supplementary group ID>, <supplementary group name>

          and the necessary number of the following added after that for
          any remaining supplementary group IDs:

              ",%u(%s)"

          and the necessary number of the following arguments added at the
          end of the argument list:

              <supplementary group ID>, <supplementary group name>

          If any of the user ID, group ID, effective user ID, effective
          group ID, or supplementary/multiple group IDs cannot be mapped by
          the system into printable user or group names, the corresponding
          "(%s)" and name argument shall be omitted from the corresponding
          format string.

          When any of the options are specified, the output format shall be
          as described in the OPTIONS section.


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

          Output produced by the -G option and by the default case could
          potentially produce very long lines on systems that support large
          numbers of supplementary groups.  (On systems with user and group
          IDs that are 32-bit integers and with group names with a maximum
          of 8 bytes per name, 93 supplementary groups plus distinct
          effective and real group and user IDs could theoretically
          overflow the 2048-byte {LINE_MAX} text file line limit on the
          default output case. It would take about 186 supplementary groups
          to overflow the 2048-byte barrier using id -G).  This is not
          expected to be a problem in practice, but in cases where it is a
          concern, applications should consider using fold -s before post-
          processing the output of id.


---------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The functionality provided by the 4 BSD groups utility can be
          simulated using:

              id -Gn [ user ]

          The 4 BSD command groups was considered, but it was not included
          because it did not provide the functionality of the id utility of
          the SVID. Also, it was thought that it would be easier to modify
          id to provide the additional functionality necessary to systems
          with multiple groups than to invent another command.

          The options -u, -g, -n, and -r were added to ease the use of id
          with shell commands substitution. Without these options it is
          necessary to use some preprocessor such as sed to select the
          desired piece of information. Since output such as that produced
          by:

              id -u -n

          is frequently wanted, it seemed desirable to add the options.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          fold(1p), logname(1p), who(1p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 8,
          Environment Variables, Section 12.2, Utility Syntax Guidelines

          The System Interfaces volume of POSIX.1‐2017, getgid(3p),
          getgroups(3p), getuid(3p)


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

   IEEE/The Open Group               2017                            ID(1P)

--------------

Pages that refer to this page: `logname(1p) <../man1/logname.1p.html>`__

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
