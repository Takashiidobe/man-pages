.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdaeventclient(3) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDAEVENTCLIENT(3)      Library Functions Manual      PMDAEVENTCLIENT(3)

NAME
-------------------------------------------------

::

          pmdaEventNewClient, pmdaEventEndClient, pmdaEventClients - client
          context tracking interfaces for event queues


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmda.h>

          int pmdaEventNewClient(int context);
          int pmdaEventEndClient(int context);
          int pmdaEventClients(pmAtomValue *avp);

          cc ... -lpcp_pmda -lpcp


---------------------------------------------------------------

::

          A Performance Metrics Domain Agent (PMDA) that exports event
          records needs to track which clients are connected to it, in
          order that it can track which events have been sent to which
          clients so far.  Only once an event has been sent to all
          monitoring tools that registered an interest can the event be
          discarded and any memory reclaimed.

          The PMDA(3) library provides callback routines for PMDA
          developers to provide custom handling of client connections and
          disconnections.  If the PMDA is making use of the event queueing
          mechanism provided by pmdaEventNewQueue(3) and friends, client
          connections and disconnections must be tracked via calls to
          pmdaEventNewClient and pmdaEventEndClient respectively.  This
          allows the library to keep track of when events can be discarded
          from a queue, for example, for the context specified.  This
          parameter is passed into the e_endCallBack function directly, and
          for other callback functions is available via the e_context field
          of the pmdaExt structure.  Additionally, it can be queried at any
          time using pmdaGetContext(3).

          Sometimes it is useful for the PMDA to export a metric indicating
          the current count of attached clients - this is available using
          the pmdaEventClients routine, which will fill in the avp
          pmAtomValue structure on behalf of a PMDA fetch callback routine.


---------------------------------------------------------

::

          pmdaEventNewArray(3), pmdaEventNewQueue(3), PMAPI(3), PMDA(3) and
          pmEventFlagsStr(3).

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

   Performance Co-Pilot               PCP                PMDAEVENTCLIENT(3)

--------------

Pages that refer to this page:
`pmdaeventarray(3) <../man3/pmdaeventarray.3.html>`__, 
`pmdaeventqueue(3) <../man3/pmdaeventqueue.3.html>`__

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
