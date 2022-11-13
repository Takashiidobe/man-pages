.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

QmcContext(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C++ SYNOPSIS <#C++_SYNOPSIS>`__  |                                   |
| \| `DESCRIPTION <#DESCRIPTION>`__ |                                   |
| \|                                |                                   |
| `CONSTRUCTORS <#CONSTRUCTORS>`__  |                                   |
| \|                                |                                   |
| `DESCRIPT                         |                                   |
| OR LOOKUP <#DESCRIPTOR_LOOKUP>`__ |                                   |
| \| `DIAGNOSTICS <#DIAGNOSTICS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   QMCCONTEXT(3)           Library Functions Manual           QMCCONTEXT(3)

NAME
-------------------------------------------------

::

          QmcContext - container for a PMAPI context and its metrics


-----------------------------------------------------------------

::

          #include <QmcContext.h>

          CC ... -lqmc -lpcp


---------------------------------------------------------------

::

          A QmcContext object is a container for a single PMAPI(3) context.
          The object maintains a list of all the metric descriptors
          (QmcDesc), instance domains (QmcIndom) and metrics (QmcMetric)
          using the context to minimize the duplication of these objects.


-----------------------------------------------------------------

::

          A QmcContext object should be constructed through the
          QmcGroup::use interface.


---------------------------------------------------------------------------

::

          The metric and instance domain descriptors are cached by the
          QmcContext object to reduce duplicate QmcDesc(3) and QmcIndom(3)
          objects and PMAPI(3) calls required to create them.  Also the
          mapping from metrics names to pmIDs is also maintained to avoid
          pmLookupName(3) calls.

          int lookupDesc(const char *name, pmID& id);
              Search for the metric name in the name list and set id to the
              known pmID.  If not found, use pmLookupName(3) to get the
              mapping.  If this call fails, the PMAPI(3) error code will be
              returned.

          int lookupDesc(const char *name, uint_t& desc, uint_t& indom);
              Find the index desc and indom to the QmcDesc object and the
              QmcIndom object for the metric name.  The indexes can then be
              used with QmcContext::desc and QmcContext::indom to obtain
              references to the real objects.  The methods will return a
              PMAPI(3) error code if the metric descriptor or instance
              domain could not be obtained.

          int lookupDesc(pmID pmid, uint_t& desc, uint_t& indom);
              Find the index desc and indom to the QmcDesc object and the
              QmcIndom object for the metric pmid.  The indexes can then be
              used with QmcContext::desc and QmcContext::indom to obtain
              references to the real objects.  The methods will return a
              PMAPI(3) error code if the metric descriptor or instance
              domain could not be obtained.


---------------------------------------------------------------

::

          Error messages are generated using pmprintf(3) but are not
          flushed. It is the responsibility of the user to call pmflush(3)
          to output any messages.

          Additional diagnostics may be activated by adding the options pmc
          and/or optfetch to the global debugging specification, as
          described in pmSetDebug(3).


---------------------------------------------------------

::

          PMAPI(3), QMC(3), QmcDesc(3), QmcGroup(3), QmcIndom(3),
          QmcMetric(3), pmflush(3), pmLookupName(3) and pmprintf(3).

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

   Performance Co-Pilot               SGI                     QMCCONTEXT(3)

--------------

Pages that refer to this page: `QMC(3) <../man3/QMC.3.html>`__, 
`QmcGroup(3) <../man3/QmcGroup.3.html>`__, 
`QmcIndom(3) <../man3/QmcIndom.3.html>`__, 
`QmcSource(3) <../man3/QmcSource.3.html>`__

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
