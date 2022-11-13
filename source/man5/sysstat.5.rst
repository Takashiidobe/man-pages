.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sysstat(5) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILE <#FILE>`__ \|               |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSSTAT(5)                 Linux User's Manual                SYSSTAT(5)

NAME
-------------------------------------------------

::

          sysstat - sysstat configuration file.


---------------------------------------------------------------

::

          This file is read by sa1(8) and sa2(8) shell scripts from the
          sysstat's set of tools.  It consists of a sequence of shell
          variable assignments used to configure sysstat logging.  The
          variables and their meanings are:

          COMPRESSAFTER
                 Number of days after which daily data files are to be
                 compressed.  The compression program is given in the ZIP
                 variable.

          DELAY_RANGE
                 Tell sa2 script to wait for a random delay in the
                 indicated range before running.  This delay is expressed
                 in seconds, and is aimed at preventing a massive I/O burst
                 at the same time on VM sharing the same storage area.  A
                 value of 0 means that sa2 script will generate its reports
                 files immediately.

          HISTORY
                 The number of days during which a daily data file or a
                 report should be kept. Data files or reports older than
                 this number of days will be removed by the sa2(8) shell
                 script.  Data files and reports are normally saved in the
                 /var/log/sa directory, under the name saDD (for data
                 files) or sarDD (for reports), where the DD parameter
                 indicates the current day.

                 The number of files actually kept in the /var/log/sa
                 directory may be slightly higher than the HISTORY value
                 due to the way the sa2 script figures out which files are
                 to be removed (see below "How the sa2(8) script applies
                 HISTORY value"). Using a value of 28 keeps a whole month's
                 worth of data. If you set HISTORY to a value greater than
                 28 then you should consider using sadc's option -D to
                 prevent older data files from being overwritten (see
                 sadc(8) manual page). In this latter case data files are
                 named saYYYYMMDD and reports sarYYYYMMDD, where YYYY
                 stands for the current year, MM for the current month and
                 DD for the current day.

                 How the sa2(8) script applies HISTORY value

                 The sa2 script uses the find command with the -mtime
                 option to figure out which files are to be removed. The
                 find command interprets this value as "N 24 hour periods",
                 ignoring any fractional part. This means that the last
                 modified time of a given sa[r]DD data or report file,
                 using a HISTORY of 1, has to have been modified at least
                 two days ago before it will be removed. And for a HISTORY
                 of 28 that would mean 29 days ago.

                 To figure out how a HISTORY of 28 is applied in practice,
                 we need to consider that the sa2 script that issues the
                 find command to remove the old files typically runs just
                 before mid-night on a given system, and since the first
                 record from sadc can also be written to the previous day's
                 data file (thereby moving its modification time up a bit),
                 the sa2 script will leave 30 files untouched. So for a
                 setting of 28, and counting the data file of the current
                 day, there will always be 31 files (or 30 files, depending
                 on the number of days in a month) in the /var/log/sa
                 directory during the majority of a given day.  E.g.:

                 April 30th: 31 files (Apr 30th-1st, Mar 31th)
                 May 1st: 30 files (May 1st, Apr 30th-2nd)

                 Yet we can note the following exceptions (as inspected at
                 Noon of the given day):

                 February 28th: 31 files (Feb 28th-1st, Jan 31st, 30th &
                 29th)
                 March 1st: 30 files (Mar 1st, Feb 28th-2nd, Jan 31st &
                 30th)
                 March 2nd: 29 files (Mar 1st & 2nd, Feb 28th-3rd, Jan.
                 31st)
                 March 3rd: 28 files (Mar 1st-3rd, Feb 28th-4th)
                 March 4th - March 28th: 28 files
                 March 29th: 29 files
                 March 30th: 30 files
                 March 31st: 31 files

                 (Determining the number of files in March on a leap year
                 is left as an exercise for the reader).

                 Things are simpler if you use the sa[r]YYYYMMDD name
                 format.  Apply the same logic as above in this case and
                 you will find that there are always HISTORY + 3 files in
                 the /var/log/sa directory during the majority of a given
                 day.

          REPORTS
                 Set this variable to false to prevent the sa2 script from
                 generating reports (the sarDD files).

          SA_DIR Directory where the standard system activity daily data
                 and report files are saved. Its default value is
                 /var/log/sa.

          SADC_OPTIONS
                 Options that should be passed to sadc(8).  With these
                 options (see sadc(8) manual page), you can select some
                 additional data which are going to be saved in daily data
                 files.  These options are used only when a new data file
                 is created. They will be ignored with an already existing
                 one.

          YESTERDAY
                 By default sa2 script generates yesterday's summary, since
                 the cron job usually runs right after midnight. If you
                 want sa2 to generate the summary of the same day (for
                 example when cron job runs at 23:53) set this variable to
                 no.

          ZIP    Program used to compress data and report files.


-------------------------------------------------

::

          /etc/sysconfig/sysstat


-----------------------------------------------------

::

          Sebastien Godard (sysstat <at> orange.fr)


---------------------------------------------------------

::

          sadc(8), sa1(8), sa2(8)

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

   Linux                           JULY 2020                     SYSSTAT(5)

--------------

Pages that refer to this page: `sadf(1) <../man1/sadf.1.html>`__, 
`sar(1) <../man1/sar.1.html>`__,  `sa1(8) <../man8/sa1.8.html>`__, 
`sa2(8) <../man8/sa2.8.html>`__,  `sadc(8) <../man8/sadc.8.html>`__

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
