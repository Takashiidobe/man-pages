.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

\__pmaf(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `CAVEAT <#CAVEAT>`__ \|           |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMAF(3)                 Library Functions Manual                 PMAF(3)

NAME
-------------------------------------------------

::

          __pmAFsetup, __pmAFregister, __pmAFunregister, __pmAFblock,
          __pmAFunblock, __pmAFisempty - event queue services for periodic
          asynchronous callbacks


-------------------------------------------------------------

::

          #include "pmapi.h"
          #include "libpcp.h"

          int __pmAFsetup(const struct timeval *start, const struct timeval
                  *delta, void *data, void (*func)(int, void *));
          int __pmAFregister(const struct timeval *delta, void *data,
                  void (*func)(int, void *));
          int __pmAFunregister(int afid);
          void __pmAFblock(void);
          void __pmAFunblock(void);
          int __pmAFisempty(void);

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

          The routines implement an event queue and callback framework that
          supports periodic evaluation of a series of events with varying
          frequencies for Performance Co-Pilot (PCP) applications.

          The pmlogger(1) application, the pmdatrace(1) PMDA and the
          pmdahotproc(1) PMDA are the principal users of these services.

          An event is created by calling __pmAFsetup or __pmAFregister and
          on success the return value is an event number greater than zero.
          The event has associated event data identified by the opaque
          pointer data.  The event will occur with frequency delta and each
          time the event occurs the function func will be called with the
          event number and the event data as arguments.

          If __pmAFsetup is used then the first event is scheduled for the
          current time plus start, else if __pmAFregister is used then the
          first event is scheduled for the current time plus delta.

          func is called in a SIGALRM signal handler context and so the
          routines that may be safely called from func are restricted to
          the so-called async-signal-safe set.  In particular there must be
          no Standard I/O calls nor calls to any of the malloc(3) routines
          to modify the state of the heap.  Refer to the Pointer to a
          Function Section of the POSIX.1-2013 document at
          http://pubs.opengroup.org/onlinepubs/9699919799/functions/V2_chap02.html
          for a fuller description.

          The safest and simplest class of func routines are those that do
          minimal processing, set some global state and return.  The real
          work associated with the event is done subsequently from the
          application's main loop when the global state change is detected.

          Once the event occurs and the callback has been executed, the
          event will be rescheduled for delta into the future, except if
          all the fields of delta are zero, in which case the event will
          not be rescheduled (a ``one trip'' event).

          Internally, events are processed serially so there is no
          possibility of nested callbacks or re-entrant callbacks from the
          event management routines.

          Given an event number afid, __pmAFunregister will permanently
          remove the corresponding entry from the event queue.

          To control the event queue processing, __pmAFblock and
          __pmAFunblock may be used to explicitly block and unblock the
          dispatch of events.  This is most useful when the caller wishes
          to set up a number of events via __pmAFsetup or __pmAFregister
          and complete the registration phase before the first event
          callback occurs.

          A call to __pmAFisempty returns 1 or 0 depending on whether the
          event queue is empty or not.


-------------------------------------------------------

::

          These routines rely on setitimer(2) and manipulate the handling
          of SIGALRM signals, and hence are probably ill-suited for
          applications that require direct and concurrent access to these
          services and resources.

          If the callback functions are slow, or delayed, it is possible
          that the event scheduling could fall behind and never catchup.
          When this begins to happen, events are silently skipped and
          rescheduled at the earliest possible time in the future according
          to the fixed schedule defined by the time of the call to
          __pmAFsetup and the value of the start and delta arguments (or
          defined by the time of the call to __pmAFregister and the value
          of the delta argument).

          In addition, the semantics of the interval timer(s) and the
          global state needed to support these services demand that
          applications calling these routines must do so from a single
          thread.  This restriction is enforced at the PMAPI(3), where
          routines may return the error code PM_ERR_THREAD if the library
          detects calls from more than one thread.


---------------------------------------------------------------

::

          __pmAFsetup, __pmAFregister and __pmAFunregister return values
          less than zero in the case of an error.  These values are PCP
          error codes, and may be used to produce error messages via
          pmErrStr(3).

          The routines support the standard PCP debug tracing, and the af
          option (or -D af on the command line) will produce diagnostics on
          standard error that trace the enqueuing and execution of events.


---------------------------------------------------------

::

          PMAPI(3)

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

   Performance Co-Pilot               PCP                           PMAF(3)

--------------

Pages that refer to this page:
`pmapi_internal(3) <../man3/pmapi_internal.3.html>`__

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
