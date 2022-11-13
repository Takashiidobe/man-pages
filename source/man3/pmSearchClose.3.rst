.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmsearchsetup(3) — Linux manual page
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

   PMSEARCHSETUP(3)        Library Functions Manual        PMSEARCHSETUP(3)

NAME
-------------------------------------------------

::

          pmSearchSetup, pmSearchSetSlots, pmSearchSetEventLoop,
          pmSearchSetConfiguration, pmSearchSetMetricRegistry,
          pmSearchClose - fast, scalable and fulltext capable search
          services


-------------------------------------------------------------

::

          #include <pcp/pmwebapi.h>

          int pmSearchSetup(pmSearchModule *module, void *arg);

          int pmSearchSetSlots(pmSearchModule *module, void *slots);
          int pmSearchSetEventLoop(pmSearchModule *module, void *events);
          int pmSearchSetConfiguration(pmSearchModule *module, struct dict
                  *config);
          int pmSearchSetMetricRegistry(pmSearchModule *module, struct
                  mmv_registry *registry);

          int pmSearchClose(pmSearchModule *module);

          cc ... -lpcp_web


---------------------------------------------------------------

::

          The pmSearchSetup and related API functions prepare an
          application for accessing the fast and scalable metric, instance
          and instance domain, fulltext capable, searching functionality of
          the Performance Co-Pilot (PCP).

          This functionality is provided trough asynchronous APIs, which
          function in event-driven fashion. The interface described here
          prepare a given search module which associates callback routines
          with certain asynchronous events that occur as part of servicing
          search requests.

          As a general pattern, all interfaces in these APIs that need to
          invoke callbacks provided by the calling program will take an
          opaque (void * pointer) arg parameter.  This pointer will be
          passed through unchanged and is typically used to access a data
          structure maintaining state within the calling program.

          Where asynchronous setup is required by pmSearchSetup its
          completion will be indicated throught use of the on_setup
          callback, which is part of the passed in pmSearchModule
          structure. This structure also provides for custom diagnostics
          handling, through the on_info callback. These are self-
          explanatory, see <pcp/pmwebapi.h> for exact calling conventions.

          The callbacks registered by pmSearchSetup to handle events are as
          follows:

          pmSearchTextResultCallBack on_text_result
               Callback is called once for each item of search result that
               matches a given query passed by pmSearchTextInDom(3),
               pmSearchTextQuery(3), pmSearchTextSuggest(3).

          pmSearchMetricsCallBack on_metrics
               Callback is called for results of a call to pmSearchInfo(3).

          pmSearchDoneCallBack on_done
               On completion of all asynchronous interfaces that return
               success (zero return code), this callback will be called.
               It provides a status code indicating overall success (zero)
               or failure (negative PMAPI code) of the operation.

          The helper functions pmSearchSetSlots (redis),
          pmSearchSetEventLoop (libuv), pmSearchSetConfiguration
          (configuration file) and pmSearchSetMetricRegistry (MMV
          instrumentation) interfaces provide a mechanism for passing in
          state for each of the associated subsystems.

          Finally, a call to pmSearchClose is used to end services
          available from a search module previously enstablished through
          pmSearchSetup.

          Within PCP, the pmproxy(1) and pmsearch(1) utilities are the
          primary users of the interfaces, providing REST API and command
          line search services respectively.


---------------------------------------------------------------

::

          Where these functions return a status code, this is always zero
          on success.  On failure a negative PMAPI error code is returned.


---------------------------------------------------------

::

          pmproxy(1), pmlogger(1), pmsearch(1), redis-server(1),
          mmv_stats_registry(3), pmSearchInfo(3), pmSearchTextInDom(3),
          pmSearchTextQuery(3), pmSearchTextSuggest(3), PMAPI(3) and
          PMWEBAPI(3).

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

   Performance Co-Pilot               PCP                  PMSEARCHSETUP(3)

--------------

Pages that refer to this page:
`pmsearchinfo(3) <../man3/pmsearchinfo.3.html>`__, 
`pmsearchtextindom(3) <../man3/pmsearchtextindom.3.html>`__, 
`pmsearchtextquery(3) <../man3/pmsearchtextquery.3.html>`__, 
`pmsearchtextsuggest(3) <../man3/pmsearchtextsuggest.3.html>`__

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
