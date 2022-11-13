.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nfsiostat-sysstat(1) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `REPORT <#REPORT>`__ \|           |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `BUG <#BUG>`__ \|                 |                                   |
| `FILE <#FILE>`__ \|               |                                   |
| `WARNING <#WARNING>`__ \|         |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NFSIOSTAT-SYSSTAT(1)       Linux User's Manual      NFSIOSTAT-SYSSTAT(1)

NAME
-------------------------------------------------

::

          nfsiostat-sysstat (the nfsiostat command from the sysstat
          package) - Report input/output statistics for network filesystems
          (NFS).


---------------------------------------------------------

::

          nfsiostat-sysstat [ -h ] [ -k | -m ] [ -t ] [ -V ] [ interval [
          count ] ]


---------------------------------------------------------------

::

          The nfsiostat-sysstat command displays statistics about read and
          write operations on NFS filesystems.

          The interval parameter specifies the amount of time in seconds
          between each report. The first report contains statistics for the
          time since system startup (boot). Each subsequent report contains
          statistics collected during the interval since the previous
          report.  A report consists of an NFS header row followed by a
          line of statistics for each network filesystem that is mounted.
          The count parameter can be specified in conjunction with the
          interval parameter. If the count parameter is specified, the
          value of count determines the number of reports generated at
          interval seconds apart. If the interval parameter is specified
          without the count parameter, the nfsiostat-sysstat command
          generates reports continuously.


-----------------------------------------------------

::

          The Network Filesystem (NFS) report provides statistics for each
          mounted network filesystem.  Transfer rates are shown in 1K
          blocks by default, unless the environment variable
          POSIXLY_CORRECT is set, in which case 512-byte blocks are used.
          The report shows the following fields:

          Filesystem:
                 This columns shows the hostname of the NFS server followed
                 by a colon and by the directory name where the network
                 filesystem is mounted.

          rBlk_nor/s (rkB_nor/s, rMB_nor)
                 Indicate the number of blocks (kilobytes, megabytes) read
                 by applications via the read(2) system call interface. A
                 block has a size of 512 bytes.

          wBlk_nor/s (wkB_nor/s, wMB_nor/s)
                 Indicate the number of blocks (kilobytes, megabytes)
                 written by applications via the write(2) system call
                 interface.

          rBlk_dir/s (rkB_dir/s, rMB_dir/s)
                 Indicate the number of blocks (kilobytes, megabytes) read
                 from files opened with the O_DIRECT flag.

          wBlk_dir/s (wkB_dir/s, wMB_dir/s)
                 Indicate the number of blocks (kilobytes, megabytes)
                 written to files opened with the O_DIRECT flag.

          rBlk_svr/s (rkB_svr/s, rMB_svr/s)
                 Indicate the number of blocks (kilobytes, megabytes) read
                 from the server by the NFS client via an NFS READ request.

          wBlk_svr/s (wkB_svr/s, wMB_svr/s)
                 Indicate the number of blocks (kilobytes, megabytes)
                 written to the server by the NFS client via an NFS WRITE
                 request.

          ops/s
                 Indicate the number of operations that were issued to the
                 filesystem per second.

          rops/s
                 Indicate the number of 'read' operations that were issued
                 to the filesystem per second.

          wops/s
                 Indicate the number of 'write' operations that were issued
                 to the filesystem per second.


-------------------------------------------------------

::

          -h     Make the NFS report easier to read by a human.

          -k     Display statistics in kilobytes per second.

          -m     Display statistics in megabytes per second.

          -t     Print the time for each report displayed. The timestamp
                 format may depend on the value of the S_TIME_FORMAT
                 environment variable (see below).

          -V     Print version number then exit.


---------------------------------------------------------------

::

          The nfsiostat-sysstat command takes into account the following
          environment variables:

          S_TIME_FORMAT
                 If this variable exists and its value is ISO then the
                 current locale will be ignored when printing the date in
                 the report header. The nfsiostat-sysstat command will use
                 the ISO 8601 format (YYYY-MM-DD) instead.  The timestamp
                 displayed with option -t will also be compliant with ISO
                 8601 format.

          POSIXLY_CORRECT
                 When this variable is set, transfer rates are shown in
                 512-byte blocks instead of the default 1K blocks.


-----------------------------------------------

::

          /proc filesystem must be mounted for nfsiostat-sysstat to work.


-------------------------------------------------

::

          /proc/self/mountstats contains statistics for network
          filesystems.


-------------------------------------------------------

::

          The nfsiostat command from the sysstat package (nfsiostat-
          sysstat) is now obsolete and is no longer maintained.  It will be
          removed in a future sysstat version.  Please use now the
          nfsiostat command from the nfs-utils package.


-----------------------------------------------------

::

          Written by Ivana Varekova (varekova <at> redhat.com)


---------------------------------------------------------

::

          nfsiostat(8), sar(1), pidstat(1), mpstat(1), vmstat(8),
          iostat(1), cifsiostat(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the sysstat (sysstat performance monitoring
          tools) project.  Information about the project can be found at 
          ⟨http://sebastien.godard.pagesperso-orange.fr/⟩.  If you have a
          bug report for this manual page, send it to sysstat-AT-orange.fr.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/sysstat/sysstat.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-07-17.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Linux                         JANUARY 2014          NFSIOSTAT-SYSSTAT(1)

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
