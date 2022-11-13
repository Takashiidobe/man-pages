.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmiaddinstance(3) — Linux manual page
=====================================

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

   PMIADDINSTANCE(3)       Library Functions Manual       PMIADDINSTANCE(3)

NAME
-------------------------------------------------

::

          pmiAddInstance - add an element to an instance domain in a
          LOGIMPORT context


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/import.h>

          int pmiAddInstance(pmInDom indom, const char *instance, int
          inst);

          cc ... -lpcp_import -lpcp


-------------------------------------------------------------------

::

          use PCP::LogImport;

          pmiAddInstance($indom, $instance, $inst);


---------------------------------------------------------------

::

          As part of the Performance Co-Pilot Log Import API (see
          LOGIMPORT(3)), pmiAddInstance adds a new element to the instance
          domain identified by indom.

          indom would normally be constructed using the pmInDom_build
          macro, e.g. pmInDom_build(PMI_DOMAIN,0) for the first instance
          domain in the Performance Metrics Domain PMI_DOMAIN (which is the
          default for all meta data created by the LOGIMPORT library).

          The new instance must have both an external name (instance) and
          an internal instance identifier (inst) that is unique across all
          instances in the indom instance domain.  There is a special
          ``uniqueness rule'' for instance that is imposed by
          pmLookupInDom(3), namely that the external instance name must be
          unique in the leading non-space characters, e.g. the instance
          names ``foo'' and ``foo bar'' are considered the same by this
          rule and not allowed in the same instance domain, but ``foo'' and
          ``foobar'' would be allowed.

          Once defined, the external instance name can be used in calls to
          pmiGetHandle(3) and/or pmiPutValue(3) with the name of a metric
          defined over the same instance domain.


---------------------------------------------------------------

::

          pmiAddInstance returns zero on success else a negative value that
          can be turned into an error message by calling pmiErrStr(3).


---------------------------------------------------------

::

          LOGIMPORT(3), pmiAddMetric(3), pmiErrStr(3), pmiGetHandle(3),
          pmiPutValue(3), pmiPutText(3), pmiPutLabel(3) and
          pmLookupInDom(3).

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

   Performance Co-Pilot                                   PMIADDINSTANCE(3)

--------------

Pages that refer to this page:
`logimport(3) <../man3/logimport.3.html>`__, 
`pmigethandle(3) <../man3/pmigethandle.3.html>`__, 
`pmiputlabel(3) <../man3/pmiputlabel.3.html>`__, 
`pmiputmark(3) <../man3/pmiputmark.3.html>`__, 
`pmiputresult(3) <../man3/pmiputresult.3.html>`__, 
`pmiputtext(3) <../man3/pmiputtext.3.html>`__, 
`pmiputvalue(3) <../man3/pmiputvalue.3.html>`__, 
`pmistart(3) <../man3/pmistart.3.html>`__, 
`pmiunits(3) <../man3/pmiunits.3.html>`__, 
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
