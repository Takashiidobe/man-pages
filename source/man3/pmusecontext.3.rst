.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmusecontext(3) — Linux manual page
===================================

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

   PMUSECONTEXT(3)         Library Functions Manual         PMUSECONTEXT(3)

NAME
-------------------------------------------------

::

          pmUseContext - change current PMAPI context


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmUseContext(int handle);

          cc ... -lpcp


---------------------------------------------------------------

::

          An application using the Performance Metrics Application
          Programming Interface (PMAPI) may manipulate several concurrent
          contexts, each associated with a source of performance metrics,
          e.g. pmcd(1) on some host, or an archive log of performance
          metrics as created by pmlogger(1).

          Calling pmUseContext causes the current PMAPI context to be set
          to the context identified by handle.  The value of handle must be
          one returned from an earlier call to pmNewContext(3) or
          pmDupContext(3).

          Below the PMAPI, all contexts used by an application are saved in
          their most recently modified state, so pmUseContext restores the
          context to the state it was in the last time the context was
          used, not the state of the context when it was established.


---------------------------------------------------------------

::

          PM_ERR_NOCONTEXT

                 handle does not identify a valid PMAPI context


---------------------------------------------------------

::

          PMAPI(3), pmDestroyContext(3), pmDupContext(3), pmNewContext(3)
          and pmWhichContext(3).

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

   Performance Co-Pilot               PCP                   PMUSECONTEXT(3)

--------------

Pages that refer to this page:
`pmaddprofile(3) <../man3/pmaddprofile.3.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`pmdelprofile(3) <../man3/pmdelprofile.3.html>`__, 
`pmdestroycontext(3) <../man3/pmdestroycontext.3.html>`__, 
`pmdupcontext(3) <../man3/pmdupcontext.3.html>`__, 
`pmfetch(3) <../man3/pmfetch.3.html>`__, 
`pmfetchgroup(3) <../man3/pmfetchgroup.3.html>`__, 
`pmistart(3) <../man3/pmistart.3.html>`__, 
`pmnewcontext(3) <../man3/pmnewcontext.3.html>`__, 
`pmreconnectcontext(3) <../man3/pmreconnectcontext.3.html>`__, 
`pmwhichcontext(3) <../man3/pmwhichcontext.3.html>`__, 
`QmcGroup(3) <../man3/QmcGroup.3.html>`__

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
