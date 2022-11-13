.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmseriessetup(3) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMSERIESSETUP(3)        Library Functions Manual        PMSERIESSETUP(3)

NAME
-------------------------------------------------

::

          pmSeriesSetup, pmSeriesSetSlots, pmSeriesSetEventLoop,
          pmSeriesSetConfiguration, pmSeriesSetMetricRegistry,
          pmSeriesClose - fast, scalable time series services


-------------------------------------------------------------

::

          #include <pcp/pmwebapi.h>

          int pmSeriesSetup(pmSeriesModule *module, pmSeriesCallBacks
                  *callbacks, void *arg);

          int pmSeriesSetSlots(pmSeriesModule *module, void *slots);
          int pmSeriesSetEventLoop(pmSeriesModule *module, void *uvloop);
          int pmSeriesSetConfiguration(pmSeriesModule *module, struct dict
                  *config);
          int pmSeriesSetMetricRegistry(pmSeriesModule *module, struct
                  mmv_registry *registry);

          int pmSeriesClose(pmSeriesModule *module);

          cc ... -lpcp_web


---------------------------------------------------------------

::

          The pmSeriesSetup and related API functions prepare an
          application for accessing the fast, scalable time series querying
          functionality of the Performance Co-Pilot (PCP).

          This functionality is provided through asynchronous APIs, which
          function in an event-driven fashion.  The interfaces described
          here prepare a given time series module which associates callback
          routines with certain asynchronous events that occur as part of
          servicing time series requests.

          As a general pattern, all interfaces in these APIs that need to
          invoke callbacks provided by the calling program will take an
          opaque (void * pointer) parameter, arg.  This pointer will be
          passed through unchanged and is typically used to access a data
          structure maintaining state within the calling program.

          Where asynchronous setup is required by pmSeriesSetup its
          completion will be indicated through use of the on_setup
          callback, which is part of the passed in pmSeriesModule
          structure.  This structure also provides for custom diagnostics
          handling, through the on_info callback.  These are self-
          explanatory, see <pcp/pmwebapi.h> for exact calling conventions.

          The callbacks registered by pmSeriesSetup to handle events are as
          follows:

          pmSeriesMatchCallBack on_match
               When a time series query discovers time series identifiers
               that match the query, the on_match callback will be called
               once for every series identifier (SID).  The SID is a unique
               40-byte ASCII representation of a SHA hash.

          pmSeriesDescCallBack on_desc
               Metric descriptor requests from pmSeriesDescs(1) will invoke
               this callback once for each series identifier.

          pmSeriesInstCallBack on_inst
               Instance identification callback - internal (numeric) and
               external (string) instance IDs, as well as time series and
               source (host) SHA1 identifiers.  Called once for each
               instance.  The associated series identifier is also provided
               to the callback.

          pmSeriesLabelCallBack on_labelmap
               Provides metric labels (name and value mappings) for each
               series identifier passed to pmSeriesLabels(1).

          pmSeriesStringCallBack on_instance
               Provides an instance name for a call to
               pmSeriesInstances(1)- the callback is called once for each
               instance name.  The associated series identifier is also
               provided to the callback.

          pmSeriesStringCallBack on_context
               Provides a context name for a call to pmSeriesSources(1)-
               the callback is called once for each source (hostname or
               archive).  The associated source identifier is also provided
               to the callback.

          pmSeriesStringCallBack on_metric
               Provides a metric name for a call to pmSeriesMetrics(1)- the
               callback is called once for each metric name.  The
               associated series identifier is also provided to the
               callback.

          pmSeriesStringCallBack on_label
               Provides a label name for a call to pmSeriesLabels(1)- the
               callback is called once for each label name.  The associated
               series identifier is also provided to the callback.

          pmSeriesValueCallBack on_value
               Calls to the pmSeriesQuery interface that provide a time
               window may result in values being found for matching time
               series.  The on_value callback will be invoked once for each
               time series value, also providing the sample timestamp (in
               both string and binary form, as a time in nanoseconds since
               the epoch).  The associated series identifier is also
               provided to the callback.

          pmSeriesDoneCallBack on_done
               On completion of all asynchronous interfaces that return
               success (zero return code), this callback will be called.
               It provides a status code indicating overall success (zero)
               or failure (negative PMAPI code) of the operation.

          The helper functions pmSeriesSetSlots (redis),
          pmSeriesSetEventLoop (libuv), pmSeriesSetConfiguration
          (configuration file) and pmSeriesSetMetricRegistry (MMV
          instrumentation) interfaces provide a mechanism for passing in
          state for each of the associated subsystems.

          Finally, a call to pmSeriesClose is used to end services
          available from a series module previously established through
          pmSeriesSetup.

          Within PCP, the pmproxy(1) and pmseries(1) utilities are the
          primary users of these interfaces, providing REST API and command
          line time series query services respectively.


---------------------------------------------------------------

::

          Where these functions return a status code, this is always zero
          on success.  On failure a negative PMAPI error code is returned.


---------------------------------------------------------

::

          pmproxy(1), pmlogger(1), pmseries(1), redis-server(1),
          mmv_stats_registry(3), pmSeriesDescs(3), pmSeriesQuery(3),
          PMAPI(3) and PMWEBAPI(3).

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

   Performance Co-Pilot               PCP                  PMSERIESSETUP(3)

--------------

Pages that refer to this page:
`pmseriesdescs(3) <../man3/pmseriesdescs.3.html>`__, 
`pmseriesquery(3) <../man3/pmseriesquery.3.html>`__

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
