.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_trace_close(3p) — Linux manual page
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

   POSIX_TRACE_CLOSE(3P)   POSIX Programmer's Manual  POSIX_TRACE_CLOSE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          posix_trace_close, posix_trace_open, posix_trace_rewind — trace
          log management (TRACING)


---------------------------------------------------------

::

          #include <trace.h>

          int posix_trace_close(trace_id_t trid);
          int posix_trace_open(int file_desc, trace_id_t *trid);
          int posix_trace_rewind(trace_id_t trid);


---------------------------------------------------------------

::

          The posix_trace_close() function shall deallocate the trace log
          identifier indicated by trid, and all of its associated
          resources. If there is no valid trace log pointed to by the trid,
          this function shall fail.

          The posix_trace_open() function shall allocate the necessary
          resources and establish the connection between a trace log
          identified by the file_desc argument and a trace stream
          identifier identified by the object pointed to by the trid
          argument. The file_desc argument should be a valid open file
          descriptor that corresponds to a trace log. The file_desc
          argument shall be open for reading. The current trace event
          timestamp, which specifies the timestamp of the trace event that
          will be read by the next call to posix_trace_getnext_event(),
          shall be set to the timestamp of the oldest trace event recorded
          in the trace log identified by trid.

          The posix_trace_open() function shall return a trace stream
          identifier in the variable pointed to by the trid argument, that
          may only be used by the following functions:

          posix_trace_close()                      posix_trace_get_attr()
          posix_trace_eventid_equal()              posix_trace_get_status()
          posix_trace_eventid_get_name()           posix_trace_getnext_event()
          posix_trace_eventtypelist_getnext_id()   posix_trace_rewind()
          posix_trace_eventtypelist_rewind()

          In particular, notice that the operations normally used by a
          trace controller process, such as posix_trace_start(),
          posix_trace_stop(), or posix_trace_shutdown(), cannot be invoked
          using the trace stream identifier returned by the
          posix_trace_open() function.

          The posix_trace_rewind() function shall reset the current trace
          event timestamp, which specifies the timestamp of the trace event
          that will be read by the next call to
          posix_trace_getnext_event(), to the timestamp of the oldest trace
          event recorded in the trace log identified by trid.


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return a value
          of zero. Otherwise, they shall return the corresponding error
          number.

          If successful, the posix_trace_open() function stores the trace
          stream identifier value in the object pointed to by trid.


-----------------------------------------------------

::

          The posix_trace_open() function shall fail if:

          EINTR  The operation was interrupted by a signal and thus no
                 trace log was opened.

          EINVAL The object pointed to by file_desc does not correspond to
                 a valid trace log.

          The posix_trace_close() and posix_trace_rewind() functions may
          fail if:

          EINVAL The object pointed to by trid does not correspond to a
                 valid trace log.

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

          The posix_trace_close(), posix_trace_open(), and
          posix_trace_rewind() functions may be removed in a future
          version.


---------------------------------------------------------

::

          posix_trace_get_attr(3p), posix_trace_get_filter(3p),
          posix_trace_getnext_event(3p)

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

   IEEE/The Open Group               2017             POSIX_TRACE_CLOSE(3P)

--------------

Pages that refer to this page:
`trace.h(0p) <../man0/trace.h.0p.html>`__, 
`posix_trace_create(3p) <../man3/posix_trace_create.3p.html>`__, 
`posix_trace_get_attr(3p) <../man3/posix_trace_get_attr.3p.html>`__, 
`posix_trace_getnext_event(3p) <../man3/posix_trace_getnext_event.3p.html>`__, 
`posix_trace_open(3p) <../man3/posix_trace_open.3p.html>`__

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
