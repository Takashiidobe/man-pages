.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ftime(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `VERSIONS <#VERSIONS>`__ \|    |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FTIME(3)                Linux Programmer's Manual               FTIME(3)

NAME
-------------------------------------------------

::

          ftime - return date and time


---------------------------------------------------------

::

          #include <sys/timeb.h>

          int ftime(struct timeb *tp);


---------------------------------------------------------------

::

          NOTE: This function is no longer provided by the GNU C library.
          Use clock_gettime(2) instead.

          This function returns the current time as seconds and
          milliseconds since the Epoch, 1970-01-01 00:00:00 +0000 (UTC).
          The time is returned in tp, which is declared as follows:

              struct timeb {
                  time_t         time;
                  unsigned short millitm;
                  short          timezone;
                  short          dstflag;
              };

          Here time is the number of seconds since the Epoch, and millitm
          is the number of milliseconds since time seconds since the Epoch.
          The timezone field is the local timezone measured in minutes of
          time west of Greenwich (with a negative value indicating minutes
          east of Greenwich).  The dstflag field is a flag that, if
          nonzero, indicates that Daylight Saving time applies locally
          during the appropriate part of the year.

          POSIX.1-2001 says that the contents of the timezone and dstflag
          fields are unspecified; avoid relying on them.


-----------------------------------------------------------------

::

          This function always returns 0.  (POSIX.1-2001 specifies, and
          some systems document, a -1 error return.)


---------------------------------------------------------

::

          Starting with glibc 2.33, the ftime() function and the
          <sys/timeb.h> header have been removed.  To support old binaries,
          glibc continues to provide a compatibility symbol for
          applications linked against glibc 2.32 and earlier.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │ftime()                               │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          4.2BSD, POSIX.1-2001.  POSIX.1-2008 removes the specification of
          ftime().

          This function is obsolete.  Don't use it.  If the time in seconds
          suffices, time(2) can be used; gettimeofday(2) gives
          microseconds; clock_gettime(2) gives nanoseconds but is not as
          widely available.


-------------------------------------------------

::

          Early glibc2 is buggy and returns 0 in the millitm field; glibc
          2.1.1 is correct again.


---------------------------------------------------------

::

          gettimeofday(2), time(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                       FTIME(3)

--------------

Pages that refer to this page:
`clock_getres(2) <../man2/clock_getres.2.html>`__, 
`gettimeofday(2) <../man2/gettimeofday.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`time(2) <../man2/time.2.html>`__, 
`unimplemented(2) <../man2/unimplemented.2.html>`__

--------------

`Copyright and license for this manual
page <../man3/ftime.3.license.html>`__

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
