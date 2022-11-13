.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdachildren(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CAVEAT <#CAVEAT>`__ \|           |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDACHILDREN(3)         Library Functions Manual         PMDACHILDREN(3)

NAME
-------------------------------------------------

::

          pmdaChildren - translate a PMID to a set of dynamic performance
          metric names


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmda.h>

          int pmdaChildren(char *name, int traverse, char ***offspring,
                  int **status, pmdaExt *pmda);

          cc ... -lpcp_pmda -lpcp


---------------------------------------------------------------

::

          As part of the Performance Metrics Domain Agent (PMDA) API (see
          PMDA(3)), pmdaChildren is the generic callback for returning
          dynamic metric names (and their status) that are descendants of
          name.

          Because implementing dynamic performance metrics requires
          specific PMDA support, and the facility is an optional component
          of a PMDA (most PMDAs do not support dynamic performance
          metrics), pmdaChildren is a skeleton implementation that returns
          PM_ERR_NAME.

          A PMDA that supports dynamic performance metrics will provide a
          private callback that replaces pmdaChildren (by assignment to
          version.four.children of the pmdaInterface structure) and takes
          the initial metric name and returns names via offspring[] and the
          leaf or non-leaf status of each via status[].

          If traverse is 0, then the behaviour is akin to pmGetChildren(3)
          and offspring[] contains the relative name component for the
          immediate descendants of name.

          If traverse is 1, then the behaviour is akin to pmTraversePMNS(3)
          and offspring[] contains the absolute names of all dynamic
          metrics that are decedents of name.

          The resulting list of pointers offspring and the values (the
          names) that the pointers reference will have been allocated by
          pmdaChildren with a single call to malloc(3), and the caller of
          pmdaChildren will call free(offspring) to release the space when
          it is no longer required.  The same holds true for the status
          array.


-----------------------------------------------------

::

          The PMDA must be using PMDA_PROTOCOL_4 or later, as specified in
          the call to pmdaDSO(3) or pmdaDaemon(3).


---------------------------------------------------------------

::

          pmdaChildren returns PM_ERR_NAME if the name is not recognized or
          cannot be translated, otherwise the number of descendent metric
          names found.


---------------------------------------------------------

::

          PMAPI(3), PMDA(3), pmdaDaemon(3), pmdaDSO(3), pmdaMain(3),
          pmGetChildren(3) and pmTraversePMNS(3).

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

   Performance Co-Pilot               PCP                   PMDACHILDREN(3)

--------------

Pages that refer to this page: `pmdamain(3) <../man3/pmdamain.3.html>`__

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
