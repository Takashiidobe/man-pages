.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmsetmode(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `LARGE DELT                       |                                   |
| A VALUES <#LARGE_DELTA_VALUES>`__ |                                   |
| \| `DIAGNOSTICS <#DIAGNOSTICS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMSETMODE(3)            Library Functions Manual            PMSETMODE(3)

NAME
-------------------------------------------------

::

          pmSetMode - set collection time parameters for the current PMAPI
          context


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmSetMode(int mode, const struct timeval *when, int delta);

          cc ... -lpcp


---------------------------------------------------------------

::

          pmSetMode is used to define the collection time and/or mode for
          accessing performance metrics and meta-data in the current
          Performance Metrics Application Programming Interface (PMAPI)
          context.  This mode affects the semantics of subsequent calls to
          the following PMAPI routines: pmFetch(3), pmFetchArchive(3),
          pmLookupDesc(3), pmGetInDom(3), pmLookupInDom(3) and
          pmNameInDom(3).

          If mode is PM_MODE_LIVE then all information is returned from the
          active pool of performance metrics as of the time that the PMAPI
          call is made, and the other two parameters to pmSetMode are
          ignored.  PM_MODE_LIVE is the default mode when a new PMAPI
          context of type PM_CONTEXT_HOST is created.

          If the mode is not PM_MODE_LIVE, then the when parameter defines
          a time origin, and all requests for meta-data (metric
          descriptions and instance identifiers from the instance domains)
          will be processed to reflect the state of the meta-data as of the
          time origin, i.e. we use the last state of this information at,
          or before, the time origin.

          If the mode is PM_MODE_INTERP then, in the case of pmFetch(3),
          the underlying code will use an interpolation scheme to compute
          the values of the metrics from the values recorded for times in
          the proximity of the time origin.  A mode of PM_MODE_INTERP may
          only be used with an archive context.

          If the mode is PM_MODE_FORW then, in the case of pmFetch(3), the
          collection of recorded metric values will be scanned in a
          forwards direction in time, until values for at least one of the
          requested metrics is located after the time origin, and then all
          requested metrics stored in the set of archives at that time will
          be returned with the corresponding timestamp.  A mode of
          PM_MODE_FORW may only be used with an archive context.

          If the mode is PM_MODE_BACK then, the situation is the same as
          for PM_MODE_FORW, except a pmFetch(3) will be serviced by
          scanning the collection of recorded metrics in a backwards
          direction in time for metrics before the time origin.  A mode of
          PM_MODE_BACK may only be used with an archive context.

          If the mode is PM_MODE_FORW or PM_MODE_BACK, and no qualifying
          metrics can be found in the requested direction of searching
          before the end or start of the set of archive logs is found, then
          pmFetch(3) returns the special error indicator, PM_ERR_EOL.

          For modes other than PM_MODE_LIVE, after each successful
          pmFetch(3), the time origin is reset to the timestamp returned
          via the pmResult structure from pmFetch(3).

          The pmSetMode parameter delta defines an additional number of
          time units that should be used to adjust the time origin
          (forwards or backwards), after the new time origin from the
          pmResult has been determined.  This automatic adjustment of the
          time origin only occurs when the mode is PM_MODE_INTERP, and the
          adjustment is applied, even if the pmFetch(3) fails because the
          time origin is outside the range defined by the records in a set
          of archive logs, i.e. returns PM_ERR_EOL.

          By default delta is interpreted as milliseconds (but see the
          LARGE DELTA VALUES section below).

          Using these mode options, an application can implement replay,
          playback, fast forward, reverse, etc. for performance metric
          values held in the set of archive logs by alternating calls to
          pmSetMode and pmFetch(3).

          As a special case, if when is NULL then the mode and delta
          arguments are used as described above, but the current time in
          the archive is not altered.


---------------------------------------------------------

::

          The following code fragment may be used to dump just those values
          recorded in an archive in correct temporal sequence, for a
          selected set of performance metrics; this uses the default
          collection time mechanisms.

               pmNewContext(PM_CONTEXT_ARCHIVE, "myarchive");
               while (pmFetch(npmid, pmidlist, &result) != PM_ERR_EOL) {
                   /*
                    * process real metric values as of result->timestamp
                    */
                   . . .
                   pmFreeResult(result);
               }

          Alternatively, to replay interpolated metrics from the log in
          reverse chronological order, at 10 second intervals (of recorded
          time), the following code fragment could be used.

               struct timeval mytime;

               mytime.tv_sec = 0x7fffffff; /* or use pmGetArchiveEnd(&mtime) */
               pmSetMode(PM_MODE_BACK, &mytime, 0);
               pmFetchArchive(&result);
               mytime = result->timestamp;
               pmFreeResult(result);
               pmSetMode(PM_MODE_INTERP | PM_XTB_SET(PM_TIME_SEC), &mytime, -10);

               while (pmFetch(numpmid, pmidlist, &result) != PM_ERR_EOL) {
                   /*
                    * process interpolated metric values as of
                    * result->timestamp
                    */
                   . . .
                   pmFreeResult(result);
               }


-----------------------------------------------------------------------------

::

          Because delta is an int and treated as milliseconds by default
          there is a limit on the maximum absolute value of delta that can
          be specified with this default interpretation, namely about 24
          days if a signed int has 31 bits of precision.  To accommodate
          longer values of delta the high-order bits of the mode parameter
          is also used to optionally set the units of time for the delta
          parameter. To specify the units of time use the PM_XTB_SET macro
          with one of the values PM_TIME_NSEC, PM_TIME_MSEC, PM_TIME_SEC,
          etc.  to set the mode as follows:

               PM_MODE_INTERP | PM_XTB_SET(PM_TIME_XXXX)

          The following code shows how this could be done if the desired
          delta is initially encoded in interval (a struct timeval).

               struct timeval interval;
               int mode;

               mode = ...

               if (abs(interval.tv_sec / (3600*24)) <= 24) {
                   /* default encoding of milliseconds is fine */
                   mode = PM_MODE_INTERP;
                   delta = interval.tv_sec * 1000 + (interval.tv_usec + 500)/ 1000;
               }
               else {
                   /* encode delta in units of seconds */
                   mode = PM_MODE_INTERP | PM_XTB_SET(PM_TIME_SEC);
                   delta = interval.tv_sec + (interval.tv_usec + 500000)/ 1000000;
               }

          For millisecond encoding of delta, using PM_XTB_SET(PM_TIME_MSEC)
          is functionally equivalent to not using PM_XTB_SET at all.


---------------------------------------------------------------

::

          PM_ERR_MODE
                 The mode parameter is invalid


---------------------------------------------------------

::

          PMAPI(3), pmFetch(3), pmFetchArchive(3), pmGetInDom(3),
          pmLookupDesc(3), pmLookupInDom(3) and pmNameInDom(3).

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

   Performance Co-Pilot               PCP                      PMSETMODE(3)

--------------

Pages that refer to this page:
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`pmfetch(3) <../man3/pmfetch.3.html>`__, 
`pmfetcharchive(3) <../man3/pmfetcharchive.3.html>`__, 
`pmfetchgroup(3) <../man3/pmfetchgroup.3.html>`__, 
`pmgetarchiveend(3) <../man3/pmgetarchiveend.3.html>`__, 
`pmnewcontext(3) <../man3/pmnewcontext.3.html>`__, 
`pmstore(3) <../man3/pmstore.3.html>`__, 
`pmtime(3) <../man3/pmtime.3.html>`__, 
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
