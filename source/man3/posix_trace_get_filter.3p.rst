.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_trace_get_filter(3p) — Linux manual page
==============================================

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

   POSIX_TRACE_GET_FILTER(3P)SIX Programmer's ManualIX_TRACE_GET_FILTER(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          posix_trace_get_filter, posix_trace_set_filter — retrieve and set
          the filter of an initialized trace stream (TRACING)


---------------------------------------------------------

::

          #include <trace.h>

          int posix_trace_get_filter(trace_id_t trid, trace_event_set_t *set);
          int posix_trace_set_filter(trace_id_t trid,
              const trace_event_set_t *set, int how);


---------------------------------------------------------------

::

          The posix_trace_get_filter() function shall retrieve, into the
          argument pointed to by set, the actual trace event filter from
          the trace stream specified by trid.

          The posix_trace_set_filter() function shall change the set of
          filtered trace event types after a trace stream identified by the
          trid argument is created. This function may be called prior to
          starting the trace stream, or while the trace stream is active.
          By default, if no call is made to posix_trace_set_filter(), all
          trace events shall be recorded (that is, none of the trace event
          types are filtered out).

          If this function is called while the trace is in progress, a
          special system trace event, POSIX_TRACE_FILTER, shall be recorded
          in the trace indicating both the old and the new sets of filtered
          trace event types (see Table 2-4, Trace and Trace Event Filter
          Options: System Trace Events and Table 2-6, Trace, Trace Log, and
          Trace Event Filter Options: System Trace Events).

          If the posix_trace_set_filter() function is interrupted by a
          signal, an error shall be returned and the filter shall not be
          changed. In this case, the state of the trace stream shall not be
          changed.

          The value of the argument how indicates the manner in which the
          set is to be changed and shall have one of the following values,
          as defined in the <trace.h> header:

          POSIX_TRACE_SET_EVENTSET
                The resulting set of trace event types to be filtered shall
                be the trace event type set pointed to by the argument set.

          POSIX_TRACE_ADD_EVENTSET
                The resulting set of trace event types to be filtered shall
                be the union of the current set and the trace event type
                set pointed to by the argument set.

          POSIX_TRACE_SUB_EVENTSET
                The resulting set of trace event types to be filtered shall
                be all trace event types in the current set that are not in
                the set pointed to by the argument set; that is, remove
                each element of the specified set from the current filter.


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return a value
          of zero. Otherwise, they shall return the corresponding error
          number.

          The posix_trace_get_filter() function stores the set of filtered
          trace event types in set, if successful.


-----------------------------------------------------

::

          These functions shall fail if:

          EINVAL The value of the trid argument does not correspond to an
                 active trace stream or the value of the argument pointed
                 to by set is invalid.

          EINTR  The operation was interrupted by a signal.

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

          The posix_trace_get_filter() and posix_trace_set_filter()
          functions may be removed in a future version.


---------------------------------------------------------

::

          Table 2-4, Trace and Trace Event Filter Options: System Trace
          Events, Table 2-6, Trace, Trace Log, and Trace Event Filter
          Options: System Trace Events, posix_trace_eventset_add(3p)

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

   IEEE/The Open Group               2017        POSIX_TRACE_GET_FILTER(3P)

--------------

Pages that refer to this page:
`trace.h(0p) <../man0/trace.h.0p.html>`__, 
`posix_trace_close(3p) <../man3/posix_trace_close.3p.html>`__, 
`posix_trace_create(3p) <../man3/posix_trace_create.3p.html>`__, 
`posix_trace_eventset_add(3p) <../man3/posix_trace_eventset_add.3p.html>`__, 
`posix_trace_set_filter(3p) <../man3/posix_trace_set_filter.3p.html>`__

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
