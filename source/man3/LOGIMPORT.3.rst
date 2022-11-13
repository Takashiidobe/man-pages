.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

logimport(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `                                 |                                   |
| Perl SYNOPSIS <#Perl_SYNOPSIS>`__ |                                   |
| \|                                |                                   |
| `Pyth                             |                                   |
| on SYNOPSIS <#Python_SYNOPSIS>`__ |                                   |
| \| `DESCRIPTION <#DESCRIPTION>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LOGIMPORT(3)            Library Functions Manual            LOGIMPORT(3)

NAME
-------------------------------------------------

::

          LOGIMPORT - introduction to the library for importing data and
          creating a PCP archive


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/import.h>

          cc ... -lpcp_import -lpcp


-------------------------------------------------------------------

::

          use PCP::LogImport;


-----------------------------------------------------------------------

::

          from pcp import pmi


---------------------------------------------------------------

::

          The Performance Co-Pilot Log Import (LOGIMPORT) API is a library
          (with Perl and Python wrappers) that supports the creation of PCP
          archives from external sources of performance data, either in the
          form of historical logs and spreadsheets or from real-time
          sources that are not integrated as a Performance Metrics Domain
          Agent (PMDA) under the control of pmcd(1).

          The typical usage for LOGIMPORT would involve:

          •  An initial call to pmiStart(3).

          •  Optional calls to pmiSetHostname(3) and/or pmiSetTimezone(3)
             to set the hostname and timezone for the source of the
             performance data.

          •  One or more calls to pmiAddMetric(3) to define performance
             metrics.

          •  One or more calls to pmiAddInstance(3) to define instances
             associated with the metrics.

          •  Optional calls to pmiGetHandle(3) to defined convenience
             handles for metric-instance pairs.

          •  A main loop in which performance data is injested and for each
             sample time interval, the PCP archive record is constructed by
             calls to pmiPutValue(3), pmiPutValueHandle(3), pmiPutText(3),
             and/or pmiPutLabel(3), followed by a call to pmiWrite(3) to
             flush all data and any associated new metadata to the PCP
             archive.  Alternatively, pmiPutResult(3) could be used to
             package and process all the data for one sample time interval.

          •  Once the input source of data has been consumed, calling
             pmiEnd(3) to complete the PCP archive creation and close all
             open files.

          If new metrics and/or instances are discovered during the data
          injestion, these can be added by subsequent calls to
          pmiAddMetric(3) and/or pmiAddInstance(3), provided all the
          metrics and instances have been defined before a call to
          pmiGetHandle(3), pmiPutValue(3)or pmiPutResult(3) that references
          those metrics and instances.


---------------------------------------------------------

::

          pmcd(1), pmlogger(1), pmiGetHandle(3), pmiAddInstance(3),
          pmiAddMetric(3), pmiEnd(3), pmiErrStr(3), pmiPutMark(3),
          pmiPutResult(3), pmiPutValue(3), pmiPutValueHandle(3),
          pmiPutText(3), pmiPutLabel(3), pmiSetHostname(3),
          pmiSetTimezone(3), pmiStart(3) and pmiWrite(3).

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

   Performance Co-Pilot                                        LOGIMPORT(3)

--------------

Pages that refer to this page:
`collectl2pcp(1) <../man1/collectl2pcp.1.html>`__, 
`ganglia2pcp(1) <../man1/ganglia2pcp.1.html>`__, 
`iostat2pcp(1) <../man1/iostat2pcp.1.html>`__, 
`mrtg2pcp(1) <../man1/mrtg2pcp.1.html>`__, 
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pmlogpaste(1) <../man1/pmlogpaste.1.html>`__, 
`sar2pcp(1) <../man1/sar2pcp.1.html>`__, 
`sheet2pcp(1) <../man1/sheet2pcp.1.html>`__, 
`pmdiscoversetup(3) <../man3/pmdiscoversetup.3.html>`__, 
`pmiaddinstance(3) <../man3/pmiaddinstance.3.html>`__, 
`pmiaddmetric(3) <../man3/pmiaddmetric.3.html>`__, 
`pmiend(3) <../man3/pmiend.3.html>`__, 
`pmierrstr(3) <../man3/pmierrstr.3.html>`__, 
`pmigethandle(3) <../man3/pmigethandle.3.html>`__, 
`pmiputlabel(3) <../man3/pmiputlabel.3.html>`__, 
`pmiputmark(3) <../man3/pmiputmark.3.html>`__, 
`pmiputresult(3) <../man3/pmiputresult.3.html>`__, 
`pmiputtext(3) <../man3/pmiputtext.3.html>`__, 
`pmiputvalue(3) <../man3/pmiputvalue.3.html>`__, 
`pmiputvaluehandle(3) <../man3/pmiputvaluehandle.3.html>`__, 
`pmisethostname(3) <../man3/pmisethostname.3.html>`__, 
`pmisettimezone(3) <../man3/pmisettimezone.3.html>`__, 
`pmistart(3) <../man3/pmistart.3.html>`__, 
`pmiunits(3) <../man3/pmiunits.3.html>`__, 
`pmiusecontext(3) <../man3/pmiusecontext.3.html>`__, 
`pmiwrite(3) <../man3/pmiwrite.3.html>`__, 
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
