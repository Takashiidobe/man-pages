.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmtrimnamespace(3) — Linux manual page
======================================

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

   PMTRIMNAMESPACE(3)      Library Functions Manual      PMTRIMNAMESPACE(3)

NAME
-------------------------------------------------

::

          pmTrimNameSpace - prune a performance metrics name space


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmTrimNameSpace(void);

          cc ... -lpcp


---------------------------------------------------------------

::

          In some (rare) cases it is helpful to prune the Performance
          Metrics Name Space (PMNS) to match the available metrics.

          The default PMNS that is accessible to a Performance Metrics
          Application Programming Interface (PMAPI) client is provided by
          the current PMAPI context:

          •  for a PMAPI context of type PM_CONTEXT_HOST the PMNS is
             provided by pmcd(1) on the associated host and no pruning is
             required

          •  for a PMAPI context of type PM_CONTEXT_ARCHIVE the PMNS is
             stored within the associated Performance Co-Pilot (PCP)
             archive log and no pruning is required

          •  for a PMAPI context of type PM_CONTEXT_LOCAL at the first
             PMAPI call requiring access to the PMNS it is loaded from the
             default local location $PCP_VAR_DIR/pmns/root (or
             $PMNS_DEFAULT) and no pruning is required.

          If the default PMNS is in effect then calling pmTrimNameSpace is
          a no-op and returns zero with no change to the PMNS.

          PMAPI clients also have the option of over-riding the default
          PMNS by loading a local PMNS from a file (see PMNS(5) for the
          format) by calling pmLoadASCIINameSpace(3) or pmLoadNameSpace(3)
          and this is when some PMNS pruning may be useful.

          If a local PMNS is in effect when pmTrimNameSpace is called then
          the first action is to restore the PMNS to the state as of the
          completion of the last pmLoadASCIINameSpace(3) or
          pmLoadNameSpace(3), so that the effects of consecutive calls to
          pmTrimNameSpace are not additive.

          The subsequent actions of pmTrimNameSpace depend on the type of
          the current PMAPI context.

          •  For a context of type PM_CONTEXT_ARCHIVE the local PMNS is
             trimmed to exclude metrics for which no description can be
             found in the PCP archive log.  The PMNS is further trimmed to
             remove empty subtrees that do not contain any performance
             metric.  Since PCP archives usually contain some subset of all
             metrics named in a PMNS, pmTrimNameSpace effectively prunes
             the application's PMNS to contain only the names of the
             metrics in the archive.

          •  For a context of type PM_CONTEXT_HOST or PM_CONTEXT_LOCAL no
             further action is required.

          On success, pmTrimNameSpace returns zero.


---------------------------------------------------------------

::

          PM_ERR_NOPMNS
                 there has been some earlier problem with establishing the
                 relevant PMNS

          PM_ERR_NOCONTEXT
                 the current PMAPI context is invalid


---------------------------------------------------------

::

          pmlogger(1), PMAPI(3), pmLoadASCIINameSpace(3),
          pmLoadNameSpace(3), pmNewContext(3) and PMNS(5).

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

   Performance Co-Pilot               PCP                PMTRIMNAMESPACE(3)

--------------

Pages that refer to this page:
`pmfetcharchive(3) <../man3/pmfetcharchive.3.html>`__, 
`pmgetpmnslocation(3) <../man3/pmgetpmnslocation.3.html>`__, 
`pmloadasciinamespace(3) <../man3/pmloadasciinamespace.3.html>`__, 
`pmloadnamespace(3) <../man3/pmloadnamespace.3.html>`__

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
