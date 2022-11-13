.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmtimeval(3) — Linux manual page
================================

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

   PMTIMEVALNOW(3)         Library Functions Manual         PMTIMEVALNOW(3)

NAME
-------------------------------------------------

::

          pmtimevalNow, pmtimevalInc, pmtimevalDec, pmtimevalAdd,
          pmtimevalSub, pmtimevalToReal, pmtimevalFromReal, pmPrintStamp,
          pmPrintHighResStamp - helper routines for time stored as a struct
          timeval


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          void pmtimevalNow(struct timeval *tv);
          void pmtimevalInc(struct timeval *ap, const struct timeval *bp);
          void pmtimevalDec(struct timeval *ap, const struct timeval *bp);
          double pmtimevalAdd(const struct timeval *ap, const struct
          timeval *bp);
          double pmtimevalSub(const struct timeval *ap, const struct
          timeval *bp);
          double pmtimevalToReal(const struct timeval *val);
          void pmtimevalFromReal(double secs, struct timeval *val);
          void pmPrintStamp(FILE *f, const struct timeval *tp);
          void pmPrintHighResStamp(FILE *f, const struct timespec *tp);

          cc ... -lpcp


---------------------------------------------------------------

::

          pmtimevalNow is a platform-independent method that returns the
          current system time since the Epoch in tv.

          pmtimevalInc adds the time in ap to the time in bp and stores the
          result in ap.  Similarly pmtimevalDec subtracts the time in bp
          from the time in ap and stores the result in ap.

          pmtimevalAdd (and pmtimevalSub) add (and subtract) times and
          return the result as a double value.  The time in the ap argument
          is not changed.

          pmtimevalToReal converts the time in tp to an equivalent double
          value.  pmtimevalFromReal provides the reverse conversion, taking
          the time in secs and returning the equivalent time in val.

          pmPrintStamp prints the timestamp from tp on the stream f in the
          local time (as returned by pmLocaltime(3)) in the format
          HH:MM:SS.XXX.  pmPrintHighResStamp performs a similar service,
          but for a struct timespec and reports the timestamp to nanosecond
          precision.


---------------------------------------------------------

::

          gettimeofday(2), time(2), PMAPI(3) and pmLocaltime(3).

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

   Performance Co-Pilot               PCP                   PMTIMEVALNOW(3)

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
