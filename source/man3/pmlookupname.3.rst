.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmlookupname(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMLOOKUPNAME(3)         Library Functions Manual         PMLOOKUPNAME(3)

NAME
-------------------------------------------------

::

          pmLookupName - translate performance metric names into PMIDs


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmLookupName(int numpmid, const char **namelist, pmID *pmidlist);

          cc ... -lpcp


---------------------------------------------------------------

::

          Given a list in namelist containing numpmid full pathnames for
          performance metrics from a Performance Metrics Name Space (PMNS),
          pmLookupName returns the list of associated Performance Metric
          Identifiers (PMIDs) via pmidlist.

          The result from pmLookupName depends on the presence of any
          lookup failures, their severity and the number of metrics being
          looked up.

          1.  If there are no lookup failures, the return value will be
              numpmid.

          2.  If a fatal error is encountered, the return value will be
              less than 0.  For example PM_ERR_TOOSMALL, PM_ERR_NOPMNS or
              PM_ERR_IPC.

          3.  If numpmid is greater than one and non-fatal error(s) are
              encountered, the return value is the number of metric names
              that have successfully been looked up (greater than or equal
              to zero and less than or equal to numpmid).

          4.  If numpmid is one and a non-fatal error is encountered, the
              return value is the error code (less than zero).

          When errors are encountered, any metrics that cannot be looked up
          result in the corresponding element of pmidlist being set to
          PM_ID_NULL.

          The slightly convoluted error protocol allows bulk lookups, then
          probing for more error details in the case of a specific failure,
          as shown in the EXAMPLES section below.

          Note that the error protocol guarantees there is a 1:1
          relationship between the elements of namelist and pmidlist, hence
          both lists contain exactly numpmid elements.  For this reason,
          the caller is expected to have pre-allocated a suitably sized
          array for pmidlist.


-------------------------------------------------------

::

          #include <pcp/pmapi.h>

          #define NUMPMID (sizeof(names)/sizeof(const char *))
          const char *names[] = {
                         "sample.bin",
                         "sample",
                         "sample.bog",
                         "sample.secret.bar",
                         "sample.secret.bar.bad"
                       };
          pmID pmids[NUMPMID];

          int
          main(int argc, char **argv)
          {
              int   sts;
              int   numpmid = NUMPMID;

              pmNewContext(PM_CONTEXT_HOST, "local:");

              sts = pmLookupName(numpmid, names, pmids);

              if (sts < 0) {
               fprintf(stderr, "pmLookupName failed: %s0, pmErrStr(sts));
               exit(1);
              }
              if (sts != numpmid) {
               /*
                * some of the lookups failed ... report the reason(s)
                */
               int  i;

               for (i = 0; i < numpmid; i++) {
                   if (pmids[i] != PM_ID_NULL) continue;
                   /* this one failed */
                   sts = pmLookupName(1, &names[i], &pmids[i]);
                   fprintf(stderr, "%s: lookup failed: %s0, names[i], pmErrStr(sts));
               }
               exit(1);
              }

              /* all good ... */
              ...
          }


---------------------------------------------------------------

::

          PM_ERR_TOOSMALL
                 numpmid must be at least 1

          PM_ERR_NOPMNS
                 Failed to access a PMNS for operation.  Note that if the
                 application hasn't a priori called pmLoadNameSpace(3) and
                 wants to use the distributed PMNS, then a call to
                 pmLookupName must be made after the creation of a context
                 (see pmNewContext(3)).

          PM_ERR_NAME
                 namelist[0] does not correspond to a valid metric name in
                 the PMNS.

          PM_ERR_NONLEAF
                 namelist[0] refers to a node in the PMNS but it was not a
                 leaf node.

          PM_ERR_*
                 Other diagnostics are for protocol failures when accessing
                 the distributed PMNS.


---------------------------------------------------------

::

          PMAPI(3), pmGetChildren(3), pmGetChildrenStatus(3),
          pmGetConfig(3), pmLoadNameSpace(3), pmNameID(3), pmNewContext(3),
          pcp.conf(5) and pcp.env(5).

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

   Performance Co-Pilot               PCP                   PMLOOKUPNAME(3)

--------------

Pages that refer to this page:
`pmgenmap(1) <../man1/pmgenmap.1.html>`__, 
`pmprobe(1) <../man1/pmprobe.1.html>`__, 
`pmseries(1) <../man1/pmseries.1.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`pmdapmid(3) <../man3/pmdapmid.3.html>`__, 
`pmfetch(3) <../man3/pmfetch.3.html>`__, 
`pmfetchgroup(3) <../man3/pmfetchgroup.3.html>`__, 
`pmgetchildren(3) <../man3/pmgetchildren.3.html>`__, 
`pmgetchildrenstatus(3) <../man3/pmgetchildrenstatus.3.html>`__, 
`pmgetderivedcontrol(3) <../man3/pmgetderivedcontrol.3.html>`__, 
`pmlookuplabels(3) <../man3/pmlookuplabels.3.html>`__, 
`pmnameall(3) <../man3/pmnameall.3.html>`__, 
`pmnameid(3) <../man3/pmnameid.3.html>`__, 
`pmparsemetricspec(3) <../man3/pmparsemetricspec.3.html>`__, 
`pmregisterderived(3) <../man3/pmregisterderived.3.html>`__, 
`pmwebapi(3) <../man3/pmwebapi.3.html>`__, 
`QmcContext(3) <../man3/QmcContext.3.html>`__

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
