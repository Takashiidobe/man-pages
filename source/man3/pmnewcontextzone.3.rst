.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmnewcontextzone(3) — Linux manual page
=======================================

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

   PMNEWCONTEXTZONE(3)     Library Functions Manual     PMNEWCONTEXTZONE(3)

NAME
-------------------------------------------------

::

          pmNewContextZone - establish a reporting timezone based on a
          PMAPI context


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmNewContextZone(void);

          cc ... -lpcp


---------------------------------------------------------------

::

          The current reporting timezone affects the timezone used by
          pmCtime(3) and pmLocaltime(3).

          If the current PMAPI context is an archive, pmNewContextZone uses
          the timezone from the archive label record to set the current
          reporting timezone.

          If the current PMAPI context corresponds to a host source of
          metrics, pmNewContextZone executes a pmFetch(3) to retrieve the
          value for the metric pmcd.timezone and uses that to set the
          current reporting timezone.

          In both cases, pmNewContextZone returns a value to identify the
          current reporting timezone that may be used in a subsequent call
          to pmUseZone(3) to restore this reporting timezone.


---------------------------------------------------------------

::

          PM_ERR_NOCONTEXT
                 the current PMAPI context is not valid

          other  a return value less than zero indicates a fatal error from
                 a system call, most likely malloc(3)


---------------------------------------------------------

::

          PMAPI(3), pmCtime(3), pmFetch(3), pmGetConfig(3), pmLocaltime(3),
          pmNewContext(3), pmNewZone(3), pmUseZone(3), pmWhichZone(3),
          pcp.conf(5), pcp.env(5) and environ(7).

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

   Performance Co-Pilot               PCP               PMNEWCONTEXTZONE(3)

--------------

Pages that refer to this page:
`pmseries(1) <../man1/pmseries.1.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`\__pmconverttime(3) <../man3/__pmconverttime.3.html>`__, 
`pmctime(3) <../man3/pmctime.3.html>`__, 
`pmlocaltime(3) <../man3/pmlocaltime.3.html>`__, 
`\__pmmktime(3) <../man3/__pmmktime.3.html>`__, 
`pmnewzone(3) <../man3/pmnewzone.3.html>`__, 
`\__pmparsetime(3) <../man3/__pmparsetime.3.html>`__, 
`pmparsetimewindow(3) <../man3/pmparsetimewindow.3.html>`__, 
`pmusezone(3) <../man3/pmusezone.3.html>`__, 
`pmwhichzone(3) <../man3/pmwhichzone.3.html>`__

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
