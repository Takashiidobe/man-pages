.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmapi(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `PERFORMANCE METRICS - NAMES      |                                   |
|  AND IDENTIFIERS <#PERFORMANCE_ME |                                   |
| TRICS_-_NAMES_AND_IDENTIFIERS>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| PMAPI CONTEXT <#PMAPI_CONTEXT>`__ |                                   |
| \|                                |                                   |
| `INSTAN                           |                                   |
| CE DOMAINS <#INSTANCE_DOMAINS>`__ |                                   |
| \|                                |                                   |
| `THE TYPE OF METRIC VALUE         |                                   |
| S <#THE_TYPE_OF_METRIC_VALUES>`__ |                                   |
| \|                                |                                   |
| `THE DIMENSIONALITY AND SCALE OF  |                                   |
|  METRIC VALUES <#THE_DIMENSIONALI |                                   |
| TY_AND_SCALE_OF_METRIC_VALUES>`__ |                                   |
| \|                                |                                   |
| `INSTAN                           |                                   |
| CE PROFILE <#INSTANCE_PROFILE>`__ |                                   |
| \|                                |                                   |
| `COLL                             |                                   |
| ECTION TIME <#COLLECTION_TIME>`__ |                                   |
| \|                                |                                   |
| `GENERAL ISSUES OF PMAPI          |                                   |
|  PROGRAMMING STYLE <#GENERAL_ISSU |                                   |
| ES_OF_PMAPI_PROGRAMMING_STYLE>`__ |                                   |
| \| `DIAGNOSTICS <#DIAGNOSTICS>`__ |                                   |
| \|                                |                                   |
| `MULTI-THREADED APPLICATIONS      |                                   |
| <#MULTI-THREADED_APPLICATIONS>`__ |                                   |
| \|                                |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMAPI(3)                Library Functions Manual                PMAPI(3)

NAME
-------------------------------------------------

::

          PMAPI - introduction to the Performance Metrics Application
          Programming Interface


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

           ... assorted routines ...

          cc ... -lpcp


---------------------------------------------------------------

::

          Within the framework of the Performance Co-Pilot (PCP), client
          applications are developed using the Performance Metrics
          Application Programming Interface (PMAPI) that defines a
          procedural interface with services suited to the development of
          applications with a particular interest in performance metrics.

          This description presents an overview of the PMAPI and the
          context in which PMAPI applications are run.  The PMAPI is more
          fully described in the Performance Co-Pilot Programmer's Guide,
          and the manual pages for the individual PMAPI routines.


-------------------------------------------------------------------------------------------------------------------------------

::

          For a description of the Performance Metrics Name Space (PMNS)
          and associated terms and concepts, see PCPIntro(1).

          Not all PMIDs need be represented in the PMNS of every
          application.  For example, an application which monitors disk
          traffic will likely use a name space which references only the
          PMIDs for I/O statistics.

          Applications which use the PMAPI may have independent versions of
          a PMNS, constructed from an initialization file when the
          application starts; see pmLoadASCIINameSpace(3),
          pmLoadNameSpace(3), and PMNS(5).

          Internally (below the PMAPI) the implementation of the
          Performance Metrics Collection System (PMCS) uses only the PMIDs,
          and a PMNS provides an external mapping from a hierarchic
          taxonomy of names to PMIDs that is convenient in the context of a
          particular system or particular use of the PMAPI.  For the
          applications programmer, the routines pmLookupName(3) and
          pmNameID(3) translate between names in a PMNS and PMIDs, and vice
          versa.  The PMNS may be traversed using pmGetChildren(3)
          andpmTraversePMNS.  The pmFetchGroup(3) functions combine metric
          name lookup, fetch, and conversion operations.


-------------------------------------------------------------------

::

          An application using the PMAPI may manipulate several concurrent
          contexts, each associated with a source of performance metrics,
          e.g. pmcd(1) on some host, or a set of archive logs of
          performance metrics as created by pmlogger(1).

          Contexts are identified by a ``handle'', a small integer value
          that is returned when the context is created; see pmNewContext(3)
          and pmDupContext(3).  Some PMAPI functions require an explicit
          ``handle'' to identify the correct context, but more commonly the
          PMAPI function is executed in the ``current'' context.  The
          current context may be discovered using pmWhichContext(3) and
          changed using pmUseContext(3).

          If a PMAPI context has not been explicitly established (or the
          previous current context has been closed using
          pmDestroyContext(3)) then the current PMAPI context is undefined.

          In addition to the source of the performance metrics, the context
          also includes the instance profile and collection time (both
          described below) which controls how much information is returned,
          and when the information was collected.


-------------------------------------------------------------------------

::

          When performance metric values are returned across the PMAPI to a
          requesting application, there may be more than one value for a
          particular metric.  Multiple values, or instances, for a single
          metric are typically the result of instrumentation being
          implemented for each instance of a set of similar components or
          services in a system, e.g.  independent counts for each CPU, or
          each process, or each disk, or each system call type, etc.  This
          multiplicity of values is not enumerated in the name space but
          rather, when performance metrics are delivered across the PMAPI
          by pmFetch(3), the format of the result accommodates values for
          one or more instances, with an instance-value pair encoding the
          metric value for a particular instance.

          The instances are identified by an internal identifier assigned
          by the agent responsible for instantiating the values for the
          associated performance metric.  Each instance identifier has a
          corresponding external instance identifier name (an ASCII
          string).  The routines pmGetInDom(3), pmLookupInDom(3) and
          pmNameInDom(3) may be used to enumerate all instance identifiers,
          and to translate between internal and external instance
          identifiers.

          All of the instance identifiers for a particular performance
          metric are collectively known as an instance domain.  Multiple
          performance metrics may share the same instance domain.

          If only one instance is ever available for a particular
          performance metric, the instance identifier in the result from
          pmFetch(3) assumes the special value PM_IN_NULL and may be
          ignored by the application, and only one instance-value pair
          appears in the result for that metric.  Under these
          circumstances, the associated instance domain (as returned via
          pmLookupDesc(3)) is set to PM_INDOM_NULL to indicate that values
          for this metric are singular.

          The difficult issue of transient performance metrics (e.g. per-
          filesystem information, hot-plug replaceable hardware modules,
          etc.) means that repeated requests for the same PMID may return
          different numbers of values, and/or some changes in the
          particular instance identifiers returned.  This means
          applications need to be aware that metric instantiation is
          guaranteed to be valid at the time of collection only.  Similar
          rules apply to the transient semantics of the associated metric
          values.  In general however, it is expected that the bulk of the
          performance metrics will have instantiation semantics that are
          fixed over the execution life-time of any PMAPI client.


-------------------------------------------------------------------------------------------

::

          The PMAPI supports a wide range of format and type encodings for
          the values of performance metrics, namely signed and unsigned
          integers, floating point numbers, 32-bit and 64-bit encodings of
          all of the above, ASCII strings (C-style, NULL byte terminated),
          and arbitrary aggregates of binary data.

          The type field in the pmDesc structure returned by
          pmLookupDesc(3) identifies the format and type of the values for
          a particular performance metric within a particular PMAPI
          context.

          Note that the encoding of values for a particular performance
          metric may be different for different PMAPI contexts, due to
          differences in the underlying implementation for different
          contexts.  However it is expected that the vast majority of
          performance metrics will have consistent value encoding across
          all versions of all implementations, and hence across all PMAPI
          contexts.

          The PMAPI supports routines to automate the handling of the
          various value formats and types, particularly for the common case
          where conversion to a canonical format is desired, see
          pmExtractValue(3) and pmPrintValue(3).


-----------------------------------------------------------------------------------------------------------------------------------

::

          Independent of how the value is encoded, the value for a
          performance metric is assumed to be drawn from a set of values
          that can be described in terms of their dimensionality and scale
          by a compact encoding as follows.  The dimensionality is defined
          by a power, or index, in each of 3 orthogonal dimensions, namely
          Space, Time and Count (or Events, which are dimensionless).  For
          example I/O throughput might be represented as Space/Time, while
          the running total of system calls is Count, memory allocation is
          Space and average service time is Time/Count.  In each dimension
          there are a number of common scale values that may be used to
          better encode ranges that might otherwise exhaust the precision
          of a 32-bit value.  This information is encoded in the pmUnits
          structure which is embedded in the pmDesc structure returned from
          pmLookupDesc(3).

          The routine pmConvScale(3) is provided to convert values in
          conjunction with the pmUnits structures that defines the
          dimensionality and scale of the values for a particular
          performance metric as returned from pmFetch(3), and the desired
          dimensionality and scale of the value the PMAPI client wishes to
          manipulate.  Alternatively, the pmFetchGroup(3) functions can
          perform data format and unit conversion operations, specified by
          textual descriptions of desired unit / scales.


-------------------------------------------------------------------------

::

          The set of instances for performance metrics returned from a
          pmFetch(3) call may be filtered or restricted using an instance
          profile.  There is one instance profile for each PMAPI context
          the application creates, and each instance profile may include
          instances from one or more instance domains.

          The routines pmAddProfile(3) and pmDelProfile(3) may be used to
          dynamically adjust the instance profile.


-----------------------------------------------------------------------

::

          For each set of values for performance metrics returned via
          pmFetch(3) there is an associated ``timestamp'' that serves to
          identify when the performance metric values were collected; for
          metrics being delivered from a real-time source (i.e. pmcd(1) on
          some host) this would typically be not long before they were
          exported across the PMAPI, and for metrics being delivered from a
          set of archive logs, this would be the time when the metrics were
          written into the archive log.

          There is an issue here of exactly when individual metrics may
          have been collected, especially given their origin in potentially
          different Performance Metric Domains, and variability in the
          metric updating frequency at the lowest level of the Performance
          Metric Domain.  The PMCS opts for the pragmatic approach, in
          which the PMAPI implementation undertakes to return all of the
          metrics with values accurate as of the timestamp, to the best of
          our ability.  The belief is that the inaccuracy this introduces
          is small, and the additional burden of accurate individual
          timestamping for each returned metric value is neither warranted
          nor practical (from an implementation viewpoint).

          Of course, in the case of collection of metrics from multiple
          hosts the PMAPI client must assume the sanity of the timestamps
          is constrained by the extent to which clock synchronization
          protocols are implemented across the network.

          A PMAPI application may call pmSetMode(3) to vary the requested
          collection time, e.g. to rescan performance metrics values from
          the recent past, or to ``fast-forward'' through a set of archive
          logs.


---------------------------------------------------------------------------------------------------------------------------

::

          Across the PMAPI, all arguments and results involving a ``list of
          something'' are declared to be arrays with an associated argument
          or function value to identify the number of elements in the list.
          This has been done to avoid both the varargs(3) approach and
          sentinel-terminated lists.

          Where the size of a result is known at the time of a call, it is
          the caller's responsibility to allocate (and possibly free) the
          storage, and the called function will assume the result argument
          is of an appropriate size.  Where a result is of variable size
          and that size cannot be known in advance (e.g. for
          pmGetChildren(3), pmGetInDom(3), pmNameInDom(3), pmNameID(3),
          pmLookupLabels(3), pmLookupText(3) and pmFetch(3)) the PMAPI
          implementation uses a range of dynamic allocation schemes in the
          called routine, with the caller responsible for subsequently
          releasing the storage when no longer required.  In some cases
          this simply involves calls to free(3), but in others (most
          notably for the result from pmFetch(3)), special routines (e.g.
          pmFreeResult(3) and pmFreeLabelSets(3)) should be used to release
          the storage.

          As a general rule, if the called routine returns an error status
          then no allocation will have been done, and any pointer to a
          variable sized result is undefined.


---------------------------------------------------------------

::

          Where error conditions may arise, the functions that comprise the
          PMAPI conform to a single, simple error notification scheme, as
          follows;

          +  the function returns an integer

          +  values >= 0 indicate no error, and perhaps some positive
             status, e.g. the number of things really processed

          +  values < 0 indicate an error, with a global table of error
             conditions and error messages

          The PMAPI routine pmErrStr(3) translates error conditions into
          error messages.  By convention, the small negative values are
          assumed to be negated versions of the Unix error codes as defined
          in <errno.h> and the strings returned are as per strerror(3).
          The larger, negative error codes are PMAPI error conditions.

          One error, common to all PMAPI routines that interact with
          pmcd(1) on some host is PM_ERR_IPC, which indicates the
          communication link to pmcd(1) has been lost.


-----------------------------------------------------------------------------------------------

::

          The original design for PCP was based around single-threaded
          applications, or more strictly applications in which only one
          thread was ever expected to call the PCP libraries.  This
          restriction has been relaxed for libpcp to allow the most common
          PMAPI routines to be safely called from any thread in a multi-
          threaded application.

          However the following groups of functions and services in libpcp
          are still restricted to being called from a single-thread, and
          this is enforced by returning PM_ERR_THREAD when an attempt to
          call the routines in each group from more than one thread is
          detected.

          1.  Any use of a PM_CONTEXT_LOCAL context, as the DSO PMDAs that
              are called directly from libpcp may not be thread-safe.


-----------------------------------------------------------------------

::

          Most environment variables are described in PCPIntro(1).  In
          addition, environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).  Values for these variables may be obtained
          programmatically using the pmGetConfig(3) function.


