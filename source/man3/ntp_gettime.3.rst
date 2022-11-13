.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ntp_gettime(3) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `VERSIONS <#VERSIONS>`__ \|    |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NTP_GETTIME(3)          Linux Programmer's Manual         NTP_GETTIME(3)

NAME
-------------------------------------------------

::

          ntp_gettime, ntp_gettimex  - get time parameters (NTP daemon
          interface)


---------------------------------------------------------

::

          #include <sys/timex.h>

          int ntp_gettime(struct ntptimeval *ntv);
          int ntp_gettimex(struct ntptimeval *ntv);


---------------------------------------------------------------

::

          Both of these APIs return information to the caller via the ntv
          argument, a structure of the following type:

              struct ntptimeval {
                  struct timeval time;    /* Current time */
                  long maxerror;          /* Maximum error */
                  long esterror;          /* Estimated error */
                  long tai;               /* TAI offset */

                  /* Further padding bytes allowing for future expansion */
              };

          The fields of this structure are as follows:

          time   The current time, expressed as a timeval structure:

                     struct timeval {
                         time_t      tv_sec;   /* Seconds since the Epoch */
                         suseconds_t tv_usec;  /* Microseconds */
                     };

          maxerror
                 Maximum error, in microseconds.  This value can be
                 initialized by ntp_adjtime(3), and is increased
                 periodically (on Linux: each second), but is clamped to an
                 upper limit (the kernel constant NTP_PHASE_MAX, with a
                 value of 16,000).

          esterror
                 Estimated error, in microseconds.  This value can be set
                 via ntp_adjtime(3) to contain an estimate of the
                 difference between the system clock and the true time.
                 This value is not used inside the kernel.

          tai    TAI (Atomic International Time) offset.

          ntp_gettime() returns an ntptimeval structure in which the time,
          maxerror, and esterror fields are filled in.

          ntp_gettimex() performs the same task as ntp_gettime(), but also
          returns information in the tai field.


-----------------------------------------------------------------

::

          The return values for ntp_gettime() and ntp_gettimex() are as for
          adjtimex(2).  Given a correct pointer argument, these functions
          always succeed.


---------------------------------------------------------

::

          The ntp_gettime() function is available since glibc 2.1.  The
          ntp_gettimex() function is available since glibc 2.12.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │ntp_gettime(), ntp_gettimex()         │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          ntp_gettime() is described in the NTP Kernel Application Program
          Interface.  ntp_gettimex() is a GNU extension.


---------------------------------------------------------

::

          adjtimex(2), ntp_adjtime(3), time(7)

          NTP "Kernel Application Program Interface" 
          ⟨http://www.slac.stanford.edu/comp/unix/package/rtems/src/ssrlApps/ntpNanoclock/api.htm⟩

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                 NTP_GETTIME(3)

--------------

Pages that refer to this page:
`adjtimex(2) <../man2/adjtimex.2.html>`__, 
`time(7) <../man7/time.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/ntp_gettime.3.license.html>`__

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
