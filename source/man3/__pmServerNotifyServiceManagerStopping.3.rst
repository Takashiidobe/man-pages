.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

\__pmServerNotifyServiceManagerReady(3) — Linux manual page
===========================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `CAVEAT <#CAVEAT>`__ \|           |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `RETURN CODE <#RETURN_CODE>`__ \| |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMSERVERNOTIFYSERVICEMANAGERREADY(3)tionsVManualFYSERVICEMANAGERREADY(3)

NAME
-------------------------------------------------

::

          __pmServerNotifyServiceManagerReady,
          __pmServerNotifyServiceManagerStopping - notify service start and
          stop


-------------------------------------------------------------

::

          #include "pmapi.h"
          #include "libpcp.h"

          int __pmServerNotifyServiceManagerReady(pid_t mainpid);
          int __pmServerNotifyServiceManagerStopping(pid_t mainpid);

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
          (PCP) these routines provide a convenient and portable interface
          to service manager APIs, such as sd_notify(3).

          PCP service daemons should call
          __pmServerNotifyServiceManagerReady immediately prior to entering
          their main loop, regardless of whether or not they have forked or
          daemonised.  This will notify the service manager (if any,
          depending on the platform) that the daemon service has started,
          and that the main process to be tracked is mainpid.

          Similarly when shutting down, service daemons should call
          __pmServerNotifyServiceManagerStopping to notify the service
          manager (if any) that the tracked process of the service has
          returned from it's main loop and is about to shut down.

          These routines are intended to be portable and thus no
          conditional code should be needed for any service daemon on any
          platform.


---------------------------------------------------------------

::

          These functions will print diagnostics to the stderr stream if
          pmDebugOptions.services is set.


---------------------------------------------------------------

::

          If successful, __pmServerNotifyServiceManagerReady returns a
          positive integer that depends on the platform service manager.
          In the case of systemd(1), the return code is from sd_notify(3).
          If the platform supports systemd(1) but the NOTIFY_SOCKET
          environment variable is not set (as may be the case if the server
          program is started manually rather than by systemd(1)), the
          return code will be PM_ERR_GENERIC which will normally be ignored
          but a diagnostic will be printed if pmDebugOptions.services is
          set.  On platforms that have no service manager, the return code
          will be PM_ERR_NYI.  For backward compatibility on these
          platforms, the return code should be ignored.

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

   Performance Co-Pilot               PCPPMSERVERNOTIFYSERVICEMANAGERREADY(3)

--------------

Pages that refer to this page: `pmlogger(1) <../man1/pmlogger.1.html>`__

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
