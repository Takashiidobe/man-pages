.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmseriesdescs(3) — Linux manual page
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

   PMSERIESDESCS(3)        Library Functions Manual        PMSERIESDESCS(3)

NAME
-------------------------------------------------

::

          pmSeriesDescs, pmSeriesLabels, pmSeriesLabelValues,
          pmSeriesInstances, pmSeriesMetrics, pmSeriesSources - fast,
          scalable time series metadata


-------------------------------------------------------------

::

          #include <pcp/pmwebapi.h>

          int pmSeriesDescs(pmSeriesSettings *sp, int count, sds *series,
                  void *arg);
          int pmSeriesLabels(pmSeriesSettings *sp, int count, sds *series,
                  void *arg);
          int pmSeriesLabelValues(pmSeriesSettings *sp, int count, sds
                  *labels, void *arg);
          int pmSeriesInstances(pmSeriesSettings *sp, int count, sds
                  *series, void *arg);
          int pmSeriesMetrics(pmSeriesSettings *sp, int count, sds *series,
                  void *arg);
          int pmSeriesSources(pmSeriesSettings *sp, int count, sds *series,
                  void *arg);

          cc ... -lpcp_web


---------------------------------------------------------------

::

          Each performance metric and data source forming part of the
          Performance Co-Pilot (PCP) fast, scalable time series service has
          certain properties (metadata) associated with it.  These
          properties can be queried using the interfaces described here.

          This functionality is provided through asynchronous APIs, which
          function in an event-driven fashion where callbacks are invoked
          for each metadata structure being returned.

          As a general pattern, all interfaces in these APIs that need to
          invoke callbacks provided by the calling program (see
          pmSeriesSetup(3)) will take an opaque (void * pointer) parameter,
          arg.  This pointer will be passed through unchanged and is
          typically used to access a data structure maintaining state
          within the calling program.

          With a couple of exceptions, these interfaces tend to operate in
          one of two modes.  Firstly, one invocation is available to query
          metadata for a specific (non-zero) count of time series.  A
          second, (zero) count, mode returns all available metadata of that
          type, across all time series.

          In order to retrieve metric descriptor information for one or
          more time series, the pmSeriesDescs interface is used.  For each
          valid series identifier provided, a callback will be invoked
          providing the metric units, semantics, and type as well as other
          identifiers associated with it (pmID, InDom and source
          identifier).  When this call is issued with a zero value for
          count, It is an error to pass a zero or negative value of count
          into this interface.

          To extract label names and values, the pmSeriesLabels interface
          is used.  With a non-zero value for count valid series
          identifiers, this routine will invoke a callback once for each
          label name and once for each label name:value pair, for labels
          associated with those time series.  If called with a count of
          zero, this interface will return (via the label name callback)
          all label names that have observed to date - not associated with
          specific time series.  The pmSeriesLabelValues interface is
          comparable to this latter mode, except will return all label
          values that have been observed to date for the given array of
          labels names (not associated with any specific time series
          identifiers).

          pmSeriesInstances can be used to find metadata about instance
          domains and instance identifiers associated with a given (non-
          zero) count of time series identifiers.  If a zero value is
          passed for count then all instance names observed to date will be
          returned.

          pmSeriesMetrics can be used to find metric names associated with
          a given (non-zero) count of time series identifiers.  If a zero
          value is passed for count then all metric names observed to date
          will be returned.

          pmSeriesSources can be used to find metadata about the source of
          metrics - that is, host names and archive file paths.  If a zero
          value is passed for count then all metric sources observed to
          date will be returned.


---------------------------------------------------------------

::

          Where these functions return a status code, this is always zero
          on success.  On failure a negative PMAPI error code is returned.


---------------------------------------------------------

::

          pmproxy(1), pmlogger(1), pmseries(1), pmSeriesQuery(3),
          pmSeriesSetup(3), PMAPI(3) and PMWEBAPI(3).

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

   Performance Co-Pilot               PCP                  PMSERIESDESCS(3)

--------------

Pages that refer to this page:
`pmseriesquery(3) <../man3/pmseriesquery.3.html>`__, 
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
