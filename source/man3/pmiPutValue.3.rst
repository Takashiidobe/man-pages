.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmiputvalue(3) — Linux manual page
==================================

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

   PMIPUTVALUE(3)          Library Functions Manual          PMIPUTVALUE(3)

NAME
-------------------------------------------------

::

          pmiPutValue - add a value for a metric-instance pair


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/import.h>

          int pmiPutValue(const char *name, const char *instance,
                  const char *value);

          cc ... -lpcp_import -lpcp


-------------------------------------------------------------------

::

          use PCP::LogImport;

          pmiPutValue($name, $instance, $value);


---------------------------------------------------------------

::

          As part of the Performance Co-Pilot Log Import API (see
          LOGIMPORT(3)), pmiPutValue adds a single value to the current
          output record for a given metric and instance.

          The metric's name should match one defined earlier in a call to
          pmiAddMetric(3).

          For singular metrics (those defined with an instance domain of
          PM_INDOM_NULL), the instance should be NULL or an empty string,
          otherwise instance should match the name of an instance defined
          earlier in a call to pmiAddInstance(3) for the metric's instance
          domain.

          The value should be in a format consistent with the metric's type
          as defined in the call to pmiAddMetric(3).

          No data will be written until pmiWrite(3) is called, so multiple
          calls to pmiPutValue or pmiPutValueHandle(3) are typically used
          to accumulate data values for several metric-instance pairs
          before calling pmiWrite(3).


---------------------------------------------------------------

::

          pmiPutValue returns zero on success else a negative value that
          can be turned into an error message by calling pmiErrStr(3).


---------------------------------------------------------

::

          LOGIMPORT(3), pmiAddInstance(3), pmiAddMetric(3), pmiErrStr(3),
          pmiPutResult(3), pmiPutValueHandle(3), pmiPutText(3),
          pmiPutLabel(3) and pmiWrite(3).

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

   Performance Co-Pilot                                      PMIPUTVALUE(3)

--------------

Pages that refer to this page:
`logimport(3) <../man3/logimport.3.html>`__, 
`pmiaddinstance(3) <../man3/pmiaddinstance.3.html>`__, 
`pmiaddmetric(3) <../man3/pmiaddmetric.3.html>`__, 
`pmigethandle(3) <../man3/pmigethandle.3.html>`__, 
`pmiputlabel(3) <../man3/pmiputlabel.3.html>`__, 
`pmiputmark(3) <../man3/pmiputmark.3.html>`__, 
`pmiputresult(3) <../man3/pmiputresult.3.html>`__, 
`pmiputtext(3) <../man3/pmiputtext.3.html>`__, 
`pmiputvaluehandle(3) <../man3/pmiputvaluehandle.3.html>`__, 
`pmistart(3) <../man3/pmistart.3.html>`__, 
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
