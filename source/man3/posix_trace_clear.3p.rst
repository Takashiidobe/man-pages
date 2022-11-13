.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_trace_clear(3p) — Linux manual page
=========================================

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

   POSIX_TRACE_CLEAR(3P)   POSIX Programmer's Manual  POSIX_TRACE_CLEAR(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          posix_trace_clear — clear trace stream and trace log (TRACING)


---------------------------------------------------------

::

          #include <sys/types.h>
          #include <trace.h>

          int posix_trace_clear(trace_id_t trid);


---------------------------------------------------------------

::

          The posix_trace_clear() function shall reinitialize the trace
          stream identified by the argument trid as if it were returning
          from the posix_trace_create() function, except that the same
          allocated resources shall be reused, the mapping of trace event
          type identifiers to trace event names shall be unchanged, and the
          trace stream status shall remain unchanged (that is, if it was
          running, it remains running and if it was suspended, it remains
          suspended).

          All trace events in the trace stream recorded before the call to
          posix_trace_clear() shall be lost. The posix_stream_full_status
          status shall be set to POSIX_TRACE_NOT_FULL.  There is no
          guarantee that all trace events that occurred during the
          posix_trace_clear() call are recorded; the behavior with respect
          to trace points that may occur during this call is unspecified.

          If the Trace Log option is supported and the trace stream has
          been created with a log, the posix_trace_clear() function shall
          reinitialize the trace stream with the same behavior as if the
          trace stream was created without the log, plus it shall
          reinitialize the trace log associated with the trace stream
          identified by the argument trid as if it were returning from the
          posix_trace_create_withlog() function, except that the same
          allocated resources, for the trace log, may be reused and the
          associated trace stream status remains unchanged.  The first
          trace event recorded in the trace log after the call to
          posix_trace_clear() shall be the same as the first trace event
          recorded in the active trace stream after the call to
          posix_trace_clear().  The posix_log_full_status status shall be
          set to POSIX_TRACE_NOT_FULL. There is no guarantee that all trace
          events that occurred during the posix_trace_clear() call are
          recorded in the trace log; the behavior with respect to trace
          points that may occur during this call is unspecified. If the log
          full policy is POSIX_TRACE_APPEND, the effect of a call to this
          function is unspecified for the trace log associated with the
          trace stream identified by the trid argument.


-----------------------------------------------------------------

::

          Upon successful completion, the posix_trace_clear() function
          shall return a value of zero. Otherwise, it shall return the
          corresponding error number.


-----------------------------------------------------

::

          The posix_trace_clear() function shall fail if:

          EINVAL The value of the trid argument does not correspond to an
                 active trace stream.

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

          The posix_trace_clear() function may be removed in a future
          version.


---------------------------------------------------------

::

          posix_trace_attr_destroy(3p), posix_trace_create(3p),
          posix_trace_get_attr(3p)

          The Base Definitions volume of POSIX.1‐2017, sys_types.h(0p),
          trace.h(0p)


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

   IEEE/The Open Group               2017             POSIX_TRACE_CLEAR(3P)

--------------

Pages that refer to this page:
`trace.h(0p) <../man0/trace.h.0p.html>`__, 
`posix_trace_create(3p) <../man3/posix_trace_create.3p.html>`__

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
