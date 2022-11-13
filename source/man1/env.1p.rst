.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

env(1p) — Linux manual page
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

   ENV(1P)                 POSIX Programmer's Manual                ENV(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          env — set the environment for command invocation


---------------------------------------------------------

::

          env [-i] [name=value]... [utility [argument...]]


---------------------------------------------------------------

::

          The env utility shall obtain the current environment, modify it
          according to its arguments, then invoke the utility named by the
          utility operand with the modified environment.

          Optional arguments shall be passed to utility.

          If no utility operand is specified, the resulting environment
          shall be written to the standard output, with one name=value pair
          per line.

          If the first argument is '-', the results are unspecified.


-------------------------------------------------------

::

          The env utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines, except for
          the unspecified usage of '-'.

          The following options shall be supported:

          -i        Invoke utility with exactly the environment specified
                    by the arguments; the inherited environment shall be
                    ignored completely.


---------------------------------------------------------

::

          The following operands shall be supported:

          name=value
                    Arguments of the form name=value shall modify the
                    execution environment, and shall be placed into the
                    inherited environment before the utility is invoked.

          utility   The name of the utility to be invoked. If the utility
                    operand names any of the special built-in utilities in
                    Section 2.14, Special Built-In Utilities, the results
                    are undefined.

          argument  A string to pass as an argument for the invoked
                    utility.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          env:

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

          PATH      Determine the location of the utility, as described in
                    the Base Definitions volume of POSIX.1‐2017, Chapter 8,
                    Environment Variables.  If PATH is specified as a
                    name=value operand to env, the value given shall be
                    used in the search for utility.


-------------------------------------------------------------------------------

::

          Default.


-----------------------------------------------------

::

          If no utility operand is specified, each name=value pair in the
          resulting environment shall be written in the form:

              "%s=%s\n", <name>, <value>

          If the utility operand is specified, the env utility shall not
          write to standard output.


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

          If utility is invoked, the exit status of env shall be the exit
          status of utility; otherwise, the env utility shall exit with one
          of the following values:

              0   The env utility completed successfully.

          1-125   An error occurred in the env utility.

            126   The utility specified by utility was found but could not
                  be invoked.

            127   The utility specified by utility could not be found.


-------------------------------------------------------------------------------------

::

          Default.

          The following sections are informative.


---------------------------------------------------------------------------

::

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

          Historical implementations of the env utility use the execvp() or
          execlp() functions defined in the System Interfaces volume of
          POSIX.1‐2017 to invoke the specified utility; this provides
          better performance and keeps users from having to escape
          characters with special meaning to the shell. Therefore, shell
          functions, special built-ins, and built-ins that are only
          provided by the shell are not found.


---------------------------------------------------------

::

          The following command:

              env -i PATH=/mybin:"$PATH" $(getconf V7_ENV) mygrep xyz myfile

          invokes the command mygrep with a new PATH value as the only
          entry in its environment other than any variables required by the
          implementation for conformance. In this case, PATH is used to
          locate mygrep, which is expected to reside in /mybin.


-----------------------------------------------------------

::

          As with all other utilities that invoke other utilities, this
          volume of POSIX.1‐2017 only specifies what env does with standard
          input, standard output, standard error, input files, and output
          files. If a utility is executed, it is not constrained by the
          specification of input and output by env.

          The -i option was added to allow the functionality of the removed
          - option in a manner compatible with the Utility Syntax
          Guidelines. It is possible to create a non-conforming environment
          using the -i option, as it may remove environment variables
          required by the implementation for conformance. The following
          will preserve these environment variables as well as preserve the
          PATH for conforming utilities:

              IFS='
              '
              # The preceding value should be <space><tab><newline>.
              # Set IFS to its default value.

              set -f
              # disable pathname expansion

              \unalias -a
              # Unset all possible aliases.
              # Note that unalias is escaped to prevent an alias
              # being used for unalias.
              # This step is not strictly necessary, since aliases are not inherited,
              # and the ENV environment variable is only used by interactive shells,
              # the only way any aliases can exist in a script is if it defines them
              # itself.

              unset -f env getconf
              # Ensure env and getconf are not user functions.

              env -i $(getconf V7_ENV) PATH="$(getconf PATH)" command

          Some have suggested that env is redundant since the same effect
          is achieved by:

              name=value ... utility [ argument ... ]

          The example is equivalent to env when an environment variable is
          being added to the environment of the command, but not when the
          environment is being set to the given value.  The env utility
          also writes out the current environment if invoked without
          arguments. There is sufficient functionality beyond what the
          example provides to justify inclusion of env.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.14, Special Built-In Utilities, Section 2.5, Parameters
          and Variables

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

   IEEE/The Open Group               2017                           ENV(1P)

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
