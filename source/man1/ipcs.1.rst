.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ipcs(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
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

   IPCS(1)                       User Commands                      IPCS(1)

NAME
-------------------------------------------------

::

          ipcs - show information on IPC facilities


---------------------------------------------------------

::

          ipcs [options]


---------------------------------------------------------------

::

          ipcs shows information on System V inter-process communication
          facilities. By default it shows information about all three
          resources: shared memory segments, message queues, and semaphore
          arrays.


-------------------------------------------------------

::

          -i, --id id
              Show full details on just the one resource element identified
              by id. This option needs to be combined with one of the three
              resource options: -m, -q or -s.

          -h, --help
              Display help text and exit.

          -V, --version
              Display version information and exit.

      Resource options
          -m, --shmems
              Write information about active shared memory segments.

          -q, --queues
              Write information about active message queues.

          -s, --semaphores
              Write information about active semaphore sets.

          -a, --all
              Write information about all three resources (default).

      Output formats
          Of these options only one takes effect: the last one specified.

          -c, --creator
              Show creator and owner.

          -l, --limits
              Show resource limits.

          -p, --pid
              Show PIDs of creator and last operator.

          -t, --time
              Write time information. The time of the last control
              operation that changed the access permissions for all
              facilities, the time of the last msgsnd(2) and msgrcv(2)
              operations on message queues, the time of the last shmat(2)
              and shmdt(2) operations on shared memory, and the time of the
              last semop(2) operation on semaphores.

          -u, --summary
              Show status summary.

      Representation
          These affect only the -l (--limits) option.

          -b, --bytes
              Print sizes in bytes.

          --human
              Print sizes in human-readable format.


-------------------------------------------------------------------

::

          The Linux ipcs utility is not fully compatible to the POSIX ipcs
          utility. The Linux version does not support the POSIX -a, -b and
          -o options, but does support the -l and -u options not defined by
          POSIX. A portable application shall not use the -a, -b, -o, -l,
          and -u options.


---------------------------------------------------

::

          The current implementation of ipcs obtains information about
          available IPC resources by parsing the files in /proc/sysvipc.
          Before util-linux version v2.23, an alternate mechanism was used:
          the IPC_STAT command of msgctl(2), semctl(2), and shmctl(2). This
          mechanism is also used in later util-linux versions in the case
          where /proc is unavailable. A limitation of the IPC_STAT
          mechanism is that it can only be used to retrieve information
          about IPC resources for which the user has read permission.


-------------------------------------------------------

::

          Krishna Balasubramanian <balasub@cis.ohio-state.edu>


---------------------------------------------------------

::

          ipcmk(1), ipcrm(1), msgrcv(2), msgsnd(2), semget(2), semop(2),
          shmat(2), shmdt(2), shmget(2), sysvipc(7)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The ipcs command is part of the util-linux package which can be
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

   util-linux 2.37.85-637cc       2021-04-02                        IPCS(1)

--------------

Pages that refer to this page: `ipcmk(1) <../man1/ipcmk.1.html>`__, 
`ipcrm(1) <../man1/ipcrm.1.html>`__, 
`lsipc(1) <../man1/lsipc.1.html>`__, 
`msgctl(2) <../man2/msgctl.2.html>`__, 
`semctl(2) <../man2/semctl.2.html>`__, 
`semget(2) <../man2/semget.2.html>`__, 
`shmctl(2) <../man2/shmctl.2.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`sysvipc(7) <../man7/sysvipc.7.html>`__

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