---------------------------------------------------------

::

          PCPIntro(1), PCPIntro(3), PMDA(3), PMWEBAPI(3), pmGetConfig(3),
          pcp.conf(5), pcp.env(5) and PMNS(5).

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

   Performance Co-Pilot               PCP                          PMAPI(3)

--------------

Pages that refer to this page: `chkhelp(1) <../man1/chkhelp.1.html>`__, 
`dbpmda(1) <../man1/dbpmda.1.html>`__, 
`htop(1) <../man1/htop.1.html>`__, 
`newhelp(1) <../man1/newhelp.1.html>`__, 
`pcp(1) <../man1/pcp.1.html>`__,  `pmafm(1) <../man1/pmafm.1.html>`__, 
`pmclient(1) <../man1/pmclient.1.html>`__, 
`pmdaperfevent(1) <../man1/pmdaperfevent.1.html>`__, 
`pmdaproc(1) <../man1/pmdaproc.1.html>`__, 
`pmdasystemd(1) <../man1/pmdasystemd.1.html>`__, 
`pmdatrace(1) <../man1/pmdatrace.1.html>`__, 
`pmdaweblog(1) <../man1/pmdaweblog.1.html>`__, 
`pmdumplog(1) <../man1/pmdumplog.1.html>`__, 
`pmdumptext(1) <../man1/pmdumptext.1.html>`__, 
`pmerr(1) <../man1/pmerr.1.html>`__, 
`pmfind(1) <../man1/pmfind.1.html>`__, 
`pmgenmap(1) <../man1/pmgenmap.1.html>`__, 
`pmie(1) <../man1/pmie.1.html>`__, 
`pminfo(1) <../man1/pminfo.1.html>`__, 
`pmlogctl(1) <../man1/pmlogctl.1.html>`__, 
`pmlogsummary(1) <../man1/pmlogsummary.1.html>`__, 
`pmnscomp(1) <../man1/pmnscomp.1.html>`__, 
`pmprobe(1) <../man1/pmprobe.1.html>`__, 
`pmproxy(1) <../man1/pmproxy.1.html>`__, 
`pmseries(1) <../man1/pmseries.1.html>`__, 
`pmsocks(1) <../man1/pmsocks.1.html>`__, 
`pmstat(1) <../man1/pmstat.1.html>`__, 
`pmstore(1) <../man1/pmstore.1.html>`__, 
`pmtrace(1) <../man1/pmtrace.1.html>`__, 
`pmval(1) <../man1/pmval.1.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmaddderived(3) <../man3/pmaddderived.3.html>`__, 
`pmaddprofile(3) <../man3/pmaddprofile.3.html>`__, 
`\__pmaf(3) <../man3/__pmaf.3.html>`__, 
`pmapi_internal(3) <../man3/pmapi_internal.3.html>`__, 
`pmatomstr(3) <../man3/pmatomstr.3.html>`__, 
`\__pmconnectlogger(3) <../man3/__pmconnectlogger.3.html>`__, 
`\__pmcontrollog(3) <../man3/__pmcontrollog.3.html>`__, 
`\__pmconverttime(3) <../man3/__pmconverttime.3.html>`__, 
`pmconvscale(3) <../man3/pmconvscale.3.html>`__, 
`pmctime(3) <../man3/pmctime.3.html>`__, 
`pmda(3) <../man3/pmda.3.html>`__, 
`pmdaattribute(3) <../man3/pmdaattribute.3.html>`__, 
`pmdacache(3) <../man3/pmdacache.3.html>`__, 
`pmdachildren(3) <../man3/pmdachildren.3.html>`__, 
`pmdaconnect(3) <../man3/pmdaconnect.3.html>`__, 
`pmdadaemon(3) <../man3/pmdadaemon.3.html>`__, 
`pmdadesc(3) <../man3/pmdadesc.3.html>`__, 
`pmdadso(3) <../man3/pmdadso.3.html>`__, 
`pmdaeventclient(3) <../man3/pmdaeventclient.3.html>`__, 
`pmdaeventqueue(3) <../man3/pmdaeventqueue.3.html>`__, 
`pmdafetch(3) <../man3/pmdafetch.3.html>`__, 
`pmdagetoptions(3) <../man3/pmdagetoptions.3.html>`__, 
`pmdahelp(3) <../man3/pmdahelp.3.html>`__, 
`pmdainit(3) <../man3/pmdainit.3.html>`__, 
`pmdainstance(3) <../man3/pmdainstance.3.html>`__, 
`pmdainterfacemoved(3) <../man3/pmdainterfacemoved.3.html>`__, 
`pmdalabel(3) <../man3/pmdalabel.3.html>`__, 
`pmdamain(3) <../man3/pmdamain.3.html>`__, 
`pmdaname(3) <../man3/pmdaname.3.html>`__, 
`pmdaopenlog(3) <../man3/pmdaopenlog.3.html>`__, 
`pmdapmid(3) <../man3/pmdapmid.3.html>`__, 
`pmdaprofile(3) <../man3/pmdaprofile.3.html>`__, 
`pmdasenderror(3) <../man3/pmdasenderror.3.html>`__, 
`pmdastore(3) <../man3/pmdastore.3.html>`__, 
`pmdatext(3) <../man3/pmdatext.3.html>`__, 
`pmdelprofile(3) <../man3/pmdelprofile.3.html>`__, 
`pmderivederrstr(3) <../man3/pmderivederrstr.3.html>`__, 
`pmdestroycontext(3) <../man3/pmdestroycontext.3.html>`__, 
`pmdiscoverservices(3) <../man3/pmdiscoverservices.3.html>`__, 
`pmdiscoversetup(3) <../man3/pmdiscoversetup.3.html>`__, 
`pmdupcontext(3) <../man3/pmdupcontext.3.html>`__, 
`pmerrstr(3) <../man3/pmerrstr.3.html>`__, 
`pmeventflagsstr(3) <../man3/pmeventflagsstr.3.html>`__, 
`pmextractvalue(3) <../man3/pmextractvalue.3.html>`__, 
`pmfault(3) <../man3/pmfault.3.html>`__, 
`pmfetch(3) <../man3/pmfetch.3.html>`__, 
`pmfetcharchive(3) <../man3/pmfetcharchive.3.html>`__, 
`pmfetchgroup(3) <../man3/pmfetchgroup.3.html>`__, 
`pmfreeeventresult(3) <../man3/pmfreeeventresult.3.html>`__, 
`pmfreelabelsets(3) <../man3/pmfreelabelsets.3.html>`__, 
`pmfreeprofile(3) <../man3/pmfreeprofile.3.html>`__, 
`pmfreeresult(3) <../man3/pmfreeresult.3.html>`__, 
`pmgetarchiveend(3) <../man3/pmgetarchiveend.3.html>`__, 
`pmgetarchivelabel(3) <../man3/pmgetarchivelabel.3.html>`__, 
`pmgetchildren(3) <../man3/pmgetchildren.3.html>`__, 
`pmgetchildrenstatus(3) <../man3/pmgetchildrenstatus.3.html>`__, 
`pmgetconfig(3) <../man3/pmgetconfig.3.html>`__, 
`pmgetcontexthostname(3) <../man3/pmgetcontexthostname.3.html>`__, 
`pmgetderivedcontrol(3) <../man3/pmgetderivedcontrol.3.html>`__, 
`pmgetindom(3) <../man3/pmgetindom.3.html>`__, 
`pmgetindomarchive(3) <../man3/pmgetindomarchive.3.html>`__, 
`pmgetoptions(3) <../man3/pmgetoptions.3.html>`__, 
`pmgetpmnslocation(3) <../man3/pmgetpmnslocation.3.html>`__, 
`pmgetusername(3) <../man3/pmgetusername.3.html>`__, 
`pmgetversion(3) <../man3/pmgetversion.3.html>`__, 
`pmhttpnewclient(3) <../man3/pmhttpnewclient.3.html>`__, 
`pmid_helper(3) <../man3/pmid_helper.3.html>`__, 
`pmidstr(3) <../man3/pmidstr.3.html>`__, 
`pmindom_helper(3) <../man3/pmindom_helper.3.html>`__, 
`pmindomstr(3) <../man3/pmindomstr.3.html>`__, 
`pmiputresult(3) <../man3/pmiputresult.3.html>`__, 
`pmloadasciinamespace(3) <../man3/pmloadasciinamespace.3.html>`__, 
`pmloadderivedconfig(3) <../man3/pmloadderivedconfig.3.html>`__, 
`pmloadnamespace(3) <../man3/pmloadnamespace.3.html>`__, 
`\__pmlocalpmda(3) <../man3/__pmlocalpmda.3.html>`__, 
`pmlocaltime(3) <../man3/pmlocaltime.3.html>`__, 
`pmlookupdesc(3) <../man3/pmlookupdesc.3.html>`__, 
`pmlookupindom(3) <../man3/pmlookupindom.3.html>`__, 
`pmlookupindomarchive(3) <../man3/pmlookupindomarchive.3.html>`__, 
`pmlookupindomtext(3) <../man3/pmlookupindomtext.3.html>`__, 
`\__pmlookupipc(3) <../man3/__pmlookupipc.3.html>`__, 
`pmlookuplabels(3) <../man3/pmlookuplabels.3.html>`__, 
`pmlookupname(3) <../man3/pmlookupname.3.html>`__, 
`pmlookuptext(3) <../man3/pmlookuptext.3.html>`__, 
`pmmergelabels(3) <../man3/pmmergelabels.3.html>`__, 
`\__pmmktime(3) <../man3/__pmmktime.3.html>`__, 
`pmnameall(3) <../man3/pmnameall.3.html>`__, 
`pmnameid(3) <../man3/pmnameid.3.html>`__, 
`pmnameindom(3) <../man3/pmnameindom.3.html>`__, 
`pmnameindomarchive(3) <../man3/pmnameindomarchive.3.html>`__, 
`pmnewcontext(3) <../man3/pmnewcontext.3.html>`__, 
`pmnewcontextzone(3) <../man3/pmnewcontextzone.3.html>`__, 
`pmnewzone(3) <../man3/pmnewzone.3.html>`__, 
`pmnomem(3) <../man3/pmnomem.3.html>`__, 
`pmnotifyerr(3) <../man3/pmnotifyerr.3.html>`__, 
`\__pmparsectime(3) <../man3/__pmparsectime.3.html>`__, 
`pmparsehostattrsspec(3) <../man3/pmparsehostattrsspec.3.html>`__, 
`pmparsehostspec(3) <../man3/pmparsehostspec.3.html>`__, 
`pmparseinterval(3) <../man3/pmparseinterval.3.html>`__, 
`pmparsemetricspec(3) <../man3/pmparsemetricspec.3.html>`__, 
`\__pmparsetime(3) <../man3/__pmparsetime.3.html>`__, 
`pmparsetimewindow(3) <../man3/pmparsetimewindow.3.html>`__, 
`pmparseunitsstr(3) <../man3/pmparseunitsstr.3.html>`__, 
`pmprintdesc(3) <../man3/pmprintdesc.3.html>`__, 
`pmprintf(3) <../man3/pmprintf.3.html>`__, 
`pmprintlabelsets(3) <../man3/pmprintlabelsets.3.html>`__, 
`pmprintvalue(3) <../man3/pmprintvalue.3.html>`__, 
`pmreconnectcontext(3) <../man3/pmreconnectcontext.3.html>`__, 
`pmrecord(3) <../man3/pmrecord.3.html>`__, 
`pmregisterderived(3) <../man3/pmregisterderived.3.html>`__, 
`pmsearchinfo(3) <../man3/pmsearchinfo.3.html>`__, 
`pmsearchsetup(3) <../man3/pmsearchsetup.3.html>`__, 
`pmsearchtextindom(3) <../man3/pmsearchtextindom.3.html>`__, 
`pmsearchtextquery(3) <../man3/pmsearchtextquery.3.html>`__, 
`pmsearchtextsuggest(3) <../man3/pmsearchtextsuggest.3.html>`__, 
`pmsemstr(3) <../man3/pmsemstr.3.html>`__, 
`pmseriesdescs(3) <../man3/pmseriesdescs.3.html>`__, 
`pmseriesquery(3) <../man3/pmseriesquery.3.html>`__, 
`pmseriessetup(3) <../man3/pmseriessetup.3.html>`__, 
`pmsetmode(3) <../man3/pmsetmode.3.html>`__, 
`pmsetprocessidentity(3) <../man3/pmsetprocessidentity.3.html>`__, 
`pmsetprogname(3) <../man3/pmsetprogname.3.html>`__, 
`pmsortinstances(3) <../man3/pmsortinstances.3.html>`__, 
`pmspeclocalpmda(3) <../man3/pmspeclocalpmda.3.html>`__, 
`pmsprintf(3) <../man3/pmsprintf.3.html>`__, 
`pmstore(3) <../man3/pmstore.3.html>`__, 
`pmtime(3) <../man3/pmtime.3.html>`__, 
`pmtimeval(3) <../man3/pmtimeval.3.html>`__, 
`pmtraversepmns(3) <../man3/pmtraversepmns.3.html>`__, 
`pmtrimnamespace(3) <../man3/pmtrimnamespace.3.html>`__, 
`pmtypestr(3) <../man3/pmtypestr.3.html>`__, 
`pmunitsstr(3) <../man3/pmunitsstr.3.html>`__, 
`pmunloadnamespace(3) <../man3/pmunloadnamespace.3.html>`__, 
`pmunpackeventrecords(3) <../man3/pmunpackeventrecords.3.html>`__, 
`pmusecontext(3) <../man3/pmusecontext.3.html>`__, 
`pmusezone(3) <../man3/pmusezone.3.html>`__, 
`pmwebapi(3) <../man3/pmwebapi.3.html>`__, 
`pmwebtimerregister(3) <../man3/pmwebtimerregister.3.html>`__, 
`pmwhichcontext(3) <../man3/pmwhichcontext.3.html>`__, 
`pmwhichzone(3) <../man3/pmwhichzone.3.html>`__, 
`QMC(3) <../man3/QMC.3.html>`__, 
`QmcContext(3) <../man3/QmcContext.3.html>`__, 
`QmcDesc(3) <../man3/QmcDesc.3.html>`__, 
`QmcGroup(3) <../man3/QmcGroup.3.html>`__, 
`QmcIndom(3) <../man3/QmcIndom.3.html>`__, 
`QmcMetric(3) <../man3/QmcMetric.3.html>`__, 
`QmcSource(3) <../man3/QmcSource.3.html>`__, 
`labels.conf(5) <../man5/labels.conf.5.html>`__, 
`LOGARCHIVE(5) <../man5/LOGARCHIVE.5.html>`__, 
`mmv(5) <../man5/mmv.5.html>`__, 
`pcp.conf(5) <../man5/pcp.conf.5.html>`__, 
`pcp-dstat(5) <../man5/pcp-dstat.5.html>`__, 
`pcp.env(5) <../man5/pcp.env.5.html>`__, 
`pmns(5) <../man5/pmns.5.html>`__

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
