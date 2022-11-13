.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

\__pmparsectime(3) — Linux manual page
======================================

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

   PMPARSECTIME(3)         Library Functions Manual         PMPARSECTIME(3)

NAME
-------------------------------------------------

::

          __pmParseCtime - convert ctime(3) string to tm structure


-------------------------------------------------------------

::

          #include "pmapi.h"
          #include "libpcp.h"

          int __pmParseCtime(const char *string, struct tm *rslt, char
          **errmsg);

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

          __pmParseCtime reverses the asctime(3) function.  It accepts a
          string specifying a time, and fills in the given tm structure.

          string is either a fully specified date and time in the format
          Day MMM DD HH:MM:SS YYYY (e.g "Mon Mar  4 13:07:47 1996") or a
          partially specified date and time like "1996", "Mar 1996", "Mar 4
          1996", "Mar", "13:07:47", "13:07", "Mar 4 13:07:47",....  For a
          partially specified date and time, the order of the fields must
          be preserved and missing fields are filled in from the current
          date and time.

          The seconds component (SS) may be a floating point number, for
          example the time "13:07:47.5".  The 12 hour clock is also
          supported, so "13:07" and "1:07 pm" are equivalent.

          __pmParseCtime returns 0 if successful.  It returns -1 and a
          dynamically allocated error message string in errmsg, if the
          given string does not parse.  Be sure to free(3) the error
          message string.

          The tm structure returned in rslt should only be used as an
          argument to the __pmConvertTime function, as it contains encoded
          information that will only be correctly interpreted by
          __pmConvertTime.


---------------------------------------------------------

::

          PMAPI(3), pmParseInterval(3), __pmConvertTime(3) and
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

   Performance Co-Pilot               PCP                   PMPARSECTIME(3)

--------------

Pages that refer to this page:
`\__pmconverttime(3) <../man3/__pmconverttime.3.html>`__, 
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
