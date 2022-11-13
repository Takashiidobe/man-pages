.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmwebtimerregister(3) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `DIAGNOSTICS <#DIAGNOSTICS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMWEBTIMERREGISTER(3)   Library Functions Manual   PMWEBTIMERREGISTER(3)

NAME
-------------------------------------------------

::

          pmWebTimerRegister, pmWebTimerRelease,
          pmWebTimerSetMetricRegistry - thread-safe timer list management


-------------------------------------------------------------

::

          #include <pcp/pmwebapi.h>

          typedef void (*pmWebTimerCallBack)(void *data);
          int pmWebTimerRegister(pmWebTimerCallBack callback, void *data);

          int pmWebTimerRelease(int seq);
          int pmWebTimerSetMetricRegistry(struct mmv_registry *registry);
          cc ... -lpcp_web


---------------------------------------------------------------

::

          The pmWebTimerRegister and related API functions provide a
          convenient thread-safe API for applications to manage a list of
          timer driven callbacks.  On the first call to pmWebTimerRegister
          or pmWebTimerSetMetricRegistry, an internal timer is set up and
          initialized to fire every 1.0 seconds.  Each time the timer
          fires, all currently registered callback functions will be called
          serially with the opaque data pointer that was supplied when each
          function was registered.  The pmWebTimerCallBack typedef provides
          a suitable callback function prototype.

          All registered callback functions should be non-blocking and
          execute quickly and synchronously.  Typical callback functions
          include refreshing instrumentation, calculating and updating
          performance metric values, periodic garbage collection and any
          other local function that requires regular execution.

          The pmWebTimerSetMetricRegistry function provides a convenient
          way for an application to pass in a pointer to an libpcp_mmv(3)
          registry that has been suitably initialized by the calling
          application.  This registry will be used to dynamically create
          six server resource metrics named NAME.mem.datasz,
          NAME.mem.maxrss, NAME.cpu.total, NAME.cpu.sys, NAME.cpu.user and
          NAME.pid, where NAME is the root PCP PMNS(5) name set up by the
          calling application.  These metrics should be reasonably self
          explanatory; they provide resource usage metrics from the calling
          application / server and use getrusage(2), times(2) and
          getpid(2).


-----------------------------------------------------------------

::

          The pmWebTimerRegister function returns a positive integer handle
          that may be subsequently used in a call to pmWebTimerRelease to
          remove a timer from the internal timer list.  When a timer is
          removed with a call to pmWebTimerRelease, the internal data
          structures are freed.  The caller however, is responsible for
          freeing the associated data (since it may or may not be
          dynamically allocated).


---------------------------------------------------------------

::

          On failure a negative PMAPI error code is returned in all cases.


---------------------------------------------------------

::

          pmproxy(1), mmv_stats_registry(3), PMAPI(3) and PMWEBAPI(3).

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

   Performance Co-Pilot               PCP             PMWEBTIMERREGISTER(3)

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
