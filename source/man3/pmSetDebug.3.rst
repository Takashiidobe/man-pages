.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmsetdebug(3) — Linux manual page
=================================

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

   PMSETDEBUG(3)           Library Functions Manual           PMSETDEBUG(3)

NAME
-------------------------------------------------

::

          pmSetDebug, pmClearDebug - manipulate PCP debugging control
          options


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmSetDebug(const char *spec);
          int pmClearDebug(const char *spec);

          cc ... -lpcp


---------------------------------------------------------------

::

          Within the libraries and applications of the Performance Co-Pilot
          (PCP) there is an extensive set of debugging options that may be
          enabled or disabled at run-time.

          Both pmSetDebug and pmClearDebug parse spec assuming it to be a
          comma separated list of PCP debug option names.

          The names of the available options may be found using the -l
          argument to pmdbg(1).

          As a special case, the name ``all'' is treated as a synonym for
          identifying all option names.

          pmSetDebug will set the corresponding options, while pmClearDebug
          will clear the corresponding options.

          Consecutive calls to either routine will be additive.  For
          example the following code fragments are equivalent in terms of
          the final configuration of the debug options.

               sts = pmClearDebug("all");
               sts = pmSetDebug("appl0");
               sts = pmSetDebug("pdu,fetch");
               sts = pmSetDebug("fetch,profile,context");
               sts = pmClearDebug("appl0");

               sts = pmClearDebug("all");
               sts = pmSetDebug("pdu,fetch,profile,context");

          An earlier implementation of the PCP debug facilities used a bit-
          vector and for backwards compatibility the elements of spec may
          include decimal values corresponding to those bit-values.  Refer
          to pmdbg(1) for more details of this deprecated format.


---------------------------------------------------------------

::

          If successful, these routines return 0, otherwise the return is
          PM_ERR_CONV to indicate a parsing error.


---------------------------------------------------------

::

          pmdbg(1)

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

   Performance Co-Pilot               PCP                     PMSETDEBUG(3)

--------------

Pages that refer to this page: `pmdbg(1) <../man1/pmdbg.1.html>`__, 
`pmdaconnect(3) <../man3/pmdaconnect.3.html>`__, 
`pmgetoptions(3) <../man3/pmgetoptions.3.html>`__, 
`pmparsedebug(3) <../man3/pmparsedebug.3.html>`__, 
`QMC(3) <../man3/QMC.3.html>`__, 
`QmcContext(3) <../man3/QmcContext.3.html>`__, 
`QmcDesc(3) <../man3/QmcDesc.3.html>`__, 
`QmcGroup(3) <../man3/QmcGroup.3.html>`__, 
`QmcIndom(3) <../man3/QmcIndom.3.html>`__, 
`QmcMetric(3) <../man3/QmcMetric.3.html>`__, 
`QmcSource(3) <../man3/QmcSource.3.html>`__

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
