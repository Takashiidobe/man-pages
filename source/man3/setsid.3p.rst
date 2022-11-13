.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setsid(3p) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
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

   SETSID(3P)              POSIX Programmer's Manual             SETSID(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          setsid — create session and set process group ID


---------------------------------------------------------

::

          #include <unistd.h>

          pid_t setsid(void);


---------------------------------------------------------------

::

          The setsid() function shall create a new session, if the calling
          process is not a process group leader. Upon return the calling
          process shall be the session leader of this new session, shall be
          the process group leader of a new process group, and shall have
          no controlling terminal. The process group ID of the calling
          process shall be set equal to the process ID of the calling
          process. The calling process shall be the only process in the new
          process group and the only process in the new session.


-----------------------------------------------------------------

::

          Upon successful completion, setsid() shall return the value of
          the new process group ID of the calling process. Otherwise, it
          shall return -1 and set errno to indicate the error.


-----------------------------------------------------

::

          The setsid() function shall fail if:

          EPERM  The calling process is already a process group leader, or
                 the process group ID of a process other than the calling
                 process matches the process ID of the calling process.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The setsid() function is similar to the setpgrp() function of
          System V.  System V, without job control, groups processes into
          process groups and creates new process groups via setpgrp(); only
          one process group may be part of a login session.

          Job control allows multiple process groups within a login
          session. In order to limit job control actions so that they can
          only affect processes in the same login session, this volume of
          POSIX.1‐2017 adds the concept of a session that is created via
          setsid().  The setsid() function also creates the initial process
          group contained in the session. Additional process groups can be
          created via the setpgid() function. A System V process group
          would correspond to a POSIX System Interfaces session containing
          a single POSIX process group. Note that this function requires
          that the calling process not be a process group leader. The usual
          way to ensure this is true is to create a new process with fork()
          and have it call setsid().  The fork() function guarantees that
          the process ID of the new process does not match any existing
          process group ID.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          getsid(3p), setpgid(3p), setpgrp(3p)

          The Base Definitions volume of POSIX.1‐2017, sys_types.h(0p),
          unistd.h(0p)


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

   IEEE/The Open Group               2017                        SETSID(3P)

--------------

Pages that refer to this page:
`unistd.h(0p) <../man0/unistd.h.0p.html>`__, 
`\_Exit(3p) <../man3/_Exit.3p.html>`__, 
`getpgid(3p) <../man3/getpgid.3p.html>`__, 
`getpgrp(3p) <../man3/getpgrp.3p.html>`__, 
`getpid(3p) <../man3/getpid.3p.html>`__, 
`getppid(3p) <../man3/getppid.3p.html>`__, 
`getsid(3p) <../man3/getsid.3p.html>`__, 
`kill(3p) <../man3/kill.3p.html>`__, 
`setpgid(3p) <../man3/setpgid.3p.html>`__, 
`setpgrp(3p) <../man3/setpgrp.3p.html>`__, 
`tcgetpgrp(3p) <../man3/tcgetpgrp.3p.html>`__

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
