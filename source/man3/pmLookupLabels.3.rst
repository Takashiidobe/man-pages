.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmlookuplabels(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `PYTH                             |                                   |
| ON SYNOPSIS <#PYTHON_SYNOPSIS>`__ |                                   |
| \| `DESCRIPTION <#DESCRIPTION>`__ |                                   |
| \|                                |                                   |
| `LABEL SYNTAX <#LABEL_SYNTAX>`__  |                                   |
| \| `PRECEDENCE <#PRECEDENCE>`__   |                                   |
| \|                                |                                   |
| `DATA                             |                                   |
|  STRUCTURES <#DATA_STRUCTURES>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `PY                               |                                   |
| THON EXAMPLE <#PYTHON_EXAMPLE>`__ |                                   |
| \| `DIAGNOSTICS <#DIAGNOSTICS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMLOOKUPLABELS(3)       Library Functions Manual       PMLOOKUPLABELS(3)

NAME
-------------------------------------------------

::

          pmLookupLabels, pmGetInstancesLabels, pmGetItemLabels,
          pmGetClusterLabels, pmGetInDomLabels, pmGetDomainLabels,
          pmGetContextLabels - retrieve labels associated with performance
          metric values


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmLookupLabels(pmID pmid, pmLabelSet **labelsets);

          int pmGetInstancesLabels(pmInDom indom, pmLabelSet **labelsets);
          int pmGetItemLabels(pmID pmid, pmLabelSet **labelsets);
          int pmGetClusterLabels(pmID pmid, pmLabelSet **labelsets);
          int pmGetInDomLabels(pmInDom indom, pmLabelSet **labelsets);
          int pmGetDomainLabels(int domain, pmLabelSet **labelsets);
          int pmGetContextLabels(pmLabelSet **labelsets);

          cc ... -lpcp


-----------------------------------------------------------------------

::

          from pcp import pmapi

          labelsets = pmapi.pmContext().pmLookupLabels(pmid)

          labelsets = pmapi.pmContext().pmGetInstancesLabels(indom)
          labelsets = pmapi.pmContext().pmGetItemLabels(pmid)
          labelsets = pmapi.pmContext().pmGetClusterLabels(pmid)
          labelsets = pmapi.pmContext().pmGetInDomLabels(indom)
          labelsets = pmapi.pmContext().pmGetDomainLabels(domain)
          labelsets = pmapi.pmContext().pmGetContextLabels()


---------------------------------------------------------------

::

          Labels are name:value pairs associated with performance metric
          values for the purpose of attaching additional metric metadata to
          values.  This metadata is less structured and exists separately
          to the metric descriptor available for every PCP metric from
          pmLookupDesc(3).

          Much like the metric descriptor metadata, labels are an integral
          part of the identity of each metric, and should rarely, if ever,
          change.

          The pmLookupLabels routine is a convenience interface providing
          retrieval for all labels associated with a single performance
          metric identifier, pmid, except labels at the instances level.
          Labels at the instances level must be retrieved separately with a
          call to pmGetInstancesLabels because different metric instances
          may have labels with the same label name.  The pmLookupLabels
          function performs no caching of labels internally.

          For efficiency in communication and storage within the various
          components of the PMCS (Performance Metrics Collection System),
          labels are maintained using a hierarchy.  The set of labels
          associated with any individual metric value consists of the union
          of labels from each of these sets of labels:

          1. Global labels (apply to all metric values from a host or
          archive context)

          pmGetContextLabels
                  provides the labelset associated with all metric values
                  from a given source (PMAPI context).

          2. Domain labels (apply to every metric within a PMDA)

          pmGetDomainLabels
                  provides the labelset associated with the domain
                  identifier.

          3. Instance Domain labels (apply to all metrics sharing that
          indom)

          pmGetInDomLabels
                  provides the labelset associated with the instance domain
                  identifier indom.

          4. Cluster labels (apply to a group of metrics within one domain)

          pmGetClusterLabels
                  provides the labelset associated with the metric cluster
                  (domain,cluster) identified by pmid.

          5. Item labels (apply to an individual performance metric)

          pmGetItemLabels
                  provides the labelset associated with the metric item
                  (domain,cluster,item) identified by pmid.

          6. Instance labels (apply to individual instances of a metric)

          pmGetInstancesLabels
                  provides the set of instance identifiers and labels in
                  labelsets for each instance associated with the instance
                  domain identifier indom.  The return value indicates the
                  number of elements in the result - one labelset for each
                  instance.

          These independent labelsets can be merged using
          pmMergeLabelSets(3) to form the complete set of all labels
          associated with a given value.  Note that the label sets returned
          by pmGetInstancesLabels can be traversed but should not be merged
          because the label names are unlikely to be unique for different
          instances of the given indom.


-----------------------------------------------------------------

::

          Labels are stored and communicated within PCP using JSONB format.
          This format is a restricted form of JSON suitable for indexing
          and other operations.  In JSONB form, insignificant whitespace is
          discarded, and the order of label names is not preserved.  Within
          the PMCS a lexicographically sorted key space is always
          maintained, however.  Duplicate label names are not permitted.
          The label with highest precedence is the only one presented.  If
          duplicate names are presented at the same hierarchy level, only
          one will be preserved (exactly which one wins is arbitrary, so do
          not rely on this).

          All name:value pair(s) present will be converted to JSONB form
          and merged with the existing set of labels for the requested
          entity (context, domain, indom, metric or instance).

          The label names are further constrained to the same set of rules
          defined for PMNS subtree names.

          Each component in a label name must begin with an alphabetic
          character, and be followed by zero or more characters drawn from
          the alphabetics, the digits and the underscore (``_'') character.
          For alphabetic characters in a name, upper and lower case are
          distinguished.

          The value of a label offers significantly more freedom, and may
          be any valid value as defined by the JSON (http://json.org )
          specification.  Redundant whitespace is always removed within the
          PMCS.


-------------------------------------------------------------

::

          The complete set of labels associated with any metric value is
          built from several sources and duplicate label names may exist at
          any point in the source hierarchy.  However, when evaluating the
          label set (merging labels from the different sources) the JSONB
          concept of only presenting unique labels is used.  It is
          therefore important to define precedence rules in order that a
          deterministic set of uniquely named labels can be defined.

          As a rule of thumb, the labels closest to PMNS leaf nodes and
          metric values take precedence:

          1. Global context labels
              (as reported by the pmcd.labels metric) are the lowest
              precedence.

          2. Domain labels
              (for all metrics and instances from a PMDA) are the next
              highest precedence.

          3. Instance Domain labels
              associated with an InDom are the next highest precedence.

          4. Metric cluster labels
              associated with a PMID cluster are the next highest
              precedence.

          5. Metric item labels
              associated with an individual PMID are the next highest
              precedence.

          6. Instance labels
              associated with a metric instance identifier have highest
              precedence.


-----------------------------------------------------------------------

::

          The primary output from pmLookupLabels is returned in the
          argument labelset as an array, using the following component data
          structures;

               struct {
                   uint     name : 16;      /* label name offset in JSONB string */
                   uint     namelen : 8;    /* length of name excluding the null */
                   uint     flags : 8;      /* information about this label */
                   uint     value : 16;     /* offset of the label value */
                   uint     valuelen : 16;  /* length of value in bytes */
               } pmLabel;

               struct {
                   uint     inst;           /* PM_IN_NULL or the instance ID */
                   int      nlabels;        /* count of labels or error code */
                   char     *json;          /* JSON formatted labels string */
                   uint     jsonlen : 16;   /* JSON string length byte count */
                   uint     padding : 16;   /* zero, reserved for future use */
                   pmLabel  *labels;        /* indexing into the JSON string */
               } pmLabelSet;

          The pmLabel provides information about an individual label.  This
          includes the offsets to the start of its name and value in the
          json string of a pmLabelSet, their respective lengths, and also
          any informative flags associated with the label (describing where
          it lies in the hierarchy of labels, and whether it is an
          intrinsic or extrinsic label).

          Building on this, the pmLabelSet provides information about the
          set of labels associated with an entity (context, domain, indom,
          metric cluster, item or instance).  The entity will be from any
          one level of the label hierarchy.  If at the lowest hierarchy
          level (which happens to be highest precedence -
          PM_LABEL_INSTANCES) then the inst field will contain an actual
          instance identifier instead of PM_IN_NULL.

          The nlabels field describes the number of labels (name:value
          pairs) that can be found in both the accompanying json string
          (which is JSONB format - no unnecessary whitespace and with no
          duplicate label names) and the accompanying labels array (which
          has nlabels elements).


---------------------------------------------------------

::

          Consider a deployment with global labels (assume $PCP_SYSCONF_DIR
          is set to its usual location of /etc/pcp) as follows:

          $ cat /etc/pcp/labels/*
          {
            "tier": "production",
            "datacenter": "hkg",
            "services": ["indexer","database"]
          }

          Use pminfo to form the merged labelsets for several pmdasample(1)
          metrics as follows:

          $ pminfo -m -f --labels sample.rapid sample.colour sample.mirage

          sample.rapid PMID: 30.0.64
               value 800000000
               labels {"agent":"sample","datacenter":"sydney","hostname":"acme.com","measure":"speed","role":"testing","services":["indexer","database"],"tier":"production","units":"metres per second","unitsystem":"SI"}

          sample.colour PMID: 30.0.5
               inst [0 or "red"] value 101
               inst [1 or "green"] value 202
               inst [2 or "blue"] value 303
               inst [0 or "red"] labels {"agent":"sample","datacenter":"syd","hostname":"acme.com","model":"RGB","role":"testing","services":["indexer","database"],"tier":"production"}
               inst [1 or "green"] labels {"agent":"sample","datacenter":"syd","hostname":"acme.com","model":"RGB","role":"testing","services":["indexer","database"],"tier":"production"}
               inst [2 or "blue"] labels {"agent":"sample","datacenter":"syd","hostname":"acme.com","model":"RGB","role":"testing","services":["indexer","database"],"tier":"production"}

          sample.mirage PMID: 29.0.37
               inst [0 or "m-00"] value 99
               inst [0 or "m-00"] labels {"agent":"sample","datacenter":"sydney","hostname":"acme.com","role":"testing","services":["indexer","database"],"tier":"production","transient":false}

          Here, pminfo has merged the separate sets of labels returned from
          pmGetContextLabels (names: datacenter, hostname, services, tier),
          pmGetDomainLabels (names: role, agent), pmGetInDomLabels (names:
          model), pmGetItemLabels (names: units, unitsystem) and
          pmGetInstancesLabels (names: transient) to form the complete set
          for each of the metrics.


---------------------------------------------------------------------

::

          #!/usr/bin/env pmpython

          import sys
          from pcp import pmapi
          import cpmapi as c_api

          ctx = pmapi.pmContext(c_api.PM_CONTEXT_HOST, "local:")

          for metric in sys.argv[1:]:
              pmid = ctx.pmLookupName(metric)[0]
              desc = ctx.pmLookupDescs(pmid)[0]

              print("== label sets for %s ==" % metric)
              labelSetList = ctx.pmLookupLabels(pmid)
              # class pmLabelSet has a __str__ handler
              for labelSet in labelSetList:
                  print("%s" % labelSet)
              ctx.pmFreeLabelSets(labelSetList)

              if desc.contents.indom != c_api.PM_INDOM_NULL:
                  print("== instances label sets for %s ==" % metric)
                  labelSetList = ctx.pmGetInstancesLabels(desc.contents.indom)
                  for labelSet in labelSetList:
                      print("%s" % labelSet)
                  ctx.pmFreeLabelSets(labelSetList)


---------------------------------------------------------------

::

          On success these interfaces all return the number of elements in
          the labelsets array.  associated with performance metrics.  The
          memory associated with labelsets should be released using
          pmFreeLabelSets(3) when no longer needed.

          Only in the case of pmLookupLabels will the resulting labelset be
          a merged set of labels from all hierarchy levels (except at the
          instances level, as described above).

          For the other routines, except for pmGetInstancesLabels, if no
          labels exist at all for the requested hierarchy level the return
          code will be zero and no space will have been allocated.

          In the case of pmGetInstancesLabels, which can return multiple
          elements in its labelsets result (one set of labels for each
          instance), the nlabels field may be either zero indicating no
          labels for that instance, or a positive count of labels, or a
          negative PMAPI error code.

          Note that it is mandatory for a call to pmGetInstancesLabels to
          be preceded by a call to pmGetInDom(3) to ensure the instances
          have been resolved within the PMDA.

          If no result can be obtained, e.g. due to IPC failure using the
          current PMAPI context then pmGetInstancesLabels will return a
          negative error code which may be examined using

          A successful return from the Python API always provides the
          labelset in the form of a list, for all labels functions.  On
          error a pmErr exception is raised containing the error code and
          diagnostic.  pmErrStr(3).


---------------------------------------------------------

::

          pmcd(1), PMAPI(3), pmFetch(3), pmGetInDom(3), pmLookupDesc(3),
          pmLookupName(3), pmFreeLabelSets(3), pmMergeLabelSets(3),
          pmNewContext(3) and labels.conf(5).

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

   Performance Co-Pilot               PCP                 PMLOOKUPLABELS(3)

--------------

Pages that refer to this page:
`pmdaopenmetrics(1) <../man1/pmdaopenmetrics.1.html>`__, 
`pmdumplog(1) <../man1/pmdumplog.1.html>`__, 
`pminfo(1) <../man1/pminfo.1.html>`__, 
`pmseries(1) <../man1/pmseries.1.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`pmdalabel(3) <../man3/pmdalabel.3.html>`__, 
`pmfetch(3) <../man3/pmfetch.3.html>`__, 
`pmfreelabelsets(3) <../man3/pmfreelabelsets.3.html>`__, 
`pmlookupindomtext(3) <../man3/pmlookupindomtext.3.html>`__, 
`pmlookuptext(3) <../man3/pmlookuptext.3.html>`__, 
`pmmergelabels(3) <../man3/pmmergelabels.3.html>`__, 
`pmprintlabelsets(3) <../man3/pmprintlabelsets.3.html>`__, 
`pmwebapi(3) <../man3/pmwebapi.3.html>`__, 
`labels.conf(5) <../man5/labels.conf.5.html>`__, 
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
