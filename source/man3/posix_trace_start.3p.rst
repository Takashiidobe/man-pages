.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_trace_start(3p) — Linux manual page
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

   POSIX_TRACE_START(3P)   POSIX Programmer's Manual  POSIX_TRACE_START(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          posix_trace_start, posix_trace_stop — trace start and stop
          (TRACING)


---------------------------------------------------------

::

          #include <trace.h>

          int posix_trace_start(trace_id_t trid);
          int posix_trace_stop (trace_id_t trid);


---------------------------------------------------------------

::

          The posix_trace_start() and posix_trace_stop() functions,
          respectively, shall start and stop the trace stream identified by
          the argument trid.

          The effect of calling the posix_trace_start() function shall be
          recorded in the trace stream as the POSIX_TRACE_START system
          trace event and the status of the trace stream shall become
          POSIX_TRACE_RUNNING.  If the trace stream is in progress when
          this function is called, the POSIX_TRACE_START system trace event
          shall not be recorded and the trace stream shall continue to run.
          If the trace stream is full, the POSIX_TRACE_START system trace
          event shall not be recorded and the status of the trace stream
          shall not be changed.

          The effect of calling the posix_trace_stop() function shall be
          recorded in the trace stream as the POSIX_TRACE_STOP system trace
          event and the status of the trace stream shall become
          POSIX_TRACE_SUSPENDED.  If the trace stream is suspended when
          this function is called, the POSIX_TRACE_STOP system trace event
          shall not be recorded and the trace stream shall remain
          suspended. If the trace stream is full, the POSIX_TRACE_STOP
          system trace event shall not be recorded and the status of the
          trace stream shall not be changed.


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return a value
          of zero. Otherwise, they shall return the corresponding error
          number.


-----------------------------------------------------

::

          These functions shall fail if:

          EINVAL The value of the argument trid does not correspond to an
                 active trace stream and thus no trace stream was started
                 or stopped.

          EINTR  The operation was interrupted by a signal and thus the
                 trace stream was not necessarily started or stopped.

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

          The posix_trace_start() and posix_trace_stop() functions may be
          removed in a future version.


---------------------------------------------------------

::

          posix_trace_create(3p)

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

   IEEE/The Open Group               2017             POSIX_TRACE_START(3P)

--------------

Pages that refer to this page:
`trace.h(0p) <../man0/trace.h.0p.html>`__, 
`posix_trace_attr_getinherited(3p) <../man3/posix_trace_attr_getinherited.3p.html>`__, 
`posix_trace_create(3p) <../man3/posix_trace_create.3p.html>`__, 
`posix_trace_event(3p) <../man3/posix_trace_event.3p.html>`__

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
