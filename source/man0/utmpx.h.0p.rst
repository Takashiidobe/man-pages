.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

utmpx.h(0p) — Linux manual page
===============================

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

   utmpx.h(0P)             POSIX Programmer's Manual            utmpx.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          utmpx.h — user accounting database definitions


---------------------------------------------------------

::

          #include <utmpx.h>


---------------------------------------------------------------

::

          The <utmpx.h> header shall define the utmpx structure that shall
          include at least the following members:

              char            ut_user[]  User login name.
              char            ut_id[]    Unspecified initialization process identifier.
              char            ut_line[]  Device name.
              pid_t           ut_pid     Process ID.
              short           ut_type    Type of entry.
              struct timeval  ut_tv      Time entry was made.

          The <utmpx.h> header shall define the pid_t type through typedef,
          as described in <sys/types.h>.

          The <utmpx.h> header shall define the timeval structure as
          described in <sys/time.h>.

          Inclusion of the <utmpx.h> header may also make visible all
          symbols from <sys/time.h>.

          The <utmpx.h> header shall define the following symbolic
          constants as possible values for the ut_type member of the utmpx
          structure:

          EMPTY         No valid user accounting information.

          BOOT_TIME     Identifies time of system boot.

          OLD_TIME      Identifies time when system clock changed.

          NEW_TIME      Identifies time after system clock changed.

          USER_PROCESS  Identifies a process.

          INIT_PROCESS  Identifies a process spawned by the init process.

          LOGIN_PROCESS Identifies the session leader of a logged-in user.

          DEAD_PROCESS  Identifies a session leader who has exited.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided.

              void          endutxent(void);
              struct utmpx *getutxent(void);
              struct utmpx *getutxid(const struct utmpx *);
              struct utmpx *getutxline(const struct utmpx *);
              struct utmpx *pututxline(const struct utmpx *);
              void          setutxent(void);

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

          sys_time.h(0p), sys_types.h(0p)

          The System Interfaces volume of POSIX.1‐2017, endutxent(3p)


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

   IEEE/The Open Group               2017                       utmpx.h(0P)

--------------

Pages that refer to this page:
`endutxent(3p) <../man3/endutxent.3p.html>`__

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
