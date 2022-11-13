.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_trace_get_attr(3p) — Linux manual page
============================================

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

   POSIX_TRACE_GET_ATTR(3P)POSIX Programmer's ManualOSIX_TRACE_GET_ATTR(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          posix_trace_get_attr, posix_trace_get_status — retrieve the trace
          attributes or trace status (TRACING)


---------------------------------------------------------

::

          #include <trace.h>

          int posix_trace_get_attr(trace_id_t trid, trace_attr_t *attr);
          int posix_trace_get_status(trace_id_t trid,
              struct posix_trace_status_info *statusinfo);


---------------------------------------------------------------

::

          The posix_trace_get_attr() function shall copy the attributes of
          the active trace stream identified by trid into the object
          pointed to by the attr argument.  If the Trace Log option is
          supported, trid may represent a pre-recorded trace log.

          The posix_trace_get_status() function shall return, in the
          structure pointed to by the statusinfo argument, the current
          trace status for the trace stream identified by the trid
          argument. These status values returned in the structure pointed
          to by statusinfo shall have been appropriately read to ensure
          that the returned values are consistent.  If the Trace Log option
          is supported and the trid argument refers to a pre-recorded trace
          stream, the status shall be the status of the completed trace
          stream.

          Each time the posix_trace_get_status() function is used, the
          overrun status of the trace stream shall be reset to
          POSIX_TRACE_NO_OVERRUN immediately after the call completes.  If
          the Trace Log option is supported, the posix_trace_get_status()
          function shall behave the same as when the option is not
          supported except for the following differences:

           *  If the trid argument refers to a trace stream with log, each
              time the posix_trace_get_status() function is used, the log
              overrun status of the trace stream shall be reset to
              POSIX_TRACE_NO_OVERRUN and the flush_error status shall be
              reset to zero immediately after the call completes.

           *  If the trid argument refers to a pre-recorded trace stream,
              the status returned shall be the status of the completed
              trace stream and the status values of the trace stream shall
              not be reset.


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return a value
          of zero. Otherwise, they shall return the corresponding error
          number.

          The posix_trace_get_attr() function stores the trace attributes
          in the object pointed to by attr, if successful.

          The posix_trace_get_status() function stores the trace status in
          the object pointed to by statusinfo, if successful.


-----------------------------------------------------

::

          These functions shall fail if:

          EINVAL The trace stream argument trid does not correspond to a
                 valid active trace stream or a valid trace log.

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

          The posix_trace_get_attr() and posix_trace_get_status() functions
          may be removed in a future version.


---------------------------------------------------------

::

          posix_trace_attr_destroy(3p), posix_trace_close(3p),
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

   IEEE/The Open Group               2017          POSIX_TRACE_GET_ATTR(3P)

--------------

Pages that refer to this page:
`trace.h(0p) <../man0/trace.h.0p.html>`__, 
`posix_trace_attr_destroy(3p) <../man3/posix_trace_attr_destroy.3p.html>`__, 
`posix_trace_attr_getclockres(3p) <../man3/posix_trace_attr_getclockres.3p.html>`__, 
`posix_trace_attr_getinherited(3p) <../man3/posix_trace_attr_getinherited.3p.html>`__, 
`posix_trace_attr_getlogsize(3p) <../man3/posix_trace_attr_getlogsize.3p.html>`__, 
`posix_trace_clear(3p) <../man3/posix_trace_clear.3p.html>`__, 
`posix_trace_close(3p) <../man3/posix_trace_close.3p.html>`__, 
`posix_trace_create(3p) <../man3/posix_trace_create.3p.html>`__, 
`posix_trace_get_status(3p) <../man3/posix_trace_get_status.3p.html>`__

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
