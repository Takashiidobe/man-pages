.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

usleep(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   USLEEP(3)               Linux Programmer's Manual              USLEEP(3)

NAME
-------------------------------------------------

::

          usleep - suspend execution for microsecond intervals


---------------------------------------------------------

::

          #include <unistd.h>

          int usleep(useconds_t usec);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          usleep():
              Since glibc 2.12:
                  (_XOPEN_SOURCE >= 500) && ! (_POSIX_C_SOURCE >= 200809L)
                      || /* Glibc since 2.19: */ _DEFAULT_SOURCE
                      || /* Glibc <= 2.19: */ _BSD_SOURCE
              Before glibc 2.12:
                  _BSD_SOURCE || _XOPEN_SOURCE >= 500


---------------------------------------------------------------

::

          The usleep() function suspends execution of the calling thread
          for (at least) usec microseconds.  The sleep may be lengthened
          slightly by any system activity or by the time spent processing
          the call or by the granularity of system timers.


-----------------------------------------------------------------

::

          The usleep() function returns 0 on success.  On error, -1 is
          returned, with errno set to indicate the error.


-----------------------------------------------------

::

          EINTR  Interrupted by a signal; see signal(7).

          EINVAL usec is greater than or equal to 1000000.  (On systems
                 where that is considered an error.)


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │usleep()                              │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          4.3BSD, POSIX.1-2001.  POSIX.1-2001 declares this function
          obsolete; use nanosleep(2) instead.  POSIX.1-2008 removes the
          specification of usleep().

          On the original BSD implementation, and in glibc before version
          2.2.2, the return type of this function is void.  The POSIX
          version returns int, and this is also the prototype used since
          glibc 2.2.2.

          Only the EINVAL error return is documented by SUSv2 and
          POSIX.1-2001.


---------------------------------------------------

::

          The type useconds_t is an unsigned integer type capable of
          holding integers in the range [0,1000000].  Programs will be more
          portable if they never mention this type explicitly.  Use

              #include <unistd.h>
              ...
                  unsigned int usecs;
              ...
                  usleep(usecs);

          The interaction of this function with the SIGALRM signal, and
          with other timer functions such as alarm(2), sleep(3),
          nanosleep(2), setitimer(2), timer_create(2), timer_delete(2),
          timer_getoverrun(2), timer_gettime(2), timer_settime(2),
          ualarm(3) is unspecified.


---------------------------------------------------------

::

          alarm(2), getitimer(2), nanosleep(2), select(2), setitimer(2),
          sleep(3), ualarm(3), time(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                      USLEEP(3)

--------------

Pages that refer to this page: `free(1) <../man1/free.1.html>`__, 
`gawk(1) <../man1/gawk.1.html>`__, 
`clock_nanosleep(2) <../man2/clock_nanosleep.2.html>`__, 
`getitimer(2) <../man2/getitimer.2.html>`__, 
`nanosleep(2) <../man2/nanosleep.2.html>`__, 
`select(2) <../man2/select.2.html>`__, 
`\__ppc_get_timebase(3) <../man3/__ppc_get_timebase.3.html>`__, 
`ualarm(3) <../man3/ualarm.3.html>`__, 
`signal(7) <../man7/signal.7.html>`__, 
`time(7) <../man7/time.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/usleep.3.license.html>`__

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
