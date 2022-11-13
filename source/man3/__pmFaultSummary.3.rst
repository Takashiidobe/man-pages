.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmfault(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RUN-TI                           |                                   |
| ME CONTROL <#RUN-TIME_CONTROL>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMFAULT(3)              Library Functions Manual              PMFAULT(3)

NAME
-------------------------------------------------

::

          __pmFaultInject, PM_FAULT_POINT, PM_FAULT_RETURN, PM_FAULT_CHECK,
          PM_FAULT_CLEAR, __pmFaultSummary - Fault Injection Infrastracture
          for QA


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/fault.h>

          void __pmFaultInject(const char *ident, int class);
          void __pmFaultSummary(FILE *f);

          PM_FAULT_POINT(ident, class);
          PM_FAULT_RETURN(class);
          PM_FAULT_CHECK(class);
          PM_FAULT_CLEAR;

          cc -DPM_FAULT_INJECTION=1 ... -lpcp_fault


---------------------------------------------------------------

::

          As part of the coverage-driven changes to QA in PCP 3.6, it
          became apparent that we needed someway to exercise the
          ``uncommon'' code paths associated with error detection and
          recovery.

          The facilities described below provide a basic fault injection
          infrastructure (for libpcp only at this stage, alhough the
          mechanism is far more general and could easily be extended).

          A special build is required to create libpcp_fault and the
          associated <pcp/fault.h> header file.  Once this has been done,
          new QA applications may be built with -DPM_FAULT_INJECTION=1
          and/or existing applications can be exercised in presence of
          fault injection by forcing libpcp_fault to be used in preference
          to libpcp as described below.

          In the code to be tested, __pmFaultInject defines a fault point
          at which a fault of type class may be injected.  ident is a
          string to uniquely identify the fault point across all of the PCP
          source code, so something like "libpcp/" __FILE__ ":<number>"
          works just fine.  The ident string also determines if a fault
          will be injected at run-time or not - refer to the RUN-TIME
          CONTROL section below.  class selects a failure type, using one
          of the following defined values (this list may well grow over
          time):

          PM_FAULT_ALLOC
                 Will cause the next call to malloc(3), realloc(3) or
                 strdup(3) to fail, returning NULL and setting errno to
                 ENOMEM.  We could extend the coverage to all of the
                 malloc-related routines, but these three are sufficient to
                 cover the vast majority of the uses within libpcp.

          PM_FAULT_PMAPI
                 Will cause the next call to a PMAPI routine to fail by
                 returning the (new) PCP error code PM_ERR_FAULT.  At the
                 this stage, only __pmRegisterAnon(3) has been instrumented
                 as a proof of concept for this part of the facility.

          PM_FAULT_TIMEOUT
                 Will cause the next call to an instrumented routine to
                 return the PCP error code PM_ERR_TIMEOUT.  At this stage,
                 only __pmGetPDU(3) has been instrumented to check for this
                 class of fault injection.

          PM_FAULT_MISC
                 The ``other'' class, currently used with PM_FAULT_CHECK as
                 described below.

          To allow fault injection to co-exist within the production source
          code, PM_FAULT_POINT is a macro that emits no code by default,
          but when PM_FAULT_INJECTION is defined this becomes a call to
          __pmFaultInject.  Throughout libpcp we use PM_FAULT_POINT and not
          __pmFaultInject so that both libpcp and libpcp_fault can be built
          from the same source code.

          Similarly, the macro PM_FAULT_RETURN emits no code unless
          PM_FAULT_INJECTION is defined, in which case if a fault of type
          class has been armed with __pmFaultInject then, the enclosing
          routine will trigger the associated error behaviour.  For the
          moment, this only works for the following class types:

          PM_FAULT_PMAPI
                 The enclosing routine will return immediately with the
                 value PM_ERR_FAULT - this assumes the enclosing routine is
                 of type int foo(...)  like all of the PMAPI routines.

          PM_FAULT_TIMEOUT
                 The enclosing routine will return immediately with the
                 value PM_ERR_TIMEOUT - this assumes the enclosing routine
                 is of type int foo(...)  like all of the PMAPI routines.

          The PM_FAULT_CHECK macro returns a value that may be 0 or 1.  If
          PM_FAULT_INJECTION is defined then if a fault of type class has
          been armed with __pmFaultInject then the value is 1 else it is 0.

          This is most often used in concert with the PM_FAULT_POINT macro
          with the PM_FAULT_MISC class to potentially arm a trigger, then
          PM_FAULT_CHECK and if this has the value 1, then the final
          PM_FAULT_CLEAR macro is used to clear any armed faults.  This is
          illustrated in the example below from src/libpcp/src/exec.c:

              pid = fork();

              /* begin fault-injection block */
              PM_FAULT_POINT("libpcp/" __FILE__ ":4", PM_FAULT_MISC);
              if (PM_FAULT_CHECK(PM_FAULT_MISC)) {
               PM_FAULT_CLEAR;
               if (pid > (pid_t)0)
                   kill(pid, SIGKILL);
               setoserror(EAGAIN);
               pid = -1;
              }
              /* end fault-injection block */

          A summary of fault points seen and faults injected is produced on
          stdio stream f by __pmFaultSummary.

          Additional tracing (via -Dfault or pmDebugOptions.fault) and a
          new PMAPI error code (PM_ERR_FAULT) are also defined, although
          these will only ever be seen or used in libpcp_fault.  If
          pmDebugOptions.fault is set the first time __pmFaultInject is
          called, then __pmFaultSummary will be called automatically to
          report on stderr when the application exits (via atexit(3)).

          Fault injection cannot be nested.  Each call to __pmFaultInject
          clears any previous fault injection that has been armed, but not
          yet executed.

          The fault injection infrastructure is not thread-safe and should
          only be used with applications that are known to be single-
          threaded.


-------------------------------------------------------------------------

::

          By default, no fault injection is enabled at run-time, even when
          __pmFaultInject is called.

          Faults are selectively enabled using a control file, identified
          by the environment variable $PM_FAULT_CONTROL; if this is not
          set, no faults are enabled.

          The control file (if it exists) is read the first time
          __pmFaultInject is called, and contains lines of the form:
                  ident op number
          that define fault injection guards.

          ident is a fault point string (as defined by a call to
          __pmFaultInject, or more usually the PM_FAULT_POINT macro).  So
          one needs access to the libpcp source code to determine the
          available ident strings and their semantics.

          op is one of the C-style operators >=, >, ==, <, <=, != or % and
          number is an unsigned integer.  op number is optional and the
          default is >0

          The semantics of the fault injection guards are that each time
          __pmFaultInject is called for a particular ident, a trip count is
          incremented (the first trip is 1); if the C-style expression
          tripcount op number has the value 1 (so true for most ops, or the
          remainder equals 1 for the % op), then a fault of the class
          defined for the fault point associated with ident will be armed,
          and executed as soon as possible.

          Within the control file, blank lines are ignored and lines
          beginning with # are treated as comments.

          For an existing application linked with libpcp fault injection
          may still be used by forcing libpcp_fault to be used in the place
          of libpcp.  The following example shows how this might be done.

          $ export PM_FAULT_CONTROL=/tmp/control
          $ cat $PM_FAULT_CONTROL
          # ok for 2 trips, then inject errors
          libpcp/events.c:1  >2

          $ export LD_PRELOAD=/usr/lib/libpcp_fault.so
          $ pmevent -Dfault -s 3 sample.event.records
          host:      localhost
          samples:   3
          interval:  1.00 sec
          sample.event.records[fungus]: 0 event records
          __pmFaultInject(libpcp/events.c:1) ntrip=1 SKIP
          sample.event.records[bogus]: 2 event records
            10:46:12.413 --- event record [0] flags 0x1 (point) ---
              sample.event.param_string "fetch #0"
            10:46:12.413 --- event record [1] flags 0x1 (point) ---
              sample.event.param_string "bingo!"
          __pmFaultInject(libpcp/events.c:1) ntrip=2 SKIP
          sample.event.records[fungus]: 1 event records
            10:46:03.416 --- event record [0] flags 0x1 (point) ---
          __pmFaultInject(libpcp/events.c:1) ntrip=3 INJECT
          sample.event.records[bogus]: pmUnpackEventRecords: Cannot allocate memory
          __pmFaultInject(libpcp/events.c:1) ntrip=4 INJECT
          sample.event.records[fungus]: pmUnpackEventRecords: Cannot allocate memory
          __pmFaultInject(libpcp/events.c:1) ntrip=5 INJECT
          sample.event.records[bogus]: pmUnpackEventRecords: Cannot allocate memory
          === Fault Injection Summary Report ===
          libpcp/events.c:1: guard trip>2, 5 trips, 3 faults


---------------------------------------------------------

::

          Refer to the PCP and PCP QA source code.

          src/libpcp/src/derive.c uses PM_FAULT_RETURN.

          src/libpcp/src/err.c and src/libpcp/src/events.c use
          PM_FAULT_POINT.

          src/libpcp/src/fault.c contains all of the the underlying
          implementation.

          src/libpcp_fault contains the recipe and Makefile for creating
          and installing libpcp_fault and <pcp/fault.h>.

          The ``fault'' group of QA tests show examples of control file
          use.  To see which tests are involved

          $ cd qa
          $ check -n -g fault


---------------------------------------------------------------

::

          Some non-recoverable errors are reported on stderr.


---------------------------------------------------------------

::

          PM_FAULT_CONTROL
                 Full path to the fault injection control file.

          LD_PRELOAD
                 Force libpcp_fault to be used in preference to libpcp.


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

   Performance Co-Pilot                                          PMFAULT(3)

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
