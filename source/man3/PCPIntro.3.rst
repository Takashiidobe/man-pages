.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcpintro(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `INTRODUCTION <#INTRODUCTION>`__  |                                   |
| \|                                |                                   |
| `GE                               |                                   |
| NERAL ERRORS <#GENERAL_ERRORS>`__ |                                   |
| \|                                |                                   |
| `CLIENT-PMC                       |                                   |
| D ERRORS <#CLIENT-PMCD_ERRORS>`__ |                                   |
| \|                                |                                   |
| `CLIENT-ARCHIVE E                 |                                   |
| RRORS <#CLIENT-ARCHIVE_ERRORS>`__ |                                   |
| \|                                |                                   |
| `TIME CONTROL                     |                                   |
|  ERRORS <#TIME_CONTROL_ERRORS>`__ |                                   |
| \|                                |                                   |
| `NAMESP                           |                                   |
| ACE ERRORS <#NAMESPACE_ERRORS>`__ |                                   |
| \|                                |                                   |
| `PMCD-P                           |                                   |
| MDA ERRORS <#PMCD-PMDA_ERRORS>`__ |                                   |
| \|                                |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCPINTRO(3)             Library Functions Manual             PCPINTRO(3)

NAME
-------------------------------------------------

::

          PCPIntro - introduction to the Performance Co-Pilot (PCP)
          libraries


-----------------------------------------------------------------

::

          Performance Co-Pilot (PCP) is a toolkit designed for monitoring
          and managing system-level performance.

          The PCP libraries support the APIs required to create new
          performance monitoring tools and new agents (or PMDAs) to export
          performance data.  The libpcp library is used in both cases.  The
          libpcp_pmda library is used only for PMDAs.

          Individual library routines are documented in their own manual
          page entries.

          Most routines return an integer value; greater than equal to zero
          for success and less than zero for an error.  The error codes
          have symbolic names defined in <pcp/pmapi.h>.  Other negative
          values are used to encode errors that can be mapped to the
          traditional errno values defined in <errno.h>, with the value
          negated.  To translate all PCP error codes into useful messages
          use either pmerr(1) or pmErrStr(3); the latter may also be used
          to decode the -errno cases.


---------------------------------------------------------------------

::

          These common errors may occur in various PCP interactions.

          PM_ERR_TIMEOUT
              Timeout waiting for a response from PMCD
              Many interactions between PCP applications involve
              synchronous message passing, and these are subject to timeout
              constraints.  These errors are most frequently encountered
              when using network connections with slow data rates or long
              latencies.

              For client-pmcd timeouts, refer to PCPIntro(1) for
              environment variables that may be used to modify the timeout
              thresholds.  For pmcd-PMDA timeouts refer to the -t and -q
              options of pmcd(1) and the PCP metric pmcd.control.timeout
              that can be dynamically changed with pmstore(1).

          PM_ERR_APPVERSION
              Metric not supported by this version of monitored application
              Some performance metrics are unavailable from specific
              versions of the associated PMDA, or may be unavailable
              because the underlying instrumentation has changed or is not
              installed or is not enabled.  This error is used in results
              from pmFetch(3) to indicate these situations.

          PM_ERR_IPC
              IPC protocol failure
              Generic protocol failure on a pipe or socket connecting two
              PCP applications, eg. client-pmcd, or client-pmtime, or
              PMDA-pmcd or pmlc-pmlogger.

          PM_ERR_TEXT
              One-line or help text is not available
              Set by a PMDA, and passed back to a PCP client, to indicate
              that the PMDA is unable to supply the requested metric or
              instance domain help text.

          PM_ERR_VALUE
              Missing metric value(s)
              This error is used for a number of conditions in which the
              value of a performance metric is inappropriate for the
              context in which it is being used, eg.

              (a) Bad value for the metric pmcd.timezone when trying to set
                  the timezone via pmNewContextZone(3) for a remote or
                  archive context.

              (b) Attempting to interpolate values for a metric with non-
                  numeric data type from a set of PCP archives.

              (c) A bad result data structure passed to pmStore(3).

          PM_ERR_NAME
              Unknown metric name
              Just what the message says.

          PM_ERR_PMID
              Unknown or illegal metric identifier
              Just what the message says.

          PM_ERR_INDOM
              Unknown or illegal instance domain identifier
              A request nominates an instance domain that is unknown or
              PM_INDOM_NULL.  May occur as a consequence of the instance
              domain identifier passed by a PCP client to pmGetInDom(3),
              pmLookupInDom(3), pmNameInDom(3), pmGetInDomArchive(3),
              pmLookupInDomArchive(3), pmNameInDomArchive(3) or a request
              passed from pmcd(1) to a PMDA.

          PM_ERR_EOF
              IPC channel closed
              End of file on a pipe or socket connecting two PCP
              applications, eg. client-pmcd, or client-pmtime or PMDA-pmcd.

          PM_ERR_NOCONTEXT
              Attempt to use an illegal context
              Typically caused by a PCP client that tries to make calls
              before calling pmNewContext(3) or after calling
              pmDestroyContext(3).

          PM_ERR_PERMISSION
              No permission to perform requested operation
              PCP-specific access controls apply to pmcd(1) and
              pmlogger(1).  Platform-specific permission errors are
              returned as -EPERM.

          PM_ERR_CONV
              Impossible value or scale conversion
              Some value conversion requests are illegal, eg. bad debug
              flag symbolic name for -D/--debug option, or asking
              pmExtractValue(3) to translate non-numeric data types to
              numbers and vice versa.

          PM_ERR_TRUNC
              Truncation in value conversion
              Some conversion requests to pmExtractValue(3) cannot be
              performed based on the metric types and values involved, in
              this case conversion would result in loss of precision.

          PM_ERR_SIGN
              Negative value in conversion to unsigned
              Some conversion requests to pmExtractValue(3) cannot be
              performed based on the metric types and values involved, in
              this case converting a negative value to an unsigned value.

          PM_ERR_TYPE
              Unknown or illegal metric type
              The metric type is held in the metric descriptor and
              sometimes encoded in the metric values returned from a call
              to pmFetch(3).  Legal values for the metric type are defined
              by the PM_TYPE_* macros in <pcp/pmapi.h>.

          PM_ERR_UNIT
              Illegal pmUnits specification
              Some conversion requests to pmConvScale(3) cannot be
              performed due to illegal or incompatible specifications of
              the source and destination units.

          PM_ERR_PROFILE
              Explicit instance identifier(s) required
              Some PMDAs, especially the proc PMDA, will not return ``all
              instances'' for a pmFetch(3) request due to the cost.  The
              client must explicitly built an instance profile using
              pmAddProfile(3) and/or pmDelProfile(3) before calling
              pmFetch(3).  See also the -F/--fetchall option to pminfo(1).

          PM_ERR_INST
              Unknown or illegal instance identifier
              A request to a PMDA nominates an instance that is unknown.
              May occur as a consequence of the profile established prior
              to a pmFetch(3) call, or an explicit instance name or
              identifier to pmLookupInDom(3) or pmNameInDom(3).

          PM_ERR_MODE
              Illegal mode specification
              Illegal mode argument to pmSetMode(3).

          PM_ERR_PROFILESPEC
              NULL pmInDom with non-NULL instlist
              Bad arguments passed from a PCP client to pmAddProfile(3).

          PM_ERR_TOOSMALL
              Insufficient elements in list
              Parameter passing error by caller specifying a list with less
              than one element to pmFetch(3), pmLookupName(3) or
              pmStore(3).

          PM_ERR_FAULT
              QA fault injected
              For testing, there is a ``fault injection'' version of libpcp
              and this error indicates a misuse of the fault injection
              infrastructure.

          PM_ERR_THREAD
              Operation not supported for multi-threaded applications
              As documented in PMAPI(3) and elsewhere, some libpcp routines
              are intended solely for use from single-threaded
              applications.

          PM_ERR_NOCONTAINER
              Container not found The user supplied container name does not
              match any known container.

          PM_ERR_BADSTORE
              Bad input to pmstore
              The metric value provided for a pmStore(3) operation is in
              the wrong format, or of the wrong type or has the wrong
              number of values.

          PM_ERR_TOOBIG
              Result size exceeded
              Indicates a fatal error in the message (or PDU) passing
              protocol between two PCP applications.  This is an internal
              error, and other than an exotic networking failure, should
              not occur.

          PM_ERR_RESET
              PMCD reset or configuration change
              Not used.

              Refer to pmFetch(3) for an alternative mechanism that may be
              used to notify a PCP client when pmcd(1) has experienced one
              or more configuration changes since the last request from the
              client.  Usually these changes involve a change to the
              namespace exported via pmcd and/or changes to the PMDAs under
              pmcd's control.

          PM_ERR_FAULT
              QA fault injected
              Used only for PCP Quality Assurance (QA) testing.

          PM_ERR_NYI
              Functionality not yet implemented
              Self explanatory and rarely used.

          PM_ERR_GENERIC
              Generic error, already reported above
              Rarely used, this error may be returned when the error
              condition is a consequent of some earlier returned error and
              a more precise characterization is not possible.

          PM_ERR_BADDERIVE
              Derived metric definition failed
              When registering a derived metric, the metric expression is
              either syntactically or semantically incorrect.

          PM_ERR_NOLABELS
              No support for metric label metadata
              Operation requires metric labels, but none are available.


-----------------------------------------------------------------------------

::

          These errors may occur in the interactions between a PCP client
          and pmcd(1) providing real-time performance data.

          PM_ERR_NOAGENT
                 No PMCD agent for domain of request
                 A request sent to pmcd(1) requires information from an
                 agent or PMDA that does not exist.  Usually this means the
                 namespace being used by the client application contains
                 metric names from a previously installed PMDA.

          PM_ERR_CONNLIMIT
                 PMCD connection limit for this host exceeded
                 The client connection limit for pmcd(1) is controlled by
                 the optional access controls in $PCP_PMCDCONF_PATH.  By
                 default there is no limit imposed by the PCP code, and
                 this error would not be seen.

          PM_ERR_AGAIN
                 Try again. Information not currently available
                 Used to notify a PCP client that the PMDA responsible for
                 delivering the information is temporarily unavailable.
                 See also PM_ERR_PMDANOTREADY.

          PM_ERR_NOPROFILE
                 Missing profile - protocol botch
                 Internal error in the communication between a client
                 application and pmcd(1) - should not occur.

          PM_ERR_NEEDCLIENTCERT
                 PMCD requires a client certificate Authentication failure.

          PM_ERR_PMDAFENCED
                 PMDA is currently fenced and unable to respond to requests
                 A privileged user has decided to isolate a PMDA from
                 pmcd(1) using a pmStore(1) operation on the
                 pmcd.agent.fenced metric, which means all fetch-level
                 requests to that PMDA are being blocked.


-----------------------------------------------------------------------------------

::

          These errors may occur in the interactions between a PCP client
          and the library routines that provide historical performance data
          from PCP archives created by pmlogger(1).

          PM_ERR_LOGFILE
                 Missing archive file
                 Each PCP archive consists of multiple physical files as
                 described in pmlogger(1).  This error occurs when one of
                 the physical files is missing or cannot be opened for
                 reading.

          PM_ERR_EOL
                 End of PCP archive log
                 An attempt is made to read past the end file of the last
                 volume of a set of PCP archives, or past the end of the
                 time window (as specified with a -T/--finish option) for a
                 set of PCP archives.

          PM_ERR_NOTHOST
                 Operation requires context with host source of metrics
                 Calls to pmStore(3) require a host context and are not
                 supported for PCP archives.

                 For archives created with versions of PCP prior to 4.0,
                 the pmLookupText(3) and pmLookupInDomText(3) calls will
                 return this code for archive PMAPI contexts (help and one-
                 line text was not previously recorded in archive logs).

          PM_ERR_LOGREC
                 Corrupted record in a PCP archive log
                 PCP archives can become corrupted for a variety of
                 reasons, but the most common is premature termination of
                 pmlogger(1) without flushing its output buffers.

          PM_ERR_LABEL
                 Illegal label record at start of a PCP archive log file
                 Each physical file in a PCP archive should begin with a
                 common label record.  This is a special case of
                 PM_ERR_LOGREC errors.

          PM_ERR_NODATA
                 Empty archive log file
                 An empty physical file can never be part of a valid PCP
                 archive (at least the label record should be present).
                 This is a special case of PM_ERR_LOGREC errors.

          PM_ERR_NOTARCHIVE
                 Operation requires context with archive source of metrics
                 A call to one of the archive variant routines, i.e.
                 pmFetchArchive(3), pmGetInDomArchive(3),
                 pmLookupInDomArchive(3) or pmNameInDomArchive(3), when the
                 current context is not associated with a set of PCP
                 archives.

          PM_ERR_PMID_LOG
                 Metric not defined in the PCP archive log
                 A PCP client has requested information about a metric, and
                 there is no corresponding information in the set of PCP
                 archives.  This should not happen for well-behaved PCP
                 clients.

          PM_ERR_INDOM_LOG
                 Instance domain identifier not defined in the PCP archive
                 log
                 A PCP client has requested information about an instance
                 domain for one or more performance metrics, and there is
                 no corresponding information in the set of PCP archives.
                 If the client is using metric descriptors from the set of
                 archives to identify the instance domain, this is less
                 likely to happen.

                 Because instance domains may vary over time, clients may
                 need to use the variant routines pmGetInDomArchive(3) or
                 pmLookupInDomArchive(3) or pmNameInDomArchive(3) to
                 manipulate the union of the instances in an instance
                 domain over the life of an archive.

          PM_ERR_INST_LOG
                 Instance identifier not defined in the PCP archive log
                 A PCP client has requested information about a specific
                 instance of a performance metric, and there is no
                 corresponding information in the set of PCP archives.  If
                 the client is using instance names from the instance
                 domain in the set of archives (rather than hard-coded
                 instance names) and instance identifiers from the results
                 returned by pmFetch(3) or pmFetchArchive(3) this is less
                 likely to happen.

                 Because instance domains may vary over time, clients may
                 need to use the variant routines pmLookupInDomArchive(3)
                 or pmNameInDomArchive(3) to manipulate the union of the
                 instances in an instance domain over the life of an
                 archive.

          PM_ERR_LOGOVERLAP
                 Archives overlap in time
                 When using a context associated with a set of archives,
                 the archives in the set may not overlap in time.

          PM_ERR_LOGHOST
                 Archives differ by host
                 When using a context associated with a set of archives,
                 the archives in the set must all have been generated on
                 the same host.

          PM_ERR_LOGCHANGETYPE
                 The type of a metric differs among archives
                 When using a context associated with a set of archives,
                 the type of each metric must be same in all of the
                 archives.

          PM_ERR_LOGCHANGESEM
                 The semantics of a metric differs among archives
                 When using a context associated with a set of archives,
                 the semantics of each metric must be same in all of the
                 archives.

          PM_ERR_LOGCHANGEINDOM
                 The instance domain of a metric differs among archives
                 When using a context associated with a set of archives,
                 the instance domain of each metric must be same in all of
                 the archives.

          PM_ERR_LOGCHANGEUNITS
                 The units of a metric differs among archives
                 When using a context associated with a set of archives,
                 the units of each metric must be same in all of the
                 archives.


-------------------------------------------------------------------------------

::

          These errors may occur in the interactions between a GUI PCP
          client and the time control services provided by pmtime(1).

          PM_ERR_ISCONN
                 Already Connected
                 A PCP client application called pmTimeConnect(3) when
                 already connected to a pmtime(1) instance.

          PM_ERR_NOTCONN
                 Not Connected
                 A PCP client application called one of the time control
                 routines pmTime*(3) when not currently connected to any
                 pmtime(1) instance.

          PM_ERR_NEEDPORT
                 A non-null port name is required
                 If a shared pmtime(1) instance is being created the port
                 argument to pmTimeConnect(3) must not be invalid.


-------------------------------------------------------------------------

::

          These errors may occur in the processing of PCP namespace
          operations.  A PCP namespace, see PMNS(5), provides the external
          names and the internal identifiers for the available performance
          metrics.

          PM_ERR_NONLEAF
                 Metric name is not a leaf in PMNS
                 The metric name passed to pmLookupName(3) names a non-
                 terminal path in the namespace, i.e. a group of metrics
                 rather than a single metric.

          PM_ERR_DUPPMNS
                 Attempt to reload the PMNS
                 When using an explicit local namespace, it is illegal to
                 call either of pmLoadNameSpace(3) or
                 pmLoadASCIINameSpace(3) more than once.

          PM_ERR_PMNS
                 Problems parsing PMNS definitions
                 Only occurs when an ASCII namespace is explicitly loaded.

          PM_ERR_NOPMNS
                 PMNS not accessible
                 Only occurs when an ASCII namespace is explicitly loaded.


-------------------------------------------------------------------------

::

          These error codes are used in the interactions between pmcd(1)
          and the PMDAs that provide the performance data.

          PM_ERR_PMDANOTREADY
                 PMDA is not yet ready to respond to requests
                 Some PMDAs have long initialization or reset times, and
                 will respond to pmcd(1) with this error if they are busy
                 at the moment.  This error translates to PM_ERR_AGAIN for
                 the PCP client who made the request to pmcd which caused
                 the initial request to the PMDA.  At some later time the
                 PMDA will inform pmcd (see PM_ERR_PMDAREADY) that it is
                 now ready to process requests, and client requests will
                 begin to succeed.

          PM_ERR_PMDAREADY
                 PMDA is now responsive to requests
                 Used by PMDAs to asynchronously inform pmcd(1) that they
                 are now willing to resume processing requests.  See also
                 PM_ERR_PMDANOTREADY.


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).  Values for these variables may be obtained
          programmatically using the pmGetConfig(3) function.


---------------------------------------------------------

::

          PCPIntro(1), pmcd(1), pmerr(1), pminfo(1), pmtime(1), pmstore(1),
          pmlogger(1), PMAPI(3), pmAddProfile(3), pmDelProfile(3),
          pmConvScale(3), pmNewContext(3), pmDestroyContext(3),
          pmErrStr(3), pmExtractValue(3), pmFetch(3), pmFetchArchive(3),
          pmGetConfig(3), pmGetInDom(3), pmGetInDomArchive(3),
          pmLoadNameSpace(3), pmLookupInDom(3), pmLookupInDomText(3),
          pmLookupName(3), pmLookupText(3), pmNameInDom(3),
          pmNameInDomArchive(3), pmSetMode(3), pmStore(3),
          pmTimeConnect(3), pcp.conf(5), pcp.env(5) and PMNS(5).

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

   Performance Co-Pilot               PCP                       PCPINTRO(3)

--------------

Pages that refer to this page: `pmapi(3) <../man3/pmapi.3.html>`__, 
`pmierrstr(3) <../man3/pmierrstr.3.html>`__, 
`pmwebapi(3) <../man3/pmwebapi.3.html>`__, 
`pcp.conf(5) <../man5/pcp.conf.5.html>`__, 
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
