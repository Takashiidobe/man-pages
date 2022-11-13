.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

\__pmconverttime(3) — Linux manual page
=======================================

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

   PMCONVERTTIME(3)        Library Functions Manual        PMCONVERTTIME(3)

NAME
-------------------------------------------------

::

          __pmConvertTime - convert tm structure to timeval structure


-------------------------------------------------------------

::

          #include "pmapi.h"
          #include "libpcp.h"

          int __pmConvertTime(struct tm *tmin, struct timeval *origin,
                  struct timeval *rslt);

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

          __pmConvertTime accepts a tm structure that has been filled in by
          __pmParseCtime(3) and a reference time point origin, and fills in
          the given rslt structure with the time the user meant when he
          specified a partial ctime or positive or negative time interval.

          Typically, the argument origin is the start time for a set of
          PCP archive logs, unless the user specified a negative interval
          offset, in which case it is the end time of the log.

          __pmConvertTime returns 0 if successful.  It returns -1 and
          writes an error message to stderr, if an error is detected.

          Use pmNewZone(3), pmNewContextZone(3) or pmUseZone(3) to
          establish a new current timezone that will effect
          __pmConvertTime.


---------------------------------------------------------

::

          PMAPI(3), pmNewContextZone(3), pmNewZone(3), pmParseInterval(3),
          pmParseTimeWindow(3), pmUseZone(3), __pmParseCtime(3) and
          __pmParseTime(3).

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

   Performance Co-Pilot               PCP                  PMCONVERTTIME(3)

--------------

Pages that refer to this page:
`\__pmparsectime(3) <../man3/__pmparsectime.3.html>`__, 
`\__pmparsetime(3) <../man3/__pmparsetime.3.html>`__

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
