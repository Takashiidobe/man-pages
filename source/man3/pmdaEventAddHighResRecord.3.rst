.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdaeventarray(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDAEVENTARRAY(3)       Library Functions Manual       PMDAEVENTARRAY(3)

NAME
-------------------------------------------------

::

          pmdaEventNewArray, pmdaEventResetArray, pmdaEventReleaseArray,
          pmdaEventAddRecord, pmdaEventAddMissedRecord, pmdaEventAddParam,
          pmdaEventGetAddr, pmdaEventNewHighResArray,
          pmdaEventResetHighResArray, pmdaEventReleaseHighResArray,
          pmdaEventAddHighResRecord, pmdaEventAddHighResMissedRecord,
          pmdaEventHighResAddParam, pmdaEventHighResGetAddr - utilities for
          PMDAs to build packed arrays of event records


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmda.h>

          int pmdaEventNewArray(void);
          int pmdaEventResetArray(int idx);
          int pmdaEventReleaseArray(int idx);
          int pmdaEventAddRecord(int idx, struct timeval *tp, int flags);
          int pmdaEventAddMissedRecord(int idx, struct timeval *tp,
                  int nmissed);
          int pmdaEventAddParam(int idx, pmID pmid, int type,
                  pmAtomValue *avp);
          pmEventArray *pmdaEventGetAddr(int idx);

          int pmdaEventNewHighResArray(void);
          int pmdaEventResetHighResArray(int idx);
          int pmdaEventReleaseHighResArray(int idx);
          int pmdaEventAddHighResRecord(int idx, struct timespec *ts,
                  int flags);
          int pmdaEventAddHighResMissedRecord(int idx, struct timespec *ts,
                  int nmissed);
          int pmdaEventHighResAddParam(int idx, pmID pmid, int type,
                  pmAtomValue *avp);
          pmHighResEventArray *pmdaEventHighResGetAddr(int idx);

          cc ... -lpcp


---------------------------------------------------------------

::

          A Performance Metrics Domain Agent (PMDA) that wishes to export
          event records (or trace records) is encouraged to use a metric of
          either type PM_TYPE_EVENT or PM_TYPE_HIGHRES_EVENT to encode a
          group of event records into a single packed array.

          The only difference between the two metric types is the
          resolution of the timestamp associated with each - in high
          resolution form it is nanosecond scale (see clock_gettime(2)),
          otherwise it is microseconds (see gettimeofday(2)).  For
          simplicity, we will only refer to the lower resolution API and
          data structures hereafter - however, the higher resolution
          variants are all named similarly and are used in the same way.

          The packed array of event records format is defined in
          <pcp/pmapi.h> and consists of a pmEventArray structure containing
          a variable number of pmEventRecord structures, each of which
          contains a variable number of pmEventParameter structures, which
          in turn may contain a variable length value for each parameter of
          each event record.

          The higher resolution equivalents are defined in the same
          location, and the structures are named the same.  Note that the
          pmEventParameter structure has no timestamp associated with it,
          hence it this does not have a high resolution counterpart.

          The routines described here are designed to assist the PMDA
          developer in building a packed array of event records, and
          managing all of the memory allocations required to hold each
          instance of an array of event records in a contiguous buffer.
          Normal use would be as part of PMDA's pmdaFetchCallBack method.

          pmdaEventNewArray is used to create a new event array.  The
          return value is a small integer that is used as the idx parameter
          to the other routines to identify a specific event array.  If
          needed, a PMDA can create and use multiple event arrays.

          To start a new cycle and refill an event array from the
          beginning, call pmdaEventResetArray.

          If the PMDA has finished with an event array,
          pmdaEventReleaseArray may be used to release the underlying
          storage and ``close'' the event array so that subsequent attempts
          to use idx will return PM_ERR_NOCONTEXT.

          To start a new event record, use pmdaEventAddRecord.  The
          timestamp for the event record is given via tp and the flags
          parameter may be used to set the control field that determines
          the type of the event record - flags may be the bit-wise ``or''
          of one or more of the PM_EVENT_FLAG_* values defined in
          <pcp/pmapi.h> (but note that PM_EVENT_FLAG_MISSED should not be
          used in this context).

          If event records have been missed, either because the PMDA cannot
          keep up or because the PMAPI client cannot keep up, then
          pmdaEventAddMissedRecord may be used.  idx and tp have the same
          meaning as for pmdaEventAddRecord and nmissed is the number of
          event records that have been missed at this point in the time-
          series of event records.  pmdaEventAddMissedRecord may be called
          multiple times for a single batch of event records if there are
          more than one ``missed event record'' episode.

          Once an event record has been started by calling
          pmdaEventAddRecord, one or more event parameters may be added
          using pmdaEventAddParam.  The pmid and type parameters decribe
          the PMID of the parameter and the data type (one of the PM_TYPE_*
          values from <pcp/pmapi.h>) of the value that is passed via avp.
          type should one where the size of the value is implied by the
          type or by the length of a string value (for PM_TYPE_STRING) or
          encoded within avp->vbp (for PM_TYPE_AGGREGATE).

          Once the packed array has been constructed, pmdaEventGetAddr
          should be used to initialize the ea_type and ea_len fields at the
          start of the pmEventArray and return the base address of the
          event array that is assigned to the vp field of the pmAtomValue
          structure that the pmdaFetchCallBack method should return.


-------------------------------------------------------

::

          The following skeletal code shows how these routines might be
          used.

          int             sts;
          int             myarray;
          int             first = 1;
          pmEventArray    eap;

          if (first) {
             first = 0;
             if ((myarray = pmdaEventNewArray()) < 0) {
                // report error and fail
             }
          }

          pmdaEventResetArray(myarray);

          // loop over all event records to be exported
          ... {
             struct timeval   stamp;
             int              flags;

             // establish timestamp and set flags to 0 or some combination
             // of PM_EVENT_FLAG_POINT, PM_EVENT_FLAG_START, PM_EVENT_FLAG_ID,
             // etc
             if ((sts = pmdaEventAddRecord(myarray, &stamp, flags)) < 0) {
                // report error and fail
             }

             // loop over all parameters for this event record
             ... {
                pmID          pmid;
                int           type;
                pmAtomValue   atom;

                // construct pmid, type and atom for the parameter and
                // its value
                if ((sts = pmdaEventAddParam(myarray, pmid, type, &atom)) < 0) {
                // report error and fail
                }
             }

             // if some event records were missed (could be at the start
             // of the exported set, or at the end, or in the middle, or
             // a combination of multiple missed record episodes)
             ... {
                int              nmiss;
                struct timeval   stamp;

                if ((sts = pmdaEventAddMissedRecord(myarray, &stamp, nmiss)) < 0) {
                // report error and fail
                }
             }
          }

          // finish up
          eap = pmdaEventGetAddr(myarray);


---------------------------------------------------------

::

          clock_gettime(2), gettimeofday(2), pmdaEventNewQueue(3),
          pmdaEventNewClient(3), PMDA(3) and pmEventFlagsStr(3).

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

   Performance Co-Pilot               PCP                 PMDAEVENTARRAY(3)

--------------

Pages that refer to this page:
`pmdaeventclient(3) <../man3/pmdaeventclient.3.html>`__, 
`pmdaeventqueue(3) <../man3/pmdaeventqueue.3.html>`__, 
`pmeventflagsstr(3) <../man3/pmeventflagsstr.3.html>`__

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
