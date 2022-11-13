.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

taskset(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `USAGE <#USAGE>`__ \|             |                                   |
| `PERMISSIONS <#PERMISSIONS>`__ \| |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TASKSET(1)                    User Commands                   TASKSET(1)

NAME
-------------------------------------------------

::

          taskset - set or retrieve a process's CPU affinity


---------------------------------------------------------

::

          taskset [options] mask command [argument...]

          taskset [options] -p [mask] pid


---------------------------------------------------------------

::

          The taskset command is used to set or retrieve the CPU affinity
          of a running process given its pid, or to launch a new command
          with a given CPU affinity. CPU affinity is a scheduler property
          that "bonds" a process to a given set of CPUs on the system. The
          Linux scheduler will honor the given CPU affinity and the process
          will not run on any other CPUs. Note that the Linux scheduler
          also supports natural CPU affinity: the scheduler attempts to
          keep processes on the same CPU as long as practical for
          performance reasons. Therefore, forcing a specific CPU affinity
          is useful only in certain applications.

          The CPU affinity is represented as a bitmask, with the lowest
          order bit corresponding to the first logical CPU and the highest
          order bit corresponding to the last logical CPU. Not all CPUs may
          exist on a given system but a mask may specify more CPUs than are
          present. A retrieved mask will reflect only the bits that
          correspond to CPUs physically on the system. If an invalid mask
          is given (i.e., one that corresponds to no valid CPUs on the
          current system) an error is returned. The masks may be specified
          in hexadecimal (with or without a leading "0x"), or as a CPU list
          with the --cpu-list option. For example,

          0x00000001
              is processor #0,

          0x00000003
              is processors #0 and #1,

          0xFFFFFFFF
              is processors #0 through #31,

          32
              is processors #1, #4, and #5,

          --cpu-list 0-2,6
              is processors #0, #1, #2, and #6.

          --cpu-list 0-10:2
              is processors #0, #2, #4, #6, #8 and #10. The suffix ":N"
              specifies stride in the range, for example 0-10:3 is
              interpreted as 0,3,6,9 list.

          When taskset returns, it is guaranteed that the given program has
          been scheduled to a legal CPU.


-------------------------------------------------------

::

          -a, --all-tasks
              Set or retrieve the CPU affinity of all the tasks (threads)
              for a given PID.

          -c, --cpu-list
              Interpret mask as numerical list of processors instead of a
              bitmask. Numbers are separated by commas and may include
              ranges. For example: 0,5,8-11.

          -p, --pid
              Operate on an existing PID and do not launch a new task.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


---------------------------------------------------

::

          The default behavior is to run a new command with a given
          affinity mask:
              taskset mask command [arguments]

          You can also retrieve the CPU affinity of an existing task:
              taskset -p pid

          Or set it:
              taskset -p mask pid


---------------------------------------------------------------

::

          A user can change the CPU affinity of a process belonging to the
          same user. A user must possess CAP_SYS_NICE to change the CPU
          affinity of a process belonging to another user. A user can
          retrieve the affinity mask of any process.


-------------------------------------------------------

::

          Written by Robert M. Love.


-----------------------------------------------------------

::

          Copyright © 2004 Robert M. Love. This is free software; see the
          source for copying conditions. There is NO warranty; not even for
          MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


---------------------------------------------------------

::

          chrt(1), nice(1), renice(1), sched_getaffinity(2),
          sched_setaffinity(2)

          See sched(7) for a description of the Linux scheduling scheme.


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The taskset command is part of the util-linux package which can
          be downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.85-637cc       2021-04-02                     TASKSET(1)

--------------

Pages that refer to this page: `chrt(1) <../man1/chrt.1.html>`__, 
`uclampset(1) <../man1/uclampset.1.html>`__, 
`sched_setaffinity(2) <../man2/sched_setaffinity.2.html>`__, 
`cpuset(7) <../man7/cpuset.7.html>`__, 
`sched(7) <../man7/sched.7.html>`__, 
`migratepages(8) <../man8/migratepages.8.html>`__

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
