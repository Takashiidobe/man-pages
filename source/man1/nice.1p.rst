.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nice(1p) — Linux manual page
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

   NICE(1P)                POSIX Programmer's Manual               NICE(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          nice — invoke a utility with an altered nice value


---------------------------------------------------------

::

          nice [-n increment] utility [argument...]


---------------------------------------------------------------

::

          The nice utility shall invoke a utility, requesting that it be
          run with a different nice value (see the Base Definitions volume
          of POSIX.1‐2017, Section 3.244, Nice Value).  With no options,
          the executed utility shall be run with a nice value that is some
          implementation-defined quantity greater than or equal to the nice
          value of the current process. If the user lacks appropriate
          privileges to affect the nice value in the requested manner, the
          nice utility shall not affect the nice value; in this case, a
          warning message may be written to standard error, but this shall
          not prevent the invocation of utility or affect the exit status.


-------------------------------------------------------

::

          The nice utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following option is supported:

          -n increment
                    A positive or negative decimal integer which shall have
                    the same effect on the execution of the utility as if
                    the utility had called the nice() function with the
                    numeric value of the increment option-argument.


---------------------------------------------------------

::

          The following operands shall be supported:

          utility   The name of a utility that is to be invoked. If the
                    utility operand names any of the special built-in
                    utilities in Section 2.14, Special Built-In Utilities,
                    the results are undefined.

          argument  Any string to be supplied as an argument when invoking
                    the utility named by the utility operand.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          nice:

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

          PATH      Determine the search path used to locate the utility to
                    be invoked.  See the Base Definitions volume of
                    POSIX.1‐2017, Chapter 8, Environment Variables.


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

          None.


---------------------------------------------------------------------------------

::

          None.


---------------------------------------------------------------

::

          If utility is invoked, the exit status of nice shall be the exit
          status of utility; otherwise, the nice utility shall exit with
          one of the following values:

          1‐125   An error occurred in the nice utility.

            126   The utility specified by utility was found but could not
                  be invoked.

            127   The utility specified by utility could not be found.


-------------------------------------------------------------------------------------

::

          Default.

          The following sections are informative.


---------------------------------------------------------------------------

::

          The only guaranteed portable uses of this utility are:

          nice utility
                Run utility with the default higher or equal nice value.

          nice -n <positive integer> utility
                Run utility with a higher nice value.

          On some implementations they have no discernible effect on the
          invoked utility and on some others they are exactly equivalent.

          Historical systems have frequently supported the <positive
          integer> up to 20. Since there is no error penalty associated
          with guessing a number that is too high, users without access to
          the system conformance document (to see what limits are actually
          in place) could use the historical 1 to 20 range or attempt to
          use very large numbers if the job should be truly low priority.

          The nice value of a process can be displayed using the command:

              ps -o nice

          The command, env, nice, nohup, time, and xargs utilities have
          been specified to use exit code 127 if an error occurs so that
          applications can distinguish ``failure to find a utility'' from
          ``invoked utility exited with an error indication''. The value
          127 was chosen because it is not commonly used for other
          meanings; most utilities use small values for ``normal error
          conditions'' and the values above 128 can be confused with
          termination due to receipt of a signal. The value 126 was chosen
          in a similar manner to indicate that the utility could be found,
          but not invoked. Some scripts produce meaningful error messages
          differentiating the 126 and 127 cases. The distinction between
          exit codes 126 and 127 is based on KornShell practice that uses
          127 when all attempts to exec the utility fail with [ENOENT], and
          uses 126 when any attempt to exec the utility fails for any other
          reason.


---------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The 4.3 BSD version of nice does not check whether increment is a
          valid decimal integer. The command nice -x utility, for example,
          would be treated the same as the command nice --1 utility.  If
          the user does not have appropriate privileges, this results in a
          ``permission denied'' error.  This is considered a bug.

          When a user without appropriate privileges gives a negative
          increment, System V treats it like the command nice -0 utility,
          while 4.3 BSD writes a ``permission denied'' message and does not
          run the utility. The standard specifies the System V behavior
          together with an optional BSD-style ``permission denied''
          message.

          The C shell has a built-in version of nice that has a different
          interface from the one described in this volume of POSIX.1‐2017.

          The term ``utility'' is used, rather than ``command'', to
          highlight the fact that shell compound commands, pipelines, and
          so on, cannot be used. Special built-ins also cannot be used.
          However, ``utility'' includes user application programs and shell
          scripts, not just utilities defined in this volume of
          POSIX.1‐2017.

          Historical implementations of nice provide a nice value range of
          40 or 41 discrete steps, with the default nice value being the
          midpoint of that range. By default, they raise the nice value of
          the executed utility by 10.

          Some historical documentation states that the increment value
          must be within a fixed range. This is misleading; the valid
          increment values on any invocation are determined by the current
          process nice value, which is not always the default.

          The definition of nice value is not intended to suggest that all
          processes in a system have priorities that are comparable.
          Scheduling policy extensions such as the realtime priorities in
          the System Interfaces volume of POSIX.1‐2017 make the notion of a
          single underlying priority for all scheduling policies
          problematic. Some implementations may implement the nice-related
          features to affect all processes on the system, others to affect
          just the general time-sharing activities implied by this volume
          of POSIX.1‐2017, and others may have no effect at all. Because of
          the use of ``implementation-defined'' in nice and renice, a wide
          range of implementation strategies are possible.

          Earlier versions of this standard allowed a -increment option.
          This form is no longer specified by POSIX.1‐2008 but may be
          present in some implementations.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Chapter 2, Shell Command Language, renice(1p)

          The Base Definitions volume of POSIX.1‐2017, Section 3.244, Nice
          Value, Chapter 8, Environment Variables, Section 12.2, Utility
          Syntax Guidelines

          The System Interfaces volume of POSIX.1‐2017, nice(3p)


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

   IEEE/The Open Group               2017                          NICE(1P)

--------------

Pages that refer to this page: `ps(1p) <../man1/ps.1p.html>`__, 
`renice(1p) <../man1/renice.1p.html>`__

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
