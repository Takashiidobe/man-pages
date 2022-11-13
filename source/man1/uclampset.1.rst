.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

uclampset(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `USAGE <#USAGE>`__ \|             |                                   |
| `PERMISSIONS <#PERMISSIONS>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UCLAMPSET(1)                  User Commands                 UCLAMPSET(1)

NAME
-------------------------------------------------

::

          uclampset - manipulate the utilization clamping attributes of the
          system or a process


---------------------------------------------------------

::

          uclampset [options] [-m uclamp_min] [-M uclamp_max] _command
          argument

          uclampset [options] [-m uclamp_min] [-M uclamp_max] -p PID


---------------------------------------------------------------

::

          uclampset sets or retrieves the utilization clamping attributes
          of an existing PID, or runs command with the given attributes.

          Utilization clamping is a new feature added in v5.3. It gives a
          hint to the scheduler about the allowed range of utilization the
          task should be operating at.

          The utilization of the task affects frequency selection and task
          placement. Only schedutil cpufreq governor understands handling
          util clamp hints at the time of writing. Consult your kernel docs
          for further info about other cpufreq governors support.

          If you’re running on asymmetric heterogeneous system like Arm’s
          big.LITTLE. Utilization clamping can help bias task placement. If
          the task is boosted such that util_min value is higher than the
          little cores' capacity, then the scheduler will do its best to
          place it on a big core.

          Similarly, if util_max is smaller than or equal the capacity of
          the little cores, then the scheduler can still choose to place it
          there even if the actual utilization of the task is at max.

          Setting a task’s uclamp_min to a none zero value will effectively
          boost the task as when it runs it’ll always start from this
          utilization value.

          By setting a task’s uclamp_max below 1024, this will effectively
          cap the task as when it runs it’ll never be able to go above this
          utilization value.

          The full utilization range is: [0:1024]. The special value -1 is
          used to reset to system’s default.


-------------------------------------------------------

::

          -m
              Set util_min value.

          -M
              Set util_max value.

          -a, --all-tasks
              Set or retrieve the utilization clamping attributes of all
              the tasks (threads) for a given PID.

          -p, --pid
              Operate on an existing PID and do not launch a new task.

          -s, --system
              Set or retrieve the system-wide utilization clamping
              attributes.

          -R, --reset-on-fork
              Set SCHED_FLAG_RESET_ON_FORK flag.

          -v, --verbose
              Show status information.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


---------------------------------------------------

::

          The default behavior is to run a new command:
              uclampset [-m uclamp_min] [-M uclamp_max] command [arguments]

          You can also retrieve the utilization clamping attributes of an
          existing task:
              uclampset -p PID

          Or set them:
              uclampset -p PID [-m uclamp_min] [-M uclamp_max]

          Or control the system-wide attributes:
              uclampset -s [-m uclamp_min] [-M uclamp_max]


---------------------------------------------------------------

::

          A user must possess CAP_SYS_NICE to change the scheduling
          attributes of a process. Any user can retrieve the scheduling
          information.


---------------------------------------------------

::

          The system wide utilization clamp attributes are there to control
          the allowed range the tasks can use. By default both uclamp_min
          and uclamp_max are set to 1024. This means users can set the
          utilization clamp values for their task across the full range
          [0:1024].

          For example:
              uclampset -s -m 512 -M 700

          will prevent any task from being boosted higher than 512. And all
          tasks in the systems are capped to a utilization of 700.
          Effectively rendering the maximum performance of the system to
          700.

          Consult your kernel docs for the exact expected behavior on that
          kernel.


-------------------------------------------------------

::

          Qais Yousef <qais.yousef@arm.com>


---------------------------------------------------------

::

          nice(1), renice(1), taskset(1), sched(7)

          See sched_setscheduler(2) and sched_setattr(2) for a description
          of the Linux scheduling scheme.


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The uclampset command is part of the util-linux package which can
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

   util-linux 2.37.85-637cc       2021-04-28                   UCLAMPSET(1)

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
