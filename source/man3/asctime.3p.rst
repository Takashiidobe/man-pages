.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

asctime(3p) — Linux manual page
===============================

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

   ASCTIME(3P)             POSIX Programmer's Manual            ASCTIME(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          asctime, asctime_r — convert date and time to a string


---------------------------------------------------------

::

          #include <time.h>

          char *asctime(const struct tm *timeptr);
          char *asctime_r(const struct tm *restrict tm, char *restrict buf);


---------------------------------------------------------------

::

          For asctime(): The functionality described on this reference page
          is aligned with the ISO C standard. Any conflict between the
          requirements described here and the ISO C standard is
          unintentional. This volume of POSIX.1‐2017 defers to the ISO C
          standard.

          The asctime() function shall convert the broken-down time in the
          structure pointed to by timeptr into a string in the form:

              Sun Sep 16 01:03:52 1973\n\0

          using the equivalent of the following algorithm:

              char *asctime(const struct tm *timeptr)
              {
                  static char wday_name[7][3] = {
                      "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"
                  };
                  static char mon_name[12][3] = {
                      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
                      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
                  };
                  static char result[26];

                  sprintf(result, "%.3s %.3s%3d %.2d:%.2d:%.2d %d\n",
                      wday_name[timeptr->tm_wday],
                      mon_name[timeptr->tm_mon],
                      timeptr->tm_mday, timeptr->tm_hour,
                      timeptr->tm_min, timeptr->tm_sec,
                      1900 + timeptr->tm_year);
                  return result;
              }

          However, the behavior is undefined if timeptr->tm_wday or
          timeptr->tm_mon are not within the normal ranges as defined in
          <time.h>, or if timeptr->tm_year exceeds {INT_MAX}-1990, or if
          the above algorithm would attempt to generate more than 26 bytes
          of output (including the terminating null).

          The tm structure is defined in the <time.h> header.

          The asctime(), ctime(), gmtime(), and localtime() functions shall
          return values in one of two static objects: a broken-down time
          structure and an array of type char.  Execution of any of the
          functions may overwrite the information returned in either of
          these objects by any of the other functions.

          The asctime() function need not be thread-safe.

          The asctime_r() function shall convert the broken-down time in
          the structure pointed to by tm into a string (of the same form as
          that returned by asctime(), and with the same undefined behavior
          when input or output is out of range) that is placed in the user-
          supplied buffer pointed to by buf (which shall contain at least
          26 bytes) and then return buf.


-----------------------------------------------------------------

::

          Upon successful completion, asctime() shall return a pointer to
          the string.  If the function is unsuccessful, it shall return
          NULL.

          Upon successful completion, asctime_r() shall return a pointer to
          a character string containing the date and time. This string is
          pointed to by the argument buf.  If the function is unsuccessful,
          it shall return NULL.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          These functions are included only for compatibility with older
          implementations. They have undefined behavior if the resulting
          string would be too long, so the use of these functions should be
          discouraged. On implementations that do not detect output string
          length overflow, it is possible to overflow the output buffers in
          such a way as to cause applications to fail, or possible system
          security violations. Also, these functions do not support
          localized date and time formats. To avoid these problems,
          applications should use strftime() to generate strings from
          broken-down times.

          Values for the broken-down time structure can be obtained by
          calling gmtime() or localtime().

          The asctime_r() function is thread-safe and shall return values
          in a user-supplied buffer instead of possibly using a static data
          area that may be overwritten by each call.


-----------------------------------------------------------

::

          The standard developers decided to mark the asctime() and
          asctime_r() functions obsolescent even though asctime() is in the
          ISO C standard due to the possibility of buffer overflow. The
          ISO C standard also provides the strftime() function which can be
          used to avoid these problems.


---------------------------------------------------------------------------

::

          These functions may be removed in a future version.


---------------------------------------------------------

::

          clock(3p), ctime(3p), difftime(3p), gmtime(3p), localtime(3p),
          mktime(3p), strftime(3p), strptime(3p), time(3p), utime(3p)

          The Base Definitions volume of POSIX.1‐2017, time.h(0p)


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

   IEEE/The Open Group               2017                       ASCTIME(3P)

--------------

Pages that refer to this page: `time.h(0p) <../man0/time.h.0p.html>`__, 
`clock(3p) <../man3/clock.3p.html>`__, 
`ctime(3p) <../man3/ctime.3p.html>`__, 
`difftime(3p) <../man3/difftime.3p.html>`__, 
`gmtime(3p) <../man3/gmtime.3p.html>`__, 
`localtime(3p) <../man3/localtime.3p.html>`__, 
`mktime(3p) <../man3/mktime.3p.html>`__, 
`strftime(3p) <../man3/strftime.3p.html>`__, 
`time(3p) <../man3/time.3p.html>`__

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
