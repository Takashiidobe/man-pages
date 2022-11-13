.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

jobs(1p) — Linux manual page
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

   JOBS(1P)                POSIX Programmer's Manual               JOBS(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          jobs — display status of jobs in the current session


---------------------------------------------------------

::

          jobs [-l|-p] [job_id...]


---------------------------------------------------------------

::

          The jobs utility shall display the status of jobs that were
          started in the current shell environment; see Section 2.12, Shell
          Execution Environment.

          When jobs reports the termination status of a job, the shell
          shall remove its process ID from the list of those ``known in the
          current shell execution environment''; see Section 2.9.3.1,
          Examples.


-------------------------------------------------------

::

          The jobs utility shall conform to the Base Definitions volume of
          POSIX.1‐2017, Section 12.2, Utility Syntax Guidelines.

          The following options shall be supported:

          -l        (The letter ell.) Provide more information about each
                    job listed. This information shall include the job
                    number, current job, process group ID, state, and the
                    command that formed the job.

          -p        Display only the process IDs for the process group
                    leaders of the selected jobs.

          By default, the jobs utility shall display the status of all
          stopped jobs, running background jobs and all jobs whose status
          has changed and have not been reported by the shell.


---------------------------------------------------------

::

          The following operand shall be supported:

          job_id    Specifies the jobs for which the status is to be
                    displayed. If no job_id is given, the status
                    information for all jobs shall be displayed. The format
                    of job_id is described in the Base Definitions volume
                    of POSIX.1‐2017, Section 3.204, Job Control Job ID.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          jobs:

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

          If the -p option is specified, the output shall consist of one
          line for each process ID:

              "%d\n", <process ID>

          Otherwise, if the -l option is not specified, the output shall be
          a series of lines of the form:

              "[%d] %c %s %s\n", <job-number>, <current>, <state>, <command>

          where the fields shall be as follows:

          <current> The character '+' identifies the job that would be used
                    as a default for the fg or bg utilities; this job can
                    also be specified using the job_id %+ or "%%".  The
                    character '-' identifies the job that would become the
                    default if the current default job were to exit; this
                    job can also be specified using the job_id %-. For
                    other jobs, this field is a <space>.  At most one job
                    can be identified with '+' and at most one job can be
                    identified with '-'.  If there is any suspended job,
                    then the current job shall be a suspended job. If there
                    are at least two suspended jobs, then the previous job
                    also shall be a suspended job.

          <job-number>
                    A number that can be used to identify the process group
                    to the wait, fg, bg, and kill utilities. Using these
                    utilities, the job can be identified by prefixing the
                    job number with '%'.

          <state>   One of the following strings (in the POSIX locale):

                    Running   Indicates that the job has not been suspended
                              by a signal and has not exited.

                    Done      Indicates that the job completed and returned
                              exit status zero.

                    Done(code)
                              Indicates that the job completed normally and
                              that it exited with the specified non-zero
                              exit status, code, expressed as a decimal
                              number.

                    Stopped   Indicates that the job was suspended by the
                              SIGTSTP signal.

                    Stopped (SIGTSTP)
                              Indicates that the job was suspended by the
                              SIGTSTP signal.

                    Stopped (SIGSTOP)
                              Indicates that the job was suspended by the
                              SIGSTOP signal.

                    Stopped (SIGTTIN)
                              Indicates that the job was suspended by the
                              SIGTTIN signal.

                    Stopped (SIGTTOU)
                              Indicates that the job was suspended by the
                              SIGTTOU signal.

                    The implementation may substitute the string Suspended
                    in place of Stopped.  If the job was terminated by a
                    signal, the format of <state> is unspecified, but it
                    shall be visibly distinct from all of the other <state>
                    formats shown here and shall indicate the name or
                    description of the signal causing the termination.

          <command> The associated command that was given to the shell.

          If the -l option is specified, a field containing the process
          group ID shall be inserted before the <state> field. Also, more
          processes in a process group may be output on separate lines,
          using only the process ID and <command> fields.


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

          The -p option is the only portable way to find out the process
          group of a job because different implementations have different
          strategies for defining the process group of the job. Usage such
          as $(jobs -p) provides a way of referring to the process group of
          the job in an implementation-independent way.

          The jobs utility does not work as expected when it is operating
          in its own utility execution environment because that environment
          has no applicable jobs to manipulate. See the APPLICATION USAGE
          section for bg(1p).  For this reason, jobs is generally
          implemented as a shell regular built-in.


---------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          Both "%%" and "%+" are used to refer to the current job. Both
          forms are of equal validity—the "%%" mirroring "$$" and "%+"
          mirroring the output of jobs.  Both forms reflect historical
          practice of the KornShell and the C shell with job control.

          The job control features provided by bg, fg, and jobs are based
          on the KornShell. The standard developers examined the
          characteristics of the C shell versions of these utilities and
          found that differences exist. Despite widespread use of the C
          shell, the KornShell versions were selected for this volume of
          POSIX.1‐2017 to maintain a degree of uniformity with the rest of
          the KornShell features selected (such as the very popular command
          line editing features).

          The jobs utility is not dependent on the job control option, as
          are the seemingly related bg and fg utilities because jobs is
          useful for examining background jobs, regardless of the condition
          of job control. When the user has invoked a set +m command and
          job control has been turned off, jobs can still be used to
          examine the background jobs associated with that current session.
          Similarly, kill can then be used to kill background jobs with
          kill %<background job number>.

          The output for terminated jobs is left unspecified to accommodate
          various historical systems. The following formats have been
          witnessed:

           1. Killed(signal name)

           2. signal name

           3. signal name(coredump)

           4. signal description- core dumped

          Most users should be able to understand these formats, although
          it means that applications have trouble parsing them.

          The calculation of job IDs was not described since this would
          suggest an implementation, which may impose unnecessary
          restrictions.

          In an early proposal, a -n option was included to ``Display the
          status of jobs that have changed, exited, or stopped since the
          last status report''. It was removed because the shell always
          writes any changed status of jobs before each prompt.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.12, Shell Execution Environment, bg(1p), fg(1p),
          kill(1p), wait(1p)

          The Base Definitions volume of POSIX.1‐2017, Section 3.204, Job
          Control Job ID, Chapter 8, Environment Variables, Section 12.2,
          Utility Syntax Guidelines


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

   IEEE/The Open Group               2017                          JOBS(1P)

--------------

Pages that refer to this page: `bg(1p) <../man1/bg.1p.html>`__, 
`fg(1p) <../man1/fg.1p.html>`__

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
