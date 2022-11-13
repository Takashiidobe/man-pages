.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

chrt(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `POLICIES <#POLICIES>`__ \|       |                                   |
| `SCHEDULING                       |                                   |
|  OPTIONS <#SCHEDULING_OPTIONS>`__ |                                   |
| \| `OPTIONS <#OPTIONS>`__ \|      |                                   |
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

   CHRT(1)                       User Commands                      CHRT(1)

NAME
-------------------------------------------------

::

          chrt - manipulate the real-time attributes of a process


---------------------------------------------------------

::

          chrt [options] priority command argument ...

          chrt [options] -p [priority] PID


---------------------------------------------------------------

::

          chrt sets or retrieves the real-time scheduling attributes of an
          existing PID, or runs command with the given attributes.


---------------------------------------------------------

::

          -o, --other
              Set scheduling policy to SCHED_OTHER (time-sharing
              scheduling). This is the default Linux scheduling policy.

          -f, --fifo
              Set scheduling policy to SCHED_FIFO (first in-first out).

          -r, --rr
              Set scheduling policy to SCHED_RR (round-robin scheduling).
              When no policy is defined, the SCHED_RR is used as the
              default.

          -b, --batch
              Set scheduling policy to SCHED_BATCH (scheduling batch
              processes). Linux-specific, supported since 2.6.16. The
              priority argument has to be set to zero.

          -i, --idle
              Set scheduling policy to SCHED_IDLE (scheduling very low
              priority jobs). Linux-specific, supported since 2.6.23. The
              priority argument has to be set to zero.

          -d, --deadline
              Set scheduling policy to SCHED_DEADLINE (sporadic task model
              deadline scheduling). Linux-specific, supported since 3.14.
              The priority argument has to be set to zero. See also
              --sched-runtime, --sched-deadline and --sched-period. The
              relation between the options required by the kernel is
              runtime ⇐ deadline ⇐ period. chrt copies period to deadline
              if --sched-deadline is not specified and deadline to runtime
              if --sched-runtime is not specified. It means that at least
              --sched-period has to be specified. See sched(7) for more
              details.


-----------------------------------------------------------------------------

::

          -T, --sched-runtime nanoseconds
              Specifies runtime parameter for SCHED_DEADLINE policy
              (Linux-specific).

          -P, --sched-period nanoseconds
              Specifies period parameter for SCHED_DEADLINE policy
              (Linux-specific).

          -D, --sched-deadline nanoseconds
              Specifies deadline parameter for SCHED_DEADLINE policy
              (Linux-specific).

          -R, --reset-on-fork
              Use SCHED_RESET_ON_FORK or SCHED_FLAG_RESET_ON_FORK flag.
              Linux-specific, supported since 2.6.31.

          Each thread has a reset-on-fork scheduling flag. When this flag
          is set, children created by fork(2) do not inherit privileged
          scheduling policies. After the reset-on-fork flag has been
          enabled, it can be reset only if the thread has the CAP_SYS_NICE
          capability. This flag is disabled in child processes created by
          fork(2).

          More precisely, if the reset-on-fork flag is set, the following
          rules apply for subsequently created children:

          •   If the calling thread has a scheduling policy of SCHED_FIFO
              or SCHED_RR, the policy is reset to SCHED_OTHER in child
              processes.

          •   If the calling process has a negative nice value, the nice
              value is reset to zero in child processes.


-------------------------------------------------------

::

          -a, --all-tasks
              Set or retrieve the scheduling attributes of all the tasks
              (threads) for a given PID.

          -m, --max
              Show minimum and maximum valid priorities, then exit.

          -p, --pid
              Operate on an existing PID and do not launch a new task.

          -v, --verbose
              Show status information.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


---------------------------------------------------

::

          The default behavior is to run a new command:
              chrt priority command [arguments]

          You can also retrieve the real-time attributes of an existing
          task:
              chrt -p PID

          Or set them:
              chrt -r -p priority PID


---------------------------------------------------------------

::

          A user must possess CAP_SYS_NICE to change the scheduling
          attributes of a process. Any user can retrieve the scheduling
          information.


---------------------------------------------------

::

          Only SCHED_FIFO, SCHED_OTHER and SCHED_RR are part of POSIX
          1003.1b Process Scheduling. The other scheduling attributes may
          be ignored on some systems.

          Linux' default scheduling policy is SCHED_OTHER.


-------------------------------------------------------

::

          Robert Love <rml@tech9.net>, Karel Zak <kzak@redhat.com>


---------------------------------------------------------

::

          nice(1), renice(1), taskset(1), sched(7)

          See sched_setscheduler(2) for a description of the Linux
          scheduling scheme.


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The chrt command is part of the util-linux package which can be
          downloaded from Linux Kernel Archive
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

   util-linux 2.37.85-637cc       2021-04-02                        CHRT(1)

--------------

Pages that refer to this page: `renice(1) <../man1/renice.1.html>`__, 
`taskset(1) <../man1/taskset.1.html>`__, 
`sched_setattr(2) <../man2/sched_setattr.2.html>`__, 
`sched_setscheduler(2) <../man2/sched_setscheduler.2.html>`__, 
`sched(7) <../man7/sched.7.html>`__

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
