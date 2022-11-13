.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmseriesquery(3) — Linux manual page
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

   PMSERIESQUERY(3)        Library Functions Manual        PMSERIESQUERY(3)

NAME
-------------------------------------------------

::

          pmSeriesQuery, pmSeriesValues, pmSeriesLoad - fast, scalable time
          series querying


-------------------------------------------------------------

::

          #include <pcp/pmwebapi.h>

          int pmSeriesQuery(pmSeriesSettings *sp, sds *query, pmSeriesFlags
                  flags, void *arg);
          int pmSeriesValues(pmSeriesSettings *sp, pmSeriesTimeWindow
                  *window, int count, sds *series, void *arg);

          int pmSeriesLoad(pmSeriesSettings *sp, sds *query, pmSeriesFlags
                  flags, void *arg);

          cc ... -lpcp_web


---------------------------------------------------------------

::

          Searching for time series identifiers and values using the
          Performance Co-Pilot (PCP) fast, scalable time series services is
          achieved using the pmseries(1) utility, and associated pmproxy(1)
          REST API service.

          The implementation of these facilities is shared and available
          for other programs to use as well.  The functionality is provided
          through asynchronous APIs, which function in an event-driven
          fashion where callbacks are invoked for each set of series
          identifiers or values structure being returned.  These callbacks
          must be registered using pmSeriesSetup(3) before any query API
          calls are made.

          As a general pattern, these interfaces take an opaque (void *
          pointer) parameter, arg.  This pointer will be passed through
          unchanged and is typically used to access a data structure
          maintaining state within the calling program.

          Depending on the pmseries query string provided, pmSeriesQuery
          operates in one of two modes.

          Firstly, if no time window specification is provided (square
          brackets), then the interface will return only matching series
          identifiers and no values.  These identifiers are returned via
          the on_match callback registered using pmSeriesSetup.  If the
          query expression includes function calls or arithmetic operators
          (rather than simple metric names), then the returned identifier
          is dynamically created and persistently associated with the
          expression.  The query expression may be retrieved with the
          pmSeriesExprs(3) API call.  See also PMWEBAPI(3) and the -e
          option to pmseries(1).

          The second mode is where a time window specification is used in
          the query string, or when the pmSeriesValues interface is used.
          This mode provides values and time stamps for all matching time
          series identifiers having data points within the provided time
          window.  In this case, the results are returned via the on_value
          callback registered using pmSeriesSetup.

          Further metadata (metric names, labels, units, semantics, type,
          etc) about matched time series and their values can be obtained
          using the interfaces described on the pmSeriesDescs(3) manual
          page.

          Typically, loading of time series is handled automatically by the
          pmproxy daemon, which uses the pmDiscoverSetup(3) series of
          interfaces to automatically detect and load logged time series
          from pmlogger(1).  However, it is also possible to manually load
          time series from a PCP archive using the pmSeriesLoad interface.
          The provided query string must provide an archive or directory to
          load data from using the source.path keyword.


---------------------------------------------------------------

::

          Where these functions return a status code, this is always zero
          on success.  On failure a negative PMAPI error code is returned.


---------------------------------------------------------

::

          pmproxy(1), pmlogger(1), pmSeriesSetup(3), pmSeriesDescs(3),
          pmDiscoverSetup(3), PMAPI(3) and PMWEBAPI(3).

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

   Performance Co-Pilot               PCP                  PMSERIESQUERY(3)

--------------

Pages that refer to this page:
`pmseriesdescs(3) <../man3/pmseriesdescs.3.html>`__, 
`pmseriessetup(3) <../man3/pmseriessetup.3.html>`__, 
`pmwebapi(3) <../man3/pmwebapi.3.html>`__

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
