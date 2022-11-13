.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmfetchgroup(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `UNUSUAL SI                       |                                   |
| TUATIONS <#UNUSUAL_SITUATIONS>`__ |                                   |
| \| `DIAGNOSTICS <#DIAGNOSTICS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMFETCHGROUP(3)         Library Functions Manual         PMFETCHGROUP(3)

NAME
-------------------------------------------------

::

          pmCreateFetchGroup, pmExtendFetchGroup_item,
          pmExtendFetchGroup_indom, pmExtendFetchGroup_event,
          pmExtendFetchGroup_timestamp, pmFetchGroup,
          pmGetFetchGroupContext, pmClearFetchGroup, pmDestroyFetchGroup -
          simplified performance metrics value fetch and conversion


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmCreateFetchGroup(pmFG *ptr, int type, const char *name);
          int pmExtendFetchGroup_item(pmFG pmfg, const char *metric, const
                  char *instance, const char *scale, pmAtomValue
                  *out_value, int out_type, int out_sts);
          int pmExtendFetchGroup_indom(pmFG pmfg, const char *metric, const
                  char *scale, int out_inst_codes[], char
                  *out_inst_names[], pmAtomValue out_values[], int
                  out_type, int out_stss[], unsigned int out_maxnum,
                  unsigned int *out_num, int *out_sts);
          int pmExtendFetchGroup_event(pmFG pmfg, const char *metric, const
                  char *instance, const char *field, const char *scale,
                  struct timespec out_times[], pmAtomValue out_values[],
                  int out_type, int out_stss[], unsigned int out_maxnum,
                  unsigned int *out_num, int *out_sts);
          int pmExtendFetchGroup_timestamp(pmFG pmfg, struct timeval
                  *out_value);
          int pmGetFetchGroupContext(pmFG pmfg);
          int pmFetchGroup(pmFG pmfg);
          int pmClearFetchGroup(pmFG pmfg);
          int pmDestroyFetchGroup(pmFG pmfg);

          cc ... -lpcp


---------------------------------------------------------------

::

          The fetchgroup functions implement a registration-based mechanism
          to fetch groups of performance metrics, including automation for
          general unit, rate and type conversions as well as convenient
          instance and value encodings.  They constitute a powerful and
          compact alternative to the classic Performance Metrics
          Application Programming Interface (PMAPI(3)) sequence of separate
          lookup, check, fetch, iterate, extract and convert functions.

          The general idea consists of two stages.  In the setup stage, the
          application identifies metrics of interest by name and with
          desired conversions, and register a unique pmAtomValue output
          location where the fetchgroup system is to later deposit the
          result.  It is also possible to identify a metric with an
          instance domain, and register a unique vector of pmAtomValue
          objects for them.  In the operation stage, one simple
          pmFetchGroup function fetches, decodes, converts, and stores all
          metrics to their destinations, where the application can read
          them directly.  This function may be called repeatedly, and each
          time new pmAtomValue values will be stored in the same
          destinations.  Rate conversions between consecutive samples may
          be requested.

          Each fetchgroup is associated with a private PMAPI context, so it
          can manipulate instance profiles and other such state without
          disrupting other contexts.  The instance profile is manipulated
          to optimize fetches of individual items, even if some are derived
          metrics.  This private PMAPI context belongs to the fetchgroup,
          is used for all of its internal operations, and will be
          destroyed.

          Multiple fetchgroups may be used concurrently, independently.  An
          opaque type pmFG is used to identify a fetchgroup, which is
          passed to all related function calls.

      Creating a fetchgroup
          int pmCreateFetchGroup(pmFG *ptr, int type, const char *name);

          This function creates a new fetchgroup, associated with a new
          PMAPI context.  The type and name parameters are relayed to
          pmNewContext(3) for creation of the context.  The fetchgroup
          identifier is returned upon success through the ptr pointer.
          This object is later used as a parameter to all other fetchgroup
          functions.  The private PMAPI context may be accessed with
          pmGetFetchGroupContext, if required.

          The normal function return code is zero, and ptr is set.  This
          function may fail in case of pmNewContext or memory allocation
          errors.  Those are indicated with a negative return code and a
          cleared ptr value.

      Getting the private PMAPI context
          int pmGetFetchGroupContext(pmFG pmfg);

          This function returns the private PMAPI context used by the given
          fetchgroup.  It may be safely used to adjust some configuration
          parameters of the context, such as via pmSetMode(3), before
          fetchgroup extension and fetching begins.

          However, mutation of this context by PMAPI functions after this
          time may disrupt fetchgroup functionality.  For example, a
          pmSetMode call could invalidate one rate-conversion time-step.

          The normal function return code is the context number.

      Extending a fetchgroup with a metric instance of interest
          int pmExtendFetchGroup_item(pmFG pmfg, const char *metric, const
                  char *instance, const char *scale, pmAtomValue
                  *out_value, int out_type, int *out_sts);

          This function registers interest in a single metric and optional
          instance.  The metric name is given in the mandatory metric
          parameter, which is checked immediately via pmLookupName(3) and
          other calls.  If and only if the metric has an instance domain,
          the specific instance of interest may be named by the instance
          parameter, which is checked immediately via pmNameInDom(3);
          otherwise pass NULL.  If the fetchgroup context is a set of
          archives, it is possible that the metric / instance pair is not
          yet defined at the current time origin.  Therefore, this function
          may attempt to seek to the end of the current set of archives
          temporarily to retry the metric / instance lookup.

          The optional scale parameter specifies desired unit/scale/rate
          conversions for the metric value.  It can take the following
          values:

          NULL
              No unit/scale conversion.  If metric has PM_SEM_COUNTER
              semantics, perform rate conversion.

          rate
              Perform rate conversion regardless of semantics, and no
              unit/scale conversion.

          instant
              Perform no rate conversion regardless of semantics, and no
              unit/scale conversion.

          EXPRESSION
              Perform unit/scale/rate conversion as specified by the
              EXPRESSION, which is parsed by pmParseUnitsStr(3).  This may
              be useful to assert a canonical scaling for the resulting
              metric value, independent of PCP version or configuration.
              Dimensionality must match the metric, except if rate
              conversion is requested, in which case the time dimension
              must be one smaller than the metric's time dimension.  Note
              that the type of rate conversion performed here matches the
              rate(x) function in derived metric expressions, in that it is
              calculated as the naive difference between previous and
              current values of a metric, divided by elapsed time.  For
              example, if a counter wraps around, or a non-counter value
              decreases, a negative output rate may be computed.

          The optional but usual out_value parameter specifies the
          pmAtomValue where the converted result should later be stored.
          If the value is NULL, fetching and conversions will be attempted,
          and possible errors reported, but the result tossed away.  The
          mandatory out_type parameter specifes the PM_TYPE_* requested for
          the output value.  It need not match the metric's native type, as
          the fetchgroup facility is capable of casting between all
          supported types (including to and from strings).

          Any errors subsequently encountered during fetching,
          unit/scale/rate conversion, or casting, will result in the
          assignment of a sentinel value to the output pmAtomValue (see the
          ``UNUSUAL SITUATIONS'' section below).  In addition, if the
          optional out_sts parameter is specified, an appropriate PMAPI
          error code will be stored there.

          As a review, only the pmfg, metric, and out_type parameters are
          mandatory.  Others may be NULL to indicate applicaton
          disinterest.

          The normal function return code is zero.  This function may fail
          in case of various lookup, type- and conversion- checking errors.
          Those are indicated with a negative return code.

      Extending a fetchgroup with a metric instance domain of interest
          int pmExtendFetchGroup_indom(pmFG pmfg, const char* metric, const
                  char *scale, int out_inst_codes[], char
                  *out_inst_names[], pmAtomValue out_values[], int
                  out_type, int out_stss[], unsigned int out_maxnum,
                  unsigned int *out_num, int *out_sts);

          This function generalizes the pmExtendFetchGroup_item function by
          registering interest in a whole instance domain.  Therefore, the
          function registers preallocated vectors for output variables
          (instead of a singleton).  Instances will be stored in sorted
          order in elements of those vectors.  The concepts are otherwise
          the same.

          The metric name is specified by the mandatory metric parameter.
          Note that it may refer to a metric without an instance domain, in
          which case the single output value will appear as one unnamed
          instance.

          The optional scale parameter specifies desired unit/scale/rate
          conversions for the metric value, same as above.

          The optional out_inst_codes parameter specifies a vector of
          integers, where the raw instance number of the fetched metrics
          should later be stored.

          The optional out_inst_names parameter specifies a vector of
          strings, where the instance names of the fetched metrics should
          later be stored.  If an instance does not have a corresponding
          name, a NULL pointer is stored instead.  The application must not
          modify or free(3) strings in that vector.

          The optional out_values parameter specifies a vector of
          pmAtomValue objects where the converted result should later be
          stored.  The mandatory out_type parameter specifies the PM_TYPE_*
          requested for the all output values, same as above.

          The optional out_stss parameter specifies a vector of integers
          where per-instance error codes should be stored.

          The mandatory out_maxnum parameter specifies the number of
          elements of the vectors above.  In other words, it tells the
          fetchgroup the maximum number of instances which are expected.
          The optional out_num parameter specifies an integer where the
          actual number of instances should later be stored.  It will range
          between 0 and out_maxnum.  It is initialized to 0 by this
          function.

          Finally, the optional out_sts parameter specifies a single
          location where an integer status code for the overall fetch for
          this metric should be stored.  Normally, this will be zero.
          Other than a severe fetch error, one may see a PM_ERR_TOOBIG here
          if the number of instances actually encountered was larger than
          out_maxnum.

          Any errors subsequently encountered during fetching,
          unit/scale/rate conversion, or casting, will result in the
          assignment of a sentinel value to the appropriate output
          pmAtomValue (see the ``UNUSUAL SITUATIONS'' section below).  In
          addition, if the optional out_stss parameter was specified, a
          PMAPI error code will be stored in the appropriate position.

          As a review, only the pmfg, metric, out_type, and out_maxnum
          parameters are mandatory.  Others may be NULL to indicate
          applicaton disinterest.

          The normal function return code is zero.  This function may fail
          in case of various lookup, type- and conversion- checking errors.
          Those are indicated with a negative return code.

      Extending a fetchgroup with an event field
          int pmExtendFetchGroup_event(pmFG pmfg, const char *metric, const
                  char *instance, const char *field, const char *scale,
                  struct timespec out_times[], pmAtomValue out_values[],
                  int out_type, int out_stss[], unsigned int out_maxnum,
                  unsigned int *out_num, int *out_sts);

          This function registers interest in all instances of one field of
          all records of an event metric.  Since event metrics may return
          multiple records per fetch, and each record may have multiple
          fields of a given field metric type, this function registers
          preallocated vectors for output variables, similarly to
          pmExtendFetchGroup_indom.  They are filled in temporal/sequential
          order.

          The metric name is specified by the mandatory metric parameter.
          It must be of PM_TYPE_EVENT.  If the metric has an instance
          domain, the instance parameter is mandatory to identify the
          instance of interest.

          The field to extract from event records is specified by the
          mandatory field parameter, which is a metric name of normal
          scalar type.  As is typical for event field metrics, it should
          not have an instance domain.  The optional scale parameter
          specifies desired unit/scale conversions on this metric value.
          Rate conversions are not available, because of ambiguity about
          which previous value to compute rates from.

          The optional out_times parameter specifies a vector of timespec
          structs, which will receive a copy of the timestamp of the event
          record where each particular field was found.

          The optional out_values parameter specifies a vector of
          pmAtomValue objects where the converted result should later be
          stored.  The mandatory out_type parameter specifies the PM_TYPE_*
          requested for the output values.

          The optional out_stss parameter specifies a vector of integers
          where per-field error codes should be stored.

          The mandatory out_maxnum parameter specifies the number of
          elements of the vectors above.  In other words, it tells the
          fetchgroup the maximum number of instances which are expected.
          The optional out_num parameter specifies an integer where the the
          actual number of instances should later be stored.  It will range
          between zero and out_maxnum.  It is initialized to zero by this
          function.

          Finally, the optional out_sts parameter specifies a single
          location where an integer status code for the overall fetch for
          this metric should be stored.  Normally, this will be zero, even
          if no event field values were found (out_num would then be zero).
          Other than a severe fetch error, one may see a PM_ERR_TOOBIG here
          if the number of fields actually encountered was larger than
          out_maxnum.

          Any errors subsequently encountered during fetching, unit/scale
          conversion, or casting, will result in the assignment of a
          sentinel value to the appropriate output pmAtomValue (see the
          ``UNUSUAL SITUATIONS'' section below).  In addition, if the
          optional out_stss parameter was specified, a PMAPI error code
          will be stored in the appropriate position.

          As a review, only the pmfg, metric, field, out_type, and
          out_maxnum parameters are mandatory.  Others may be NULL to
          indicate applicaton disinterest.

          The normal function return code is zero.  This function may fail
          in case of various lookup, type- and conversion- checking errors.
          Those are indicated with a negative return code.

      Extending a fetchgroup with the fetch timestamp
          int pmExtendFetchGroup_timestamp(pmFG pmfg, struct timeval
                  *out_value);

          This function registers interest in the pmResult timestamp.  If
          the out_value pointer is non-NULL, at every future pmFetchGroup
          call, the corresponding result timestamp will be copied there.

      Fetching all metrics in a fetchgroup
          int pmFetchGroup(pmFG pmfg);

          This function performs one pmFetch on its private PMAPI context,
          including all the metrics that were registered via prior
          pmExtendFetchGroup_* calls.  It runs all the data extraction and
          conversion operations necessary to populate all the requested
          output variables.

          The normal function return code is zero or positive, as per the
          underlying pmFetch function.  This function may fail in case of
          severe fetch errors, which are indicated with a negative return
          code.

          In the case of per-metric availability or conversion errors, or
          severe fetch errors, output variables are reset to sentinel
          values and individual error codes are set.  PM_ERR_AGAIN signals
          rate-conversion failure due to lack of a previous value.

          However, temporarily absent metrics with discrete semantics are
          exempt from some sentinel/error processing: if a pmFetchGroup
          fails to collect a result for a discrete metric (pmResult
          pmValueSet.numval==0), then the last seen valid value (if any) is
          retained.  This is intended to ease the processing of sets of
          archives with a mixture of once- and repeatedly-sampled metrics.

      Clearing a fetchgroup
          int pmClearFetchGroup(pmFG pmfg);

          When the current fetch state of a fetchgroup is no longer needed,
          it may be explicitly reset with this function.  It releases any
          dynamically stored state but keeps the private PMAPI context
          intact for subsequent use (i.e. no change to the context is made
          at all and the context remains at the current fetch offset).  It
          frees any pointers such as indom instance names or strings that
          may have been stored in output variables.

      Destroying a fetchgroup
          int pmDestroyFetchGroup(pmFG pmfg);

          When the fetchgroup is no longer needed, it may be explicitly
          freed with this function.  It releases any dynamically stored
          state, as well as the private PMAPI context.  It clears frees any
          pointers such as indom instance names or strings that may have
          been stored in output variables.


-------------------------------------------------------

::

          The following program demonstrates fetchgroup usage.  Run it with
          different $PCP_DISK_UNITS environment variables to see different
          unit/rate conversion in effect.

          #include <pcp/pmapi.h>
          #include <stdio.h>

          #define pcpassert(sts) \
              while (sts<0) { fprintf(stderr, "%s\n", pmErrStr(sts)); exit(42); }

          int main()
          {
              pmFG fg;
              pmAtomValue v, v2;
              enum { v3_maxnum = 100 };
              pmAtomValue v3_values[v3_maxnum];
              char *v3_names[v3_maxnum];
              int v3_stss[v3_maxnum];
              unsigned int v3_num;
              int sts, i;
              char *diskunits = getenv("PCP_DISK_UNITS");
              struct timeval t;

              sts = pmCreateFetchGroup(&fg, PM_CONTEXT_HOST, "local:");
              pcpassert(sts);
              sts = pmExtendFetchGroup_item(fg, "kernel.all.load", "1 minute",
                                            NULL, &v, PM_TYPE_FLOAT, NULL);
              pcpassert(sts);
              sts = pmExtendFetchGroup_item(fg, "kernel.all.idletime", NULL,
                                            "hour", &v2, PM_TYPE_DOUBLE, NULL);
              pcpassert(sts);
              sts = pmExtendFetchGroup_indom(fg, "disk.dev.total", diskunits,
                                             NULL, v3_names,
                                             v3_values, PM_TYPE_STRING,
                                             v3_stss, v3_maxnum, &v3_num, NULL);
              pcpassert(sts);
              sts = pmExtendFetchGroup_timestamp(fg, &t);
              pcpassert(sts);

              for (i=0; i < 10; i++) {
                  unsigned int j;
                  char stamp[28];

                  sts = pmFetchGroup(fg);
                  pcpassert(sts);
                  printf("%s", pmCtime(&t.tv_sec, stamp));
                  printf("1-minute load: %f; idletime: %f h\n", v.f, v2.d);
                  for (j=0; j < v3_num; j++) {
                      if (v3_stss[j] == 0)
                           printf("disk %s i/o operations (%s): %s\n",
                                  v3_names[j] ? v3_names[j] : "?",
                                  diskunits ? diskunits : "-",
                                  v3_values[j].cp);
                  }
                  sleep(1);
              }

              sts = pmDestroyFetchGroup(fg);
              pcpassert(sts);
              return 0;
          }


-----------------------------------------------------------------------------

::

          The fetchgroup API supports only the numeric, string and event
          metric types.  Aggregates are rejected during
          pmExtendFetchGroup_*.

          Any strings supplied by the fetchgroup API to the application are
          "owned" by the API.  The application should consider them read-
          only, so it should not modify them nor free them.

          Error codes are always negative integers, whether returned from
          fetchgroup functions as return value, or stored in out_sts type
          variables.  Normal result codes are always zero.

          Because of the unique ways in which extracted data is shared
          between the application and a fetchgroup, the functions in this
          API are not protected by the multi-threading mutexes conventional
          in other parts of PMAPI.  Specifically, for any given pmFG, it is
          not safe to concurrently call two or more fetchgroup API
          functions, nor to traverse the registered output variables while
          calling one of the functions.  Instead, the calling application
          must ensure that only one thread at a time uses these calls and
          the registered output variables.  On the other hand, concurrency
          between different pmFG instances is unrestricted, because they
          share no global data.

          Any pointers passed to a successful pmFetchGroupExtent_* call
          must stay valid throughout the lifetime of the fetchgroup, since
          future pmFetchGroup calls may write into them.


---------------------------------------------------------------

::

          The fetchgroup API offers several options for collecting
          diagnostics.  Negative integer error codes may be returned from
          each function for serious conditions.

          In addition, each output pmAtomValue may have a corresponding
          integer variable, where pmFetchGroup can store per-metric per-
          instance error codes.

          As an alternative, per-metric per-instance error conditions are
          also signalled by setting the corresponding pmAtomValue to a
          sentinel value.  If unambiguous and precise error detection is
          not required, this may be sufficient.  The sentinel value is
          negative one for all integers (including unsigned integers - i.e.
          all bits are set), NaN for floating point types, a NULL pointer
          for strings, and 0.0s for the timestamp.  The fetchgroup API
          guarantees that once an output pmAtomValue is registered (during
          a successful pmExtendFetchGroup_* call), it will be cleared to
          the sentinel value or to a valid converted metric value, from the
          time of registration until the pmDestroyFetchGroup call.


---------------------------------------------------------

::

          PMAPI(3), pmLookupName(3), pmFetch(3), pmParseUnitsStr(3),
          pmUseContext(3), pmRegisterDerived(3) and pmExtractValue(3).

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

   Performance Co-Pilot               PCP                   PMFETCHGROUP(3)

--------------

Pages that refer to this page:
`pmclient(1) <../man1/pmclient.1.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`pmextractvalue(3) <../man3/pmextractvalue.3.html>`__, 
`pmfetch(3) <../man3/pmfetch.3.html>`__

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
