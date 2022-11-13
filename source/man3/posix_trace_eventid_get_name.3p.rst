.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_trace_eventid_equal(3p) — Linux manual page
=================================================

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

   POSIX_TRACE_EVENTID_EQUAL(3P) Programmer's ManualTRACE_EVENTID_EQUAL(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          posix_trace_eventid_equal, posix_trace_eventid_get_name,
          posix_trace_trid_eventid_open — manipulate the trace event type
          identifier (TRACING)


---------------------------------------------------------

::

          #include <trace.h>

          int posix_trace_eventid_equal(trace_id_t trid, trace_event_id_t event1,
              trace_event_id_t event2);
          int posix_trace_eventid_get_name(trace_id_t trid,
              trace_event_id_t event, char *event_name);
          int posix_trace_trid_eventid_open(trace_id_t trid,
              const char *restrict event_name,
              trace_event_id_t *restrict event);


---------------------------------------------------------------

::

          The posix_trace_eventid_equal() function shall compare the trace
          event type identifiers event1 and event2 from the same trace
          stream or the same trace log identified by the trid argument. If
          the trace event type identifiers event1 and event2 are from
          different trace streams, the return value shall be unspecified.

          The posix_trace_eventid_get_name() function shall return, in the
          argument pointed to by event_name, the trace event name
          associated with the trace event type identifier identified by the
          argument event, for the trace stream or for the trace log
          identified by the trid argument. The name of the trace event
          shall have a maximum of {TRACE_EVENT_NAME_MAX} characters (which
          has the minimum value {_POSIX_TRACE_EVENT_NAME_MAX}).  Successive
          calls to this function with the same trace event type identifier
          and the same trace stream identifier shall return the same event
          name.

          The posix_trace_trid_eventid_open() function shall associate a
          user trace event name with a trace event type identifier for a
          given trace stream. The trace stream is identified by the trid
          argument, and it shall be an active trace stream. The trace event
          name is the string pointed to by the argument event_name.  It
          shall have a maximum of {TRACE_EVENT_NAME_MAX} characters (which
          has the minimum value {_POSIX_TRACE_EVENT_NAME_MAX}).  The number
          of user trace event type identifiers that can be defined for any
          given process is limited by the maximum value
          {TRACE_USER_EVENT_MAX}, which has the minimum value
          {_POSIX_TRACE_USER_EVENT_MAX}.

          If the Trace Inherit option is not supported, the
          posix_trace_trid_eventid_open() function shall associate the user
          trace event name pointed to by the event_name argument with a
          trace event type identifier that is unique for the process being
          traced in the trace stream identified by the trid argument, and
          is returned in the variable pointed to by the event argument. If
          the user trace event name has already been mapped for the traced
          process, then the previously assigned trace event type identifier
          shall be returned. If the per-process user trace event name limit
          represented by {TRACE_USER_EVENT_MAX} has been reached, the pre-
          defined POSIX_TRACE_UNNAMED_USEREVENT (see Table 2-7, Trace
          Option: User Trace Event) user trace event shall be returned.

          If the Trace Inherit option is supported, the
          posix_trace_trid_eventid_open() function shall associate the user
          trace event name pointed to by the event_name argument with a
          trace event type identifier that is unique for all the processes
          being traced in the trace stream identified by the trid argument,
          and is returned in the variable pointed to by the event argument.
          If the user trace event name has already been mapped for the
          traced processes, then the previously assigned trace event type
          identifier shall be returned. If the per-process user trace event
          name limit represented by {TRACE_USER_EVENT_MAX} has been
          reached, the pre-defined POSIX_TRACE_UNNAMED_USEREVENT (see Table
          2-7, Trace Option: User Trace Event) user trace event shall be
          returned.


-----------------------------------------------------------------

::

          Upon successful completion, the posix_trace_eventid_get_name()
          and posix_trace_trid_eventid_open() functions shall return a
          value of zero. Otherwise, they shall return the corresponding
          error number.

          The posix_trace_eventid_equal() function shall return a non-zero
          value if event1 and event2 are equal; otherwise, a value of zero
          shall be returned. No errors are defined. If either event1 or
          event2 are not valid trace event type identifiers for the trace
          stream specified by trid or if the trid is invalid, the behavior
          shall be unspecified.

          The posix_trace_eventid_get_name() function stores the trace
          event name value in the object pointed to by event_name, if
          successful.

          The posix_trace_trid_eventid_open() function stores the trace
          event type identifier value in the object pointed to by event, if
          successful.


-----------------------------------------------------

::

          The posix_trace_eventid_get_name() and
          posix_trace_trid_eventid_open() functions shall fail if:

          EINVAL The trid argument was not a valid trace stream identifier.

          The posix_trace_trid_eventid_open() function shall fail if:

          ENAMETOOLONG
                 The size of the name pointed to by the event_name argument
                 was longer than the implementation-defined value
                 {TRACE_EVENT_NAME_MAX}.

          The posix_trace_eventid_get_name() function shall fail if:

          EINVAL The trace event type identifier event was not associated
                 with any name.

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

          The posix_trace_eventid_equal(), posix_trace_eventid_get_name(),
          and posix_trace_trid_eventid_open() functions may be removed in a
          future version.


---------------------------------------------------------

::

          Table 2-7, Trace Option: User Trace Event, exec(1p),
          posix_trace_event(3p), posix_trace_getnext_event(3p)

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

   IEEE/The Open Group               2017     POSIX_TRACE_EVENTID_EQUAL(3P)

--------------

Pages that refer to this page:
`trace.h(0p) <../man0/trace.h.0p.html>`__, 
`exec(3p) <../man3/exec.3p.html>`__, 
`fork(3p) <../man3/fork.3p.html>`__, 
`posix_trace_create(3p) <../man3/posix_trace_create.3p.html>`__, 
`posix_trace_event(3p) <../man3/posix_trace_event.3p.html>`__, 
`posix_trace_eventset_add(3p) <../man3/posix_trace_eventset_add.3p.html>`__, 
`posix_trace_eventtypelist_getnext_id(3p) <../man3/posix_trace_eventtypelist_getnext_id.3p.html>`__, 
`posix_trace_trid_eventid_open(3p) <../man3/posix_trace_trid_eventid_open.3p.html>`__

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
