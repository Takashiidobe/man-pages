.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cifsiostat(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `REPORT <#REPORT>`__ \|           |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `BUG <#BUG>`__ \|                 |                                   |
| `FILE <#FILE>`__ \|               |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CIFSIOSTAT(1)              Linux User's Manual             CIFSIOSTAT(1)

NAME
-------------------------------------------------

::

          cifsiostat - Report CIFS statistics.


---------------------------------------------------------

::

          cifsiostat [ -h ] [ -k | -m ] [ -t ] [ -V ] [ --dec={ 0 | 1 | 2 }
          ] [ --human ] [ --pretty ] [ interval [ count ] ]


---------------------------------------------------------------

::

          The cifsiostat command displays statistics about read and write
          operations on CIFS filesystems.

          The interval parameter specifies the amount of time in seconds
          between each report. The first report contains statistics for the
          time since system startup (boot). Each subsequent report contains
          statistics collected during the interval since the previous
          report.  A report consists of a CIFS header row followed by a
          line of statistics for each CIFS filesystem that is mounted.  The
          count parameter can be specified in conjunction with the interval
          parameter. If the count parameter is specified, the value of
          count determines the number of reports generated at interval
          seconds apart. If the interval parameter is specified without the
          count parameter, the cifsiostat command generates reports
          continuously.


-----------------------------------------------------

::

          The CIFS report provides statistics for each mounted CIFS
          filesystem.  The report shows the following fields:

          Filesystem:
                 This columns shows the mount point of the CIFS filesystem.

          rB/s (rkB/s, rMB/s)
                 Indicate the average number of bytes (kilobytes,
                 megabytes) read per second.

          wB/s (wkB/s, wMB/s)
                 Indicate the average number of bytes (kilobytes,
                 megabytes) written per second.

          rop/s  Indicate the number of 'read' operations that were issued
                 to the filesystem per second.

          wop/s  Indicate the number of 'write' operations that were issued
                 to the filesystem per second.

          fo/s   Indicate the number of open files per second.

          fc/s   Indicate the number of closed files per second.

          fd/s   Indicate the number of deleted files per second.


-------------------------------------------------------

::

          --dec={ 0 | 1 | 2 }
                 Specify the number of decimal places to use (0 to 2,
                 default value is 2).

          -h     This option is equivalent to specifying --human --pretty.

          --human
                 Print sizes in human readable format (e.g. 1.0k, 1.2M,
                 etc.)  The units displayed with this option supersede any
                 other default units (e.g.  kilobytes, sectors...)
                 associated with the metrics.

          -k     Display statistics in kilobytes per second.

          -m     Display statistics in megabytes per second.

          --pretty
                 Make the CIFS report easier to read by a human.

          -t     Print the time for each report displayed. The timestamp
                 format may depend on the value of the S_TIME_FORMAT
                 environment variable (see below).

          -V     Print version number then exit.


---------------------------------------------------------------

::

          The cifsiostat command takes into account the following
          environment variables:

          S_COLORS
                 By default statistics are displayed in color when the
                 output is connected to a terminal.  Use this variable to
                 change the settings. Possible values for this variable are
                 never, always or auto (the latter is equivalent to the
                 default settings).
                 Please note that the color (being red, yellow, or some
                 other color) used to display a value is not indicative of
                 any kind of issue simply because of the color. It only
                 indicates different ranges of values.

          S_COLORS_SGR
                 Specify the colors and other attributes used to display
                 statistics on the terminal.  Its value is a colon-
                 separated list of capabilities that defaults to
                 I=32;22:N=34;1:Z=34;22.  Supported capabilities are:

                 I=     SGR substring for filesystem names.

                 N=     SGR substring for non-zero statistics values.

                 Z=     SGR substring for zero values.

          S_TIME_FORMAT
                 If this variable exists and its value is ISO then the
                 current locale will be ignored when printing the date in
                 the report header. The cifsiostat command will use the ISO
                 8601 format (YYYY-MM-DD) instead.  The timestamp displayed
                 with option -t will also be compliant with ISO 8601
                 format.


-----------------------------------------------

::

          /proc filesystem must be mounted for cifsiostat to work.

          Although cifsiostat speaks of kilobytes (kB), megabytes (MB)...,
          it actually uses kibibytes (kiB), mebibytes (MiB)...  A kibibyte
          is equal to 1024 bytes, and a mebibyte is equal to 1024
          kibibytes.


-------------------------------------------------

::

          /proc/fs/cifs/Stats contains CIFS statistics.


-------------------------------------------------------

::

          Written by Ivana Varekova (varekova <at> redhat.com)
          Maintained by Sebastien Godard (sysstat <at> orange.fr)


---------------------------------------------------------

::

          sar(1), pidstat(1), mpstat(1), vmstat(8), iostat(1), tapestat(1),
          nfsiostat(1)

          https://github.com/sysstat/sysstat 
          http://pagesperso-orange.fr/sebastien.godard/ 

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

   Linux                           JULY 2020                  CIFSIOSTAT(1)

--------------

Pages that refer to this page: `iostat(1) <../man1/iostat.1.html>`__, 
`nfsiostat-sysstat(1) <../man1/nfsiostat-sysstat.1.html>`__

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
