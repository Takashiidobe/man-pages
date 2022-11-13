.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmiaddmetric(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `                                 |                                   |
| Perl SYNOPSIS <#Perl_SYNOPSIS>`__ |                                   |
| \| `DESCRIPTION <#DESCRIPTION>`__ |                                   |
| \| `DIAGNOSTICS <#DIAGNOSTICS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMIADDMETRIC(3)         Library Functions Manual         PMIADDMETRIC(3)

NAME
-------------------------------------------------

::

          pmiAddMetric - add a new metric definition to a LOGIMPORT context


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/import.h>

          int pmiAddMetric(const char *name, pmID pmid, int type,
                  pmInDom indom, int sem, pmUnits units);

          cc ... -lpcp_import -lpcp


-------------------------------------------------------------------

::

          use PCP::LogImport;

          pmiAddMetric($name, $pmid, $type, $indom, $sem, $units);


---------------------------------------------------------------

::

          As part of the Performance Co-Pilot Log Import API (see
          LOGIMPORT(3)), pmiAddMetric is used to define a new metric.  The
          metric's name must follow the naming conventions described in
          PCPIntro(1) and should be unique for each LOGIMPORT context.

          The other arguments are in effect the fields of a pmDesc
          structure.  Refer to pmLookupDesc(3) for a complete description
          of the values and semantics of the components of this structure,
          and hence the valid argument values for pmiAddMetrics.

          The internal identifier for the metric may be given using the
          pmid argument and must be unique for each LOGIMPORT context.  The
          value for pmid which would typically be constructed using the
          pmID_build macro, e.g. pmID_build(PMI_DOMAIN, 0, 3) for the
          fourth metric in first ``cluster'' of metrics in the Performance
          Metrics Domain PMI_DOMAIN (which is the default for all meta data
          created by the LOGIMPORT library).  Alternatively, pmid may be
          PM_IN_NULL and pmiAddMetric will assign a unique pmid (although
          this means the pmid remains opaque and the application must use
          pmiPutValue(3) or pmiPutValueHandle(3) and cannot use
          pmiPutResult(3) to add data values to the PCP archive).

          type defines the data type of the metric and must be one of the
          PM_TYPE_...  values defined in <pcp/import.h>.

          The instance domain for the metric is defined by indom and may be
          PM_INDOM_NULL for a metric with a singular value, else the value
          for indom would normally be constructed using the pmInDom_build
          macro, e.g. pmInDom_build(LOGIMPORT,0) for the first instance
          domain in the Performance Metrics Domain LOGIMPORT (which is the
          default for all meta data created by the LOGIMPORT library).
          Multiple metrics can share the same instance domain if they have
          values for a similar (or more usually, identical) set of
          instances.

          The semantics of the metric (counter, instantaneous value, etc.)
          is specified by the sem argument which would normally be the
          result of a call to the convenience constructor method
          pmiUnits(3).


---------------------------------------------------------------

::

          pmiAddMetric returns zero on success else a negative value that
          can be turned into an error message by calling pmiErrStr(3).


---------------------------------------------------------

::

          PCPIntro(1), LOGIMPORT(3), pmiErrStr(3), pmiPutResult(3),
          pmiPutValue(3), pmiPutValueHandle(3), pmiPutText(3),
          pmiPutLabel(3), pmiUnits(3) and pmLookupDesc(3).

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

   Performance Co-Pilot                                     PMIADDMETRIC(3)

--------------

Pages that refer to this page:
`sheet2pcp(1) <../man1/sheet2pcp.1.html>`__, 
`logimport(3) <../man3/logimport.3.html>`__, 
`pmiaddinstance(3) <../man3/pmiaddinstance.3.html>`__, 
`pmigethandle(3) <../man3/pmigethandle.3.html>`__, 
`pmiputlabel(3) <../man3/pmiputlabel.3.html>`__, 
`pmiputmark(3) <../man3/pmiputmark.3.html>`__, 
`pmiputresult(3) <../man3/pmiputresult.3.html>`__, 
`pmiputtext(3) <../man3/pmiputtext.3.html>`__, 
`pmiputvalue(3) <../man3/pmiputvalue.3.html>`__, 
`pmiputvaluehandle(3) <../man3/pmiputvaluehandle.3.html>`__, 
`pmistart(3) <../man3/pmistart.3.html>`__, 
`pmiunits(3) <../man3/pmiunits.3.html>`__, 
`pmiwrite(3) <../man3/pmiwrite.3.html>`__

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
