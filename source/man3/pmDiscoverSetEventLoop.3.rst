.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdiscoversetup(3) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDISCOVERSETUP(3)      Library Functions Manual      PMDISCOVERSETUP(3)

NAME
-------------------------------------------------

::

          pmDiscoverSetup, pmDiscoverSetSlots, pmDiscoverSetEventLoop,
          pmDiscoverSetConfiguration, pmDiscoverSetMetricRegistry,
          pmDiscoverClose - asynchronous archive location and contents
          discovery services


-------------------------------------------------------------

::

          #include <pcp/pmwebapi.h>

          int pmDiscoverSetup(pmDiscoverModule *module, pmDiscoverCallBacks
                  *callbacks, void *arg);

          int pmDiscoverSetSlots(pmDiscoverModule *module, void *slots);
          int pmDiscoverSetEventLoop(pmDiscoverModule *module, void
                  *uvloop);
          int pmDiscoverSetConfiguration(pmDiscoverModule *module, struct
                  dict *config);
          int pmDiscoverSetMetricRegistry(pmDiscoverModule *module, struct
                  mmv_registry *registry);

          int pmDiscoverClose(pmDiscoverModule *module);

          cc ... -lpcp_web


---------------------------------------------------------------

::

          The pmDiscoverSetup and related functions are an integral part of
          the libpcp_web API library, as used by and described in
          pmwebapi(3), pmproxy(1), pmseries(1) and elsewhere.  These
          functions provide an asynchronous event driven mechanism to
          automatically discover PCP archives created by pmlogger(1) and
          any other application capable of writing PCP archives.  This
          includes pmrep(1) and other applications using the LOGIMPORT(3)
          API for importing performance data into the PCP infrastructure
          and writing PCP archives.

          The pmDiscover API services dynamically discover, monitor and
          manage directories of PCP archives as they are created, written
          to, compressed and eventually deleted.  The underlying archive
          life-cycle is normally managed by the PCP log management
          infrustructure (see pmlogger_daily(1)).  Discovered archives that
          are active (currently being written) are "log-tailed" to extract
          near live/real-time performance data which is then passed off via
          registered callbacks for further processing.  Archives that are
          compressed or inactive are tracked/monitored but not log-tailed.

          The pmDiscover routines can be configured to automatically
          discover and monitor PCP archives in one or more directories as
          specified in the pmDiscoverModule, which is initially set up by
          calling pmDiscoverSetConfiguration to create a module of type
          pmDiscoverModule, as described above.  The resulting module is
          then passed to pmDiscoverSetup along with an initialized
          structure of callbacks of type pmDiscoverCallBacks.

          Setting up a discovery module and callbacks would normally
          declare an instance of pmDiscoverSettings, e.g.

               #include <pcp/pmwebapi.h>

               static pmDiscoverSettings someapp_discover = {
                   .callbacks.on_source        = pmSomeappDiscoverSource,
                   .callbacks.on_closed        = pmSomeappDiscoverClosed,
                   .callbacks.on_labels        = pmSomeappDiscoverLabels,
                   .callbacks.on_metric        = pmSomeappDiscoverMetric,
                   .callbacks.on_values        = pmSomeappDiscoverValues,
                   .callbacks.on_indom         = pmSomeappDiscoverInDom,
                   .callbacks.on_text          = pmSomeappDiscoverText,
                   .module.on_info             = someapp_logging_function,
               };

          And then initialize this with API calls similar to the following:

               pmDiscoverSetEventLoop(&someapp_discover.module, myevents);
               pmDiscoverSetConfiguration(&someapp_discover.module, myconfig);
               pmDiscoverSetMetricRegistry(&someapp_discover.module, metric_registry);
               pmDiscoverSetup(&someapp_discover.module, &someapp_discover.callbacks, &privatedata);

          The above code must then implement each of the declared callbacks
          etc. to do whatever is required with the data passed in to the
          callback.  Prototypes for these callbacks can be found in the
          pmwebapi.h header.  The callbacks will be made asynchronously, as
          archives are discovered or deleted and as new data is written to
          active archive log volume and metadata files.

          In the case of pmproxy(1), callbacks are registered to capture
          performance data, which is then sent to redis(1) as the database
          back-end for fast scalable time-series queries by clients of the
          PMWEBAPI(3) REST API services.  Such clients include the
          pmseries(1) application and pmproxy(1), which is the back-end
          REST API server for grafana-pcp, a native grafana-server(1) data-
          source for PCP.


---------------------------------------------------------------

::

          Generally zero on success, or on error a negative return code,
          see pmerr(1).


---------------------------------------------------

::

          The default archive directory is $PCP_LOG_DIR, which is normally
          /var/log/pcp/pmlogger.  The API recursively descends all sub-
          directories and also dynamically discovers any new directories or
          archives found therein.


---------------------------------------------------------

::

          grafana-server(1), pmerr(1), pmlogger(1), pmproxy(1),
          pmseries(1), PMWEBAPI(3), mmv_stats_registry(3), PMAPI(3),
          pmErrStr(3), pcp.conf(5) and pcp.env(5).

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

   Performance Co-Pilot               PCP                PMDISCOVERSETUP(3)

--------------

Pages that refer to this page:
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
