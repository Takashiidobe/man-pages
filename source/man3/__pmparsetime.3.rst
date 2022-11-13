.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

\__pmparsetime(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `CAVEAT <#CAVEAT>`__ \|           |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMPARSETIME(3)          Library Functions Manual          PMPARSETIME(3)

NAME
-------------------------------------------------

::

          __pmParseTime - parse time point specification


-------------------------------------------------------------

::

          #include "pmapi.h"
          #include "libpcp.h"

          int __pmParseTime(const char *string, struct timeval *logStart,
                  struct timeval *logEnd, struct timeval *rslt,
                  char **errMsg);

          cc ... -lpcp


-----------------------------------------------------

::

          This documentation is intended for internal Performance Co-Pilot
          (PCP) developer use.

          These interfaces are not part of the PCP APIs that are guaranteed
          to remain fixed across releases, and they may not work, or may
          provide different semantics at some point in the future.


---------------------------------------------------------------

::

          __pmParseTime is designed to encapsulate the interpretation of a
          time point specification in command line switches for use by the
          PCP client tools.

          This function expects to be called with the time point
          specification as string.  If the tool is running against PCP
          archive(s), you also need to supply the start time of the first
          (only) archive as logStart, and the end of the last (only)
          archive as logEnd.  See pmGetArchiveLabel(3) and
          pmGetArchiveEnd(3) for how to obtain values for these parameters.
          If the tool is running against a live feed of performance data,
          logStart should be the current time (but could be aligned on the
          next second for example), while logEnd should have its tv_sec
          component set to INT_MAX.

          The rslt structure must be allocated before calling
          __pmParseTime.

          You also need to set the current PCP reporting time zone to
          correctly reflect the -z and -Z command line parameters before
          calling __pmParseTime.  See pmUseZone(3) and friends for
          information on how this is done.

          If the conversion is successful, __pmParseTime returns 0, and
          fills in rslt with the time value defined by the input
          parameters.  If the argument strings could not be parsed, it
          returns -1 and a dynamically allocated error message string in
          errMsg.  Be sure to free(3) this error message string.


---------------------------------------------------------

::

          PMAPI(3), pmGetArchiveEnd(3), pmGetArchiveLabel(3),
          pmNewContextZone(3), pmNewZone(3), pmParseInterval(3),
          pmParseTimeWindow(3), pmUseZone(3), __pmConvertTime(3) and
          __pmParseCtime(3).

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

   Performance Co-Pilot               PCP                    PMPARSETIME(3)

--------------

Pages that refer to this page:
`\__pmconverttime(3) <../man3/__pmconverttime.3.html>`__, 
`\__pmparsectime(3) <../man3/__pmparsectime.3.html>`__

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
