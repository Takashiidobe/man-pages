.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmparsedebug(3) — Linux manual page
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

   PMPARSEDEBUG(3)         Library Functions Manual         PMPARSEDEBUG(3)

NAME
-------------------------------------------------

::

          __pmParseDebug, __pmSetDebugBits - manipulate old-style PCP
          debugging control bit-fields


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/deprecated.h>

          int __pmParseDebug(const char *spec);
          void __pmSetDebugBits(int value);

          cc ... -lpcp


---------------------------------------------------------------

::

          These routine have been deprecated and may be removed in a future
          Performance Co-Pilot (PCP) release.  Please refer to
          pmSetDebug(3) and pmClearDebug(3) for replacement functionality.

          __pmParseDebug parses spec assuming it to be a comma separated
          list of PCP debug flags.

          Each flag may be specified as an integer or the trailing portion
          of the symbolic name of the corresponding flag as reported by
          pmdbg(1).  Symbolic names are stripped of the ``DBG_TRACE_''
          prefix and may appear in either case.

          As a special case, the values ``-1'' and ``ALL'' are treated as
          synonyms for turning on all bits except the sign bit in the
          result, i.e. INT_MAX from <limits.h>.

          For example the debug option fetch is defined in the output from
          pmdbg(3) with the -L option and may be specified in spec as 2,
          FETCH or fetch.

          __pmSetDebugBits may be used to set the bit-fields directly using
          the encoding in value.  The effect is additive, so consecutive
          calls to __pmSetDebugBits will set the conjunction of the bits in
          the value arguments.  To clear the bit-fields, see
          pmClearDebug(3).


---------------------------------------------------------------

::

          If successful, __pmParseDebug returns the value computed by the
          bit-wise ``or'' of each flag in the spec, suitable for assigning
          to the global debug trace control variable pmDebug.  Otherwise
          the return value is less than 0 to indicate a parsing error.


---------------------------------------------------------

::

          pmdbg(1), pmSetDebug(3) and pmClearDebug(3).

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

   Performance Co-Pilot               PCP                   PMPARSEDEBUG(3)

--------------

Pages that refer to this page: `pmdbg(1) <../man1/pmdbg.1.html>`__

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
