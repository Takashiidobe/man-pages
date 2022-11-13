.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmextractvalue(3) — Linux manual page
=====================================

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

   PMEXTRACTVALUE(3)       Library Functions Manual       PMEXTRACTVALUE(3)

NAME
-------------------------------------------------

::

          pmExtractValue - extract a performance metric value from a
          pmResult structure


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmExtractValue(int valfmt, const pmValue *ival, int itype,
                  pmAtomValue *oval, int otype);

          cc ... -lpcp


---------------------------------------------------------------

::

          The pmValue structure is embedded within the pmResult structure
          that is used to return one or more performance metrics; see
          pmFetch(3).

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

          The routine pmExtractValue provides a convenient mechanism for
          extracting values from the pmValue part of a pmResult structure,
          optionally converting the data type, and making the result
          available to the application programmer.

          itype defines the data type of the input value held in ival
          according to the storage format defined by valfmt (see
          pmFetch(3)).  otype defines the data type of the result to be
          placed in oval.

          The value for itype is typically extracted from a pmDesc
          structure, following a call to pmLookupDesc(3) for a particular
          performance metric.

          The otype value should be one of the defined PM_TYPE_...  values,
          that have a 1:1 correspondence with the fields in the pmAtomValue
          union.

          Normally the valfmt parameter would be plucked from the same
          pmResult structure that provides the ival parameter, and if
          valfmt specifies PM_VAL_INSITU, then the following types are not
          allowed, as these cannot be encoded in 32-bits; __int64_t,
          __uint64_t, double, char * and void * (the corresponding itype
          values are PM_TYPE_64, PM_TYPE_U64, PM_TYPE_DOUBLE,
          PM_TYPE_STRING, PM_TYPE_AGGREGATE and PM_TYPE_EVENT
          respectively).  If valfmt specifies PM_VAL_PTR, then the value
          will be extracted from the associated pmValueBlock structure, and
          the __int32_t, __uint32_t and float options (itype being
          PM_TYPE_32, PM_TYPE_U32 and PM_TYPE_FLOAT respectively) are not
          allowed, as PM_VAL_INSITU is the appropriate encoding for these.

          The following table defines the various possibilities for the
          type conversion -- the input type (itype) is shown vertically,
          and the output type (otype) is shown horizontally.  Y means the
          conversion is always acceptable, N means the conversion can never
          be performed (the function returns PM_ERR_CONV), P means the
          conversion may lose accuracy (but no error status is returned), T
          means the result may be subject to high-order truncation (in
          which case the function returns PM_ERR_TRUNC) and S means the
          conversion may be impossible due to the sign of the input value
          (in which case the function returns PM_ERR_SIGN).  If an error
          occurs, the value represented by oval will be zero (or NULL).

          Note that although some of the conversions involving the types
          PM_TYPE_STRING and PM_TYPE_AGGREGATE are indeed possible, but are
          marked N - the rationale is that pmExtractValue should not be
          attempting to duplicate functionality already available in the C
          library via sscanf(3) and sprintf(3).

          No conversion involving the type PM_TYPE_EVENT is supported.

                | 32  |  U32  | 64  |  U64  | FLOAT | DBLE | STRNG | AGGR | EVENT
          ======|=====|=======|=====|=======|=======|======|=======|======|=======
          32    |  Y  |   S   |  Y  |   S   |   P   |  P   |   N   |  N   |   N
          U32   |  T  |   Y   |  Y  |   Y   |   P   |  P   |   N   |  N   |   N
          64    |  T  |  T,S  |  Y  |   S   |   P   |  P   |   N   |  N   |   N
          U64   |  T  |   T   |  T  |   Y   |   P   |  P   |   N   |  N   |   N
          FLOAT | P,T | P,T,S | P,T | P,T,S |   Y   |  Y   |   N   |  N   |   N
          DBLE  | P,T | P,T,S | P,T | P,T,S |   P   |  Y   |   N   |  N   |   N
          STRNG |  N  |   N   |  N  |   N   |   N   |  N   |   Y   |  N   |   N
          AGGR  |  N  |   N   |  N  |   N   |   N   |  N   |   N   |  Y   |   N
          EVENT |  N  |   N   |  N  |   N   |   N   |  N   |   N   |  N   |   N

          In the cases where multiple conversion errors could occur, the
          first encountered error will be notified, and the order of
          checking is not defined.

          If the output conversion is to one of the pointer types, i.e.
          otype is PM_TYPE_STRING or PM_TYPE_AGGREGATE, then the value
          buffer will have been allocated by pmExtractValue(3) using
          malloc(3), and it is the caller's responsibility to free the
          space when it is no longer required.

          Although this function appears rather complex, it has been
          constructed to assist the development of performance tools that
          wish to convert values, whose type is only known via the type
          field in a pmDesc structure, into a canonical type for local
          processing.  See the pmFetchGroup functions for a simpler
          alternative.


---------------------------------------------------------------

::

          PM_ERR_CONV

                 Impossible conversion, marked by N in above table

          PM_ERR_TRUNC

                 High-order truncation occurred

          PM_ERR_SIGN

                 Conversion of negative value to unsigned type attempted


---------------------------------------------------------

::

          PMAPI(3), pmAtomStr(3), pmConvScale(3), pmFetch(3),
          pmFetchGroup(3), pmLookupDesc(3), pmPrintValue(3), pmTypeStr(3),
          pmUnitsStr(3) and pmUnpackEventRecords(3).

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

   Performance Co-Pilot               PCP                 PMEXTRACTVALUE(3)

--------------

Pages that refer to this page:
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`pmatomstr(3) <../man3/pmatomstr.3.html>`__, 
`pmconvscale(3) <../man3/pmconvscale.3.html>`__, 
`pmextractvalue(3) <../man3/pmextractvalue.3.html>`__, 
`pmfetch(3) <../man3/pmfetch.3.html>`__, 
`pmfetchgroup(3) <../man3/pmfetchgroup.3.html>`__, 
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
