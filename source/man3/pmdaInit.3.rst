.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdainit(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `                                 |                                   |
| METRIC LOOKUP <#METRIC_LOOKUP>`__ |                                   |
| \|                                |                                   |
| `ME                               |                                   |
| TRIC CHANGES <#METRIC_CHANGES>`__ |                                   |
| \|                                |                                   |
| `COMMUNICATION ATTRIBUT           |                                   |
| ES <#COMMUNICATION_ATTRIBUTES>`__ |                                   |
| \|                                |                                   |
| `PRIVATE DATA <#PRIVATE_DATA>`__  |                                   |
| \| `CAVEAT <#CAVEAT>`__ \|        |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDAINIT(3)             Library Functions Manual             PMDAINIT(3)

NAME
-------------------------------------------------

::

          pmdaInit, pmdaRehash, pmdaSetData, pmdaExtGetData,
          pmdaExtSetData, pmdaSetFlags, pmdaSetCommFlags, pmdaExtSetFlags -
          initialize a PMDA


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmda.h>

          void pmdaInit(pmdaInterface *dispatch, pmdaIndom *indoms,
                  int nindoms, pmdaMetric *metrics, int nmetrics);

          void pmdaRehash(pmdaExt *pmda, pmdaMetric *metrics,
                  int nmetrics);

          void pmdaSetFlags(pmdaInterface *dispatch, int flags);
          void pmdaSetCommFlags(pmdaInterface *dispatch, int flags);
          void pmdaExtSetFlags(pmdaExt *pmda, int flags);

          void pmdaSetData(pmdaInterface *dispatch, void *data);
          void pmdaExtSetData(pmdaExt *pmda, void *data);
          void *pmdaExtGetData(pmdaExt *pmda);

          cc ... -lpcp_pmda -lpcp


---------------------------------------------------------------

::

          pmdaInit initializes a PMDA so that it is ready to receive PDUs
          from pmcd(1).  The function expects as arguments the instance
          domain table (indoms) and the metric description table (metrics)
          that are initialized by the PMDA. The arguments nindoms and
          nmetrics should be set to the number of instances and metrics in
          the tables, respectively.

          Much of the pmdaInterface structure can be automatically
          initialized with pmdaDaemon(3), pmdaGetOpt(3) and pmdaDSO(3).
          pmdaInit completes the PMDA initialization phase with three
          operations.  The first operation adds the domain and instance
          numbers to the instance and metric tables.  Singular metrics
          (metrics without an instance domain) should have the instance
          domain PM_INDOM_NULL set in the indom field of the pmDesc
          structure (see pmLookupDesc(3)).  Metrics with an instance domain
          should set this field to be the serial number of the instance
          domain in the indoms table.

          The instance domain table may be made empty by setting indoms to
          NULL and nindoms to 0.  This allows the caller to provide custom
          Fetch and Instance callback functions.  The metric table may be
          made empty by setting metrics to NULL and nmetrics to 0.  This
          allows the caller to provide custom Fetch and Descriptor callback
          functions.


-------------------------------------------------------

::

          For example, a PMDA has three metrics: A, B and C, and two
          instance domains X and Y, with two instances in each instance
          domain.  The instance domain and metrics description tables could
          be defined as:

               static pmdaInstid _X[] = {
                   { 0, "X1" }, { 1, "X2" }
               };

               static pmdaInstid _Y[] = {
                   { 0, "Y1" }, { 1, "Y2" }
               };

               static pmdaIndom indomtab[] = {
               #define X_INDOM 0
                   { X_INDOM, 2, _X },
               #define Y_INDOM 3
                   { Y_INDOM, 2, _Y }
               };

               static pmdaMetric metrictab[] = {
               /* A */
                   { (void *)0,
                     { PMDA_PMID(0,0), PM_TYPE_U32, PM_INDOM_NULL, PM_SEM_INSTANT,
                       { 0,0,0,0,0,0} }, },
               /* B */
                   { (void *)0,
                     { PMDA_PMID(0,1), PM_TYPE_U32, X_INDOM, PM_SEM_INSTANT,
                       { 0,0,0,0,0,0} }, },
               /* C */
                   { (void *)0,
                     { PMDA_PMID(0,2), PM_TYPE_DOUBLE, Y_INDOM, PM_SEM_INSTANT,
                       { 0,1,0,0,PM_TIME_SEC,0} }, }
               };

          The metric description table defines metric A with no instance
          domain, metric B with instance domain X and metric C with
          instance domain Y.  Metric C has units of seconds, while the
          other metrics have no units (simple counters).  pmdaInit will
          take these structures and assign the PMDA(3) domain number to the
          it_indom field of each instance domain.  This identifier also
          replaces the indom field of all metrics which have that instance
          domain, so that they are correctly associated.

          The second stage opens the help text file, if one was specified
          with the -h command line option (see pmdaGetOpt(3)) or as a
          helptext argument to pmdaDSO(3) or pmdaDaemon(3).

          The final stage involves preparing the metric table lookup
          strategy.


-------------------------------------------------------------------

::

          When fetch and descriptor requests are made of the PMDA, each
          requested PMID must be mapped to a metric table entry.  There are
          currently three strategies for performing this mapping - direct,
          linear and hashed.  Each has its own set of tradeoffs and an
          appropriate strategy should be selected for each PMDA.

          If all of the metric PMID item numbers correspond to the position
          in the metrics table, then direct mapping is used.  This is the
          most efficient of the lookup functions as it involves a direct
          array index (no additional memory is required nor any additional
          processing overhead).  If the PMID numbering requirement is met
          by the PMDA, it is ideal.  This strategy can be explicitly
          requested by calling pmdaSetFlags(pmda, PMDA_EXT_FLAG_DIRECT)
          before calling pmdaInit.  In this case, if the direct mapping is
          not possible (e.g. due to an oversight on the part of the PMDA
          developer), a warning is logged and the linear strategy is used
          instead.

          The second strategy (linear search) is the default, when a direct
          mapping cannot be established.  This provides greater flexibility
          in the PMID numbering scheme, as the PMDA item numbers do not
          have to be unique (hence, the PMID cluster numbers can be used
          more freely, which is often extremely convenient for the PMDA
          developer).  However, lookup involves a linear walk from the
          start of the metric table until a matching PMID is found, for
          each requested PMID in a request.

          The third strategy (hash lookup) can be requested by calling
          pmdaSetFlags(pmda, PMDA_EXT_FLAG_HASHED) before calling pmdaInit.
          This strategy is most useful for PMDAs with large numbers of
          metrics (many hundreds, or thousands).  Such PMDAs will almost
          always use the cluster numbering scheme, so the direct lookup
          scheme becomes inappropriate.  They may also be prepared to
          sacrifice a small amount of additional memory for a hash table,
          mapping PMID to metric table offsets, to speed up lookups in
          their vast metric tables.

          This final strategy can also be used by PMDAs serving up
          dynamically numbered metrics.  For this case, the pmdaRehash
          function should be used to replace the metric table when new
          metrics become available, or existing metrics are removed.  The
          PMID hash mapping will be recomputed at the same time that the
          new metric table is installed.


---------------------------------------------------------------------

::

          It should be well understood by PMDA authors that metric metadata
          for individual metrics is fixed, and ideally would not ever
          change.  In the situation where metadata is incorrect and is
          updated, such a change requires correction to logged metrics
          using pmlogrewrite(1), and as a result should be avoided whenever
          possible.

          However, a PMDA may become aware of new domain metrics at
          runtime, and in this case it is ideal to export them immediately
          (without any collector system restart).  In this situation, the
          PMDA can inform all running PMAPI clients that may have already
          explored the metric namespace (for example, using
          pmTraversePMNS(3)) of the change to the metric namespace.

          This is achieved using pmdaSetFlags(pmda, PMDA_EXT_NAMES_CHANGE)
          which will result in the PMCD_NAMES_CHANGE state change
          notification being sent to each PMAPI client on next fetch.  If
          the newly discovered metrics have label metadata associated, then
          the PMDA_EXT_LABEL_CHANGE flag may also be set, which will result
          in the PMCD_LABEL_CHANGE notification being sent as well.

          pmdaExtSetFlags is equivalent to pmdaSetFlags, and is provided as
          a convenience interface in situations where the pmdaExt is more
          readily available than the pmdaInterface structure.


-----------------------------------------------------------------------------------------

::

          Agents that make use of authentication or container attributes
          should indicate this using the pmdaSetCommFlags interface.  This
          indicates the need for these attributes to be communicated on the
          channel between the PMDA and pmcd or local context client.  Valid
          flags are PMDA_FLAG_AUTHORIZE (for authentication related
          attributes) and PMDA_FLAG_CONTAINER (for container name related
          attributes).


-----------------------------------------------------------------

::

          A facility for associating private PMDA data with the pmdaExt
          structure is available.  This allows a PMDA to associate an
          arbitrary (and typically not global) pointer with the pmdaExt
          such that it can be later obtained during callbacks.  The
          interfaces for setting this pointer are pmdaSetData and
          pmdaExtSetData, and pmdaExtGetData for subsequently retrieving
          it.


-----------------------------------------------------

::

          The PMDA must be using PMDA_INTERFACE_2 or later, as specified in
          the call to pmdaDSO(3) or pmdaDaemon(3) to use pmdaInit.

          The PMDA must use PMDA_INTERFACE_7 or later to issue state change
          notifications using pmdaSetFlags or pmdaExtSetFlags.


---------------------------------------------------------------

::

          pmdaInit will set dispatch->status to a value less than zero if
          there is an error that would prevent the PMDA(3) from
          successfully running.  pmcd(1) will terminate the connection to
          the PMDA(3) if this occurs.

          pmdaInit may issue any of these messages:

          PMDA interface version interface not supported
                 The interface version is not supported by pmdaInit.

          Using pmdaFetch() but fetch call back not set
                 The fetch callback, pmdaFetch(3), requires an additional
                 callback to be provided using pmdaSetFetchCallBack(3).

          Illegal instance domain inst for metric pmid
                 The instance domain inst that was specified for metric
                 pmid is not within the range of the instance domain table.

          No help text path specified
                 The help text callback, pmdaText(3), requires a help text
                 file for the metrics to have been opened, however no path
                 to the help text was specified as a command line option,
                 or as an argument to pmdaDSO(3) or pmdaDaemon(3).  This
                 message is only a warning.

          Direct mapping for metrics disabled @ num
                 The unit numbers of the metrics did not correspond to the
                 index in the metric description table.  The direct mapping
                 failed for metric number num in the metrics table.  This
                 is less efficient but is not fatal and the message is only
                 a warning.

          Hashed mapping for metrics disabled @ num
                 A memory allocation failure occurred while building the
                 hash table to index the metric description table.  This is
                 a non-fatal warning message - a fallback to linear
                 searching will be automatically performed should this
                 situation arise.


---------------------------------------------------------

::

          newhelp(1), pmcd(1), pmlogrewrite(1), PMAPI(3), PMDA(3),
          pmdaDaemon(3), pmdaDSO(3), pmdaFetch(3), pmdaGetOpt(3),
          pmdaText(3), pmLookupDesc(3) and pmTraversePMNS(3).

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

   Performance Co-Pilot               PCP                       PMDAINIT(3)

--------------

Pages that refer to this page:
`pmlogger(1) <../man1/pmlogger.1.html>`__, 
`pmda(3) <../man3/pmda.3.html>`__, 
`pmdacache(3) <../man3/pmdacache.3.html>`__, 
`pmdaconnect(3) <../man3/pmdaconnect.3.html>`__, 
`pmdadso(3) <../man3/pmdadso.3.html>`__, 
`pmdafetch(3) <../man3/pmdafetch.3.html>`__, 
`pmdahelp(3) <../man3/pmdahelp.3.html>`__, 
`pmdalabel(3) <../man3/pmdalabel.3.html>`__, 
`pmdatext(3) <../man3/pmdatext.3.html>`__

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
