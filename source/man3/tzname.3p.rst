.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tzset(3p) — Linux manual page
=============================

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

   TZSET(3P)               POSIX Programmer's Manual              TZSET(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          daylight, timezone, tzname, tzset — set timezone conversion
          information


---------------------------------------------------------

::

          #include <time.h>

          extern int daylight;
          extern long timezone;
          extern char *tzname[2];
          void tzset(void);


---------------------------------------------------------------

::

          The tzset() function shall use the value of the environment
          variable TZ to set time conversion information used by ctime(3p),
          localtime(3p), mktime(3p), and strftime(3p).  If TZ is absent
          from the environment, implementation-defined default timezone
          information shall be used.

          The tzset() function shall set the external variable tzname as
          follows:

              tzname[0] = "std";
              tzname[1] = "dst";

          where std and dst are as described in the Base Definitions volume
          of POSIX.1‐2017, Chapter 8, Environment Variables.

          The tzset() function also shall set the external variable
          daylight to 0 if Daylight Savings Time conversions should never
          be applied for the timezone in use; otherwise, non-zero. The
          external variable timezone shall be set to the difference, in
          seconds, between Coordinated Universal Time (UTC) and local
          standard time.

          If a thread accesses tzname, daylight, or timezone directly while
          another thread is in a call to tzset(), or to any function that
          is required or allowed to set timezone information as if by
          calling tzset(), the behavior is undefined.


-----------------------------------------------------------------

::

          The tzset() function shall not return a value.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          Example TZ variables and their timezone differences are given in
          the table below:

                              ┌───────────┬────────────┐
                              │    TZ     │  timezone  │
                              ├───────────┼────────────┤
                              │EST5EDT    │ 5*60*60    │
                              │GMT0       │ 0*60*60    │
                              │JST-9      │ -9*60*60   │
                              │MET-1MEST  │ -1*60*60   │
                              │MST7MDT    │ 7*60*60    │
                              │PST8PDT    │ 8*60*60    │
                              └───────────┴────────────┘


---------------------------------------------------------------------------

::

          Since the ctime(), localtime(), mktime(), strftime(), and
          strftime_l() functions are required to set timezone information
          as if by calling tzset(), there is no need for an explicit
          tzset() call before using these functions. However, portable
          applications should call tzset() explicitly before using
          ctime_r() or localtime_r() because setting timezone information
          is optional for those functions.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          ctime(3p), localtime(3p), mktime(3p), strftime(3p)

          The Base Definitions volume of POSIX.1‐2017, Chapter 8,
          Environment Variables, time.h(0p)


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

   IEEE/The Open Group               2017                         TZSET(3P)

--------------

Pages that refer to this page: `time.h(0p) <../man0/time.h.0p.html>`__, 
`daylight(3p) <../man3/daylight.3p.html>`__, 
`localtime(3p) <../man3/localtime.3p.html>`__, 
`mktime(3p) <../man3/mktime.3p.html>`__, 
`strftime(3p) <../man3/strftime.3p.html>`__, 
`timezone(3p) <../man3/timezone.3p.html>`__

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
