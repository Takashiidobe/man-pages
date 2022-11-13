.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

alarm(2) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
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

   ALARM(2)                Linux Programmer's Manual               ALARM(2)

NAME
-------------------------------------------------

::

          alarm - set an alarm clock for delivery of a signal


---------------------------------------------------------

::

          #include <unistd.h>

          unsigned int alarm(unsigned int seconds);


---------------------------------------------------------------

::

          alarm() arranges for a SIGALRM signal to be delivered to the
          calling process in seconds seconds.

          If seconds is zero, any pending alarm is canceled.

          In any event any previously set alarm() is canceled.


-----------------------------------------------------------------

::

          alarm() returns the number of seconds remaining until any
          previously scheduled alarm was due to be delivered, or zero if
          there was no previously scheduled alarm.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.


---------------------------------------------------

::

          alarm() and setitimer(2) share the same timer; calls to one will
          interfere with use of the other.

          Alarms created by alarm() are preserved across execve(2) and are
          not inherited by children created via fork(2).

          sleep(3) may be implemented using SIGALRM; mixing calls to
          alarm() and sleep(3) is a bad idea.

          Scheduling delays can, as ever, cause the execution of the
          process to be delayed by an arbitrary amount of time.


---------------------------------------------------------

::

          gettimeofday(2), pause(2), select(2), setitimer(2), sigaction(2),
          signal(2), timer_create(2), timerfd_create(2), sleep(3), time(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2017-05-03                       ALARM(2)

--------------

Pages that refer to this page: `tload(1) <../man1/tload.1.html>`__, 
`fork(2) <../man2/fork.2.html>`__, 
`getitimer(2) <../man2/getitimer.2.html>`__, 
`seccomp(2) <../man2/seccomp.2.html>`__, 
`signal(2) <../man2/signal.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`sleep(3) <../man3/sleep.3.html>`__, 
`ualarm(3) <../man3/ualarm.3.html>`__, 
`usleep(3) <../man3/usleep.3.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`signal(7) <../man7/signal.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`time(7) <../man7/time.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/alarm.2.license.html>`__

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
