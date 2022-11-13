.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmfetch(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMFETCH(3)              Library Functions Manual              PMFETCH(3)

NAME
-------------------------------------------------

::

          pmFetch, pmHighResFetch, - get performance metric values


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmFetch(int numpmid, pmID *pmidlist, pmResult **result);
          int pmHighResFetch(int numpmid, pmID *pmidlist, pmHighResResult **result);

          cc ... -lpcp


---------------------------------------------------------------

::

          Given a list of Performance Metric Identifiers (PMID)s, e.g. as
          constructed by pmLookupName(3), via pmidlist and numpmid, fetch
          the values for these performance metrics.

          A call to either pmFetch or pmHighResFetch is executed in the
          context of a source of metrics, instance profile and collection
          time, previously established by calls to the appropriate context
          and profile functions, namely some of pmNewContext(3),
          pmDupContext(3), pmUseContext(3), pmAddProfile(3),
          pmDelProfile(3) and pmSetMode(3).

          The principal result from pmFetch is returned in the argument
          result as a tree, using the following component data structures;

               typedef struct {
                     unsigned int vtype : 8;        /* value type (same as pmDesc.type) */
                     unsigned int vlen : 24;        /* bytes for vtype/vlen + vbuf */
                     char         vbuf[1];          /* one or more values */
               } pmValueBlock;

               typedef struct {
                     int      inst;                 /* instance identifier */
                     union {
                           pmValueBlock *pval;      /* pointer to value-block */
                           int          lval;       /* integer value insitu */
                     } value;
               } pmValue;

               typedef struct {
                     pmID      pmid;                /* metric identifier */
                     int       numval;              /* number of values or error code */
                     int       valfmt;              /* value style, insitu or ptr */
                     pmValue   vlist[1];            /* set of instances/values */
               } pmValueSet;

               /* Result returned by pmFetch() */
               typedef struct {
                     struct timeval timestamp;      /* time stamped by collector */
                     int            numpmid;        /* number of PMIDs */
                     pmValueSet     *vset[1];       /* set of value sets */
               } pmResult;

          The principal result from pmHighResFetch is exactly the same in
          terms of value sets, however a higher resolution timestamp
          (nanosecond instead of microsecond precision) is available in the
          pmHighResResult structure.

               /* Result returned by pmHighResFetch() */
               typedef struct {
                     struct timespec timestamp;      /* time stamped by collector */
                     int             numpmid;        /* number of PMIDs */
                     pmValueSet      *vset[1];       /* set of value sets */
               } pmHighResResult;

          To accommodate metrics with multiple value instances, the numval
          field indicates how many values are returned for each requested
          PMID.  The field valfmt in the pmValueSet structure indicates if
          the values for this metric are stored insitu in the lval field,
          i.e. a 32-bit integer quantity (either int, unsigned int, long or
          unsigned long) or if the values are held in associated
          pmValueBlock structures.  The pmValueBlock structure is always
          used for floating point values (float or double) and also
          accommodates arbitrary sized binary data such as `string-valued'
          metrics and metrics with aggregated or complex data types.  The
          maximum length of a pmValueBlock buffer is PM_VAL_VLEN_MAX bytes.
          If the pmValueBlock format is used, the vtype field indicates the
          data type of the value.  This field has the same interpretation
          as the type field in the pmDesc structure, see pmLookupDesc(3).

          Note that the insitu value may be a signed or unsigned 32 bit
          integer, signed or unsigned 32 bit long value (on 32 bit
          platforms), In the special cases described below, it may also be
          a 32 bit floating point value.  If the application needs to know
          the type of an insitu value, which is almost always the case, it
          is necessary to fetch the descriptor for the metric and interpret
          the type field, as described in detail in pmLookupDesc(3).  When
          the pmResult is received from a PCP1.x pmcd, insitu values may
          also be 32 bit floating point values (of type PM_TYPE_FLOAT).  In
          all cases, it is good practice to use pmLookupDesc(3) to fetch
          the descriptor for the metric and interpret the type field
          therein.  Note also that the PMAPI(3) will automatically
          translate from the PCP2.0 format to the PCP1.x format when a
          PCP1.x client requests 32 bit floating point values from a PCP2.0
          pmcd, but the reverse translation does not occur (because the
          PCP2.0 pmcd cannot automatically distinguish between arbitrary 32
          bit floating point values and 32 bit integers).

          If one value (i.e. associated with a particular instance) for a
          requested metric is `unavailable' (at the requested time), then
          there is no associated pmValue structure in the result.  If there
          are no available values for a metric, then numval will be zero
          and the associated pmValue[] instance will be empty (valfmt is
          undefined in these circumstances, however pmid will be correctly
          set to the PMID of the metric with no values).

          As an extension of this protocol, if the Performance Metrics
          Collection System (PMCS) is able to provide a reason why no
          values are available for a particular metric, this is encoded as
          a standard error code in the corresponding numval.  Since the
          error codes are all negative, values for a requested metric are
          `unavailable' if numval is less than, or equal to, zero.  A
          performance metric's value may be `unavailable' for a number of
          reasons; the following list is illustrative but not exhaustive:
          of the software for the associated Performance Metric Domain

          +      Collection is not currently activated in the software for
                 the associated Performance Metric Domain

          +      The associated PMID is not known

          +      The current system configuration does not include the
                 associated hardware component and/or the associated
                 software module, e.g. a disk is not installed, or off-
                 line, or Oracle is not installed

          +      The metric is one for which an instance profile is
                 required, and none was provided (there are a small number
                 of metrics in this category, typically ones with very
                 large, and/or very dynamic instance domains, and/or
                 expensive metric instantiation methods).

          +      If the current context involves fetching metrics from an
                 archive log, values may be unavailable in the region
                 around a <mark> record (see pmlogextract(1)) that indicate
                 a temporal discontinuity in the time-series of metric
                 values.

          In general, we may not be able to differentiate between the
          various cases, and if differentiation is not possible, numval
          will simply be zero.

          The argument definition and the result specifications have been
          constructed to ensure that for each PMID in the requested
          pmidlist there is exactly one pmValueSet in the result, and
          further the PMIDs appear in exactly the same sequence in both
          pmidlist and result.  This makes the number and order of entries
          in result completely deterministic, and greatly simplifies the
          application programming logic after the call to pmHighResFetch or
          pmFetch.

          The result structure returned by pmFetch is dynamically allocated
          using a combination of malloc(3) calls and specialized allocation
          strategies, and should be released when no longer required by
          calling pmFreeResult(3) - under no circumstances should free(3)
          be called directly to release this space.

          As common error conditions are encoded in the result data
          structure, we'd expect only cataclysmic events to cause an error
          value to be returned.  One example would be if the metrics source
          context was a remote host, and that host or the PMCS on that host
          became unreachable.  Otherwise the value returned by the pmFetch
          function will be non-negative.

          Similarly, the result structure returned by pmHighResFetch
          operates under the same principles, and should be released via
          pmFreeHighResResult(3).

          If the current context involves fetching metrics from a
          Performance Metrics Collector Daemon (PMCD), then the return
          value may be used to encode out-of-band changes in the state of
          the PMCD and the associated Performance Metrics Daemon Agents
          (PMDAs), as a bit-wise ``or'' of the following values:

          PMCD_RESTART_AGENT  An attempt has been made to restart at least
                              one failed PMDA.

          PMCD_ADD_AGENT      At least one PMDA has been started.

          PMCD_DROP_AGENT     PMCD has noticed the termination of at least
                              one PMDA.

          PMCD_AGENT_CHANGE   A convenience macro for any of the three PMDA
                              changes.

          PMCD_LABEL_CHANGE   PMCD has been informed of changes to global
                              (context) labels, or new metrics have
                              appeared which have associated labels.

          PMCD_NAMES_CHANGE   PMCD has been informed that the namespace has
                              been modified, such that new metrics have
                              appeared or existing metrics have been
                              removed.

          The default is to return zero to indicate no change in state,
          however the pmResult returned by pmFetch (or pmHighResResult
          returned by pmHighResFetch) has the same interpretation
          independent of the return value being zero or greater than zero.


---------------------------------------------------------

::

          pmcd(1), pmAddProfile(3), PMAPI(3), pmDelProfile(3),
          pmDupContext(3), pmExtractValue(3), pmFetchArchive(3),
          pmFreeHighResResult(3), pmFreeResult(3), pmGetInDom(3),
          pmLookupDesc(3), pmLookupLabels(3), pmLookupName(3),
          pmNewContext(3), pmSetMode(3), pmUseContext(3) and
          pmWhichContext(3).

          Note that pmFetch and pmHighResFetch are the most primitive
          methods of fetching metric values from the PMCS.  See the
          pmFetchGroup(3) API for a higher level method that insulates the
          user from the intricacies of looking up metric names and
          metadata, setting up instance profiles, pmResult traversal,
          conversions, and scaling.


---------------------------------------------------------------

::

          As mentioned above, pmFetch and pmHighResFetch return error codes
          insitu in the argument result.  If no result is returned, e.g.
          due to IPC failure using the current PMAPI context, or end of
          file on an archive log, then these routines will return a
          negative error code which may be examined using pmErrStr(3).

          PM_ERR_NYI
                 Currently PCP archives do not support high resolution
                 timestamps, until this is addressed when fetching records
                 from an archive log the pmHighResFetch will fail with the
                 not-yet-implemented error code.

          PM_ERR_EOL
                 When fetching records from an archive log, pmFetch returns
                 this error code to indicate the end of the log has been
                 passed (or the start of the log has been passed, if the
                 direction of traversal is backwards in time).  If the
                 ``mode'' for the current PMAPI context (see pmSetMode(3))
                 is PM_MODE_INTERP then the time origin is advanced, even
                 when this error code is returned.  In this way
                 applications that position the time outside the range
                 defined by the records in the archive, and then commence
                 to pmFetch will eventually see valid results once the time
                 origin moves inside the temporal span of the archive.


---------------------------------------------------------------

::

          Many of the performance metrics exported from PCP agents have the
          semantics of counter meaning they are expected to be
          monotonically increasing.  Under some circumstances, one value of
          these metrics may be smaller than the previously fetched value.
          This can happen when a counter of finite precision overflows, or
          when the PCP agent has been reset or restarted, or when the PCP
          agent is exporting values from some underlying instrumentation
          that is subject to some asynchronous discontinuity.
          The environment variable PCP_COUNTER_WRAP may be set to indicate
          that all such cases of a decreasing ``counter'' should be treated
          as a counter overflow, and hence the values are assumed to have
          wrapped once in the interval between consecutive samples.  This
          ``wrapping'' behavior was the default in earlier PCP versions,
          but by default has been disabled in PCP version 1.3 and later.

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

   Performance Co-Pilot               PCP                        PMFETCH(3)

--------------

Pages that refer to this page:
`pmdaopenmetrics(1) <../man1/pmdaopenmetrics.1.html>`__, 
`pmgenmap(1) <../man1/pmgenmap.1.html>`__, 
`pmstore(1) <../man1/pmstore.1.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmaddprofile(3) <../man3/pmaddprofile.3.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`\__pmcontrollog(3) <../man3/__pmcontrollog.3.html>`__, 
`pmconvscale(3) <../man3/pmconvscale.3.html>`__, 
`pmdafetch(3) <../man3/pmdafetch.3.html>`__, 
`pmdelprofile(3) <../man3/pmdelprofile.3.html>`__, 
`pmextractvalue(3) <../man3/pmextractvalue.3.html>`__, 
`pmfetcharchive(3) <../man3/pmfetcharchive.3.html>`__, 
`pmfetchgroup(3) <../man3/pmfetchgroup.3.html>`__, 
`pmfreeresult(3) <../man3/pmfreeresult.3.html>`__, 
`pmgetarchiveend(3) <../man3/pmgetarchiveend.3.html>`__, 
`pmgetcontexthostname(3) <../man3/pmgetcontexthostname.3.html>`__, 
`pmgetderivedcontrol(3) <../man3/pmgetderivedcontrol.3.html>`__, 
`pmlookuplabels(3) <../man3/pmlookuplabels.3.html>`__, 
`pmnewcontext(3) <../man3/pmnewcontext.3.html>`__, 
`pmnewcontextzone(3) <../man3/pmnewcontextzone.3.html>`__, 
`pmprintvalue(3) <../man3/pmprintvalue.3.html>`__, 
`pmregisterderived(3) <../man3/pmregisterderived.3.html>`__, 
`pmsetmode(3) <../man3/pmsetmode.3.html>`__, 
`pmsortinstances(3) <../man3/pmsortinstances.3.html>`__, 
`pmstore(3) <../man3/pmstore.3.html>`__, 
`pmwebapi(3) <../man3/pmwebapi.3.html>`__, 
`QmcIndom(3) <../man3/QmcIndom.3.html>`__

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
