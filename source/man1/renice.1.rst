.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

renice(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RENICE(1)                     User Commands                    RENICE(1)

NAME
-------------------------------------------------

::

          renice - alter priority of running processes


---------------------------------------------------------

::

          renice [-n] priority [-g|-p|-u] identifier...


---------------------------------------------------------------

::

          renice alters the scheduling priority of one or more running
          processes. The first argument is the priority value to be used.
          The other arguments are interpreted as process IDs (by default),
          process group IDs, user IDs, or user names. renice’ing a process
          group causes all processes in the process group to have their
          scheduling priority altered. renice’ing a user causes all
          processes owned by the user to have their scheduling priority
          altered.


-------------------------------------------------------

::

          -n, --priority priority
              Specify the scheduling priority to be used for the process,
              process group, or user. Use of the option -n or --priority is
              optional, but when used it must be the first argument.

          -g, --pgrp
              Interpret the succeeding arguments as process group IDs.

          -p, --pid
              Interpret the succeeding arguments as process IDs (the
              default).

          -u, --user
              Interpret the succeeding arguments as usernames or UIDs.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


---------------------------------------------------

::

          /etc/passwd
              to map user names to user IDs


---------------------------------------------------

::

          Users other than the superuser may only alter the priority of
          processes they own. Furthermore, an unprivileged user can only
          increase the "nice value" (i.e., choose a lower priority) and
          such changes are irreversible unless (since Linux 2.6.12) the
          user has a suitable "nice" resource limit (see ulimit(1p) and
          getrlimit(2)).

          The superuser may alter the priority of any process and set the
          priority to any value in the range -20 to 19. Useful priorities
          are: 19 (the affected processes will run only when nothing else
          in the system wants to), 0 (the "base" scheduling priority),
          anything negative (to make things go very fast).


-------------------------------------------------------

::

          The renice command appeared in 4.0BSD.


---------------------------------------------------------

::

          The following command would change the priority of the processes
          with PIDs 987 and 32, plus all processes owned by the users
          daemon and root:

          renice +1 987 -u daemon root -p 32


---------------------------------------------------------

::

          nice(1), chrt(1), getpriority(2), setpriority(2), credentials(7),
          sched(7)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The renice command is part of the util-linux package which can be
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

   util-linux 2.37.85-637cc       2021-04-02                      RENICE(1)

--------------

Pages that refer to this page: `chrt(1) <../man1/chrt.1.html>`__, 
`kill(1@@procps-ng) <../man1/kill.1@@procps-ng.html>`__, 
`nice(1) <../man1/nice.1.html>`__, 
`skill(1) <../man1/skill.1.html>`__, 
`taskset(1) <../man1/taskset.1.html>`__, 
`uclampset(1) <../man1/uclampset.1.html>`__, 
`getpriority(2) <../man2/getpriority.2.html>`__, 
`nice(2) <../man2/nice.2.html>`__

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
