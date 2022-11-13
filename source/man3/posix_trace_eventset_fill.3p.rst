.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_trace_eventset_add(3p) — Linux manual page
================================================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   POSIX_TRACE_EVENTSET_ADD(3P)X Programmer's Manual_TRACE_EVENTSET_ADD(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          posix_trace_eventset_add, posix_trace_eventset_del,
          posix_trace_eventset_empty, posix_trace_eventset_fill,
          posix_trace_eventset_ismember — manipulate trace event type sets
          (TRACING)


---------------------------------------------------------

::

          #include <trace.h>

          int posix_trace_eventset_add(trace_event_id_t event_id,
              trace_event_set_t *set);
          int posix_trace_eventset_del(trace_event_id_t event_id,
              trace_event_set_t *set);
          int posix_trace_eventset_empty(trace_event_set_t *set);
          int posix_trace_eventset_fill(trace_event_set_t *set, int what);
          int posix_trace_eventset_ismember(trace_event_id_t event_id,
              const trace_event_set_t *restrict set, int *restrict ismember);


---------------------------------------------------------------

::

          These primitives manipulate sets of trace event types. They
          operate on data objects addressable by the application, not on
          the current trace event filter of any trace stream.

          The posix_trace_eventset_add() and posix_trace_eventset_del()
          functions, respectively, shall add or delete the individual trace
          event type specified by the value of the argument event_id to or
          from the trace event type set pointed to by the argument set.
          Adding a trace event type already in the set or deleting a trace
          event type not in the set shall not be considered an error.

          The posix_trace_eventset_empty() function shall initialize the
          trace event type set pointed to by the set argument such that all
          trace event types defined, both system and user, shall be
          excluded from the set.

          The posix_trace_eventset_fill() function shall initialize the
          trace event type set pointed to by the argument set, such that
          the set of trace event types defined by the argument what shall
          be included in the set. The value of the argument what shall
          consist of one of the following values, as defined in the
          <trace.h> header:

          POSIX_TRACE_WOPID_EVENTS
                All the process-independent implementation-defined system
                trace event types are included in the set.

          POSIX_TRACE_SYSTEM_EVENTS
                All the implementation-defined system trace event types are
                included in the set, as are those defined in POSIX.1‐2008.

          POSIX_TRACE_ALL_EVENTS
                All trace event types defined, both system and user, are
                included in the set.

          Applications shall call either posix_trace_eventset_empty() or
          posix_trace_eventset_fill() at least once for each object of type
          trace_event_set_t prior to any other use of that object. If such
          an object is not initialized in this way, but is nonetheless
          supplied as an argument to any of the posix_trace_eventset_add(),
          posix_trace_eventset_del(), or posix_trace_eventset_ismember()
          functions, the results are undefined.

          The posix_trace_eventset_ismember() function shall test whether
          the trace event type specified by the value of the argument
          event_id is a member of the set pointed to by the argument set.
          The value returned in the object pointed to by ismember argument
          is zero if the trace event type identifier is not a member of the
          set and a value different from zero if it is a member of the set.


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return a value
          of zero. Otherwise, they shall return the corresponding error
          number.


-----------------------------------------------------

::

          These functions may fail if:

          EINVAL The value of one of the arguments is invalid.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The posix_trace_eventset_add(), posix_trace_eventset_del(),
          posix_trace_eventset_empty(), posix_trace_eventset_fill(), and
          posix_trace_eventset_ismember() functions may be removed in a
          future version.


---------------------------------------------------------

::

          posix_trace_eventid_equal(3p), posix_trace_get_filter(3p)

          The Base Definitions volume of POSIX.1‐2017, trace.h(0p)


-----------------------------------------------------------

::

          Portions of this text are reprinted and reproduced in electronic
          form from IEEE Std 1003.1-2017, Standard for Information
          Technology -- Portable Operating System Interface (POSIX), The
          Open Group Base Specifications Issue 7, 2018 Edition, Copyright
          (C) 2018 by the Institute of Electrical and Electronics
          Engineers, Inc and The Open Group.  In the event of any
          discrepancy between this version and the original IEEE and The
          Open Group Standard, the original IEEE and The Open Group
          Standard is the referee document. The original Standard can be
          obtained online at http://www.opengroup.org/unix/online.html .

          Any typographical or formatting errors that appear in this page
          are most likely to have been introduced during the conversion of
          the source files to man page format. To report such errors, see
          https://www.kernel.org/doc/man-pages/reporting_bugs.html .

   IEEE/The Open Group               2017      POSIX_TRACE_EVENTSET_ADD(3P)

--------------

Pages that refer to this page:
`trace.h(0p) <../man0/trace.h.0p.html>`__, 
`posix_trace_get_filter(3p) <../man3/posix_trace_get_filter.3p.html>`__

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
