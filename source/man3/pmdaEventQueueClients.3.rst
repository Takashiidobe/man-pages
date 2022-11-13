.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdaeventqueue(3) — Linux manual page
=====================================

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

   PMDAEVENTQUEUE(3)       Library Functions Manual       PMDAEVENTQUEUE(3)

NAME
-------------------------------------------------

::

          pmdaEventNewQueue, pmdaEventNewActiveQueue, pmdaEventQueueHandle,
          pmdaEventQueueAppend, pmdaEventQueueShutdown,
          pmdaEventQueueRecords, pmdaEventQueueClients,
          pmdaEventQueueCounter, pmdaEventQueueBytes, pmdaEventQueueMemory
          - utilities for PMDAs managing event queues


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmda.h>

          int pmdaEventNewQueue(const char *name, size_t maxmem);
          int pmdaEventNewActiveQueue(const char *name, size_t maxmem,  int
                  nclients);
          int pmdaEventQueueHandle(const char *name);
          int pmdaEventQueueAppend(int handle, void *buffer, size_t bytes,
                  struct timeval *tv);
          int pmdaEventQueueShutdown(int handle);

          typedef int (*pmdaEventDecodeCallBack)(int, void *, int, struct
                  timeval *, void *);
          int pmdaEventQueueRecords(int handle, pmAtomValue *avp, int
                  context, pmdaEventDecodeCallBack decoder, void *data);
          int pmdaEventQueueClients(int handle, pmAtomValue *avp);
          int pmdaEventQueueCounter(int handle, pmAtomValue *avp);
          int pmdaEventQueueBytes(int handle, pmAtomValue *avp);
          int pmdaEventQueueMemory(int handle, pmAtomValue *avp);

          cc ... -lpcp_pmda -lpcp


---------------------------------------------------------------

::

          A Performance Metrics Domain Agent (PMDA) that exports event
          records must effectively act an event multiplexer.  Events
          consumed by the PMDA may have to be forwarded on to any number of
          monitoring tools (or "client contexts").  These tools may be
          requesting events at different sampling intervals, and are very
          unlikely to request an event at the exact moment it arrives at
          the PMDA, making some form of event buffering and queueing scheme
          a necessity.  Events must be held by the PMDA until either all
          registered clients have been sent them, or until a memory limit
          has been reached by the PMDA at which point it must discard older
          events as new ones arrive.

          The routines described here are designed to assist the PMDA
          developer in managing both client contexts and queues of events
          at a high level.  These fit logically above lower level
          primitives, such as those described in pmdaEventNewArray(3), and
          shield the average PMDA from the details of directly building
          event record arrays for individual client contexts.

          The PMDA registers a new queue of events using either
          pmdaEventNewQueue or pmdaEventNewActiveQueue.  These are passed
          an identifying name (for diagnostic purposes, and for subsequent
          lookup by pmdaEventQueueLookup) and maxmem, an upper bound on the
          memory (in bytes) that can be consumed by events in this queue,
          before beginning to discard them (resulting in "missed" events
          for any client that has not kept up).  If a queue is dynamically
          allocated (such that the PMDA may already have clients connected)
          the pmdaEventNewActiveQueue interface should be used, with the
          additional numclients parameter indicating the count of active
          client connections.  The return is a negative error code on
          failure, suitable for decoding by the pmErrStr(3) routine.  Any
          non-negative value indicates success, and provides a handle
          suitable for passing into the other API routines.

          For each new event received by the PMDA, the pmdaEventQueueAppend
          routine should be called, placing that event into the queue
          identified by handle.  The event itself must be contained in the
          passed in buffer, having bytes length.  The timestamp associated
          with the event (time at which the event occurred) is passed in
          via the final tv parameter.

          In the PMDAs specific implementation of its fetch callback, when
          values for an event metric have been requested, the
          pmdaEventQueueRecords routine should be used.  It is passed the
          queue handle and the avp pmAtomValue structure to fill with event
          records, for the client making that fetch request (identified by
          the context parameter).  Finally, the PMDA must also pass in an
          event decoding routine, which is responsible for decoding the
          fields of a single event into the individual event parameters of
          that event.  The data parameter is an opaque cookie that can be
          used to pass situation-specific information into each decoder
          invocation.

          Under some situations it is useful for the PMDA to export state
          about the queues under its control.  The accessor routines -
          pmdaEventQueueClients, pmdaEventQueueCounter, pmdaEventQueueBytes
          and pmdaEventQueueMemory provide a mechanism for querying a queue
          by its handle and filling in a pmAtomValue structure that the
          pmdaFetchCallBack method should return.


---------------------------------------------------------

::

          PMAPI(3), PMDA(3), pmdaEventNewClient(3) and
          pmdaEventNewArray(3).

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

   Performance Co-Pilot               PCP                 PMDAEVENTQUEUE(3)

--------------

Pages that refer to this page:
`pmdaeventarray(3) <../man3/pmdaeventarray.3.html>`__, 
`pmdaeventclient(3) <../man3/pmdaeventclient.3.html>`__

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
