.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdahelp(3) — Linux manual page
===============================

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

   PMDAHELP(3)             Library Functions Manual             PMDAHELP(3)

NAME
-------------------------------------------------

::

          pmdaOpenHelp, pmdaGetHelp, pmdaGetInDomHelp, pmdaCloseHelp - help
          text support for a PMDA


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmda.h>

          int pmdaOpenHelp(const char *fname);
          char *pmdaGetHelp(int handle, pmID pmid, int type);
          char *pmdaGetInDomHelp(int handle, pmInDom indom, int type);
          void pmdaCloseHelp(int handle);

          cc ... -lpcp_pmda -lpcp


---------------------------------------------------------------

::

          As part of the Performance Metrics Domain Agent (PMDA) API (see
          PMDA(3)), this group of routines is used to implement the
          processing of a PMDA's metric help information.

          These routines are really intended for internal use, and should
          not need to be called directly from any PMDA code.

          Briefly, the base name of the help text file (as created by
          newhelp(1)) is passed in via a -h command line option for a
          daemon PMDA or as an argument to pmdaDaemon(3) or pmdaDSO(3).
          Then pmdaOpenHelp is called from pmdaInit(3) and returns a handle
          that is used in subsequent calls to identify a particular help
          text collection (each PMDA typically has only one such
          collection).

          Requests for help text are passed to pmdaText(3) which calls
          pmdaGetHelp or pmdaGetInDomHelp as required.

          Other than error cases in pmdaOpenHelp, pmdaCloseHelp is not
          called.


-----------------------------------------------------

::

          The PMDA must be using PMDA_PROTOCOL_2 or later, as specified in
          the call to pmdaDSO(3) or pmdaDaemon(3).


---------------------------------------------------------------

::

          pmdaOpenHelp returns a negative value for failure, suitable for
          decoding with pmErrStr(3).  pmdaGetHelp and pmdaGetInDomHelp
          return NULL if the corresponding help text does not exist.


---------------------------------------------------------

::

          newhelp(1), PMAPI(3), PMDA(3), pmdaDaemon(3), pmdaDSO(3),
          pmdaInit(3), pmdaText(3) and pmErrStr(3).

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

   Performance Co-Pilot               PCP                       PMDAHELP(3)

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
