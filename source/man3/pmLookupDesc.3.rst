.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmlookupdesc(3) — Linux manual page
===================================

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

   PMLOOKUPDESC(3)         Library Functions Manual         PMLOOKUPDESC(3)

NAME
-------------------------------------------------

::

          pmLookupDesc - obtain a description for a performance metric


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmLookupDesc(pmID pmid, pmDesc *desc);

          cc ... -lpcp


---------------------------------------------------------------

::

          Given a Performance Metrics Identifier (PMID) as pmid, fill in
          the given pmDesc structure, pointed to by the parameter desc,
          from the current Performance Metrics Application Programming
          Interface (PMAPI) context.

          The pmDesc structure provides all of the information required to
          describe and manipulate a performance metric via the PMAPI, and
          has the following declaration.

               /* Performance Metric Descriptor */
               typedef struct {
                   pmID    pmid;   /* unique identifier */
                   int     type;   /* base data type (see below) */
                   pmInDom indom;  /* instance domain */
                   int     sem;    /* semantics of value (see below) *
                   pmUnits units;  /* dimension and units (see below) */
               } pmDesc;

               /* pmDesc.type -- data type of metric values */
               #define PM_TYPE_NOSUPPORT        -1    /* not impl. in this version */
               #define PM_TYPE_32               0    /* 32-bit signed integer */
               #define PM_TYPE_U32              1    /* 32-bit unsigned integer */
               #define PM_TYPE_64               2    /* 64-bit signed integer */
               #define PM_TYPE_U64              3    /* 64-bit unsigned integer */
               #define PM_TYPE_FLOAT            4    /* 32-bit floating point */
               #define PM_TYPE_DOUBLE           5    /* 64-bit floating point */
               #define PM_TYPE_STRING           6    /* array of char */
               #define PM_TYPE_AGGREGATE        7    /* arbitrary binary data */
               #define PM_TYPE_AGGREGATE_STATIC 8    /* static pointer to aggregate */
               #define PM_TYPE_EVENT            9    /* packed pmEventArray */
               #define PM_TYPE_UNKNOWN          255  /* used in pmValueBlock, not pmDesc */

               /* pmDesc.sem -- semantics/interpretation of metric values */
               #define PM_SEM_COUNTER  1  /* cumulative ctr (monotonic incr) */
               #define PM_SEM_INSTANT  3  /* instant. value continuous domain */
               #define PM_SEM_DISCRETE 4  /* instant. value discrete domain */

          The type field in the pmDesc describes various encodings (or
          formats) for a metric's value.

          If a value is counted in the underlying base instrumentation with
          less than 32 bits of integer precision, it is the responsibility
          of the Performance Metrics Domain Agent (PMDA) to promote the
          value to a 32-bit integer before it is exported into the
          Performance Metrics Collection Subsystem (PMCS); i.e.
          applications above the PMAPI never have to deal with 8-bit and
          16-bit counters.

          If the value of a performance metric is of type
          PM_TYPE_AGGREGATE, PM_TYPE_AGGREGATE_STATIC, PM_TYPE_EVENT or
          PM_TYPE_STRING, the interpretation of the value is unknown to the
          PMCS.  In these cases, the application using the value, and the
          PMDA providing the value must have some common understanding
          about how the value is structured and interpreted.

          Each value for a performance metric is assumed to be drawn from a
          set of values that can be described in terms of their
          dimensionality and scale by a compact encoding as follows.  The
          dimensionality is defined by a power, or index, in each of 3
          orthogonal dimensions, namely Space, Time and Count (or Events,
          which are dimensionless).  For example I/O throughput might be
          represented as
                       -1
             Space.Time
          while the running total of system calls is Count, memory
          allocation is Space and average service time is
                       -1
             Time.Count
          In each dimension there are a number of common scale values that
          may be used to better encode ranges that might otherwise exhaust
          the precision of a 32-bit value.  This information is encoded in
          the pmUnits structure which is embedded in the pmDesc structure.

               /*
                * Encoding for the units (dimensions Time and Space) and scale
                * for Performance Metric Values
                *
                * For example, a pmUnits struct of
                *      { 1, -1, 0, PM_SPACE_MBYTE, PM_TIME_SEC, 0 }
                * represents Mbytes/sec, while
                *      { 0, 1, -1, 0, PM_TIME_HOUR, 6 }
                * represents hours/million-events
                */
               typedef struct {
                   int dimSpace:4;             /* space dimension */
                   int dimTime:4;              /* time dimension */
                   int dimCount:4;             /* event dimension */
                   unsigned int scaleSpace:4;  /* one of PM_SPACE_* below */
                   unsigned int scaleTime:4;   /* one of PM_TIME_* below */
                   int scaleCount:4;           /* one of PM_COUNT_* below */
               } pmUnits;                      /* dimensional units and scale of value */

               /* pmUnits.scaleSpace */
               #define PM_SPACE_BYTE   0       /* bytes */
               #define PM_SPACE_KBYTE  1       /* Kilobytes (1024) */
               #define PM_SPACE_MBYTE  2       /* Megabytes (1024^2) */
               #define PM_SPACE_GBYTE  3       /* Gigabytes (1024^3) */
               #define PM_SPACE_TBYTE  4       /* Terabytes (1024^4) */
               /* pmUnits.scaleTime */
               #define PM_TIME_NSEC    0       /* nanoseconds */
               #define PM_TIME_USEC    1       /* microseconds */
               #define PM_TIME_MSEC    2       /* milliseconds */
               #define PM_TIME_SEC     3       /* seconds */
               #define PM_TIME_MIN     4       /* minutes */
               #define PM_TIME_HOUR    5       /* hours */
               /*
                * pmUnits.scaleCount (e.g. count events, syscalls, interrupts,
                * etc.) these are simply powers of 10, and not enumerated here,
                * e.g. 6 for 10^6, or -3 for 10^-3
                */
               #define PM_COUNT_ONE    0       /* 1 */

          Special routines (e.g. pmExtractValue(3), pmConvScale(3)) are
          provided to manipulate values in conjunction with the pmUnits
          structure that defines the dimension and scale of the values for
          a particular performance metric.

          Below the PMAPI, the information required to complete the pmDesc
          structure, is fetched from the PMDAs, and in this way the format
          and scale of performance metrics may change dynamically, as the
          PMDAs and their underlying instrumentation evolve with time.  In
          particular, when some metrics suddenly become 64-bits long, or
          change their units from Mbytes to Gbytes, well-written
          applications using the services provided by the PMAPI will
          continue to function correctly.


