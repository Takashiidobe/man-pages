.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdamain(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CALLBACKS <#CALLBACKS>`__ \|     |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDAMAIN(3)             Library Functions Manual             PMDAMAIN(3)

NAME
-------------------------------------------------

::

          pmdaMain, pmdaGetContext, pmdaSetResultCallBack,
          pmdaSetCheckCallBack, pmdaSetDoneCallBack,
          pmdaSetEndContextCallBack - generic PDU processing for a PMDA


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmda.h>

          cc ... -lpcp_pmda -lpcp

          void pmdaMain(pmdaInterface *dispatch);
          void pmdaSetCheckCallBack(pmdaInterface *dispatch,
                  pmdaCheckCallBack callback);
          void pmdaSetDoneCallBack(pmdaInterface *dispatch,
                  pmdaDoneCallBack callback);
          void pmdaSetResultCallBack(pmdaInterface *dispatch,
                  pmdaResultCallBack callback);
          void pmdaSetEndContextCallBack(pmdaInterface *dispatch,
                  pmdaEndContextCallBack callback);
          int pmdaGetContext(void);


---------------------------------------------------------------

::

          For Performance Metric Domain Agents (PMDA(3)) using the binary
          PDU protocols to communicate with pmcd(1), the routine pmdaMain
          provides a generic implementation of the PDU-driven main loop.

          dispatch describes how to process each incoming PDU. It is a
          vector of function pointers, one per request PDU type, as used in
          the DSO interface for a PMDA, namely:

          /*
           * Interface Definitions for PMDA Methods
           */
          typedef struct {
              int domain;         /* set/return performance metrics domain id here */
              struct {
                  unsigned int    pmda_interface: 8; /* PMDA DSO interface version */
                  unsigned int    pmapi_version : 8; /* PMAPI version */
                  unsigned int    flags : 16;        /* optional feature flags */
              } comm;             /* set/return communication and version info */
              int status;         /* return initialization status here */

              union {
                  struct {                              /* PMDA_INTERFACE_2 or _3 */
                      pmdaExt *ext;
                      int (*profile)(pmProfile *, pmdaExt *);
                      int (*fetch)(int, pmID *, pmResult **, pmdaExt *);
                      int (*desc)(pmID, pmDesc *, pmdaExt *);
                      int (*instance)(pmInDom, int, char *, pmInResult **, pmdaExt *);
                      int (*text)(int, int, char **, pmdaExt *);
                      int (*store)(pmResult *, pmdaExt *);
                  } two, three;

                  struct {                              /* PMDA_INTERFACE_4 or _5 */
                      pmdaExt *ext;
                      int     (*profile)(pmProfile *, pmdaExt *);
                      int     (*fetch)(int, pmID *, pmResult **, pmdaExt *);
                      int     (*desc)(pmID, pmDesc *, pmdaExt *);
                      int     (*instance)(pmInDom, int, char *, pmInResult **, pmdaExt *);
                      int     (*text)(int, int, char **, pmdaExt *);
                      int     (*store)(pmResult *, pmdaExt *);
                      int     (*pmid)(char *, pmID *, pmdaExt *);
                      int     (*name)(pmID, char ***, pmdaExt *);
                      int     (*children)(char *, int, char ***, int **, pmdaExt *);
                  } four, five;

                  struct {                              /* PMDA_INTERFACE_6 */
                      pmdaExt *ext;
                      int     (*profile)(pmProfile *, pmdaExt *);
                      int     (*fetch)(int, pmID *, pmResult **, pmdaExt *);
                      int     (*desc)(pmID, pmDesc *, pmdaExt *);
                      int     (*instance)(pmInDom, int, char *, pmInResult **, pmdaExt *);
                      int     (*text)(int, int, char **, pmdaExt *);
                      int     (*store)(pmResult *, pmdaExt *);
                      int     (*pmid)(char *, pmID *, pmdaExt *);
                      int     (*name)(pmID, char ***, pmdaExt *);
                      int     (*children)(char *, int, char ***, int **, pmdaExt *);
                      int     (*attribute)(int, int, const char *, int, pmdaExt *);
                  } six;
              } version;

          } pmdaInterface;

          This structure has been extended to incorporate the multiple
          interface versions that have evolved over time.  For pmdaMain,
          dispatch->domain and dispatch->status are ignored.  The
          comm.pmda_interface field is used to determine the interface used
          by the PMDA.  Setting this field to PMDA_INTERFACE_2 or
          PMDA_INTERFACE_3 will force pmdaMain to use the callbacks in the
          version.two or version.three structure.  A setting of
          PMDA_INTERFACE_4 or PMDA_INTERFACE_5 will force pmdaMain to use
          the callbacks in the version.four or version.five structure, and
          similarly a PMDA_INTERFACE_6 setting forces pmdaMain to use the
          callbacks in the version.six structure.  Any other value will
          result in an error and termination of pmdaMain.

          Note that the use of dispatch as the interface between the
          pmcd(1) and the methods of the PMDA allows each PMDA to be
          implemented as though it were a DSO, with pmdaMain providing a
          convenient wrapper that may be used to convert from the DSO
          interface to the binary PDU (daemon PMDA) interface.

          pmdaMain executes as a continuous loop, returning only when an
          end of file is encountered on the PDU input file descriptor.


-----------------------------------------------------------

::

          In addition to the individual PDU processing callbacks -
          pmdaProfile(3), pmdaFetch(3), pmdaDesc(3), pmdaInstance(3),
          pmdaText(3), pmdaStore(3), pmdaPMID(3), pmdaName(3),
          pmdaChildren(3), and pmdaAttribute(3) there are other callbacks
          that can affect or inform all PDU processing within a PMDA,
          namely check, done and end.  These callbacks should be set with
          pmdaSetCheckCallBack, pmdaSetDoneCallBack and
          pmdaSetEndContextCallBack.

          If not null, check is called after each PDU is received (but
          before it was processed), and done is called after each PDU is
          sent.  If check returns a value less than zero (typically
          PM_ERR_AGAIN), the PDU processing is skipped and in most cases
          the function value is returned as an error PDU to pmcd(1) - this
          may be used for PMDAs that require some sort of deferred
          connection or reconnect protocols for the underlying sources of
          performance metrics, e.g. a DBMS.  The error indication from
          check is not passed back to pmcd(1) in the cases where no
          acknowledgment is expected, e.g. for a PDU_PROFILE.

          The end callback allows a PMDA to keep track of state for
          individual clients that are requesting it to perform actions (PDU
          processing).  Using pmdaGetContext a PMDA can determine, at any
          point, an integer identifier that uniquely identifies the client
          tools at the remote end of PMCD (for local context modes, this
          identifier is always zero).  This becomes very important for
          handling event metrics, where each event must be propagated once
          only to each interested client.  It also underlies the mechanism
          whereby connection information is passed to the PMDA, such as the
          the credentials (user and group identifiers) for the client tool.

          One final callback mechanism is provided for handling the
          pmResult built for a PDU_RESULT in response to a PDU_FETCH
          request.  By default, pmdaMain will free the pmResult once the
          result has been sent to the pmcd(1).  For some PMDAs this is
          inappropriate, e.g. the pmResult is statically allocated, or
          contains a hybrid of pinned PDU buffer information and
          dynamically allocated information.  pmdaSetResultCallBack may be
          used to define an alternative callback from pmdaMain.


---------------------------------------------------------------

::

          These messages may be appended to the PMDA's log file:

          PMDA interface version interface not supported
                 The interface version is not supported by pmdaMain.

          Unrecognized pdu type
                 The PMDA received a PDU from pmcd that it does not
                 recognize. This may indicate that the pmcd process is
                 using a more advanced interface than pmdaMain.

          If the PMAPI(3) debugging control options have the ``libpmda''
          option set then each PDU that is received is reported in the
          PMDA's log file.


---------------------------------------------------------

::

          pmcd(1), PMAPI(3), PMDA(3), pmdaProfile(3), pmdaFetch(3),
          pmdaDesc(3), pmdaInstance(3), pmdaText(3), pmdaStore(3),
          pmdaPMID(3), pmdaName(3), pmdaChildren(3), and pmdaAttribute(3).

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

   Performance Co-Pilot               PCP                       PMDAMAIN(3)

--------------

Pages that refer to this page: `pmda(3) <../man3/pmda.3.html>`__, 
`pmdaattribute(3) <../man3/pmdaattribute.3.html>`__, 
`pmdachildren(3) <../man3/pmdachildren.3.html>`__, 
`pmdaeventclient(3) <../man3/pmdaeventclient.3.html>`__, 
`pmdaname(3) <../man3/pmdaname.3.html>`__, 
`pmdapmid(3) <../man3/pmdapmid.3.html>`__

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
