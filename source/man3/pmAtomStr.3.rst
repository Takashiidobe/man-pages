.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmatomstr(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMATOMSTR(3)            Library Functions Manual            PMATOMSTR(3)

NAME
-------------------------------------------------

::

          pmAtomStr, pmAtomStr_r - convert a performance metric value into
          a string


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          const char *pmAtomStr(const pmAtomValue *avp, int type);
          char *pmAtomStr_r(const pmAtomValue *avp, int type, char *buf,
          int buflen);

          cc ... -lpcp


---------------------------------------------------------------

::

          All performance metric values may be encoded in a pmAtomValue
          union, defined as follows;

               typedef union {
                   __int32_t    l;     /* 32-bit signed */
                   __uint32_t   ul;    /* 32-bit unsigned */
                   __int64_t    ll;    /* 64-bit signed */
                   __uint64_t   ull;   /* 64-bit unsigned */
                   float        f;     /* 32-bit floating point */
                   double       d;     /* 64-bit floating point */
                   char         *cp;   /* char ptr */
                   pmValueBlock *vbp;  /* pmValueBlock ptr */
               } pmAtomValue;

          Given the performance metric value pointed to by avp, and a
          performance metric type defined by type, pmAtomStr will generate
          the corresponding metric value as a string, suitable for
          diagnostic or report output.  The pmAtomStr_r function does the
          same, but stores the result in a user-supplied buffer buf of
          length buflen, which should have room for at least 80 bytes.

          The value for type is typically extracted from a pmDesc
          structure, following a call to pmLookupDesc(3) for a particular
          performance metric.

          If the type is PM_TYPE_STRING values longer than 38 characters
          will be truncated after 34 characters, and truncation shown with
          ellipsis ``...'' at the end of the value.

          If the type is PM_TYPE_AGGREGATE then up to the first three
          32-bit words are displayed as hexadecimal values.

          If the type is PM_TYPE_EVENT then a summary of the number of
          event records found in the value is generated.

          The return value from pmAtomStr is held in a single static
          buffer, so the returned value is only valid until the next call
          to pmAtomStr.


---------------------------------------------------

::

          pmAtomStr returns a pointer to a static buffer and hence is not
          thread-safe.  Multi-threaded applications should use pmAtomStr_r
          instead.


---------------------------------------------------------

::

          PMAPI(3), pmConvScale(3), pmExtractValue(3), pmLookupDesc(3),
          pmPrintValue(3), pmTypeStr(3) and pmUnitsStr(3).

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

   Performance Co-Pilot               PCP                      PMATOMSTR(3)

--------------

Pages that refer to this page:
`pmconvscale(3) <../man3/pmconvscale.3.html>`__, 
`pmextractvalue(3) <../man3/pmextractvalue.3.html>`__, 
`pmlookupdesc(3) <../man3/pmlookupdesc.3.html>`__, 
`pmprintvalue(3) <../man3/pmprintvalue.3.html>`__, 
`pmsemstr(3) <../man3/pmsemstr.3.html>`__, 
`pmtypestr(3) <../man3/pmtypestr.3.html>`__, 
`pmunitsstr(3) <../man3/pmunitsstr.3.html>`__

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
