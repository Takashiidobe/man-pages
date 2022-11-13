.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_trace_attr_destroy(3p) — Linux manual page
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

   POSIX_TRACE_ATTR_DESTROY(3P)X Programmer's Manual_TRACE_ATTR_DESTROY(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          posix_trace_attr_destroy, posix_trace_attr_init — destroy and
          initialize the trace stream attributes object (TRACING)


---------------------------------------------------------

::

          #include <trace.h>

          int posix_trace_attr_destroy(trace_attr_t *attr);
          int posix_trace_attr_init(trace_attr_t *attr);


---------------------------------------------------------------

::

          The posix_trace_attr_destroy() function shall destroy an
          initialized trace attributes object.  A destroyed attr attributes
          object can be reinitialized using posix_trace_attr_init(); the
          results of otherwise referencing the object after it has been
          destroyed are undefined.

          The posix_trace_attr_init() function shall initialize a trace
          attributes object attr with the default value for all of the
          individual attributes used by a given implementation. The read-
          only generation-version and clock-resolution attributes of the
          newly initialized trace attributes object shall be set to their
          appropriate values (see Section 2.11.1.2, posix_trace_status_info
          Structure).

          Results are undefined if posix_trace_attr_init() is called
          specifying an already initialized attr attributes object.

          Implementations may add extensions to the trace attributes object
          structure as permitted in the Base Definitions volume of
          POSIX.1‐2017, Chapter 2, Conformance.

          The resulting attributes object (possibly modified by setting
          individual attributes values), when used by posix_trace_create(),
          defines the attributes of the trace stream created. A single
          attributes object can be used in multiple calls to
          posix_trace_create().  After one or more trace streams have been
          created using an attributes object, any function affecting that
          attributes object, including destruction, shall not affect any
          trace stream previously created. An initialized attributes object
          also serves to receive the attributes of an existing trace stream
          or trace log when calling the posix_trace_get_attr() function.


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return a value
          of zero. Otherwise, they shall return the corresponding error
          number.


-----------------------------------------------------

::

          The posix_trace_attr_destroy() function may fail if:

          EINVAL The value of attr is invalid.

          The posix_trace_attr_init() function shall fail if:

          ENOMEM Insufficient memory exists to initialize the trace
                 attributes object.

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

          The posix_trace_attr_destroy() and posix_trace_attr_init()
          functions may be removed in a future version.


---------------------------------------------------------

::

          posix_trace_create(3p), posix_trace_get_attr(3p), uname(3p)

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

   IEEE/The Open Group               2017      POSIX_TRACE_ATTR_DESTROY(3P)

--------------

Pages that refer to this page:
`trace.h(0p) <../man0/trace.h.0p.html>`__, 
`posix_trace_attr_getclockres(3p) <../man3/posix_trace_attr_getclockres.3p.html>`__, 
`posix_trace_attr_getinherited(3p) <../man3/posix_trace_attr_getinherited.3p.html>`__, 
`posix_trace_attr_getlogsize(3p) <../man3/posix_trace_attr_getlogsize.3p.html>`__, 
`posix_trace_attr_init(3p) <../man3/posix_trace_attr_init.3p.html>`__, 
`posix_trace_clear(3p) <../man3/posix_trace_clear.3p.html>`__, 
`posix_trace_create(3p) <../man3/posix_trace_create.3p.html>`__, 
`posix_trace_get_attr(3p) <../man3/posix_trace_get_attr.3p.html>`__

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
