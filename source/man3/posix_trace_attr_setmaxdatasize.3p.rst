.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_trace_attr_getlogsize(3p) — Linux manual page
===================================================

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

   POSIX_TRACE_ATTR_GETLOGSIZE(3P)rogrammer'sOManualACE_ATTR_GETLOGSIZE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          posix_trace_attr_getlogsize, posix_trace_attr_getmaxdatasize,
          posix_trace_attr_getmaxsystemeventsize,
          posix_trace_attr_getmaxusereventsize,
          posix_trace_attr_getstreamsize, posix_trace_attr_setlogsize,
          posix_trace_attr_setmaxdatasize, posix_trace_attr_setstreamsize —
          retrieve and set trace stream size attributes (TRACING)


---------------------------------------------------------

::

          #include <sys/types.h>
          #include <trace.h>

          int posix_trace_attr_getlogsize(const trace_attr_t *restrict attr,
              size_t *restrict logsize);
          int posix_trace_attr_getmaxdatasize(const trace_attr_t *restrict attr,
              size_t *restrict maxdatasize);
          int posix_trace_attr_getmaxsystemeventsize(
              const trace_attr_t *restrict attr,
              size_t *restrict eventsize);
          int posix_trace_attr_getmaxusereventsize(
              const trace_attr_t *restrict attr,
              size_t data_len, size_t *restrict eventsize);
          int posix_trace_attr_getstreamsize(const trace_attr_t *restrict attr,
              size_t *restrict streamsize);
          int posix_trace_attr_setlogsize(trace_attr_t *attr,
              size_t logsize);
          int posix_trace_attr_setmaxdatasize(trace_attr_t *attr,
              size_t maxdatasize);
          int posix_trace_attr_setstreamsize(trace_attr_t *attr,
              size_t streamsize);


---------------------------------------------------------------

::

          The posix_trace_attr_getlogsize() function shall copy the log
          size, in bytes, from the log-max-size attribute of the attributes
          object pointed to by the attr argument into the variable pointed
          to by the logsize argument. This log size is the maximum total of
          bytes that shall be allocated for system and user trace events in
          the trace log. The default value for the log-max-size attribute
          is implementation-defined.

          The posix_trace_attr_setlogsize() function shall set the maximum
          allowed size, in bytes, in the log-max-size attribute of the
          attributes object pointed to by the attr argument, using the size
          value supplied by the logsize argument.

          The trace log size shall be used if the log-full-policy attribute
          is set to POSIX_TRACE_LOOP or POSIX_TRACE_UNTIL_FULL. If the log-
          full-policy attribute is set to POSIX_TRACE_APPEND, the
          implementation shall ignore the log-max-size attribute.

          The posix_trace_attr_getmaxdatasize() function shall copy the
          maximum user trace event data size, in bytes, from the max-data-
          size attribute of the attributes object pointed to by the attr
          argument into the variable pointed to by the maxdatasize
          argument. The default value for the max-data-size attribute is
          implementation-defined.

          The posix_trace_attr_getmaxsystemeventsize() function shall
          calculate the maximum memory size, in bytes, required to store a
          single system trace event. This value is calculated for the trace
          stream attributes object pointed to by the attr argument and is
          returned in the variable pointed to by the eventsize argument.

          The values returned as the maximum memory sizes of the user and
          system trace events shall be such that if the sum of the maximum
          memory sizes of a set of the trace events that may be recorded in
          a trace stream is less than or equal to the stream-min-size
          attribute of that trace stream, the system provides the necessary
          resources for recording all those trace events, without loss.

          The posix_trace_attr_getmaxusereventsize() function shall
          calculate the maximum memory size, in bytes, required to store a
          single user trace event generated by a call to
          posix_trace_event() with a data_len parameter equal to the
          data_len value specified in this call. This value is calculated
          for the trace stream attributes object pointed to by the attr
          argument and is returned in the variable pointed to by the
          eventsize argument.

          The posix_trace_attr_getstreamsize() function shall copy the
          stream size, in bytes, from the stream-min-size attribute of the
          attributes object pointed to by the attr argument into the
          variable pointed to by the streamsize argument.

          This stream size is the current total memory size reserved for
          system and user trace events in the trace stream. The default
          value for the stream-min-size attribute is implementation-
          defined. The stream size refers to memory used to store trace
          event records. Other stream data (for example, trace attribute
          values) shall not be included in this size.

          The posix_trace_attr_setmaxdatasize() function shall set the
          maximum allowed size, in bytes, in the max-data-size attribute of
          the attributes object pointed to by the attr argument, using the
          size value supplied by the maxdatasize argument. This maximum
          size is the maximum allowed size for the user data argument which
          may be passed to posix_trace_event().  The implementation shall
          be allowed to truncate data passed to trace_user_event which is
          longer than maxdatasize.

          The posix_trace_attr_setstreamsize() function shall set the
          minimum allowed size, in bytes, in the stream-min-size attribute
          of the attributes object pointed to by the attr argument, using
          the size value supplied by the streamsize argument.


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return a value
          of zero. Otherwise, they shall return the corresponding error
          number.

          The posix_trace_attr_getlogsize() function stores the maximum
          trace log allowed size in the object pointed to by logsize, if
          successful.

          The posix_trace_attr_getmaxdatasize() function stores the maximum
          trace event record memory size in the object pointed to by
          maxdatasize, if successful.

          The posix_trace_attr_getmaxsystemeventsize() function stores the
          maximum memory size to store a single system trace event in the
          object pointed to by eventsize, if successful.

          The posix_trace_attr_getmaxusereventsize() function stores the
          maximum memory size to store a single user trace event in the
          object pointed to by eventsize, if successful.

          The posix_trace_attr_getstreamsize() function stores the maximum
          trace stream allowed size in the object pointed to by streamsize,
          if successful.


-----------------------------------------------------

::

          These functions may fail if:

          EINVAL The value specified by one of the arguments is invalid.

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

                 posix_trace_attr_getlogsize()
                 posix_trace_attr_getmaxdatasize()
                 posix_trace_attr_getmaxsystemeventsize()
                 posix_trace_attr_getmaxusereventsize()
                 posix_trace_attr_getstreamsize()
                 posix_trace_attr_setlogsize()
                 posix_trace_attr_setmaxdatasize()
                 posix_trace_attr_setstreamsize()

          may be removed in a future version.


---------------------------------------------------------

::

          posix_trace_attr_destroy(3p), posix_trace_create(3p),
          posix_trace_event(3p), posix_trace_get_attr(3p)

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

   IEEE/The Open Group               2017   POSIX_TRACE_ATTR_GETLOGSIZE(3P)

--------------

Pages that refer to this page:
`trace.h(0p) <../man0/trace.h.0p.html>`__, 
`posix_trace_attr_getstreamsize(3p) <../man3/posix_trace_attr_getstreamsize.3p.html>`__, 
`posix_trace_attr_setlogsize(3p) <../man3/posix_trace_attr_setlogsize.3p.html>`__, 
`posix_trace_attr_setstreamsize(3p) <../man3/posix_trace_attr_setstreamsize.3p.html>`__

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
