.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmistart(3) — Linux manual page
===============================

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

   PMISTART(3)             Library Functions Manual             PMISTART(3)

NAME
-------------------------------------------------

::

          pmiStart - establish a new LOGIMPORT context


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/import.h>

          int pmiStart(const char *archive, int inherit);

          cc ... -lpcp_import -lpcp


-------------------------------------------------------------------

::

          use PCP::LogImport;

          pmiStart($archive, $inherit);


---------------------------------------------------------------

::

          As part of the Performance Co-Pilot Log Import API (see
          LOGIMPORT(3)), pmiStart creates a new context.  Each context
          maintains the following state and metadata:

          •  The base name (archive) for the physical  files that
             constitute the output PCP archive.

          •  The source hostname for the data that will be written to the
             PCP archive.  Defaults to the hostname of the localhost, but
             can be set using pmiSetHostname(3).

          •  The source timezone for the PCP archive.  Defaults to the
             timezone of the localhost, but can be set using
             pmiSetTimezone(3).

          •  Metrics and instance domains, as defined by pmiAddMetric(3).

          •  Instances for each instance domain, as defined by
             pmiAddInstance(3).

          •  Handles as defined by pmiGetHandle(3).  Each handle is a
             metric-instance pair, and each metric-instance pair may have
             an associated value in each record written to the output PCP
             archive.

          •  An optional set of data values for one or more metric-instance
             pairs (ready for the next record to be written to the output
             PCP archive) as defined by calls to pmPutValue(3) or
             pmPutValuehandle(3).

          If inherit is true, then the new context will inherit any and all
          metadata (metrics, instance domains, instances and handles) from
          the current context, otherwise the new context is created with no
          metadata.  The basename for the output PCP archive, the source
          hostname, the source timezone and any data values from the
          current context are not inherited.  If this is the first call to
          pmiStart the metadata will be empty independent of the value of
          inherit.

          Since no physical files for the output PCP archive will be
          created until the first call to pmiWrite(3) or pmiPutRecord(3),
          archive could be NULL to create a convenience context that is
          populated with metadata to be inherited by subsequent contexts.

          The return value is a context identifier that could be used in a
          subsequent call to pmUseContext(3) and the new context becomes
          the current context which persists for all subsequent calls up to
          either another pmiStart call or a call to pmiUseContext(3) or a
          call to pmiEnd(3).


---------------------------------------------------------------

::

          It is an error if the physical files archive.0 and/or
          archive.index and/or archive.meta already exist, but this is not
          discovered until the first attempt is made to output some data by
          calling pmiWrite(3) or pmiPutRecord(3), so pmiStart always
          returns a positive context identifier.


---------------------------------------------------------

::

          LOGIMPORT(3), pmiAddInstance(3), pmiAddMetric(3), pmiEnd(3),
          pmiErrStr(3), pmiGetHandle(3), pmiPutResult(3), pmiPutValue(3),
          pmiPutValueHandle(3), pmiPutText(3), pmiPutLabel(3),
          pmiSetHostname(3), pmiSetTimezone(3), pmiUseContext(3) and
          pmiWrite(3).

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

   Performance Co-Pilot                                         PMISTART(3)

--------------

Pages that refer to this page:
`logimport(3) <../man3/logimport.3.html>`__, 
`pmiend(3) <../man3/pmiend.3.html>`__, 
`pmisethostname(3) <../man3/pmisethostname.3.html>`__, 
`pmisettimezone(3) <../man3/pmisettimezone.3.html>`__, 
`pmiusecontext(3) <../man3/pmiusecontext.3.html>`__

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
