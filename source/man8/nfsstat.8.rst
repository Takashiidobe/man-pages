.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nfsstat(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `DISPLAY <#DISPLAY>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   nfsstat(8)               System Manager's Manual              nfsstat(8)

NAME
-------------------------------------------------

::

          nfsstat - list NFS statistics


---------------------------------------------------------

::

          nfsstat [OPTION]...


---------------------------------------------------------------

::

          The nfsstat displays statistics kept about NFS client and server
          activity.


-------------------------------------------------------

::

          -s, --server
                 Print only server-side statistics. The default is to print
                 both server and client statistics.

          -c, --client
                 Print only client-side statistics.

          -n, --nfs
                 Print only NFS statistics. The default is to print both
                 NFS and RPC information.

          -2     Print only NFS v2 statistics. The default is to only print
                 information about the versions of NFS that have non-zero
                 counts.

          -3     Print only NFS v3 statistics. The default is to only print
                 information about the versions of NFS that have non-zero
                 counts.

          -4     Print only NFS v4 statistics. The default is to only print
                 information about the versions of NFS that have non-zero
                 counts.

          -m, --mounts
                 Print information about each of the mounted NFS file
                 systems.

                 If this option is used, all other options are ignored.

          -r, --rpc
                 Print only RPC statistics.

          -o facility
                 Display statistics for the specified facility, which must
                 be one of:

                 nfs    NFS protocol information, split up by RPC call.

                 rpc    General RPC information.

                 net    Network layer statistics, such as the number of
                        received packets, number of TCP connections, etc.

                 fh     Usage information on the server's file handle
                        cache, including the total number of lookups, and
                        the number of hits and misses.

                 rc     Usage information on the server's request reply
                        cache, including the total number of lookups, and
                        the number of hits and misses.

                 io     Usage information on the server's io statistics;
                        bytes read and written.

                 ra     Usage information on the server's read ahead cache,
                        including the ra cache size, the depth of ra cache
                        hits, and ra cache misses.

                 all    Display all of the above facilities.

          -v, --verbose
                 This is equivalent to -o all.

          -l, --list
                 Print information in list form.

          -S, --since file
                 Instead of printing current statistics, nfsstat imports
                 statistics from file and displays the difference between
                 those and the current statistics.  Valid input files may
                 be in the form of /proc/net/rpc/nfs (raw client stats),
                 /proc/net/rpc/nfsd (raw server stats), or saved output
                 from nfsstat itself (client and/or server stats).   Any
                 statistics missing from a saved nfsstat output file are
                 treated as zeroes.

          -Z[interval], --sleep=[interval]
                 Instead of printing current statistics and immediately
                 exiting, nfsstat takes a snapshot of the current
                 statistics and pauses until it receives SIGINT (typically
                 from Ctrl-C), at which point it takes another snapshot and
                 displays the difference between the two.  If interval is
                 specified, nfsstat will print the number of NFS calls made
                 since the previous report.  Stats will be printed
                 repeatedly every interval seconds.


---------------------------------------------------------

::

          nfsstat -o all -234
                 Show all information about all versions of NFS.

          nfsstat --verbose -234
                 Same as above.

          nfsstat -o all
                 Show all information about active versions of NFS.

          nfsstat --nfs --server -3
                 Show statistics for NFS version 3 server.

          nfsstat -m
                 Show information about mounted NFS filesystems.


-------------------------------------------------------

::

          The Flags output from the -m option is the same as the flags give
          to the mount command.


---------------------------------------------------

::

          /proc/net/rpc/nfsd
                 procfs-based interface to kernel NFS server statistics.

          /proc/net/rpc/nfs
                 procfs-based interface to kernel NFS client statistics.

          /proc/mounts
                 procfs-based interface to the mounted filesystems.


---------------------------------------------------------

::

          rpc.nfsd(8).  nfs(5).


-------------------------------------------------

::

          The default output has been changed.  To get the old default
          output you must run nfsstat --auto -2.

          The function of the -v and -a options have changed. The -a option
          is now reserved for future use. The -v does what the -a option
          used to do, and the new -[234] options replace the -v option.

          The Display section should be more complete.

          Further bugs can be found or reported at http://nfs.sf.net/ .


-----------------------------------------------------

::

          Olaf Kirch, <okir@suse.de>

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

                                  7 Aug 2007                     nfsstat(8)

--------------

Pages that refer to this page: `nfsd(7) <../man7/nfsd.7.html>`__, 
`mountstats(8) <../man8/mountstats.8.html>`__, 
`nfsd(8) <../man8/nfsd.8.html>`__, 
`nfsiostat(8) <../man8/nfsiostat.8.html>`__

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
