.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmunpackeventrecords(3) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMUNPACKEVENTRECORDS(3) Library Functions Manual PMUNPACKEVENTRECORDS(3)

NAME
-------------------------------------------------

::

          pmUnpackEventRecords, pmUnpackHighResEventRecords - unpack event
          records


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmUnpackEventRecords(pmValueSet *vsp, int idx, pmResult
          ***rap);

          int pmUnpackHighResEventRecords(pmValueSet *vsp, int idx,
          pmHighResResult ***hrap);

          cc ... -lpcp


---------------------------------------------------------------

::

          Event records are encoded as a packed array of records within a
          pmResult using a container metric with a value of type
          PM_TYPE_EVENT , and a pmHighResResult when using a metric of type
          PM_TYPE_HIGHRES_EVENT.

          pmUnpackEventRecords and pmUnpackHighResEventRecords may be used
          to unpack event records from a metric value identified by vsp and
          idx.  If the metric has a singular value, idx should be 0, else
          the ordinal instance value identified by idx will be unpacked,
          i.e. vsp->vlist[idx].  The unpacked records are turned into
          either pmResult or pmHighResResult structures, one per event
          record and one metric per event parameter, and rap is returned as
          a pointer to an array (NULL pointer terminated) of pointers to
          the result structures.

          The only difference between the two result types is the timestamp
          scale; the pmHighResResult allows for nanosecond precision,
          whereas pmResult allows for microsecond resolution.

          Some control information from the packed event records is
          unpacked into additional ``anonymous'' metrics as follows:

          1.  If the event record has a non-zero flags value, then the
              corresponding pmResult/pmHighResResult will have the flags
              value encoded with the additional metric event.flags that is
              inserted ahead of all other event parameters.

          2.  If the event record flag is set to PM_EVENT_FLAG_MISSED, then
              the corresponding pmResult/pmHighResResult will have one
              metric event.missed with a value that equals the number of
              event records ``missed'' because either the PMDA could not
              keep up, or the PMAPI client did not collect the event
              records fast enough.

          pmUnpackEventRecords returns the number of pmResult structures as
          the return value, which is >= 0 for success.  Similarly,
          pmUnpackHighResEventRecords returns the number of pmHighResResult
          structures as the return value, which is >= 0 for success.

          rap and the associated pmResult structures may be freed using the
          convenience function pmFreeEventResult(3).

          Similarly, the hrap and the associated pmHighResResult structures
          may be freed using the convenience function
          pmFreeHighResEventResult.


-----------------------------------------------------------------

::

          The following errors are possible:

          PM_ERR_CONV
                 The values associated with vsp are not encoded using the
                 format PM_VAL_DPTR or PM_VAL_SPTR, or the flags at the
                 head of the event record has an unexpected value.

          PM_ERR_INST
                 The value associated with vsp is not singular as expected.

          PM_ERR_TYPE
                 vsp is not a value of type PM_TYPE_EVENT.

          PM_ERR_TOOSMALL
                 The value identified by vbp is not legal because the value
                 length is less than the minimum size, or the number of
                 event records encoded in the (value header)
                 pmEventArray/pmEventHighResArray structure is negative, or
                 the number of missed event records in the array is
                 negative.

          PM_ERR_TOOBIG
                 Either vsp indicates more than one value is present (all
                 the event records are expected to be packed in a single
                 metric value), or when unpacking the event records, the
                 processing continues past the end of the enclosing value.
                 Indicates corruption of the packed event record.

          PM_ERR_TYPE
                 Event parameters must have one of the arithmetic types,
                 else PM_TYPE_AGGREGATE, PM_TYPE_STRING or
                 PM_TYPE_AGGREGATE_STATIC.

          other values < 0
                 refer to pmErrStr(3).


---------------------------------------------------------

::

          PMAPI(3) and pmFreeEventResult(3).

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

   Performance Co-Pilot               PCP           PMUNPACKEVENTRECORDS(3)

--------------

Pages that refer to this page:
`pmextractvalue(3) <../man3/pmextractvalue.3.html>`__, 
`pmfreeeventresult(3) <../man3/pmfreeeventresult.3.html>`__

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
