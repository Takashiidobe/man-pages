.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdatext(3) — Linux manual page
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

   PMDATEXT(3)             Library Functions Manual             PMDATEXT(3)

NAME
-------------------------------------------------

::

          pmdaText - extract metric help text for a PMDA


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmda.h>

          int pmdaText(int ident, int type, char **buffer, pmdaExt *pmda);

          cc ... -lpcp_pmda -lpcp


---------------------------------------------------------------

::

          As part of the Performance Metrics Domain Agent (PMDA) API (see
          PMDA(3)), pmdaText uses the standard PMDA(3) data structures to
          return the help text for metric ident in buffer.  The help text
          must be located in help text files created with newhelp(1), and
          the associated files are automatically opened by pmdaInit(3).

          The path to the (basename of the) help text files can be set in
          the calls to pmdaDSO(3) or pmdaDaemon(3) and overridden by the -h
          command line option in pmdaGetOpt(3).

          The encoding of ident follows the internal scheme used below the
          routines pmLookupText(3) and pmLookupInDomText(3), namely ident
          encodes either a metric identifier or an instance domain
          identifier, according to the value of type.

          The type argument is a bit mask that encodes the interpretation
          of ident and the requested form of help text, as follows: either
          PM_TEXT_PMID if ident is a metric identifier, or PM_TEXT_INDOM if
          ident is an instance domain identifier, plus either
          PM_TEXT_ONELINE for the one line help text or PM_TEXT_HELP for
          the full help text.

          The buffer is managed internally (usually it is cached), and it
          should not be released or freed by the caller of pmdaText.


-----------------------------------------------------

::

          The PMDA must be using PMDA_PROTOCOL_2 or later, as specified in
          the call to pmdaDSO(3) or pmdaDaemon(3).


---------------------------------------------------------------

::

          If the requested help text could not be obtained, pmdaText will
          return PM_ERR_TEXT.


---------------------------------------------------------

::

          newhelp(1), malloc(3), PMAPI(3), PMDA(3), pmdaDaemon(3),
          pmdaDSO(3), pmdaInit(3), pmLookupInDomText(3) and
          pmLookupText(3).

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

   Performance Co-Pilot               PCP                       PMDATEXT(3)

--------------

Pages that refer to this page: `pmda(3) <../man3/pmda.3.html>`__, 
`pmdadaemon(3) <../man3/pmdadaemon.3.html>`__, 
`pmdadso(3) <../man3/pmdadso.3.html>`__, 
`pmdagetoptions(3) <../man3/pmdagetoptions.3.html>`__, 
`pmdahelp(3) <../man3/pmdahelp.3.html>`__, 
`pmdainit(3) <../man3/pmdainit.3.html>`__, 
`pmdamain(3) <../man3/pmdamain.3.html>`__

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
