.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmgetderivedcontrol(3) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| RETURN VALUES <#RETURN_VALUES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDERIVEDCONTROL(3)     Library Functions Manual     PMDERIVEDCONTROL(3)

NAME
-------------------------------------------------

::

          pmGetDerivedControl, pmSetDerivedControl  - get and set controls
          for derived metrics


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmGetDerivedControl(int what, int *valuep);
          int pmSetDerivedControl(int what, int value);

          cc ... -lpcp


---------------------------------------------------------------

::

          These routines may be used to influence the behaviour of the
          derived metric services that are activated for global derived
          metrics using pmRegisterDerived(3), pmRegisterDerivedMetric(3)
          and pmLoadDerivedConfig(3), or per-context derived metrics using
          pmAddDerived(3) and pmAddDerivedDerived(3).

          The what argument selects a control, the value argument provides
          a value for pmSetDerivedControl and the valuep argument is used
          to return the value for pmGetDerivedControl.

          The what argument has one of the following values:

          PCP_DERIVED_GLOBAL_LIMIT
                 The maximum number of global derived metrics that may be
                 defined.  The value -1 indicates no limit.

          PCP_DERIVED_CONTEXT_LIMIT
                 The maximum number of per-context derived metrics that may
                 be defined.  The value -1 indicates no limit.

          PCP_DERIVED_DEBUG_SYNTAX
                 Debug diagnostics during parsing of derived metric
                 expression.  The value 1 enables the diagnostics, the
                 value 0 disables them.

          PCP_DERIVED_DEBUG_SEMANTICS
                 Debug diagnostics for semantic checks during the binding
                 of metrics in the derived metric expression to the
                 available metrics in a new PMAPI context.  The value 1
                 enables the diagnostics, the value 0 disables them.

          PCP_DERIVED_DEBUG_EVAL
                 Debug diagnostics when derived metrics are used in PMAPI
                 operations like pmFetch(3), pmGetChildren(3),
                 pmGetChildrenStatus(3), pmLookupDesc(3), pmLookupName(3),
                 pmNameAll(3), pmNameID(3) and pmTraversePMNS(3).


-------------------------------------------------------------------

::

          Both routines return 0 on success, else a value less than 0 that
          can be decoded using pmErrStr(3).


---------------------------------------------------------

::

          PCPIntro(1), pmAddDerived(3), pmAddDerivedMetric(3), PMAPI(3),
          pmErrStr(3), pmLoadDerivedConfig(3), pmRegisterDerived(3),
          pmRegisterDerivedMetric(3) and PMNS(5).

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

   Performance Co-Pilot                                 PMDERIVEDCONTROL(3)

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
