.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sleep(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLEEP(3)                Linux Programmer's Manual               SLEEP(3)

NAME
-------------------------------------------------

::

          sleep - sleep for a specified number of seconds


---------------------------------------------------------

::

          #include <unistd.h>

          unsigned int sleep(unsigned int seconds);


---------------------------------------------------------------

::

          sleep() causes the calling thread to sleep either until the
          number of real-time seconds specified in seconds have elapsed or
          until a signal arrives which is not ignored.


-----------------------------------------------------------------

::

          Zero if the requested time has elapsed, or the number of seconds
          left to sleep, if the call was interrupted by a signal handler.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────┬───────────────┬─────────────────────────────┐
          │Interface         │ Attribute     │ Value                       │
          ├──────────────────┼───────────────┼─────────────────────────────┤
          │sleep()           │ Thread safety │ MT-Unsafe sig:SIGCHLD/linux │
          └──────────────────┴───────────────┴─────────────────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          On Linux, sleep() is implemented via nanosleep(2).  See the
          nanosleep(2) man page for a discussion of the clock used.

      Portability notes
          On some systems, sleep() may be implemented using alarm(2) and
          SIGALRM (POSIX.1 permits this); mixing calls to alarm(2) and
          sleep() is a bad idea.

          Using longjmp(3) from a signal handler or modifying the handling
          of SIGALRM while sleeping will cause undefined results.


---------------------------------------------------------

::

          sleep(1), alarm(2), nanosleep(2), signal(2), signal(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                       SLEEP(3)

--------------

Pages that refer to this page: `sleep(1) <../man1/sleep.1.html>`__, 
`alarm(2) <../man2/alarm.2.html>`__, 
`clock_nanosleep(2) <../man2/clock_nanosleep.2.html>`__, 
`getitimer(2) <../man2/getitimer.2.html>`__, 
`nanosleep(2) <../man2/nanosleep.2.html>`__, 
`ualarm(3) <../man3/ualarm.3.html>`__, 
`usleep(3) <../man3/usleep.3.html>`__, 
`signal(7) <../man7/signal.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`time(7) <../man7/time.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/sleep.3.license.html>`__

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
