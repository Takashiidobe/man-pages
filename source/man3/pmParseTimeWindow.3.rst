.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmparsetimewindow(3) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `USAGE <#USAGE>`__ \|             |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMPARSETIMEWINDOW(3)    Library Functions Manual    PMPARSETIMEWINDOW(3)

NAME
-------------------------------------------------

::

          pmParseTimeWindow - parse time window command line arguments


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmParseTimeWindow(const char *swStart, const char *swEnd,
                  const char *swAlign, const char *swOffset,
                  const struct timeval *logStart,
                  const struct timeval *logEnd, struct timeval *rsltStart,
                  struct timeval *rsltEnd, struct timeval *rsltOffset,
                  char **errMsg);

          cc ... -lpcp


---------------------------------------------------------------

::

          pmParseTimeWindow is designed to encapsulate the interpretation
          of the -S, -T, -A and -O command line options used by Performance
          Co-Pilot (PCP) applications to define a time window of interest.
          The time window is defined by a start time and an end time that
          constrains the time interval during which the PCP application
          will retrieve and display performance metrics.  In the absence of
          the -O and -A options to specify an initial sample time origin
          and time alignment (see below), the PCP application will retrieve
          the first sample at the start of the time window.

          The syntax and meaning of the various argument formats for these
          options is described in PCPIntro(1).


---------------------------------------------------

::

          pmParseTimeWindow expects to be called with the argument of the
          -S option as swStart, the argument of the -T option as swEnd, the
          argument of the -A option as swAlign, and the argument of the -O
          option as swOffset.  Any or all of these parameters may be NULL
          to indicate that the corresponding command line option was not
          present.

          If the application is using a set of PCP archive logs as the
          source of performance metrics, you also need to supply the time
          of the first archive log entry as logStart, and the time of the
          last archive log entry as logEnd.  See pmGetArchiveLabel(3) and
          pmGetArchiveEnd(3) for how to obtain values for these times.

          If the application is manipulating multiple concurrent archive
          logs, then the caller must resolve how the default time window is
          to be defined (the union of the time intervals in all archive
          logs is a likely interpretation).

          If the application is using a live feed of performance data,
          logStart should be the current time (but could be aligned on the
          next second for example), while logEnd should have its tv_sec
          component set to INT_MAX.

          The rsltStart, rsltEnd and rsltOffset structures must be
          allocated before calling pmParseTimeWindow.

          You also need to set the current PCP reporting time zone to
          correctly reflect the -z and -Z command line parameters before
          calling pmParseTimeWindow.  See pmUseZone(3) and friends for
          information on how this is done.


---------------------------------------------------------------

::

          If the conversion is successful, pmParseTimeWindow returns 1 and
          fills in rsltStart, rsltEnd and rsltOffset with the start, end,
          and offset times for the time window defined by the input
          parameters.  The errMsg parameter is not changed when
          pmParseTimeWindow returns 1.

          If the conversion is successful, but the requested alignment
          could not be performed (e.g. the set of PCP archive logs is too
          short) the alignment is ignored, rsltStart, rsltEnd and
          rsltOffset are filled in and pmParseTimeWindow returns 0.  In
          this case, errMsg will point to a warning message in a
          dynamically allocated buffer.  The caller is responsible for
          releasing the buffer by calling free(3).

          If the argument strings could not be parsed, pmParseTimeWindow
          returns -1.  In this case, errMsg will point to an error message
          in a dynamically allocated buffer.  The caller is responsible for
          releasing the buffer by calling free(3).


---------------------------------------------------------

::

          free(3), PMAPI(3), pmGetArchiveEnd(3), pmGetArchiveLabel(3),
          pmNewContextZone(3), pmNewZone(3), pmParseInterval(3) and
          pmUseZone(3).

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

   Performance Co-Pilot               PCP              PMPARSETIMEWINDOW(3)

--------------

Pages that refer to this page:
`pmseries(1) <../man1/pmseries.1.html>`__, 
`\__pmconverttime(3) <../man3/__pmconverttime.3.html>`__, 
`pmparseinterval(3) <../man3/pmparseinterval.3.html>`__, 
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
