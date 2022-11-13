.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_trace_attr_getinherited(3p) — Linux manual page
=====================================================

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

   POSIX_TRACE_ATTR_GETINHERITED(3P)grammer'sIManualE_ATTR_GETINHERITED(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          posix_trace_attr_getinherited, posix_trace_attr_getlogfullpolicy,
          posix_trace_attr_getstreamfullpolicy,
          posix_trace_attr_setinherited, posix_trace_attr_setlogfullpolicy,
          posix_trace_attr_setstreamfullpolicy — retrieve and set the
          behavior of a trace stream (TRACING)


---------------------------------------------------------

::

          #include <trace.h>

          int posix_trace_attr_getinherited(const trace_attr_t *restrict attr,
              int *restrict inheritancepolicy);
          int posix_trace_attr_getlogfullpolicy(const trace_attr_t *restrict attr,
              int *restrict logpolicy);
          int posix_trace_attr_getstreamfullpolicy(const trace_attr_t *restrict
              attr, int *restrict streampolicy);
          int posix_trace_attr_setinherited(trace_attr_t *attr,
              int inheritancepolicy);
          int posix_trace_attr_setlogfullpolicy(trace_attr_t *attr,
              int logpolicy);
          int posix_trace_attr_setstreamfullpolicy(trace_attr_t *attr,
              int streampolicy);


---------------------------------------------------------------

::

          The posix_trace_attr_getinherited() and
          posix_trace_attr_setinherited() functions, respectively, shall
          get and set the inheritance policy stored in the inheritance
          attribute for traced processes across the fork() and spawn()
          operations. The inheritance attribute of the attributes object
          pointed to by the attr argument shall be set to one of the
          following values defined by manifest constants in the <trace.h>
          header:

          POSIX_TRACE_CLOSE_FOR_CHILD
                After a fork() or spawn() operation, the child shall not be
                traced, and tracing of the parent shall continue.

          POSIX_TRACE_INHERITED
                After a fork() or spawn() operation, if the parent is being
                traced, its child shall be concurrently traced using the
                same trace stream.

          The default value for the inheritance attribute is
          POSIX_TRACE_CLOSE_FOR_CHILD.

          The posix_trace_attr_getlogfullpolicy() and
          posix_trace_attr_setlogfullpolicy() functions, respectively,
          shall get and set the trace log full policy stored in the log-
          full-policy attribute of the attributes object pointed to by the
          attr argument.

          The log-full-policy attribute shall be set to one of the
          following values defined by manifest constants in the <trace.h>
          header:

          POSIX_TRACE_LOOP
                The trace log shall loop until the associated trace stream
                is stopped.  This policy means that when the trace log gets
                full, the file system shall reuse the resources allocated
                to the oldest trace events that were recorded. In this way,
                the trace log will always contain the most recent trace
                events flushed.

          POSIX_TRACE_UNTIL_FULL
                The trace stream shall be flushed to the trace log until
                the trace log is full. This condition can be deduced from
                the posix_log_full_status member status (see the
                posix_trace_status_info structure defined in <trace.h>).
                The last recorded trace event shall be the POSIX_TRACE_STOP
                trace event.

          POSIX_TRACE_APPEND
                The associated trace stream shall be flushed to the trace
                log without log size limitation. If the application
                specifies POSIX_TRACE_APPEND, the implementation shall
                ignore the log-max-size attribute.

          The default value for the log-full-policy attribute is
          POSIX_TRACE_LOOP.

          The posix_trace_attr_getstreamfullpolicy() and
          posix_trace_attr_setstreamfullpolicy() functions, respectively,
          shall get and set the trace stream full policy stored in the
          stream-full-policy attribute of the attributes object pointed to
          by the attr argument.

          The stream-full-policy attribute shall be set to one of the
          following values defined by manifest constants in the <trace.h>
          header:

          POSIX_TRACE_LOOP
                The trace stream shall loop until explicitly stopped by the
                posix_trace_stop() function. This policy means that when
                the trace stream is full, the trace system shall reuse the
                resources allocated to the oldest trace events recorded. In
                this way, the trace stream will always contain the most
                recent trace events recorded.

          POSIX_TRACE_UNTIL_FULL
                The trace stream will run until the trace stream resources
                are exhausted. Then the trace stream will stop. This
                condition can be deduced from posix_stream_status and
                posix_stream_full_status (see the posix_trace_status_info
                structure defined in <trace.h>).  When this trace stream is
                read, a POSIX_TRACE_STOP trace event shall be reported
                after reporting the last recorded trace event.  The trace
                system shall reuse the resources allocated to any trace
                events already reported—see the
                posix_trace_getnext_event(),
                posix_trace_trygetnext_event(), and
                posix_trace_timedgetnext_event() functions—or already
                flushed for an active trace stream with log if the Trace
                Log option is supported; see the posix_trace_flush()
                function. The trace system shall restart the trace stream
                when it is empty and may restart it sooner. A
                POSIX_TRACE_START trace event shall be reported before
                reporting the next recorded trace event.

          POSIX_TRACE_FLUSH
                If the Trace Log option is supported, this policy is
                identical to the POSIX_TRACE_UNTIL_FULL trace stream full
                policy except that the trace stream shall be flushed
                regularly as if posix_trace_flush() had been explicitly
                called. Defining this policy for an active trace stream
                without log shall be invalid.

          The default value for the stream-full-policy attribute shall be
          POSIX_TRACE_LOOP for an active trace stream without log.

          If the Trace Log option is supported, the default value for the
          stream-full-policy attribute shall be POSIX_TRACE_FLUSH for an
          active trace stream with log.


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return a value
          of zero. Otherwise, they shall return the corresponding error
          number.

          If successful, the posix_trace_attr_getinherited() function shall
          store the inheritance attribute value in the object pointed to by
          inheritancepolicy.  Otherwise, the content of this object is
          undefined.

          If successful, the posix_trace_attr_getlogfullpolicy() function
          shall store the log-full-policy attribute value in the object
          pointed to by logpolicy.  Otherwise, the content of this object
          is undefined.

          If successful, the posix_trace_attr_getstreamfullpolicy()
          function shall store the stream-full-policy attribute value in
          the object pointed to by streampolicy.  Otherwise, the content of
          this object is undefined.


-----------------------------------------------------

::

          These functions may fail if:

          EINVAL The value specified by at least one of the arguments is
                 invalid.

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

          The following functions:

                 posix_trace_attr_getinherited()
                 posix_trace_attr_getlogfullpolicy()
                 posix_trace_attr_getstreamfullpolicy()
                 posix_trace_attr_setinherited()
                 posix_trace_attr_setlogfullpolicy()
                 posix_trace_attr_setstreamfullpolicy()

          may be removed in a future version.


---------------------------------------------------------

::

          fork(3p), posix_trace_attr_destroy(3p), posix_trace_create(3p),
          posix_trace_get_attr(3p), posix_trace_getnext_event(3p),
          posix_trace_start(3p)

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

   IEEE/The Open Group               2017 POSIX_TRACE_ATTR_GETINHERITED(3P)

--------------

Pages that refer to this page:
`trace.h(0p) <../man0/trace.h.0p.html>`__, 
`fork(3p) <../man3/fork.3p.html>`__, 
`posix_trace_attr_getstreamfullpolicy(3p) <../man3/posix_trace_attr_getstreamfullpolicy.3p.html>`__, 
`posix_trace_attr_setinherited(3p) <../man3/posix_trace_attr_setinherited.3p.html>`__, 
`posix_trace_attr_setstreamfullpolicy(3p) <../man3/posix_trace_attr_setstreamfullpolicy.3p.html>`__

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
