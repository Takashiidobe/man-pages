.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdafetch(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `CAVEAT <#CAVEAT>`__ \|           |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDAFETCH(3)            Library Functions Manual            PMDAFETCH(3)

NAME
-------------------------------------------------

::

          pmdaFetch, pmdaSetFetchCallBack - fill a pmResult structure with
          the requested metric values


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmda.h>

          int pmdaFetch(int numpmid, pmID *pmidlist, pmResult **resp,
                  pmdaExt *pmda);
          void pmdaSetFetchCallBack(pmdaInterface *dispatch,
                  pmdaFetchCallBack callback);

          cc ... -lpcp_pmda -lpcp


---------------------------------------------------------------

::

          pmdaFetch is a generic callback used by a PMDA(3) to process a
          fetch request from pmcd(1).  The request from pmcd is initiated
          by a client calling pmFetch(3).

          This is one of the few generic callbacks in libpcp_pmda (see
          PMDA(3)) that is incomplete, requiring a further
          pmdaFetchCallBack method of its own.  The additional callback
          should be registered using pmdaSetFetchCallBack and the
          pmdaFetchCallBack method has the following prototype:
          int func(pmdaMetric *mdesc, unsigned int inst, pmAtomValue *avp)

          pmdaFetch will allocate and resize the resp result structure, to
          store values for the numpmid metrics listed in pmidlist.

          For each instance listed in the profile (see pmdaProfile(3)) of
          each metric listed in pmidlist, the pmdaFetchCallBack method is
          called to fill the pmAtomValue structure identified by avp with a
          value for a specific metric-instance pair identified by the
          metric descriptor mdesc and the instance inst.  This value is
          then copied into the pmResult structure.

          The pmdaFetchCallBack method should return a value less than zero
          for an error, and the most likely cases would be PM_ERR_PMID if
          the metric identified by mdesc is not known to the method, or
          PM_ERR_INST if the method believes the instance inst is not known
          for the metric identified by mdesc.

          The success error codes depend on the version of PMDA_INTERFACE
          the PMDA is using.

          If the PMDA is using PMDA_INTERFACE_2 then on success the
          pmdaFetchCallBack method should return 0.

          If the PMDA is using PMDA_INTERFACE_3 or PMDA_INTERFACE_4 then on
          success the pmdaFetchCallBack method should return 1 if a value
          is returned via avp, else 0 if no values are currently available
          for the requested metric-instance pair although mdesc and inst
          both seem reasonable.

          If the PMDA is using PMDA_INTERFACE_5 or later then on success
          the pmdaFetchCallBack method should return PMDA_FETCH_STATIC (1)
          if the value returned via avp can be ignored by pmdaFetch once it
          has been copied into the pmResult structure, else
          PMDA_FETCH_DYNAMIC (2) if the value returned via avp uses the
          either the vp or cp fields of the pmAtomValue and the associated
          value (buffer) was allocated using one of malloc(3), calloc(3),
          realloc(3), strdup(3) etc. and pmdaFetch should release the
          memory by calling free(3) once a new buffer has been allocated
          and the value copied, else PMDA_FETCH_NOVALUES (0) if no values
          are currently available for the requested metric-instance pair
          although mdesc and inst both seem reasonable.

          If the pmdaFetchCallBack method returns a value for an instance
          of a metric of type PM_TYPE_STRING or PM_TYPE_AGGREGATE some
          special care is needed – the method should either use a static
          buffer, set avp->cp or avp->vp to the address of the buffer and
          return PMDA_FETCH_STATIC, or use a dynamically allocated buffer,
          keep a static reference to the buffer's address, return
          PMDA_FETCH_STATIC and free(3) or realloc(3) or reuse the buffer
          the next time the pmdaFetchCallBack method is called, else use a
          dynamically allocated buffer and return PMDA_FETCH_DYNAMIC.


-------------------------------------------------------

::

          The following code fragments are for a hypothetical PMDA has with
          metrics (A, B, C and D) and an instance domain (X) with two
          instances (X1 and X2).  The instance domain and metrics
          description tables (see pmdaInit(3)) could be defined as:

               static pmdaInstid _X[] = {
                   { 0, "X1" }, { 1, "X2" }
               };
               static pmdaIndom indomtab[] = {
               #define X_INDOM 0
                   { 0, 2, _X },
               };
               static pmdaMetric metrictab[] = {
               /* A */
                   { (void *)0,
                     { PMDA_PMID(0,0), PM_TYPE_32, PM_INDOM_NULL,
                       PM_SEM_INSTANT, {0,0,0,0,0,0} }, },
               /* B */
                   { (void *)0,
                     { PMDA_PMID(0,1), PM_TYPE_DOUBLE, X_INDOM,
                       PM_SEM_INSTANT, {0,1,0,0,PM_TIME_SEC,0} }, },
               /* C */
                   { (void *)0,
                     { PMDA_PMID(0,2), PM_TYPE_STRING, PM_INDOM_NULL,
                       PM_SEM_INSTANT, {0,0,0,0,0,0} }, },
               /* D */
                   { (void *)0,
                     { PMDA_PMID(0,3), PM_TYPE_STRING, PM_INDOM_NULL,
                       PM_SEM_INSTANT, {0,0,0,0,0,0} }, },
               };

          A pmdaFetchCallBack method to be called from pmdaFetch could be
          defined as:

               int
               myFetchCallBack(pmdaMetric *mdesc, unsigned int inst, pmAtomValue *avp)
               {
                 static char sbuf[20]; // reuse this buffer
                 char        *dbuf;    // malloc'd
                 switch (pmID_item(mdesc->m_desc.pmid)) {
                   case 0:
                     /* assign some value for metric A */;
                     avp->l = ...
                     break;
                   case 1:
                     switch (inst) {
                         case 0:
                          /* assign a value for metric B, instance X1 */;
                             avp->d = ...
                             break;
                         case 1:
                          /* assign a value for metric B, instance X2 */;
                             avp->d = ...
                             break;
                         default:
                             return PM_ERR_INST;
                     }
                   case 2:
                     /* place value for metric C in dbuf[] */
                     memcpy(dbuf, ...);
                     avp->cp = dbuf;
                     break;
                   case 3:
                     avp->cp = (char *)malloc(somesize);
                     /* place value in avp->cp */
                     pmsprintf(avp->cp, somesize, ...);
                     return PMDA_FETCH_DYNAMIC;
                   default:
                     return PM_ERR_PMID;
                 }
                 return PMDA_FETCH_STATIC;
               }


-----------------------------------------------------

::

          The PMDA must be using PMDA_INTERFACE_2 or later, as specified in
          the call to pmdaDSO(3) or pmdaDaemon(3).


---------------------------------------------------------------

::

          The following error messages indicate that there is discrepancy
          between the namespace, pmdaMetric and pmdaIndom tables passed to
          pmdaInit(3), and the registered fetch callback:

          pmdaFetch: Requested metric metric is not defined
                 A requested metric metric is not listed in the pmdaMetric
                 table.  The namespace for this PMDA(3) may contain
                 additional metrics.

          pmdaFetch: PMID pmid not handled by fetch callback
                 The pmdaFetchCallBack method has returned PM_ERR_PMID.
                 This indicates that a metric may be listed in the
                 pmdaMetric table, but is not supported by the callback
                 method.

          pmdaFetch: Instance inst of PMID pmid not handled by fetch
          callback
                 The pmdaFetchCallBack method has returned PM_ERR_INST.
                 This indicates that an instance of metric is listed in the
                 pmdaIndom table, but is not supported by the callback
                 method.

          pmdaFetch: Fetch callback error:
                 The pmdaFetchCallBack method returned a result other than
                 PMDA_FETCH_NOVALUES, PMDA_FETCH_STATIC,
                 PMDA_FETCH_DYNAMIC, PM_ERR_PMID or PM_ERR_INST.

          pmdaFetch: Descriptor type (type) for metric pmid is bad
                 The data type type specified for the metric pmid in the
                 pmdaMetric table is illegal.

          pmdaFetch will return -errno if an error occurred while
          allocating the pmResult structure or copying the value from the
          pmAtomValue.


---------------------------------------------------------

::

          pmcd(1), PMAPI(3), PMDA(3), pmdaDaemon(3), pmdaDSO(3),
          pmdaInit(3) and pmFetch(3).

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

   Performance Co-Pilot               PCP                      PMDAFETCH(3)

--------------

Pages that refer to this page: `pmda(3) <../man3/pmda.3.html>`__, 
`pmdacache(3) <../man3/pmdacache.3.html>`__, 
`pmdadaemon(3) <../man3/pmdadaemon.3.html>`__, 
`pmdadso(3) <../man3/pmdadso.3.html>`__, 
`pmdainit(3) <../man3/pmdainit.3.html>`__, 
`pmdamain(3) <../man3/pmdamain.3.html>`__, 
`pmdaprofile(3) <../man3/pmdaprofile.3.html>`__

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
