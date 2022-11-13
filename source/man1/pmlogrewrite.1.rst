.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmlogrewrite(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `REWRITING RULES SY               |                                   |
| NTAX <#REWRITING_RULES_SYNTAX>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMLOGREWRITE(1)          General Commands Manual         PMLOGREWRITE(1)

NAME
-------------------------------------------------

::

          pmlogrewrite - rewrite Performance Co-Pilot archives


---------------------------------------------------------

::

          $PCP_BINADM_DIR/pmlogrewrite [-Cdiqsvw?]  [-c config] inlog
          [outlog]


---------------------------------------------------------------

::

          pmlogrewrite reads a set of Performance Co-Pilot (PCP) archive
          logs identified by inlog and creates a PCP archive log in outlog.
          Under normal usage, the -c option will be used to nominate a
          configuration file or files that contains specifications (see the
          REWRITING RULES SYNTAX section below) that describe how the data
          and metadata from inlog should be transformed to produce outlog.

          The typical uses for pmlogrewrite would be to accommodate the
          evolution of Performance Metric Domain Agents (PMDAs) where the
          names, metadata and semantics of metrics and their associated
          instance domains may change over time, e.g. promoting the type of
          a metric from a 32-bit to a 64-bit integer, or renaming a group
          of metrics.  Refer to the EXAMPLES section for some additional
          use cases.

          pmlogrewrite is most useful where PMDA changes, or errors in the
          production environment, result in archives that cannot be
          combined with pmlogextract(1).  By pre-processing the archives
          with pmlogrewrite the resulting archives may be able to be merged
          with pmlogextract(1).

          The input inlog must be a set of PCP archive logs created by
          pmlogger(1), or possibly one of the tools that read and create
          PCP archives, e.g.  pmlogextract(1) and pmlogreduce(1).  inlog is
          a comma-separated list of names, each of which may be the base
          name of an archive or the name of a directory containing one or
          more archives.

          If no -c option is specified, then the default behavior simply
          creates outlog as a copy of inlog.  This is a little more
          complicated than cat(1), as each PCP archive is made up of
          several physical files.

          While pmlogrewrite may be used to repair some data consistency
          issues in PCP archives, there is also a class of repair tasks
          that cannot be handled by pmlogrewrite and pmloglabel(1) may be a
          useful tool in these cases.


-------------------------------------------------------

::

          The available command line options are:

          -c config, --config=config
               If config is a file or symbolic link, read and parse
               rewriting rules from there.  If config is a directory, then
               all of the files or symbolic links in that directory
               (excluding those beginning with a period ``.'') will be used
               to provide the rewriting rules.  Multiple -c options are
               allowed.

          -C, --check
               Parse the rewriting rules and quit.  outlog is not created.
               When -C is specified, this also sets -v and -w so that all
               warnings and verbose messages are displayed as config is
               parsed.

          -d, --desperate
               Desperate mode.  Normally if a fatal error occurs, all trace
               of the partially written PCP archive outlog is removed.
               With the -d option, the partially created outlog archive log
               is not removed.

          -i   Rather than creating outlog, inlog is rewritten in place
               when the -i option is used.  A new archive is created using
               temporary file names and then renamed to inlog in such a way
               that if any errors (not warnings) are encountered, inlog
               remains unaltered.

          -q, --quick
               Quick mode, where if there are no rewriting actions to be
               performed (none of the global data, instance domains or
               metrics from inlog will be changed), then pmlogrewrite will
               exit (with status 0, so success) immediately after parsing
               the configuration file(s) and outlog is not created.

          -s, --scale
               When the ``units'' of a metric are changed, if the dimension
               in terms of space, time and count is unaltered, then the
               scaling factor is being changed, e.g. BYTE to KBYTE, or
               MSEC-1 to USEC-1, or the composite MBYTE.SEC-1 to
               KBYTE.USEC-1.  The motivation may be (a) that the original
               metadata was wrong but the values in inlog are correct, or
               (b) the metadata is changing so the values need to change as
               well.  The default pmlogrewrite behaviour matches case (a).
               If case (b) applies, then use the -s option and the values
               of all the metrics with a scale factor change in each result
               will be rescaled.  For finer control over value rescaling
               refer to the RESCALE option for the UNITS clause of the
               metric rewriting rule described below.

          -v, --verbose
               Enable verbose mode.

          -w, --warnings
               Emit warnings.  Normally pmlogrewrite remains silent for any
               warning that is not fatal and it is expected that for a
               particular archive, some (or indeed, all) of the rewriting
               specifications may not apply.  For example, changes to a
               PMDA may be captured in a set of rewriting rules, but a
               single archive may not contain all of the modified metrics
               nor all of the modified instance domains and/or instances.
               Because these cases are expected, they do not prevent
               pmlogrewrite executing, and rules that do not apply to inlog
               are silently ignored by default.  Similarly, some rewriting
               rules may involve no change because the metadata in inlog
               already matches the intent of the rewriting rule to correct
               data from a previous version of a PMDA.  The -w flag forces
               warnings to be emitted for all of these cases.

          -?, --help
               Display usage message and exit.

          The argument outlog is required in all cases, except when -i is
          specified.


-------------------------------------------------------------------------------------

::

          A configuration file contains zero or more rewriting rules as
          defined below.

          Keywords and special punctuation characters are shown below in
          bolditalic font and are case-insensitive, so METRIC, metric and
          Metric are all equivalent in rewriting rules.

          The character ``#'' introduces a comment and the remainder of the
          line is ignored.  Otherwise the input is relatively free format
          with optional white space (spaces, tabs or newlines) between
          lexical items in the rules.

          A global rewriting rule has the form:

          GLOBAL { globalspec ...  }

          where globalspec is zero or more of the following clauses:

              HOSTNAME -> hostname

                  Modifies the label records in the outlog PCP archive, so
                  that the metrics will appear to have been collected from
                  the host hostname.

              TIME -> delta

                  Both metric values and the instance domain metadata in a
                  PCP archive carry timestamps.  This clause forces all the
                  timestamps to be adjusted by delta, where delta is an
                  optional sign ``+'' (the default) or ``-'', an optional
                  number of hours followed by a colon ``:'', an optional
                  number of minutes followed by a colon ``:'', a number of
                  seconds, an optional fraction of seconds following a
                  period ``.''.  The simplest example would be ``30'' to
                  increase the timestamps by 30 seconds.  A more complex
                  example would be ``-23:59:59.999'' to move the timestamps
                  backwards by one millisecond less than one day.

              TZ -> "timezone"

                  Modifies the label records in the outlog PCP archive, so
                  that the metrics will appear to have been collected from
                  a host with a local timezone of timezone.  timezone must
                  be enclosed in quotes, and should conform to the valid
                  timezone syntax rules for the local platform.

          An indom rewriting rule modifies an instance domain and has the
          form:

          INDOM domain.serial { indomspec ...  }

          where domain and serial identify one or more existing instance
          domains from inlog - typically domain would be an integer in the
          range 1 to 510 and serial would be an integer in the range 0 to
          4194304.

          As a special case serial could be an asterisk ``*'' which means
          the rule applies to every instance domain with a domain number of
          domain.

          If a designated instance domain is not in inlog the rule has no
          effect.

          The indomspec is zero or more of the following clauses:

              INAME "oldname" -> "newname"

                  The instance identified by the external instance name
                  oldname is renamed to newname.  Both oldname and newname
                  must be enclosed in quotes.

                  As a special case, the new name may be the keyword DELETE
                  (with no quotes), and then the instance oldname will be
                  expunged from outlog which removes it from the instance
                  domain metadata and removes all values of this instance
                  for all the associated metrics.

                  If the instance names contain any embedded spaces then
                  special care needs to be taken in respect of the PCP
                  instance naming rule that treats the leading non-space
                  part of the instance name as the unique portion of the
                  name for the purposes of matching and ensuring uniqueness
                  within an instance domain, refer to pmdaInstance(3) for a
                  discussion of this issue.

                  As an illustration, consider the hypothetical instance
                  domain for a metric which contains 2 instances with the
                  following names:
                      red
                      eek urk

                  Then some possible INAME clauses might be:

                  "eek" -> "yellow like a flower"
                         Acceptable, oldname "eek" matches the "eek urk"
                         instance.

                  "red" -> "eek"
                         Error, newname "eek" matches the existing "eek
                         urk" instance.

                  "eek urk" -> "red of another hue"
                         Error, newname "red of another hue" matches the
                         existing "red" instance.

              INDOM -> newdomain.newserial

                  Modifies the metadata for the instance domain and every
                  metric associated with the instance domain.  As a special
                  case, newserial could be an asterisk ``*'' which means
                  use serial from the indom rewriting rule, although this
                  is most useful when serial is also an asterisk.  So for
                  example:
                      indom 29.* { indom -> 109.* }
                  will move all instance domains from domain 29 to domain
                  109.

              INDOM -> DUPLICATE newdomain.newserial

                  A special case of the previous INDOM clause where the
                  instance domain is a duplicate copy of the domain.serial
                  instance domain from the indom rewriting rule, and then
                  any mapping rules are applied to the copied
                  newdomain.newserial instance domain.  This is useful when
                  a PMDA is split and the same instance domain needs to be
                  replicated for domain domain and domain newdomain.  So
                  for example if the metrics foo.one and foo.two are both
                  defined over instance domain 12.34, and foo.two is moved
                  to another PMDA using domain 27, then the following
                  rewriting rules could be used:
                      indom 12.34 { indom -> duplicate 27.34 }
                      metric foo.two { indom -> 27.34 pmid -> 27.*.*  }

              INST oldid -> newid

                  The instance identified by the internal instance
                  identifier oldid is renumbered to newid.  Both oldid and
                  newid are integers in the range 0 to 231-1.

                  As a special case, newid may be the keyword DELETE and
                  then the instance oldid will be expunged from outlog
                  which removes it from the instance domain metadata and
                  removes all values of this instance for all the
                  associated metrics.

          A metric rewriting rule has the form:

          METRIC metricid { metricspec ...  }

          where metricid identifies one or more existing metrics from inlog
          using either a metric name, or the internal encoding for a
          metric's PMID as domain.cluster.item.  In the latter case,
          typically domain would be an integer in the range 1 to 510,
          cluster would be an integer in the range 0 to 4095, and item
          would be an integer in the range 0 to 1023.

          As special cases item could be an asterisk ``*'' which means the
          rule applies to every metric with a domain number of domain and a
          cluster number of cluster, or cluster could be an asterisk which
          means the rule applies to every metric with a domain number of
          domain and an item number of item, or both cluster and item could
          be asterisks, and rule applies to every metric with a domain
          number of domain.

          If a designated metric is not in inlog the rule has no effect.

          The metricspec is zero or more of the following clauses:

              DELETE

                  The metric is completely removed from outlog, both the
                  metadata and all values in results are expunged.

              INDOM -> newdomain.newserial [ pick ]

                  Modifies the metadata to change the instance domain for
                  this metric.  The new instance domain must exist in
                  outlog.

                  The optional pick clause may be used to select one input
                  value, or compute an aggregate value from the instances
                  in an input result, or assign an internal instance
                  identifier to a single output value.  If no pick clause
                  is specified, the default behaviour is to copy all input
                  values from each input result to an output result,
                  however if the input instance domain is singular (indom
                  PM_INDOM_NULL) then the one output value must be assigned
                  an internal instance identifier, which is 0 by default,
                  unless over-ridden by a INST or INAME clause as defined
                  below.

                  The choices for pick are as follows:

                  OUTPUT FIRST
                         choose the value of the first instance from each
                         input result

                  OUTPUT LAST
                         choose the value of the last instance from each
                         input result

                  OUTPUT INST instid
                         choose the value of the instance with internal
                         instance identifier instid from each result; the
                         sequence of rewriting rules ensures the OUTPUT
                         processing happens before instance identifier
                         renumbering from any associated indom rule, so
                         instid should be one of the internal instance
                         identifiers that appears in inlog

                  OUTPUT INAME "name"
                         choose the value of the instance with name for its
                         external instance name from each result; the
                         sequence of rewriting rules ensures the OUTPUT
                         processing happens before instance renaming from
                         any associated indom rule, so name should be one
                         of the external instance names that appears in
                         inlog

                  OUTPUT MIN
                         choose the smallest value in each result (metric
                         type must be numeric and output instance will be 0
                         for a non-singular instance domain)

                  OUTPUT MAX
                         choose the largest value in each result (metric
                         type must be numeric and output instance will be 0
                         for a non-singular instance domain)

                  OUTPUT SUM
                         choose the sum of all values in each result
                         (metric type must be numeric and output instance
                         will be 0 for a non-singular instance domain)

                  OUTPUT AVG
                         choose the average of all values in each result
                         (metric type must be numeric and output instance
                         will be 0 for a non-singular instance domain)

                  If the input instance domain is singular (indom
                  PM_INDOM_NULL) then independent of any pick
                  specifications, there is at most one value in each input
                  result and so FIRST, LAST, MIN, MAX, SUM and AVG are all
                  equivalent and the output instance identifier will be 0.

                  In general it is an error to specify a rewriting action
                  for the same metadata or result values more than once,
                  e.g. more than one INDOM clause for the same instance
                  domain.  The one exception is the possible interaction
                  between the INDOM clauses in the indom and metric rules.
                  For example the metric sample.bin is defined over the
                  instance domain 29.2 in inlog and the following is
                  acceptable (albeit redundant):
                      indom 29.* { indom -> 109.* }
                      metric sample.bin { indom -> 109.2 }
                  However the following is an error, because the instance
                  domain for sample.bin has two conflicting definitions:
                      indom 29.* { indom -> 109.* }
                      metric sample.bin { indom -> 123.2 }

              INDOM -> NULL[ pick ]

                  The metric (which must have been previously defined over
                  an instance domain) is being modified to be a singular
                  metric.  This involves a metadata change and collapsing
                  all results for this metric so that multiple values
                  become one value.

                  The optional pick part of the clause defines how the one
                  value for each result should be calculated and follows
                  the same rules as described for the non-NULL INDOM case
                  above.

                  In the absence of pick, the default is OUTPUT FIRST.

              NAME -> newname

                  Renames the metric in the PCP archive's metadata that
                  supports the Performance Metrics Name Space (PMNS).
                  newname should not match any existing name in the
                  archive's PMNS and must follow the syntactic rules for
                  valid metric names as outlined in PMNS(5).

              PMID -> newdomain.newcluster.newitem

                  Modifies the metadata and results to renumber the
                  metric's PMID.  As special cases, newcluster could be an
                  asterisk ``*'' which means use cluster from the metric
                  rewriting rule and/or item could be an asterisk which
                  means use item from the metric rewriting rule.  This is
                  most useful when cluster and/or item is also an asterisk.
                  So for example:
                      metric 30.*.* { pmid -> 123.*.* }
                  will move all metrics from domain 30 to domain 123.

              SEM -> newsem

                  Change the semantics of the metric.  newsem should be the
                  XXX part of the name of one of the PM_SEM_XXX macros
                  defined in <pcp/pmapi.h> or pmLookupDesc(3), e.g.
                  COUNTER for PM_TYPE_COUNTER.

                  No data value rewriting is performed as a result of the
                  SEM clause, so the usefulness is limited to cases where a
                  version of the associated PMDA was exporting incorrect
                  semantics for the metric.  pmlogreduce(1) may provide an
                  alternative in cases where re-computation of result
                  values is desired.

              TYPE -> newtype

                  Change the type of the metric which alters the metadata
                  and may change the encoding of values in results.
                  newtype should be the XXX part of the name of one of the
                  PM_TYPE_XXX macros defined in <pcp/pmapi.h> or
                  pmLookupDesc(3), e.g.  FLOAT for PM_TYPE_FLOAT.

                  Type conversion is only supported for cases where the old
                  and new metric type is numeric, so PM_TYPE_STRING,
                  PM_TYPE_AGGREGATE and PM_TYPE_EVENT are not allowed.
                  Even for the numeric cases, some conversions may produce
                  run-time errors, e.g. integer overflow, or attempting to
                  rewrite a negative value into an unsigned type.

              TYPE IF oldtype -> newtype

                  The same as the preceding TYPE clause, except the type of
                  the metric is only changed to newtype if the type of the
                  metric in inlog is oldtype.

                  This useful in cases where the type of metricid in inlog
                  may be platform dependent and so more than one type
                  rewriting rule is required.

              UNITS -> newunits [ RESCALE ]

                  newunits is six values separated by commas.  The first 3
                  values describe the dimension of the metric along the
                  dimensions of space, time and count; these are integer
                  values, usually 0, 1 or -1.  The remaining 3 values
                  describe the scale of the metric's values in the
                  dimensions of space, time and count.  Space scale values
                  should be 0 (if the space dimension is 0), else the XXX
                  part of the name of one of the PM_SPACE_XXX macros, e.g.
                  KBYTE for PM_TYPE_KBYTE.  Time scale values should be 0
                  (if the time dimension is 0), else the XXX part of the
                  name of one of the PM_TIME_XXX macros, e.g.  SEC for
                  PM_TIME_SEC.  Count scale values should be 0 (if the time
                  dimension is 0), else ONE for PM_COUNT_ONE.

                  The PM_SPACE_XXX, PM_TIME_XXX and PM_COUNT_XXX macros are
                  defined in <pcp/pmapi.h> or pmLookupDesc(3).

                  When the scale is changed (but the dimension is
                  unaltered) the optional keyword RESCALE may be used to
                  chose value rescaling as per the -s command line option,
                  but applied to just this metric.

              When changing the domain number for a metric or instance
              domain, the new domain number will usually match an existing
              PMDA's domain number.  If this is not the case, then the new
              domain number should not be randomly chosen; consult
              $PCP_VAR_DIR/pmns/stdpmid for domain numbers that are already
              assigned to PMDAs.

          A text rewriting rule modifies a help text record and has the
          form:

          TEXT textid [ texttype ] [ "textcontent" ] { textspec ...  }

          where textid identifies the metric or instance domain with which
          the text is currently associated, and is either METRIC metricid
          or INDOM domain.serial.

          metricid has the same form and meaning as for a METRIC rewriting
          rule (see above) and domain.serial has the same form and meaning
          as for an INDOM rewriting rule (see above).

          The optional texttype identifies the type of text and may be one
          of ONELINE to select the one line help text, HELP to select the
          full help text, or ALL or an asterisk ``*'' to select both types
          of help text.  If texttype is not specified, then the default is
          ONELINE.

          The optional textcontent further restricts the selected text
          records to those containing the specified content.  Characters
          such as double quotes may be escaped by preceding them with a
          backslash ``\''.

          If a designated help text record is not in inlog the rule has no
          effect.

          The textspec is zero or more of the following clauses:

              DELETE

                  The selected text is completely removed from outlog.

              INDOM -> newdomain.newserial

                  Reassociates the text with the specified instance domain.
                  As a special case, newserial could be an asterisk ``*''
                  which means use serial from the text rewriting rule,
                  although this is most useful when serial is also an
                  asterisk.  So for example:
                      text indom 29.* all { indom -> 109.* }
                  will reassociate all text associated with instance
                  domains from domain 29 to domain 109.

              METRIC -> newdomain.newcluster.newitem

                  Reassociates the text with the specified metric.  As
                  special cases, newcluster could be an asterisk ``*''
                  which means use cluster from the text rewriting rule
                  and/or item could be an asterisk which means use item
                  from the text rewriting rule.  This is most useful when
                  cluster and/or item is also an asterisk.  So for example:
                      text metric 30.*.* all { metric -> 123.*.* }
                  will reassociate all text associated with metrics from
                  domain 30 to domain 123.

              TEXT -> "new-text"

                  Replaces the content of the selected text with new-text.

          A label rewriting rule modifies a label record and has the form:

          LABEL labelid [ instance ] [ "label-name[1m"[24m [22m] [ "label-value[1m"[24m [22m] {
          labelspec ...  }

          where labelid refers to the global context or identifies the
          metric domain, metric cluster, metric item, instance domain, or
          instance domain instances with which the label is currently
          associated, and is either CONTEXT or DOMAIN domainid or CLUSTER
          domainid.clusterid or ITEM metricid or INDOM domain.serial or
          INSTANCES domain.serial.

          metricid has the same form and meaning as for a METRIC rewriting
          rule (see above).  clusterid may be an asterisk ``*'' which means
          the rule applies to every metric with a domain number of domainid
          in the same way as an asterisk may be used for the cluster within
          metricid.

          domain.serial has the same form and meaning as for an INDOM
          rewriting rule (see above).

          In the case of an INSTANCES labelid, the name or number of a
          specific instance may be optionally specified as instance.  This
          name or number number may be omitted or specified as an asterisk
          ``*'' to indicate that labels for all instances of the specified
          instance domain are selected.  If an instance name is specified,
          it must be within double quotes.  If the instance name contains
          any embedded spaces then special care needs to be taken in
          respect of the PCP instance naming rule that treats the leading
          non-space part of the instance name as the unique portion of the
          name for the purposes of matching and ensuring uniqueness within
          an instance domain, refer to pmdaInstance(3) for a discussion of
          this issue.

          In all cases, a "label-name[1m"[24m [22mand/or a "label-value[1m"[24m [22mmay be
          optionally specified in double quotes in order to select labels
          with the given name and/or given value.  These may individually
          be omitted or specified as asterisks ``*'' to indicate that
          labels with all names and/or values are selected.

          If a designated label record is not in inlog the rule has no
          effect.

          The labelspec is zero or more of the following clauses:

              DELETE

                  The selected labels are completely removed from outlog.

              NEW "new-label-name" "new-label-value"

                  A new label with the name "new-label-name[1m"[24m [22mand the value
                  "new-label-value[1m"[24m [22mis created and associated with the
                  specified labelid and optional instance (in the case of a
                  INSTANCES labelid).  If "label-name[1m"[24m [22mor "label-value"
                  were specified, then they are ignored with a warning.  If
                  instance is not specified for an INSTANCES labelid, then
                  a new label will be created for each instance in the
                  specified instance domain.

              LABEL -> "new-label-name"

                  The name of the selected label(s) is changed to "new-
                  label-name[1m"[24m[22m.

              VALUE -> "new-label-value"

                  The value of the selected label(s) is changed to "new-
                  label-value[1m"[24m[22m.

              DOMAIN -> newdomain

                  Reassociates the selected label(s) with the specified
                  metric domain.  For example:
                      label domain 30 { domain -> 123 }
                  will reassociate all labels associated with domains from
                  domain 30 to domain 123.

              CLUSTER -> newdomain.newcluster

                  Reassociates the selected label(s) with the specified
                  metric cluster.  As a special case, newcluster could be
                  an asterisk ``*'' which means use cluster from the label
                  rewriting rule.  This is most useful when cluster is also
                  an asterisk.  So for example:
                      label cluster 30.* { cluster -> 123.* }
                  will reassociate all labels associated with clusters from
                  domain 30 to domain 123.

              ITEM -> newdomain.newcluster.newitem

                  Reassociates the selected label(s) with the specified
                  metric item.  As special cases, newcluster could be an
                  asterisk ``*'' which means use cluster from the label
                  rewriting rule and/or item could be an asterisk which
                  means use item from the label rewriting rule.  This is
                  most useful when cluster and/or item is also an asterisk.
                  So for example:
                      label item 30.*.* { item -> 123.*.* }
                  will reassociate all labels associated with metrics from
                  domain 30 to domain 123.

              INDOM -> newdomain.newserial

                  Reassociates the selected label(s) with the specified
                  instance domain.  As a special case, newserial could be
                  an asterisk ``*'' which means use serial from the label
                  rewriting rule, although this is most useful when serial
                  is also an asterisk.  So for example:
                      label indom 29.* { indom -> 109.* }
                  will reassociate all labels associated with instance
                  domains from domain 29 to domain 109.

              INSTANCES -> newdomain.newserial

                  This is the same as INDOM except that it reassociates the
                  selected label(s) with the instances of the specified
                  instance domain.


---------------------------------------------------------

::

          To promote the values of the per-disk IOPS metrics to 64-bit to
          allow aggregation over a long time period for capacity planning,
          or because the PMDA has changed to export 64-bit counters and we
          want to convert old archives so they can be processed alongside
          new archives.
              metric disk.dev.read { type -> U64 }
              metric disk.dev.write { type -> U64 }
              metric disk.dev.total { type -> U64 }

          The instances associated with the load average metric
          kernel.all.load could be renamed and renumbered by the rules
          below.
              # for the Linux PMDA, the kernel.all.load metric is defined
              # over instance domain 60.2
              indom 60.2 {
                  inst 1 -> 60 iname "1 minute" -> "60 second"
                  inst 5 -> 300 iname "5 minute" -> "300 second"
                  inst 15 -> 900 iname "15 minute" -> "900 second"
              }

          If we decide to split the ``proc'' metrics out of the Linux PMDA,
          this will involve changing the domain number for the PMID of
          these metrics and the associated instance domains.  The rules
          below would rewrite an old archive to match the changes after the
          PMDA split.
              # all Linux proc metrics are in 7 clusters
              metric 60.8.* { pmid -> 123.*.* }
              metric 60.9.* { pmid -> 123.*.* }
              metric 60.13.* { pmid -> 123.*.* }
              metric 60.24.* { pmid -> 123.*.* }
              metric 60.31.* { pmid -> 123.*.* }
              metric 60.32.* { pmid -> 123.*.* }
              metric 60.51.* { pmid -> 123.*.* }
              # only one instance domain for Linux proc metrics
              indom 60.9 { indom -> 123.0 }

          If the metric foo.count_em was exported as a native ``long'' then
          it could be a 32-bit integer on some platforms and a 64-bit
          integer on other platforms.  Subsequent investigations show the
          value is in fact unsigned, so the following rules could be used.
              metric foo.count_em {
                   type if 32 -> U32
                   type if 64 -> U64
              }


---------------------------------------------------------------

::

          All error conditions detected by pmlogrewrite are reported on
          stderr with textual (if sometimes terse) explanation.

          Should the input archive log be corrupted (this can happen if the
          pmlogger instance writing the log suddenly dies), then
          pmlogrewrite will detect and report the position of the
          corruption in the file, and any subsequent information from that
          archive log will not be processed.

          If the input archive contains no archive records then an ``empty
          archive'' warning is issued and no processing is performed.

          If any error is detected, pmlogrewrite will exit with a non-zero
          status.


---------------------------------------------------

::

          For each of the inlog and outlog archive logs, several physical
          files are used.

          archive.meta
               metadata (metric descriptions, instance domains, etc.) for
               the archive log

          archive.0
               initial volume of metrics values (subsequent volumes have
               suffixes 1, 2, ...).

          archive.index
               temporal index to support rapid random access to the other
               files in the archive log.


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).

          For environment variables affecting PCP tools, see
          pmGetOptions(3).


---------------------------------------------------------

::

          PCPIntro(1), pmdumplog(1), pmlogger(1), pmlogextract(1),
          pmloglabel(1), pmlogreduce(1), pmdaInstance(3), pmLookupDesc(3),
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

   Performance Co-Pilot                                     PMLOGREWRITE(1)

--------------

Pages that refer to this page:
`pmdaperfevent(1) <../man1/pmdaperfevent.1.html>`__, 
`pmlogcheck(1) <../man1/pmlogcheck.1.html>`__, 
`pmlogextract(1) <../man1/pmlogextract.1.html>`__, 
`pmlogger_check(1) <../man1/pmlogger_check.1.html>`__, 
`pmlogger_rewrite(1) <../man1/pmlogger_rewrite.1.html>`__, 
`pmloglabel(1) <../man1/pmloglabel.1.html>`__, 
`pmdainit(3) <../man3/pmdainit.3.html>`__, 
`LOGARCHIVE(5) <../man5/LOGARCHIVE.5.html>`__

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
