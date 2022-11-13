.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmlookupindomarchive(3) — Linux manual page
===========================================

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

   PMLOOKUPINDOMARCHIVE(3) Library Functions Manual PMLOOKUPINDOMARCHIVE(3)

NAME
-------------------------------------------------

::

          pmLookupInDomArchive - translate an instance name into an
          instance identifier


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmLookupInDomArchive(pmInDom indom, const char *name);

          cc ... -lpcp


---------------------------------------------------------------

::

          Provided the current Performance Metrics Application Programming
          Interface (PMAPI) context is associated with a set of archive
          logs, pmLookupInDomArchive will scan the union of all the
          instance domain metadata for the instance domain indom, locate
          the first instance with the external identification given by
          name, and return the internal instance identifier.

          This routine is a specialized version of the more general PMAPI
          routine pmLookupInDom.

          Only the leading non-space characters of name will be used to
          identify the instance.

          The value for the instance domain indom is typically extracted
          from a pmDesc structure, following a call to pmLookupDesc(3) for
          a particular performance metric.

          pmLookupInDomArchive will return a positive instance identifier
          on success.


---------------------------------------------------------------

::

          PM_ERR_NOTARCHIVE
                 the current PMAPI context is not associated with a set of
                 archive logs

          PM_ERR_INDOM_LOG
                 indom is not a defined instance domain identifier for the
                 set of archive logs

          PM_ERR_INST_LOG
                 the external instance name is not known for the instance
                 domain indom in the set of archive logs


---------------------------------------------------------

::

          PMAPI(3), pmGetConfig(3), pmGetInDomArchive(3), pmLookupDesc(3),
          pmLookupInDom(3), pmNameInDomArchive(3), pcp.conf(5) and
          pcp.env(5).

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

   Performance Co-Pilot               PCP           PMLOOKUPINDOMARCHIVE(3)

--------------

Pages that refer to this page:
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmgetindomarchive(3) <../man3/pmgetindomarchive.3.html>`__, 
`pmlookupindom(3) <../man3/pmlookupindom.3.html>`__, 
`pmnameindomarchive(3) <../man3/pmnameindomarchive.3.html>`__

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
