.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmprintvalue(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMPRINTVALUE(3)         Library Functions Manual         PMPRINTVALUE(3)

NAME
-------------------------------------------------

::

          pmPrintValue - print a performance metric value


-------------------------------------------------------------

::

          #include <stdio.h>
          #include <pcp/pmapi.h>

          void pmPrintValue(FILE *f, int valfmt, int type,
                  const pmValue *val, int minwidth);

          cc ... -lpcp


---------------------------------------------------------------

::

          The value of a single performance metric (as identified by val)
          is printed on the standard I/O stream identified by f.

          The value of the performance metric is interpreted according to
          the format of val as defined by valfmt (from a pmValueSet within
          a pmResult structure; see pmFetch(3)) and the generic description
          of the metrics type passed in via type.

          The value for type is typically extracted from a pmDesc
          structure, following a call to pmLookupDesc(3) for a particular
          performance metric.

          The output will be optionally padded to be at least minwidth
          characters wide.

          pmPrintValue is most useful for displaying values of performance
          metrics from pmFetch(3) (which returns a set of valfmt and val
          pairs for each requested metric), based upon the metrics type as
          returned from pmLookupDesc(3).


---------------------------------------------------------

::

          PMAPI(3), pmAtomStr(3), pmConvScale(3), pmExtractValue(3),
          pmFetch(3), pmLookupDesc(3), pmTypeStr(3) and pmUnitsStr(3).

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

   Performance Co-Pilot               PCP                   PMPRINTVALUE(3)

--------------

Pages that refer to this page: `pmprobe(1) <../man1/pmprobe.1.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`pmatomstr(3) <../man3/pmatomstr.3.html>`__, 
`pmconvscale(3) <../man3/pmconvscale.3.html>`__, 
`pmextractvalue(3) <../man3/pmextractvalue.3.html>`__, 
`pmsemstr(3) <../man3/pmsemstr.3.html>`__, 
`pmtypestr(3) <../man3/pmtypestr.3.html>`__, 
`pmunitsstr(3) <../man3/pmunitsstr.3.html>`__

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
