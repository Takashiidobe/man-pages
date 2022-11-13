.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

localtime(3p) — Linux manual page
=================================

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

   LOCALTIME(3P)           POSIX Programmer's Manual          LOCALTIME(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          localtime, localtime_r — convert a time value to a broken-down
          local time


---------------------------------------------------------

::

          #include <time.h>

          struct tm *localtime(const time_t *timer);
          struct tm *localtime_r(const time_t *restrict timer,
              struct tm *restrict result);


---------------------------------------------------------------

::

          For localtime(): The functionality described on this reference
          page is aligned with the ISO C standard. Any conflict between the
          requirements described here and the ISO C standard is
          unintentional. This volume of POSIX.1‐2017 defers to the ISO C
          standard.

          The localtime() function shall convert the time in seconds since
          the Epoch pointed to by timer into a broken-down time, expressed
          as a local time. The function corrects for the timezone and any
          seasonal time adjustments.  Local timezone information is used as
          though localtime() calls tzset().

          The relationship between a time in seconds since the Epoch used
          as an argument to localtime() and the tm structure (defined in
          the <time.h> header) is that the result shall be as specified in
          the expression given in the definition of seconds since the Epoch
          (see the Base Definitions volume of POSIX.1‐2017, Section 4.16,
          Seconds Since the Epoch) corrected for timezone and any seasonal
          time adjustments, where the names in the structure and in the
          expression correspond.

          The same relationship shall apply for localtime_r().

          The localtime() function need not be thread-safe.

          The asctime(), ctime(), gmtime(), and localtime() functions shall
          return values in one of two static objects: a broken-down time
          structure and an array of type char.  Execution of any of the
          functions may overwrite the information returned in either of
          these objects by any of the other functions.

          The localtime_r() function shall convert the time in seconds
          since the Epoch pointed to by timer into a broken-down time
          stored in the structure to which result points. The localtime_r()
          function shall also return a pointer to that same structure.

          Unlike localtime(), the localtime_r() function is not required to
          set tzname.  If localtime_r() sets tzname, it shall also set
          daylight and timezone.  If localtime_r() does not set tzname, it
          shall not set daylight and shall not set timezone.


-----------------------------------------------------------------

::

          Upon successful completion, the localtime() function shall return
          a pointer to the broken-down time structure.  If an error is
          detected, localtime() shall return a null pointer and set errno
          to indicate the error.

          Upon successful completion, localtime_r() shall return a pointer
          to the structure pointed to by the argument result.  If an error
          is detected, localtime_r() shall return a null pointer and set
          errno to indicate the error.


-----------------------------------------------------

::

          The localtime() and localtime_r() functions shall fail if:

          EOVERFLOW
                 The result cannot be represented.

          The following sections are informative.


---------------------------------------------------------

::

      Getting the Local Date and Time
          The following example uses the time() function to calculate the
          time elapsed, in seconds, since January 1, 1970 0:00 UTC (the
          Epoch), localtime() to convert that value to a broken-down time,
          and asctime() to convert the broken-down time values into a
          printable string.

              #include <stdio.h>
              #include <time.h>

              int main(void)
              {
                  time_t result;

                  result = time(NULL);
                  printf("%s%ju secs since the Epoch\n",
                      asctime(localtime(&result)),
                          (uintmax_t)result);
                  return(0);
              }

          This example writes the current time to stdout in a form like
          this:

              Wed Jun 26 10:32:15 1996
              835810335 secs since the Epoch

      Getting the Modification Time for a File
          The following example prints the last data modification timestamp
          in the local timezone for a given file.

              #include <stdio.h>
              #include <time.h>
              #include <sys/stat.h>

              int
              print_file_time(const char *pathname)
              {
                  struct stat statbuf;
                  struct tm *tm;
                  char timestr[BUFSIZ];

                  if(stat(pathname, &statbuf) == -1)
                      return -1;
                  if((tm = localtime(&statbuf.st_mtime)) == NULL)
                      return -1;
                  if(strftime(timestr, sizeof(timestr), "%Y-%m-%d %H:%M:%S", tm) == 0)
                      return -1;
                  printf("%s: %s.%09ld\n", pathname, timestr, statbuf.st_mtim.tv_nsec);
                  return 0;
              }

      Timing an Event
          The following example gets the current time, converts it to a
          string using localtime() and asctime(), and prints it to standard
          output using fputs().  It then prints the number of minutes to an
          event being timed.

              #include <time.h>
              #include <stdio.h>
              ...
              time_t now;
              int minutes_to_event;
              ...
              time(&now);
              printf("The time is ");
              fputs(asctime(localtime(&now)), stdout);
              printf("There are still %d minutes to the event.\n",
                  minutes_to_event);
              ...


---------------------------------------------------------------------------

::

          The localtime_r() function is thread-safe and returns values in a
          user-supplied buffer instead of possibly using a static data area
          that may be overwritten by each call.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          asctime(3p), clock(3p), ctime(3p), difftime(3p), getdate(3p),
          gmtime(3p), mktime(3p), strftime(3p), strptime(3p), time(3p),
          tzset(3p), utime(3p)

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

   IEEE/The Open Group               2017                     LOCALTIME(3P)

--------------

Pages that refer to this page: `time.h(0p) <../man0/time.h.0p.html>`__, 
`asctime(3p) <../man3/asctime.3p.html>`__, 
`clock(3p) <../man3/clock.3p.html>`__, 
`ctime(3p) <../man3/ctime.3p.html>`__, 
`difftime(3p) <../man3/difftime.3p.html>`__, 
`getdate(3p) <../man3/getdate.3p.html>`__, 
`gmtime(3p) <../man3/gmtime.3p.html>`__, 
`mktime(3p) <../man3/mktime.3p.html>`__, 
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
