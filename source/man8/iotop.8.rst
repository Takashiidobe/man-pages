.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

iotop(8) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IOTOP(8)                 System Manager's Manual                IOTOP(8)

NAME
-------------------------------------------------

::

          iotop - simple top-like I/O monitor


---------------------------------------------------------

::

          iotop [OPTIONS]


---------------------------------------------------------------

::

          iotop watches I/O usage information output by the Linux kernel
          (requires 2.6.20 or later) and displays a table of current I/O
          usage by processes or threads on the system. At least the
          CONFIG_TASK_DELAY_ACCT, CONFIG_TASK_IO_ACCOUNTING,
          CONFIG_TASKSTATS and CONFIG_VM_EVENT_COUNTERS options need to be
          enabled in your Linux kernel build configuration.

          iotop displays columns for the I/O bandwidth read and written by
          each process/thread during the sampling period. It also displays
          the percentage of time the thread/process spent while swapping in
          and while waiting on I/O. For each process, its I/O priority
          (class/level) is shown.

          In addition, the total I/O bandwidth read and written during the
          sampling period is displayed at the top of the interface.  Total
          DISK READ and Total DISK WRITE values represent total read and
          write bandwidth between processes and kernel threads on the one
          side and kernel block device subsystem on the other. While
          Current DISK READ and Current DISK WRITE values represent
          corresponding bandwidths for current disk I/O between kernel
          block device subsystem and underlying hardware (HDD, SSD, etc.).
          Thus Total and Current values may not be equal at any given
          moment of time due to data caching and I/O operations reordering
          that take place inside Linux kernel.

          Use the left and right arrows to change the sorting, r to reverse
          the sorting order, o to toggle the --only option, p to toggle the
          --processes option, a to toggle the --accumulated option, q to
          quit or i to change the priority of a thread or a process's
          thread(s). Any other key will force a refresh.


-------------------------------------------------------

::

          --version
                 Show the version number and exit

          -h, --help
                 Show usage information and exit

          -o, --only
                 Only show processes or threads actually doing I/O, instead
                 of showing all processes or threads. This can be
                 dynamically toggled by pressing o.

          -b, --batch
                 Turn on non-interactive mode.  Useful for logging I/O
                 usage over time.

          -n NUM, --iter=NUM
                 Set the number of iterations before quitting (never quit
                 by default).  This is most useful in non-interactive mode.

          -d SEC, --delay=SEC
                 Set the delay between iterations in seconds (1 second by
                 default).  Accepts non-integer values such as 1.1 seconds.

          -p PID, --pid=PID
                 A list of processes/threads to monitor (all by default).

          -u USER, --user=USER
                 A list of users to monitor (all by default)

          -P, --processes
                 Only show processes. Normally iotop shows all threads.

          -a, --accumulated
                 Show accumulated I/O instead of bandwidth. In this mode,
                 iotop shows the amount of I/O processes have done since
                 iotop started.

          -k, --kilobytes
                 Use kilobytes instead of a human friendly unit. This mode
                 is useful when scripting the batch mode of iotop. Instead
                 of choosing the most appropriate unit iotop will display
                 all sizes in kilobytes.

          -t, --time
                 Add a timestamp on each line (implies --batch). Each line
                 will be prefixed by the current time.

          -q, --quiet
                 suppress some lines of header (implies --batch). This
                 option can be specified up to three times to remove header
                 lines.

          --no-help
                 Suppress the keyboard shortcuts help display.
                 -q     column names are only printed on the first
                        iteration,
                 -qq    column names are never printed,
                 -qqq   the I/O summary is never printed.


---------------------------------------------------------

::

          ionice(1), top(1), vmstat(1), atop(1), htop(1)


-----------------------------------------------------

::

          iotop was written by Guillaume Chazarain.

          This manual page was started by Paul Wise for the Debian project
          and is placed in the public domain.

COLOPHON
---------------------------------------------------------

::

          This page is part of the iotop (a simple top-like I/O monitor)
          project.  Information about the project can be found at 
          ⟨http://guichaz.free.fr/iotop/⟩.  If you have a bug report for
          this manual page, send it to guichaz@gmail.com.  This page was
          obtained from the project's upstream Git repository
          ⟨git://repo.or.cz/iotop.git⟩ on 2021-08-27.  (At that time, the
          date of the most recent commit that was found in the repository
          was 2021-05-13.)  If you discover any rendering problems in this
          HTML version of the page, or you believe there is a better or
          more up-to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

                                  April 2009                       IOTOP(8)

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