---------------------------------------------------------------

::

          PM_ERR_PMID
                 The requested PMID is not known to the PMCS

          PM_ERR_NOAGENT
                 The PMDA responsible for providing the metric is currently
                 not available


---------------------------------------------------------

::

          PMAPI(3), pmAtomStr(3), pmConvScale(3), pmExtractValue(3),
          pmGetConfig(3), pmTypeStr(3), pmUnitsStr(3), pcp.conf(5) and
          pcp.env(5).

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

   Performance Co-Pilot               PCP                   PMLOOKUPDESC(3)

--------------

Pages that refer to this page:
`pmdaopenmetrics(1) <../man1/pmdaopenmetrics.1.html>`__, 
`pmdumplog(1) <../man1/pmdumplog.1.html>`__, 
`pmgenmap(1) <../man1/pmgenmap.1.html>`__, 
`pmie(1) <../man1/pmie.1.html>`__, 
`pmlogcheck(1) <../man1/pmlogcheck.1.html>`__, 
`pmlogrewrite(1) <../man1/pmlogrewrite.1.html>`__, 
`pmseries(1) <../man1/pmseries.1.html>`__, 
`sheet2pcp(1) <../man1/sheet2pcp.1.html>`__, 
`pmaddprofile(3) <../man3/pmaddprofile.3.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`pmatomstr(3) <../man3/pmatomstr.3.html>`__, 
`pmconvscale(3) <../man3/pmconvscale.3.html>`__, 
`pmda(3) <../man3/pmda.3.html>`__, 
`pmdadesc(3) <../man3/pmdadesc.3.html>`__, 
`pmdainit(3) <../man3/pmdainit.3.html>`__, 
`pmdelprofile(3) <../man3/pmdelprofile.3.html>`__, 
`pmextractvalue(3) <../man3/pmextractvalue.3.html>`__, 
`pmfetch(3) <../man3/pmfetch.3.html>`__, 
`pmgetderivedcontrol(3) <../man3/pmgetderivedcontrol.3.html>`__, 
`pmgetindom(3) <../man3/pmgetindom.3.html>`__, 
`pmgetindomarchive(3) <../man3/pmgetindomarchive.3.html>`__, 
`pmiaddmetric(3) <../man3/pmiaddmetric.3.html>`__, 
`pmidstr(3) <../man3/pmidstr.3.html>`__, 
`pmindomstr(3) <../man3/pmindomstr.3.html>`__, 
`pmiunits(3) <../man3/pmiunits.3.html>`__, 
`pmlookupindom(3) <../man3/pmlookupindom.3.html>`__, 
`pmlookupindomarchive(3) <../man3/pmlookupindomarchive.3.html>`__, 
`pmlookupindomtext(3) <../man3/pmlookupindomtext.3.html>`__, 
`pmlookuplabels(3) <../man3/pmlookuplabels.3.html>`__, 
`pmlookuptext(3) <../man3/pmlookuptext.3.html>`__, 
`pmnameindom(3) <../man3/pmnameindom.3.html>`__, 
`pmnameindomarchive(3) <../man3/pmnameindomarchive.3.html>`__, 
`pmparseunitsstr(3) <../man3/pmparseunitsstr.3.html>`__, 
`pmprintdesc(3) <../man3/pmprintdesc.3.html>`__, 
`pmprintvalue(3) <../man3/pmprintvalue.3.html>`__, 
`pmregisterderived(3) <../man3/pmregisterderived.3.html>`__, 
`pmsemstr(3) <../man3/pmsemstr.3.html>`__, 
`pmsetmode(3) <../man3/pmsetmode.3.html>`__, 
`pmtypestr(3) <../man3/pmtypestr.3.html>`__, 
`pmunitsstr(3) <../man3/pmunitsstr.3.html>`__, 
`pmwebapi(3) <../man3/pmwebapi.3.html>`__, 
`QmcDesc(3) <../man3/QmcDesc.3.html>`__, 
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
