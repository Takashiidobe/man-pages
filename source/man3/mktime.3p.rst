.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mktime(3p) — Linux manual page
==============================

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

   MKTIME(3P)              POSIX Programmer's Manual             MKTIME(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          mktime — convert broken-down time into time since the Epoch


---------------------------------------------------------

::

          #include <time.h>

          time_t mktime(struct tm *timeptr);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The mktime() function shall convert the broken-down time,
          expressed as local time, in the structure pointed to by timeptr,
          into a time since the Epoch value with the same encoding as that
          of the values returned by time().  The original values of the
          tm_wday and tm_yday components of the structure shall be ignored,
          and the original values of the other components shall not be
          restricted to the ranges described in <time.h>.

          A positive or 0 value for tm_isdst shall cause mktime() to
          presume initially that Daylight Savings Time, respectively, is or
          is not in effect for the specified time. A negative value for
          tm_isdst shall cause mktime() to attempt to determine whether
          Daylight Savings Time is in effect for the specified time.

          Local timezone information shall be set as though mktime() called
          tzset().

          The relationship between the tm structure (defined in the
          <time.h> header) and the time in seconds since the Epoch is that
          the result shall be as specified in the expression given in the
          definition of seconds since the Epoch (see the Base Definitions
          volume of POSIX.1‐2017, Section 4.16, Seconds Since the Epoch)
          corrected for timezone and any seasonal time adjustments, where
          the names other than tm_yday in the structure and in the
          expression correspond, and the tm_yday value used in the
          expression is the day of the year from 0 to 365 inclusive,
          calculated from the other tm structure members specified in
          <time.h> (excluding tm_wday).

          Upon successful completion, the values of the tm_wday and tm_yday
          components of the structure shall be set appropriately, and the
          other components shall be set to represent the specified time
          since the Epoch, but with their values forced to the ranges
          indicated in the <time.h> entry; the final value of tm_mday shall
          not be set until tm_mon and tm_year are determined.


-----------------------------------------------------------------

::

          The mktime() function shall return the specified time since the
          Epoch encoded as a value of type time_t.  If the time since the
          Epoch cannot be represented, the function shall return the value
          (time_t)-1 and set errno to indicate the error.


-----------------------------------------------------

::

          The mktime() function shall fail if:

          EOVERFLOW
                 The result cannot be represented.

          The following sections are informative.


---------------------------------------------------------

::

          What day of the week is July 4, 2001?

              #include <stdio.h>
              #include <time.h>

              struct tm time_str;

              char daybuf[20];

              int main(void)
              {
                  time_str.tm_year = 2001 — 1900;
                  time_str.tm_mon = 7 — 1;
                  time_str.tm_mday = 4;
                  time_str.tm_hour = 0;
                  time_str.tm_min = 0;
                  time_str.tm_sec = 1;
                  time_str.tm_isdst = -1;
                  if (mktime(&time_str) == -1)
                      (void)puts("-unknown-");
                  else {
                      (void)strftime(daybuf, sizeof(daybuf), "%A", &time_str);
                      (void)puts(daybuf);
                  }
                  return 0;
              }


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          asctime(3p), clock(3p), ctime(3p), difftime(3p), gmtime(3p),
          localtime(3p), strftime(3p), strptime(3p), time(3p), tzset(3p),
          utime(3p)

          The Base Definitions volume of POSIX.1‐2017, Section 4.16,
          Seconds Since the Epoch, time.h(0p)


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

   IEEE/The Open Group               2017                        MKTIME(3P)

--------------

Pages that refer to this page: `time.h(0p) <../man0/time.h.0p.html>`__, 
`asctime(3p) <../man3/asctime.3p.html>`__, 
`clock(3p) <../man3/clock.3p.html>`__, 
`ctime(3p) <../man3/ctime.3p.html>`__, 
`difftime(3p) <../man3/difftime.3p.html>`__, 
`gmtime(3p) <../man3/gmtime.3p.html>`__, 
`localtime(3p) <../man3/localtime.3p.html>`__, 
`strftime(3p) <../man3/strftime.3p.html>`__, 
`time(3p) <../man3/time.3p.html>`__, 
`tzset(3p) <../man3/tzset.3p.html>`__

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
