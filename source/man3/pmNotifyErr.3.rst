.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmnotifyerr(3) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMNOTIFYERR(3)          Library Functions Manual          PMNOTIFYERR(3)

NAME
-------------------------------------------------

::

          pmNotifyErr, pmSyslog - standard handling of error messages


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          void pmNotifyErr(int priority, const char *message, ...);
          void pmSyslog(int onoff);

          cc ... -lpcp


---------------------------------------------------------------

::

          These routines provide standard handling for error messages from
          within the internals of Performance Co-Pilot (PCP) daemons and
          Performance Metric Domain Agents (PMDAs).

          pmNotifyErr is a printf(3) style function that will format
          message (and any subsequent arguments) with a prefix that
          includes the current date and time from ctime(3), the name of the
          application from pmGetProgname(3), the process's id from
          getpid(2) and the priority.

          priority should be one of the level LOG_ macros defined for
          syslog(3).  Most typically this would be LOG_INFO, LOG_WARNING or
          LOG_ERR.

          pmNotifyErr writes to standard error, which for daemons and PMDAs
          has most likely been redirected to a log file using pmOpenLog(3).
          Additionally message (and any subsequent arguments) may be sent
          forwarded to syslog(3) if pmSyslog has previously been called
          with onoff having a non-zero value.

          Forwarding to syslog(3) can be disabled at any time by calling
          pmSyslog with onoff having a zero value, and this is the starting
          state for each PCP application.

          In the style of syslog(3) message need not include a terminating
          newline character (one will be added if required).


---------------------------------------------------------

::

          getpid(2), ctime(3), PMAPI(3), pmGetProgname(3), pmOpenLog(3),
          printf(3) and syslog(3).

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

   Performance Co-Pilot               PCP                    PMNOTIFYERR(3)

--------------

Pages that refer to this page: `pmnomem(3) <../man3/pmnomem.3.html>`__

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
