.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmiputlabel(3) — Linux manual page
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

   PMIPUTLABEL(3)          Library Functions Manual          PMIPUTLABEL(3)

NAME
-------------------------------------------------

::

          pmiPutLabel - add labels to the output archive


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/import.h>

          int pmiPutLabel(unsigned int type, unsigned int id, unsigned int
                  instance, const char *name, const char *value)

          cc ... -lpcp_import -lpcp


-------------------------------------------------------------------

::

          use PCP::LogImport;

          pmiPutLabel($type, $id, $instance, $name, $value);


---------------------------------------------------------------

::

          As part of the Performance Co-Pilot Log Import API (see
          LOGIMPORT(3)), pmiPutLabel adds a label for the global context or
          for a given domain, cluster, item, instance domain or instance.

          The type must be one of PM_LABEL_CONTEXT, PM_LABEL_DOMAIN,
          PM_LABEL_CLUSTER, PM_LABEL_ITEM, PM_LABEL_INDOM, or
          PM_LABEL_INSTANCES.

          If type is PM_LABEL_CONTEXT, then id and instance are ignored.
          Otherwise, id should match a domain, cluster, metric or instance
          domain defined earlier in a call to pmiAddMetric(3).

          If type is PM_LABEL_INSTANCES, then instance should match an
          instance number of the selected domain. Otherwise instance is
          ignored.

          name is a string containing the name of the label to be added.

          value is a string containing the value of the label to be added.

          No data will be written until pmiWrite(3) is called, so multiple
          calls to pmiPutLabel are typically used to accumulate several
          labels before calling pmiWrite(3).


---------------------------------------------------------------

::

          pmiPutLabel returns zero on success else a negative value that
          can be turned into an error message by calling pmiErrStr(3).


---------------------------------------------------------

::

          LOGIMPORT(3), pmiAddInstance(3), pmiAddMetric(3), pmiErrStr(3),
          pmiPutResult(3), pmiPutValue(3), pmiPutValueHandle(3),
          pmiPutText(3) and pmiWrite(3).

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

   Performance Co-Pilot                                      PMIPUTLABEL(3)

--------------

Pages that refer to this page:
`logimport(3) <../man3/logimport.3.html>`__, 
`pmiaddinstance(3) <../man3/pmiaddinstance.3.html>`__, 
`pmiaddmetric(3) <../man3/pmiaddmetric.3.html>`__, 
`pmiputmark(3) <../man3/pmiputmark.3.html>`__, 
`pmiputresult(3) <../man3/pmiputresult.3.html>`__, 
`pmiputtext(3) <../man3/pmiputtext.3.html>`__, 
`pmiputvalue(3) <../man3/pmiputvalue.3.html>`__, 
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
