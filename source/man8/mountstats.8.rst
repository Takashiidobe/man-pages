.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mountstats(8) — Linux manual page
=================================

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

   mountstats(8)            System Manager's Manual           mountstats(8)

NAME
-------------------------------------------------

::

          mountstats - Displays various NFS client per-mount statistics


---------------------------------------------------------

::

          mountstats [-h|--help] [-v|--version] [-f|--file infile]
          [-S|--since sincefile] [ [-n|--nfs] | [-r|--rpc] | [-R|--raw] |
          [-x|--xprt] ] [mountpoint]...

          mountstats iostat [-h|--help] [-v|--version] [-f|--file infile]
          [-S|--since sincefile] [interval] [count] [mountpoint]...

          mountstats nfsstat [-h|--help] [-v|--version] [-f|--file infile]
          [-S|--since sincefile] [-3] [-4] [mountpoint]...


---------------------------------------------------------------

::

          The mountstats command displays various NFS client statisitics
          for each given mountpoint.

          If no mountpoint is given, statistics will be displayed for all
          NFS mountpoints on the client.

      Sub-commands
          Valid mountstats(8) subcommands are:

          mountstats
                 Display a combination of per-op RPC statistics, NFS event
                 counts, and NFS byte counts.  This is the default sub-
                 command that will be executed if no sub-command is given.

          iostat Display iostat-like statistics.

          nfsstat
                 Display nfsstat-like statistics.


-------------------------------------------------------

::

      Options valid for all sub-commands
          -h, --help
                 show the help message and exit

          -v, --version
                 show program's version number and exit

          -f infile, --file infile
                 Read stats from infile instead of /proc/self/mountstats.
                 infile must be in the same format as
                 /proc/self/mountstats.  This may be used with the
                 -S|--since options to display the delta between two
                 different points in time.  This may not be used with the
                 interval or count options of the iostat sub-command.

          -S sincefile, --since sincefile
                 Show difference between current stats and those in
                 sincefile.  sincefile must be in the same format as
                 /proc/self/mountstats.  This may be used with the
                 -f|--file options to display the delta between two
                 different points in time.  This may not be used with the
                 interval or count options of the iostat sub-command.

      Options specific to the mountstats sub-command
          -n, --nfs Display only the NFS statistics

          -r, --rpc
                 Display only the RPC statistics

          -R, --raw
                 Display only the raw statistics.  This is intended for use
                 with the -f|--file and -S|--since options.

          -x, --xprt
                 Display only the transport statistics

      Options specific to the iostat sub-command
          interval
                 Specifies the amount of time in seconds between each
                 report.  The first report contains statistics for the time
                 since each file system was mounted.  Each subsequent
                 report contains statistics collected during the interval
                 since the previous report.  This may not be used with the
                 -f|--file or -S|--since options.

          count  Determines the number of reports generated at interval
                 seconds apart.  If the interval parameter is specified
                 without the count parameter, the command generates reports
                 continuously.  This may not be used with the -f|--file or
                 -S|--since options.

      Options specific to the nfsstat sub-command
          -3     Show only NFS version 3 statistics.  The default is to
                 show both version 3 and version 4 statistics.

          -4     Show only NFS version 4 statistics.  The default is to
                 show both version 3 and version 4 statistics.


---------------------------------------------------

::

          /proc/self/mountstats


---------------------------------------------------------

::

          iostat(8), nfsiostat(8), nfsstat(8)


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

                                  12 Dec 2014                 mountstats(8)

--------------

Pages that refer to this page:
`pmdanfsclient(1) <../man1/pmdanfsclient.1.html>`__, 
`mountstats(8) <../man8/mountstats.8.html>`__, 
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
