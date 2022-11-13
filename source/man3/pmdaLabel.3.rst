.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdalabel(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CAVEAT <#CAVEAT>`__ \|           |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDALABEL(3)            Library Functions Manual            PMDALABEL(3)

NAME
-------------------------------------------------

::

          pmdaLabel, pmdaSetLabelCallBack - fill pmdaLabelSet structures
          with metric labels


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmda.h>

          int pmdaLabel(int ident, int type, pmLabelSet **sets, pmdaExt
                  *pmda);
          int pmdaSetLabelCallBack(pmdaInterface *dispatch,
                  pmdaLabelCallBack callback);

          cc ... -lpcp_pmda -lpcp


---------------------------------------------------------------

::

          As part of the Performance Metrics Domain Agent (PMDA) API (see
          PMDA(3)), pmdaLabel uses the standard PMDA(3) data structures to
          return the labels for performance domain, instance domain, metric
          or individual instances in "JSONB" format in the given sets data
          structure.

          The type argument determines the interpretation of ident and the
          requested form of label, as follows:

          PM_LABEL_DOMAIN
              when ident is a PMDA domain identifier,

          PM_LABEL_CLUSTER
              when ident is a metric identifier and labels for the cluster
              containing that metric are being requested.

          PM_LABEL_ITEM
              when ident is a metric identifier,

          PM_LABEL_INDOM
              when ident is an instance domain identifier, or

          PM_LABEL_INSTANCES
              when ident is a metric identifier and labels for all
              instances of that metric are being requested.

          The label sets pointer must be initialised to NULL before calling
          pmdaLabel and space is only to be allocated when labels are
          present and returned.  In this case, the return code must
          indicate the number of label sets that have been allocated.  This
          will only ever be greater than one in the PM_LABEL_INSTANCES
          case.

          This is one of the few generic callbacks in libpcp_pmda (see
          PMDA(3)) that is incomplete, requiring a further
          pmdaLabelCallBack method of its own.  The additional callback
          should be registered using pmdaSetLabelCallBack and the
          pmdaLabelCallBack method has the following prototype:
          int func(pmInDom indom, unsigned int inst, pmLabelSet **set)

          The purpose of the pmdaLabelCallBack routine is to return the
          label(s) for an individual instance inst of a given instance
          domain, indom.  Its successful return code differs significantly
          to pmdaLabel, as described below.


-----------------------------------------------------

::

          The PMDA must be using PMDA_PROTOCOL_7 or later, as specified in
          the call to pmdaDSO(3) or pmdaDaemon(3).


---------------------------------------------------------------

::

          On success pmdaLabel returns the number of label sets created.
          This is usually zero or one, except in the case of
          PM_LABEL_INSTANCES where more than one label sets will often be
          returned, one for each instance of the requested metric.

          By contrast, on success of the pmdaLabelCallBack routine the
          number of labels successfully added to the provided labelset
          pointer must be returned (and not the total number of label
          sets).

          If labels for the requested entity could not be obtained due to a
          catastrophic failure, such as an out of memory condition, these
          routines will return a negative error code.


---------------------------------------------------------

::

          pminfo(1), malloc(3), PMAPI(3), PMDA(3), pmdaDaemon(3),
          pmdaDSO(3), pmdaInit(3) and pmLookupLabels(3).

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

   Performance Co-Pilot               PCP                      PMDALABEL(3)

--------------

Pages that refer to this page:
`pmdacache(3) <../man3/pmdacache.3.html>`__, 
`pmdainstance(3) <../man3/pmdainstance.3.html>`__

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
