.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmctime(3) — Linux manual page
==============================

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

   PMCTIME(3)              Library Functions Manual              PMCTIME(3)

NAME
-------------------------------------------------

::

          pmCtime - format the date and time for a reporting timezone


-------------------------------------------------------------

::

          #include <time.h>
          #include <pcp/pmapi.h>

          char *pmCtime(const time_t *clock, char *buf);

          cc ... -lpcp


---------------------------------------------------------------

::

          pmCtime is very similar to ctime(3), except the timezone used is
          the current ``reporting timezone'' (rather than the default TZ
          environment variable scheme), and the result is returned into a
          caller-declared buffer (rather than a private buffer).

          Like ctime(3) the time to be converted is passed via clock, and
          the result in buf is fixed width fields in the format:

                    Fri Sep 13 00:00:00 1986\n\0

          The result buffer buf must be at least 26 bytes long, and no
          attempt is made to check this.  pmCtime returns buf as the value
          of the function.

          The default current reporting timezone is as defined by the TZ
          environment variable, so pmCtime and ctime(3) will initially
          produce similar encoding of the date and time.

          Use pmNewZone(3), pmNewContextZone(3) or pmUseZone(3) to
          establish a new current reporting timezone that will effect
          pmCtime but not ctime(3).


---------------------------------------------------------

::

          ctime(3), PMAPI(3), pmLocaltime(3), pmNewContextZone(3),
          pmNewZone(3) and pmUseZone(3).

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

   Performance Co-Pilot               PCP                        PMCTIME(3)

--------------

Pages that refer to this page:
`pmlocaltime(3) <../man3/pmlocaltime.3.html>`__, 
`\__pmmktime(3) <../man3/__pmmktime.3.html>`__, 
`pmnewcontextzone(3) <../man3/pmnewcontextzone.3.html>`__, 
`pmnewzone(3) <../man3/pmnewzone.3.html>`__, 
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
