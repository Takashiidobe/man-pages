.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

\__pmprocesspipe(3) — Linux manual page
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

   PMPROCESSPIPE(3)        Library Functions Manual        PMPROCESSPIPE(3)

NAME
-------------------------------------------------

::

          __pmProcessPipe, __pmProcessPipeClose - support for process
          execution at the end of a pipe


-------------------------------------------------------------

::

          #include "pmapi.h"
          #include "libpcp.h"

          int __pmProcessPipe(__pmExecCtl_t **handle, const char *type, int
          toss, FILE **fp);
          int __pmProcessPipeClose(FILE *fp);

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
          alternative to popen(3) and pclose(3) for executing commands in a
          separate process that is connected to the caller by a pipe.

          Setting up the command and arguments is fully documented in
          __pmProcessAddArg(3) and is identical to the procedure used to
          setup __pmProcessExec(3).

          Once all the command name and arguments have been registered
          calling __pmProcessPipe uses a pipe(2), fork(2) and execvp(2)
          sequence to execute the command.

          The type argument needs to be ``r'' to read from the pipe, else
          ``w'' to write to the pipe.

          The argument toss may be used to assign some or all of the
          standard I/O streams for the command to /dev/null - specifically
          toss is either PM_EXEC_TOSS_NONE to keep all I/O streams the same
          as the parent process, else the bit-wise or of PM_EXEC_TOSS_STDIN
          and/or PM_EXEC_TOSS_STDOUT and/or PM_EXEC_TOSS_STDERR to reassign
          stdin, stdout and stderr respectively.  PM_EXEC_TOSS_ALL is a
          convenience macro equivalent to PM_EXEC_TOSS_STDIN |
          PM_EXEC_TOSS_STDOUT | PM_EXEC_TOSS_STDERR.

          Obviously some combinations of argument values make no sense,
          e.g. type equal to ``r'' and PM_EXEC_TOSS_STDOUT set in toss or
          type equal to ``w'' and PM_EXEC_TOSS_STDIN set in type.

          __pmProcessPipe returns a standard I/O stream for the pipe via
          the fp argument.

          Once the caller determines all the work has been done,
          __pmProcessPipeClose should be called.

          Nested calling of __pmProcessExec(3) and/or __pmProcessPipe is
          not allowed.  Once __pmProcessAddArg(3) is called with handle set
          to NULL to start the registration and execution sequence any
          attempt to start a second registration sequence will be blocked
          until the first one is completed by calling __pmProcessExec(3) or
          __pmProcessPipe.


---------------------------------------------------------------

::

          If successful __pmProcessPipe returns 0.  Other conditions are
          rare (e.g. alloc failure) and are indicated by a return value
          that can be decoded using pmErrStr(3).

          The return status from __pmProcessPipeClose is a little more
          complicated.  If the command completes with an exit status of 0,
          the return value is 0.  Return values less than 0 indicate a more
          serious error and the value can be decoded using pmErrStr(3).  If
          the command was executed, but did not exit with status of 0 then
          the return value is an encoding of the waitpid(2) status as
          follows: 2000 if something unknown went wrong, else if 1000 +
          signal number of the command was killed or stopped by a signal,
          else the exit status of the command.


---------------------------------------------------------

::

          execvp(2), fork(2), pclose(2), pipe(2), popen(2),
          __pmProcessAddArg(3), __pmProcessExec(3) and waitpid(3).

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

   Performance Co-Pilot               PCP                  PMPROCESSPIPE(3)

--------------

Pages that refer to this page:
`\__pmprocessexec(3) <../man3/__pmprocessexec.3.html>`__

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
