.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gmtime(3p) — Linux manual page
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

   GMTIME(3P)              POSIX Programmer's Manual             GMTIME(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          gmtime, gmtime_r — convert a time value to a broken-down UTC time


---------------------------------------------------------

::

          #include <time.h>

          struct tm *gmtime(const time_t *timer);
          struct tm *gmtime_r(const time_t *restrict timer,
              struct tm *restrict result);


---------------------------------------------------------------

::

          For gmtime(): The functionality described on this reference page
          is aligned with the ISO C standard. Any conflict between the
          requirements described here and the ISO C standard is
          unintentional. This volume of POSIX.1‐2017 defers to the ISO C
          standard.

          The gmtime() function shall convert the time in seconds since the
          Epoch pointed to by timer into a broken-down time, expressed as
          Coordinated Universal Time (UTC).

          The relationship between a time in seconds since the Epoch used
          as an argument to gmtime() and the tm structure (defined in the
          <time.h> header) is that the result shall be as specified in the
          expression given in the definition of seconds since the Epoch
          (see the Base Definitions volume of POSIX.1‐2017, Section 4.16,
          Seconds Since the Epoch), where the names in the structure and in
          the expression correspond.

          The same relationship shall apply for gmtime_r().

          The gmtime() function need not be thread-safe.

          The asctime(), ctime(), gmtime(), and localtime() functions shall
          return values in one of two static objects: a broken-down time
          structure and an array of type char.  Execution of any of the
          functions may overwrite the information returned in either of
          these objects by any of the other functions.

          The gmtime_r() function shall convert the time in seconds since
          the Epoch pointed to by timer into a broken-down time expressed
          as Coordinated Universal Time (UTC).  The broken-down time is
          stored in the structure referred to by result.  The gmtime_r()
          function shall also return the address of the same structure.


-----------------------------------------------------------------

::

          Upon successful completion, the gmtime() function shall return a
          pointer to a struct tm.  If an error is detected, gmtime() shall
          return a null pointer and set errno to indicate the error.

          Upon successful completion, gmtime_r() shall return the address
          of the structure pointed to by the argument result.  If an error
          is detected, gmtime_r() shall return a null pointer and set errno
          to indicate the error.


-----------------------------------------------------

::

          The gmtime() and gmtime_r() functions shall fail if:

          EOVERFLOW
                 The result cannot be represented.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The gmtime_r() function is thread-safe and returns values in a
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

          asctime(3p), clock(3p), ctime(3p), difftime(3p), localtime(3p),
          mktime(3p), strftime(3p), strptime(3p), time(3p), utime(3p)

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

   IEEE/The Open Group               2017                        GMTIME(3P)

--------------

Pages that refer to this page: `time.h(0p) <../man0/time.h.0p.html>`__, 
`asctime(3p) <../man3/asctime.3p.html>`__, 
`clock(3p) <../man3/clock.3p.html>`__, 
`ctime(3p) <../man3/ctime.3p.html>`__, 
`difftime(3p) <../man3/difftime.3p.html>`__, 
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
