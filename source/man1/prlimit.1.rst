.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

prlimit(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `GENE                             |                                   |
| RAL OPTIONS <#GENERAL_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `RESOUR                           |                                   |
| CE OPTIONS <#RESOURCE_OPTIONS>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
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

   PRLIMIT(1)                    User Commands                   PRLIMIT(1)

NAME
-------------------------------------------------

::

          prlimit - get and set process resource limits


---------------------------------------------------------

::

          prlimit [options] [--resource[=limits]] [--pid PID]

          prlimit [options] [--resource[=limits]] command [argument...]


---------------------------------------------------------------

::

          Given a process ID and one or more resources, prlimit tries to
          retrieve and/or modify the limits.

          When command is given, prlimit will run this command with the
          given arguments.

          The limits parameter is composed of a soft and a hard value,
          separated by a colon (:), in order to modify the existing values.
          If no limits are given, prlimit will display the current values.
          If one of the values is not given, then the existing one will be
          used. To specify the unlimited or infinity limit (RLIM_INFINITY),
          the -1 or 'unlimited' string can be passed.

          Because of the nature of limits, the soft limit must be lower or
          equal to the high limit (also called the ceiling). To see all
          available resource limits, refer to the RESOURCE OPTIONS section.

          •   soft:_hard_ Specify both limits.

          •   soft: Specify only the soft limit.

          •   :hard Specify only the hard limit.

          •   value Specify both limits to the same value.


-----------------------------------------------------------------------

::

          -h, --help
              Display help text and exit.

          --noheadings
              Do not print a header line.

          -o, --output list
              Define the output columns to use. If no output arrangement is
              specified, then a default set is used. Use --help to get a
              list of all supported columns.

          -p, --pid
              Specify the process id; if none is given, the running process
              will be used.

          --raw
              Use the raw output format.

          --verbose
              Verbose mode.

          -V, --version
              Display version information and exit.


-------------------------------------------------------------------------

::

          -c, --core[=limits]
              Maximum size of a core file.

          -d, --data[=limits]
              Maximum data size.

          -e, --nice[=limits]
              Maximum nice priority allowed to raise.

          -f, --fsize[=limits]
              Maximum file size.

          -i, --sigpending[=limits]
              Maximum number of pending signals.

          -l, --memlock[=limits]
              Maximum locked-in-memory address space.

          -m, --rss[=limits]
              Maximum Resident Set Size (RSS).

          -n, --nofile[=limits]
              Maximum number of open files.

          -q, --msgqueue[=limits]
              Maximum number of bytes in POSIX message queues.

          -r, --rtprio[=limits]
              Maximum real-time priority.

          -s, --stack[=limits]
              Maximum size of the stack.

          -t, --cpu[=limits]
              CPU time, in seconds.

          -u, --nproc[=limits]
              Maximum number of processes.

          -v, --as[=limits]
              Address space limit.

          -x, --locks[=limits]
              Maximum number of file locks held.

          -y, --rttime[=limits]
              Timeout for real-time tasks.


---------------------------------------------------

::

          The prlimit system call is supported since Linux 2.6.36, older
          kernels will break this program.


---------------------------------------------------------

::

          prlimit --pid 13134
              Display limit values for all current resources.

          prlimit --pid 13134 --rss --nofile=1024:4095
              Display the limits of the RSS, and set the soft and hard
              limits for the number of open files to 1024 and 4095,
              respectively.

          prlimit --pid 13134 --nproc=512:
              Modify only the soft limit for the number of processes.

          prlimit --pid $$ --nproc=unlimited
              Set for the current process both the soft and ceiling values
              for the number of processes to unlimited.

          prlimit --cpu=10 sort -u hugefile
              Set both the soft and hard CPU time limit to ten seconds and
              run 'sort'.


-------------------------------------------------------

::

          Davidlohr Bueso <dave@gnu.org> - In memory of Dennis M. Ritchie.


---------------------------------------------------------

::

          ulimit(1p), prlimit(2)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The prlimit command is part of the util-linux package which can
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

   util-linux 2.37.109-b366e69    2021-06-20                     PRLIMIT(1)

--------------

Pages that refer to this page:
`getrlimit(2) <../man2/getrlimit.2.html>`__, 
`cgroups(7) <../man7/cgroups.7.html>`__

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
