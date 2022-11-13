.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

\__pmprocessexec(3) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `CAVEAT <#CAVEAT>`__ \|           |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMPROCESSEXEC(3)        Library Functions Manual        PMPROCESSEXEC(3)

NAME
-------------------------------------------------

::

          __pmProcessAddArg, __pmProcessUnpickArgs, __pmProcessExec -
          process execution support


-------------------------------------------------------------

::

          #include "pmapi.h"
          #include "libpcp.h"

          int __pmProcessAddArg(__pmExecCtl_t **handle, const char *arg);
          int __pmProcessUnpickArgs(__pmExecCtl_t **handle, const char
          *command);
          int __pmProcessExec(__pmExecCtl_t **handle, int toss, int wait);

          cc ... -lpcp


-----------------------------------------------------

::

          This documentation is intended for internal Performance Co-Pilot
          (PCP) developer use.

          These interfaces are not part of the PCP APIs that are guaranteed
          to remain fixed across releases, and they may not work, or may
          provide different semantics at some point in the future.


---------------------------------------------------------------

::

          Within the libraries and applications of the Performance Co-Pilot
          (PCP) these routines are provide a convenient and safe
          alternative to system(3) for executing commands in a separate
          process.

          Use __pmProcessAddArg to register the executable and command
          arguments in order.  handle should be set to NULL before the
          first call to __pmProcessAddArg for a particular command
          execution and it will be set to an opaque pointer to data
          structures that are manipulated in __pmProcessAddArg,
          __pmProcessExec and the related __pmProcessPipe(3) routines.

          When called with handle set to NULL arg is treated as the name of
          the command to be executed and subsequent calls (if any) are for
          the arguments to that command.  The name of the command can be a
          full pathname, or the name of an executable that can be found on
          the current $PATH as per the rules of execvp(2) that is used by
          __pmProcessExec.

          __pmProcessUnpickArgs is a convenience wrapper to assist
          conversion of code that assumes the command is a shell command
          that has been prepared for use with system(3) or popen(3) in
          existing code.  The arguments in command are picked off one-by-
          one and used to call __pmProcessAddArgs.  The parser is simple,
          as the routine is designed for simple shell command syntax, where
          arguments are separated by one or more spaces but embedded spaces
          within an argument are allowed if the arguement is enclosed in
          single or double quotes.  More advanced shell syntax like escape
          characters and input-output redirection are not recognized.

          Once all the command name and arguments have been registered
          calling __pmProcessExec uses a fork(2) and execvp(2) sequence to
          execute the command.

          The argument toss may be used to assign some or all of the
          standard I/O streams for the command to /dev/null - specifically
          toss is either PM_EXEC_TOSS_NONE to keep all I/O streams the same
          as the parent process, else the bit-wise or of PM_EXEC_TOSS_STDIN
          and/or PM_EXEC_TOSS_STDOUT and/or PM_EXEC_TOSS_STDERR to reassign
          stdin, stdout and stderr respectively.  PM_EXEC_TOSS_ALL is a
          convenience macro equivalent to PM_EXEC_TOSS_STDIN |
          PM_EXEC_TOSS_STDOUT | PM_EXEC_TOSS_STDERR.

          The wait argument should be PM_EXEC_WAIT if __pmProcessExec
          should wait for completion of the command and harvest the exit
          status, else PM_EXEC_NOWAIT in which case __pmProcessExec returns
          immediately (effectively running the command in the background).

          Nested calling of __pmProcessExec and/or __pmProcessPipe(3) is
          not allowed.  Once __pmProcessAddArg is called with handle set to
          NULL to start the registration and execution sequence any attempt
          to start a second registration sequence will be blocked until the
          first one is completed by calling __pmProcessExec or
          __pmProcessPipe(3).


---------------------------------------------------------------

::

          If successful __pmProcessAddArg returns 0.  Other conditions are
          rare (e.g. alloc failure) and are indicated by a return value
          that can be decoded using pmErrStr(3).

          __pmProcessUnpickArgs returns 0 on success.  In the case of an
          unterminated string, a message is generated and PM_ERR_GENERIC is
          returned.  Other return values less than 0 indicate a more
          serious error and the value can be decoded using pmErrStr(3).

          The return status from __pmProcessExec is more complicated.  If
          either PM_EXEC_NOWAIT is specified, or the command completes with
          an exit status of 0, the return value is 0.  Return values less
          than 0 indicate a more serious error and the value can be decoded
          using pmErrStr(3).  If the command was executed, but did not exit
          with status of 0 then the return value is an encoding of the
          waitpid(2) status as follows: 2000 if something unknown went
          wrong, else if 1000 + signal number of the command was killed or
          stopped by a signal, else the exit status of the command.


---------------------------------------------------------

::

          execvp(2), fork(2), __pmProcessPipe(3), popen(3), system(3) and
          waitpid(3).

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCP (Performance Co-Pilot) project.
          Information about the project can be found at 
          ⟨http://www.pcp.io/⟩.  If you have a bug report for this manual
          page, send it to pcp@groups.io.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/performancecopilot/pcp.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Performance Co-Pilot               PCP                  PMPROCESSEXEC(3)

--------------

Pages that refer to this page:
`\__pmprocesspipe(3) <../man3/__pmprocesspipe.3.html>`__

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
