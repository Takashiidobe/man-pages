.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sys_wait.h(0p) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   sys_wait.h(0P)          POSIX Programmer's Manual         sys_wait.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sys/wait.h — declarations for waiting


---------------------------------------------------------

::

          #include <sys/wait.h>


---------------------------------------------------------------

::

          The <sys/wait.h> header shall define the following symbolic
          constants for use with waitpid():

          WCONTINUED    Report status of continued child process.

          WNOHANG       Do not hang if no status is available; return
                        immediately.

          WUNTRACED     Report status of stopped child process.

          The <sys/wait.h> header shall define the following macros for
          analysis of process status values:

          WEXITSTATUS   Return exit status.

          WIFCONTINUED  True if child has been continued.

          WIFEXITED     True if child exited normally.

          WIFSIGNALED   True if child exited due to uncaught signal.

          WIFSTOPPED    True if child is currently stopped.

          WSTOPSIG      Return signal number that caused process to stop.

          WTERMSIG      Return signal number that caused process to
                        terminate.

          The <sys/wait.h> header shall define the following symbolic
          constants as possible values for the options argument to
          waitid():

          WEXITED       Wait for processes that have exited.

          WNOWAIT       Keep the process whose status is returned in infop
                        in a waitable state.

          WSTOPPED      Status is returned for any child that has stopped
                        upon receipt of a signal.

          The WCONTINUED and WNOHANG constants, described above for
          waitpid(), can also be used with waitid().

          The type idtype_t shall be defined as an enumeration type whose
          possible values shall include at least the following: P_ALL
          P_PGID P_PID

          The <sys/wait.h> header shall define the id_t and pid_t types as
          described in <sys/types.h>.

          The <sys/wait.h> header shall define the siginfo_t type and the
          sigval union as described in <signal.h>.

          Inclusion of the <sys/wait.h> header may also make visible all
          symbols from <signal.h>.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided.

              pid_t  wait(int *);
              int    waitid(idtype_t, id_t, siginfo_t *, int);
              pid_t  waitpid(pid_t, int *, int);

          The following sections are informative.


---------------------------------------------------------------------------

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

          signal.h(0p), sys_resource.h(0p), sys_types.h(0p)

          The System Interfaces volume of POSIX.1‐2017, wait(3p),
          waitid(3p)


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

   IEEE/The Open Group               2017                    sys_wait.h(0P)

--------------

Pages that refer to this page:
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`system(3p) <../man3/system.3p.html>`__, 
`wait(3p) <../man3/wait.3p.html>`__, 
`waitid(3p) <../man3/waitid.3p.html>`__

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
