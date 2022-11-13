.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

who(1p) — Linux manual page
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

   WHO(1P)                 POSIX Programmer's Manual                WHO(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          who — display who is on the system


---------------------------------------------------------

::

          who [-mTu] [-abdHlprt] [file]

          who [-mu] -s [-bHlprt] [file]

          who -q [file]

          who am i

          who am I


---------------------------------------------------------------

::

          The who utility shall list various pieces of information about
          accessible users. The domain of accessibility is implementation-
          defined.

          Based on the options given, who can also list the user's name,
          terminal line, login time, elapsed time since activity occurred
          on the line, and the process ID of the command interpreter for
          each current system user.


-------------------------------------------------------

::

          The who utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following options shall be supported. The metavariables, such
          as <line>, refer to fields described in the STDOUT section.

          -a        Process the implementation-defined database or named
                    file with the -b, -d, -l, -p, -r, -t, -T and -u options
                    turned on.

          -b        Write the time and date of the last system reboot. The
                    system reboot time is the time at which the
                    implementation is able to commence running processes.

          -d        Write a list of all processes that have expired and not
                    been respawned by the init system process. The <exit>
                    field shall appear for dead processes and contain the
                    termination and exit values of the dead process. This
                    can be useful in determining why a process terminated.

          -H        Write column headings above the regular output.

          -l        (The letter ell.) List only those lines on which the
                    system is waiting for someone to login. The <name>
                    field shall be LOGIN in such cases. Other fields shall
                    be the same as for user entries except that the <state>
                    field does not exist.

          -m        Output only information about the current terminal.

          -p        List any other process that is currently active and has
                    been previously spawned by init.

          -q        (Quick.) List only the names and the number of users
                    currently logged on. When this option is used, all
                    other options shall be ignored.

          -r        Write the current run-level of the init process.

          -s        List only the <name>, <line>, and <time> fields.  This
                    is the default case.

          -t        Indicate the last change to the system clock.

          -T        Show the state of each terminal, as described in the
                    STDOUT section.

          -u        Write ``idle time'' for each displayed user in addition
                    to any other information. The idle time is the time
                    since any activity occurred on the user's terminal. The
                    method of determining this is unspecified.  This option
                    shall list only those users who are currently logged
                    in.  The <name> is the user's login name. The <line> is
                    the name of the line as found in the directory /dev.
                    The <time> is the time that the user logged in. The
                    <activity> is the number of hours and minutes since
                    activity last occurred on that particular line. A dot
                    indicates that the terminal has seen activity in the
                    last minute and is therefore ``current''. If more than
                    twenty-four hours have elapsed or the line has not been
                    used since boot time, the entry shall be marked <old>.
                    This field is useful when trying to determine whether a
                    person is working at the terminal or not. The <pid> is
                    the process ID of the user's login process.


---------------------------------------------------------

::

          The following operands shall be supported:

          am i, am I
                    In the POSIX locale, limit the output to describing the
                    invoking user, equivalent to the -m option. The am and
                    i or I must be separate arguments.

          file      Specify a pathname of a file to substitute for the
                    implementation-defined database of logged-on users that
                    who uses by default.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          who:

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

          LC_TIME   Determine the locale used for the format and contents
                    of the date and time strings.

          NLSPATH   Determine the location of message catalogs for the
                    processing of LC_MESSAGES.

          TZ        Determine the timezone used when writing date and time
                    information. If TZ is unset or null, an unspecified
                    default timezone shall be used.


-------------------------------------------------------------------------------

::

          Default.


-----------------------------------------------------

::

          The who utility shall write its default format to the standard
          output in an implementation-defined format, subject only to the
          requirement of containing the information described above.

          XSI-conformant systems shall write the default information to the
          standard output in the following general format:

              <name>[<state>]<line><time>[<activity>][<pid>][<comment>][<exit>]

          For the -b option, <line> shall be "systemboot".  The <name> is
          unspecified.

          The following format shall be used for the -T option:

              "%s %c %s %s\n" <name>, <terminal state>, <terminal name>,
                  <time of login>

          where <terminal state> is one of the following characters:

          +       The terminal allows write access to other users.

          -       The terminal denies write access to other users.

          ?       The terminal write-access state cannot be determined.

          <space> This entry is not associated with a terminal.

          In the POSIX locale, the <time of login> shall be equivalent in
          format to the output of:

              date +"%b %e %H:%M"

          If the -u option is used with -T, the idle time shall be added to
          the end of the previous format in an unspecified format.


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

          The name init used for the system process is the most commonly
          used on historical systems, but it may vary.

          The ``domain of accessibility'' referred to is a broad concept
          that permits interpretation either on a very secure basis or even
          to allow a network-wide implementation like the historical rwho.


---------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          Due to differences between historical implementations, the base
          options provided were a compromise to allow users to work with
          those functions. The standard developers also considered removing
          all the options, but felt that these options offered users
          valuable functionality. Additional options to match historical
          systems are available on XSI-conformant systems.

          It is recognized that the who command may be of limited
          usefulness, especially in a multi-level secure environment. The
          standard developers considered, however, that having some
          standard method of determining the ``accessibility'' of other
          users would aid user portability.

          No format was specified for the default who output for systems
          not supporting the XSI option. In such a user-oriented command,
          designed only for human use, this was not considered to be a
          deficiency.

          The format of the terminal name is unspecified, but the
          descriptions of ps, talk, and write require that they use the
          same format.

          It is acceptable for an implementation to produce no output for
          an invocation of who mil.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          mesg(1p)

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

   IEEE/The Open Group               2017                           WHO(1P)

--------------

Pages that refer to this page: `id(1p) <../man1/id.1p.html>`__, 
`logname(1p) <../man1/logname.1p.html>`__, 
`talk(1p) <../man1/talk.1p.html>`__, 
`write(1p) <../man1/write.1p.html>`__

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
