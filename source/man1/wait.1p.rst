.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

wait(1p) — Linux manual page
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

   WAIT(1P)                POSIX Programmer's Manual               WAIT(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          wait — await process completion


---------------------------------------------------------

::

          wait [pid...]


---------------------------------------------------------------

::

          When an asynchronous list (see Section 2.9.3.1, Examples) is
          started by the shell, the process ID of the last command in each
          element of the asynchronous list shall become known in the
          current shell execution environment; see Section 2.12, Shell
          Execution Environment.

          If the wait utility is invoked with no operands, it shall wait
          until all process IDs known to the invoking shell have terminated
          and exit with a zero exit status.

          If one or more pid operands are specified that represent known
          process IDs, the wait utility shall wait until all of them have
          terminated. If one or more pid operands are specified that
          represent unknown process IDs, wait shall treat them as if they
          were known process IDs that exited with exit status 127. The exit
          status returned by the wait utility shall be the exit status of
          the process requested by the last pid operand.

          The known process IDs are applicable only for invocations of wait
          in the current shell execution environment.


-------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          The following operand shall be supported:

          pid       One of the following:

                     1. The unsigned decimal integer process ID of a
                        command, for which the utility is to wait for the
                        termination.

                     2. A job control job ID (see the Base Definitions
                        volume of POSIX.1‐2017, Section 3.204, Job Control
                        Job ID) that identifies a background process group
                        to be waited for. The job control job ID notation
                        is applicable only for invocations of wait in the
                        current shell execution environment; see Section
                        2.12, Shell Execution Environment.  The exit status
                        of wait shall be determined by the last command in
                        the pipeline.

                        Note:  The job control job ID type of pid is only
                               available on systems supporting the User
                               Portability Utilities option.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          The following environment variables shall affect the execution of
          wait:

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

          If one or more operands were specified, all of them have
          terminated or were not known by the invoking shell, and the
          status of the last operand specified is known, then the exit
          status of wait shall be the exit status information of the
          command indicated by the last operand specified. If the process
          terminated abnormally due to the receipt of a signal, the exit
          status shall be greater than 128 and shall be distinct from the
          exit status generated by other signals, but the exact value is
          unspecified. (See the kill -l option.) Otherwise, the wait
          utility shall exit with one of the following values:

              0   The wait utility was invoked with no operands and all
                  process IDs known by the invoking shell have terminated.

          1‐126   The wait utility detected an error.

            127   The command identified by the last pid operand specified
                  is unknown.


-------------------------------------------------------------------------------------

::

          Default.

          The following sections are informative.


---------------------------------------------------------------------------

::

          On most implementations, wait is a shell built-in. If it is
          called in a subshell or separate utility execution environment,
          such as one of the following:

              (wait)
              nohup wait ...
              find . -exec wait ... \;

          it returns immediately because there are no known process IDs to
          wait for in those environments.

          Historical implementations of interactive shells have discarded
          the exit status of terminated background processes before each
          shell prompt. Therefore, the status of background processes was
          usually lost unless it terminated while wait was waiting for it.
          This could be a serious problem when a job that was expected to
          run for a long time actually terminated quickly with a syntax or
          initialization error because the exit status returned was usually
          zero if the requested process ID was not found. This volume of
          POSIX.1‐2017 requires the implementation to keep the status of
          terminated jobs available until the status is requested, so that
          scripts like:

              j1&
              p1=$!
              j2&
              wait $p1
              echo Job 1 exited with status $?
              wait $!
              echo Job 2 exited with status $?

          work without losing status on any of the jobs. The shell is
          allowed to discard the status of any process if it determines
          that the application cannot get the process ID for that process
          from the shell. It is also required to remember only {CHILD_MAX}
          number of processes in this way. Since the only way to get the
          process ID from the shell is by using the '!'  shell parameter,
          the shell is allowed to discard the status of an asynchronous
          list if "$!" was not referenced before another asynchronous list
          was started. (This means that the shell only has to keep the
          status of the last asynchronous list started if the application
          did not reference "$!".  If the implementation of the shell is
          smart enough to determine that a reference to "$!" was not saved
          anywhere that the application can retrieve it later, it can use
          this information to trim the list of saved information. Note also
          that a successful call to wait with no operands discards the exit
          status of all asynchronous lists.)

          If the exit status of wait is greater than 128, there is no way
          for the application to know if the waited-for process exited with
          that value or was killed by a signal.  Since most utilities exit
          with small values, there is seldom any ambiguity. Even in the
          ambiguous cases, most applications just need to know that the
          asynchronous job failed; it does not matter whether it detected
          an error and failed or was killed and did not complete its job
          normally.


---------------------------------------------------------

::

          Although the exact value used when a process is terminated by a
          signal is unspecified, if it is known that a signal terminated a
          process, a script can still reliably determine which signal by
          using kill as shown by the following script:

              sleep 1000&
              pid=$!
              kill -kill $pid
              wait $pid
              echo $pid was terminated by a SIG$(kill -l $?) signal.

          If the following sequence of commands is run in less than 31
          seconds:

              sleep 257 | sleep 31 &
              jobs -l %%

          either of the following commands returns the exit status of the
          second sleep in the pipeline:

              wait <pid of sleep 31>
              wait %%


-----------------------------------------------------------

::

          The description of wait does not refer to the waitpid() function
          from the System Interfaces volume of POSIX.1‐2017 because that
          would needlessly overspecify this interface. However, the wording
          means that wait is required to wait for an explicit process when
          it is given an argument so that the status information of other
          processes is not consumed. Historical implementations use the
          wait() function defined in the System Interfaces volume of
          POSIX.1‐2017 until wait() returns the requested process ID or
          finds that the requested process does not exist. Because this
          means that a shell script could not reliably get the status of
          all background children if a second background job was ever
          started before the first job finished, it is recommended that the
          wait utility use a method such as the functionality provided by
          the waitpid() function.

          The ability to wait for multiple pid operands was adopted from
          the KornShell.

          This new functionality was added because it is needed to
          determine the exit status of any asynchronous list accurately.
          The only compatibility problem that this change creates is for a
          script like

              while sleep 60 do
                  job& echo Job started $(date) as $!  done

          which causes the shell to monitor all of the jobs started until
          the script terminates or runs out of memory. This would not be a
          problem if the loop did not reference "$!" or if the script would
          occasionally wait for jobs it started.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Chapter 2, Shell Command Language, kill(1p), sh(1p)

          The Base Definitions volume of POSIX.1‐2017, Section 3.204, Job
          Control Job ID, Chapter 8, Environment Variables

          The System Interfaces volume of POSIX.1‐2017, wait(3p)


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

   IEEE/The Open Group               2017                          WAIT(1P)

--------------

Pages that refer to this page: `bg(1p) <../man1/bg.1p.html>`__, 
`fg(1p) <../man1/fg.1p.html>`__,  `jobs(1p) <../man1/jobs.1p.html>`__, 
`kill(1p) <../man1/kill.1p.html>`__, 
`sleep(1p) <../man1/sleep.1p.html>`__

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
