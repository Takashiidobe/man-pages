.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nfsiostat(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   nfsiostat(8)             System Manager's Manual            nfsiostat(8)

NAME
-------------------------------------------------

::

          nfsiostat - Emulate iostat for NFS mount points using
          /proc/self/mountstats


---------------------------------------------------------

::

          nfsiostat [[<interval>] [<count>]] [<options>][<mount_point>]


---------------------------------------------------------------

::

          The nfsiostat command displays NFS client per-mount statisitics.

          <interval>
                 specifies the amount of time in seconds between each
                 report.  The first report contains statistics for the time
                 since each file system was mounted.  Each subsequent
                 report contains statistics collected during the interval
                 since the previous report.

          <count>
                 If the <count> parameter is specified, the value of
                 <count> determines the number of reports generated at
                 <interval> seconds apart. if the interval parameter is
                 specified without the <count> parameter, the command
                 generates reports continuously.

          <options>
                 Define below

          <mount_point>
                 If one or more <mount point> names are specified,
                 statistics for only these mount points will be displayed.
                 Otherwise, all NFS mount points on the client are listed.

          The meaning of each column of nfsiostat's output is the
          following:
                  - op/s
                         This is the number of operations per second.
                  - rpc bklog
                         This is the length of the backlog queue.
                  - kB/s
                         This is the number of kB written/read per second.
                  - kB/op
                         This is the number of kB written/read per each
                         operation.
                  - retrans
                         This is the number of retransmissions.
                  - avg RTT (ms)
                         This is the duration from the time that client's
                         kernel sends the RPC request until the time it
                         receives the reply.
                  - avg exe (ms)
                         This is the duration from the time that NFS client
                         does the RPC request to its kernel until the RPC
                         request is completed, this includes the RTT time
                         above.
                  - avg queue (ms)
                         This is the duration from the time the NFS client
                         created the RPC request task to the time the
                         request is transmitted.
                  - errors
                         This is the number of operations that completed
                         with an error status (status < 0).  This count is
                         only available on kernels with RPC iostats version
                         1.1 or above.

          Note that if an interval is used as argument to nfsiostat, then
          the diffrence from previous interval will be displayed, otherwise
          the results will be from the time that the share was mounted.


-------------------------------------------------------

::

          -a  or  --attr
                 displays statistics related to the attribute cache

          -d  or  --dir
                 displays statistics related to directory operations

          -h  or  --help
                 shows help message and exit

          -l LIST or  --list=LIST
                 only print stats for first LIST mount points

          -p  or  --page
                 displays statistics related to the page cache

          -s  or  --sort
                 Sort NFS mount points by ops/second

          --version
                 show program's version number and exit


---------------------------------------------------

::

          /proc/self/mountstats


---------------------------------------------------------

::

          iostat(8), mountstats(8), nfsstat(8)


-----------------------------------------------------

::

          Chuck Lever <chuck.lever@oracle.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the nfs-utils (NFS utilities) project.
          Information about the project can be found at 
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩.  If you have a
          bug report for this manual page, see
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=summary⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-21.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                  15 Apr 2010                  nfsiostat(8)

--------------

Pages that refer to this page:
`nfsiostat-sysstat(1) <../man1/nfsiostat-sysstat.1.html>`__, 
`mountstats(8) <../man8/mountstats.8.html>`__

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
