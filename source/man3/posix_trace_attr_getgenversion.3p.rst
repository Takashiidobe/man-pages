.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_trace_attr_getclockres(3p) — Linux manual page
====================================================

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

   POSIX_TRACE_ATTR_GETCLOCKRES(3P)ogrammer'sSManualCE_ATTR_GETCLOCKRES(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          posix_trace_attr_getclockres, posix_trace_attr_getcreatetime,
          posix_trace_attr_getgenversion, posix_trace_attr_getname,
          posix_trace_attr_setname — retrieve and set information about a
          trace stream (TRACING)


---------------------------------------------------------

::

          #include <time.h>
          #include <trace.h>

          int posix_trace_attr_getclockres(const trace_attr_t *attr,
              struct timespec *resolution);
          int posix_trace_attr_getcreatetime(const trace_attr_t *attr,
              struct timespec *createtime);

          #include <trace.h>

          int posix_trace_attr_getgenversion(const trace_attr_t *attr,
              char *genversion);
          int posix_trace_attr_getname(const trace_attr_t *attr,
              char *tracename);
          int posix_trace_attr_setname(trace_attr_t *attr,
              const char *tracename);


---------------------------------------------------------------

::

          The posix_trace_attr_getclockres() function shall copy the clock
          resolution of the clock used to generate timestamps from the
          clock-resolution attribute of the attributes object pointed to by
          the attr argument into the structure pointed to by the resolution
          argument.

          The posix_trace_attr_getcreatetime() function shall copy the
          trace stream creation time from the creation-time attribute of
          the attributes object pointed to by the attr argument into the
          structure pointed to by the createtime argument. The creation-
          time attribute shall represent the time of creation of the trace
          stream.

          The posix_trace_attr_getgenversion() function shall copy the
          string containing version information from the generation-version
          attribute of the attributes object pointed to by the attr
          argument into the string pointed to by the genversion argument.
          The genversion argument shall be the address of a character array
          which can store at least {TRACE_NAME_MAX} characters.

          The posix_trace_attr_getname() function shall copy the string
          containing the trace name from the trace-name attribute of the
          attributes object pointed to by the attr argument into the string
          pointed to by the tracename argument. The tracename argument
          shall be the address of a character array which can store at
          least {TRACE_NAME_MAX} characters.

          The posix_trace_attr_setname() function shall set the name in the
          trace-name attribute of the attributes object pointed to by the
          attr argument, using the trace name string supplied by the
          tracename argument. If the supplied string contains more than
          {TRACE_NAME_MAX} characters, the name copied into the trace-name
          attribute may be truncated to one less than the length of
          {TRACE_NAME_MAX} characters. The default value is a null string.


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return a value
          of zero. Otherwise, they shall return the corresponding error
          number.

          If successful, the posix_trace_attr_getclockres() function stores
          the clock-resolution attribute value in the object pointed to by
          resolution.  Otherwise, the content of this object is
          unspecified.

          If successful, the posix_trace_attr_getcreatetime() function
          stores the trace stream creation time in the object pointed to by
          createtime.  Otherwise, the content of this object is
          unspecified.

          If successful, the posix_trace_attr_getgenversion() function
          stores the trace version information in the string pointed to by
          genversion.  Otherwise, the content of this string is
          unspecified.

          If successful, the posix_trace_attr_getname() function stores the
          trace name in the string pointed to by tracename.  Otherwise, the
          content of this string is unspecified.


-----------------------------------------------------

::

          The posix_trace_attr_getclockres(),
          posix_trace_attr_getcreatetime(),
          posix_trace_attr_getgenversion(), and posix_trace_attr_getname()
          functions may fail if:

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

          The posix_trace_attr_getclockres(),
          posix_trace_attr_getcreatetime(),
          posix_trace_attr_getgenversion(), posix_trace_attr_getname(), and
          posix_trace_attr_setname() functions may be removed in a future
          version.


---------------------------------------------------------

::

          posix_trace_attr_destroy(3p), posix_trace_create(3p),
          posix_trace_get_attr(3p), uname(3p)

          The Base Definitions volume of POSIX.1‐2017, time.h(0p),
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

   IEEE/The Open Group               2017  POSIX_TRACE_ATTR_GETCLOCKRES(3P)

--------------

Pages that refer to this page:
`trace.h(0p) <../man0/trace.h.0p.html>`__, 
`posix_trace_attr_getname(3p) <../man3/posix_trace_attr_getname.3p.html>`__, 
`posix_trace_attr_setname(3p) <../man3/posix_trace_attr_setname.3p.html>`__

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
