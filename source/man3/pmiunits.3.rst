.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmiunits(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `                                 |                                   |
| Perl SYNOPSIS <#Perl_SYNOPSIS>`__ |                                   |
| \| `DESCRIPTION <#DESCRIPTION>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMIUNITS(3)             Library Functions Manual             PMIUNITS(3)

NAME
-------------------------------------------------

::

          pmiUnits, pmiID, pmiInDom - construct core metric data structures


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/import.h>

          pmID pmiID(int domain, int cluster, int item);
          pmInDom pmiInDom(int domain, int serial);
          pmUnits pmiUnits(int dimSpace, int dimTime, int dimCount,
                  int scaleSpace, int scaleTime, int scaleCount);

          cc ... -lpcp_import -lpcp


-------------------------------------------------------------------

::

          use PCP::LogImport;

          $pmid = pmiID($domain, $cluster, $item);
          $indom = pmiInDom($domain, $serial);
          $units = pmiUnits($dimSpace, $dimTime, $dimCount, $scaleSpace,
                  $scaleTime, $scaleCount);


---------------------------------------------------------------

::

          As part of the Performance Co-Pilot Log Import API (see
          LOGIMPORT(3)), these routines provide convenience methods
          (especially for script use) for constructing pmID, pmInDom and
          pmUnits structures respectively, to be used in subsequent calls
          to pmiAddMetric(3) and pmiAddInstance(3).

          Refer to pmLookupDesc(3) for a complete description of the values
          and semantics of the components of a pmUnits structure, and hence
          the valid argument values for pmiUnits.


---------------------------------------------------------

::

          LOGIMPORT(3), pmiAddMetric(3), pmiAddInstance(3) and
          pmLookupDesc(3).

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

   Performance Co-Pilot               PCP                       PMIUNITS(3)

--------------

Pages that refer to this page:
`sheet2pcp(1) <../man1/sheet2pcp.1.html>`__, 
`pmiaddmetric(3) <../man3/pmiaddmetric.3.html>`__

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
