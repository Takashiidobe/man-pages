.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

choom(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
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

   CHOOM(1)                      User Commands                     CHOOM(1)

NAME
-------------------------------------------------

::

          choom - display and adjust OOM-killer score.

          choom -p PID

          choom -p PID -n number

          choom -n number [--] command [argument ...]


---------------------------------------------------------------

::

          The choom command displays and adjusts Out-Of-Memory killer score
          setting.


-------------------------------------------------------

::

          -p, --pid pid
              Specifies process ID.

          -n, --adjust value
              Specify the adjust score value.

          -h, --help
              Display help text and exit.

          -V, --version
              Display version information and exit.


---------------------------------------------------

::

          Linux kernel uses the badness heuristic to select which process
          gets killed in out of memory conditions.

          The badness heuristic assigns a value to each candidate task
          ranging from 0 (never kill) to 1000 (always kill) to determine
          which process is targeted. The units are roughly a proportion
          along that range of allowed memory the process may allocate from
          based on an estimation of its current memory and swap use. For
          example, if a task is using all allowed memory, its badness score
          will be 1000. If it is using half of its allowed memory, its
          score will be 500.

          There is an additional factor included in the badness score: the
          current memory and swap usage is discounted by 3% for root
          processes.

          The amount of "allowed" memory depends on the context in which
          the oom killer was called. If it is due to the memory assigned to
          the allocating task’s cpuset being exhausted, the allowed memory
          represents the set of mems assigned to that cpuset. If it is due
          to a mempolicy’s node(s) being exhausted, the allowed memory
          represents the set of mempolicy nodes. If it is due to a memory
          limit (or swap limit) being reached, the allowed memory is that
          configured limit. Finally, if it is due to the entire system
          being out of memory, the allowed memory represents all
          allocatable resources.

          The adjust score value is added to the badness score before it is
          used to determine which task to kill. Acceptable values range
          from -1000 to +1000. This allows userspace to polarize the
          preference for oom killing either by always preferring a certain
          task or completely disabling it. The lowest possible value,
          -1000, is equivalent to disabling oom killing entirely for that
          task since it will always report a badness score of 0.

          Setting an adjust score value of +500, for example, is roughly
          equivalent to allowing the remainder of tasks sharing the same
          system, cpuset, mempolicy, or memory controller resources to use
          at least 50% more memory. A value of -500, on the other hand,
          would be roughly equivalent to discounting 50% of the task’s
          allowed memory from being considered as scoring against the task.


-------------------------------------------------------

::

          Karel Zak <kzak@redhat.com>


---------------------------------------------------------

::

          proc(5)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The choom command is part of the util-linux package which can be
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

   util-linux 2.37.85-637cc       2021-04-02                       CHOOM(1)

--------------

Pages that refer to this page: `proc(5) <../man5/proc.5.html>`__

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
