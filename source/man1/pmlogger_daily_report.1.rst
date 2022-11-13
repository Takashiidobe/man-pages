.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmlogger_daily_report(1) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMLOGGER_DAILY_REPORT(1) General Commands ManualPMLOGGER_DAILY_REPORT(1)

NAME
-------------------------------------------------

::

          pmlogger_daily_report - write Performance Co-Pilot daily summary
          reports


---------------------------------------------------------

::

          $PCP_BINADM_DIR/pmlogger_daily_report [-ApV?]  [-a archivefile]
          [-f outputfile] [-h hostname] [-l logfile] [-o directory] [-t
          interval]


---------------------------------------------------------------

::

          pmlogger_daily_report and the associated systemd(1) services
          write daily performance summary reports, much like those produced
          by sadc(1) and the sa2(8) utility.

          All of the command line arguments are optional and intended to be
          self explanatory.  The service is not enabled by default.  If the
          service is enabled and no arguments are specified,
          pmlogger_daily_report will be run by systemd at 2am each morning
          and write a performance summary report named sarXX (where XX is
          yesterdays day-of-the-month, wrapping to the previous month if
          today is the 1st).  The outputfile may be changed with the -f
          option.  The report will be written to the $PCP_LOG_DIR/sa
          directory by default, but this may be changed with the -o option
          to a different directory.

          Note that there are suffciently flexible command line options for
          pmlogger_daily_report to be used to read any archivefile and
          write the report to any output directory.

          If the -a option is not given, the default input archivefile is
          $PCP_ARCHIVE_DIR/HOSTNAME/YYYYMMDD, where HOSTNAME defaults to
          the local hostname (unless changed with the -h option) and
          YYYYMMDD is the base name of yesterdays merged archive, as
          produced by pmlogger(1) and the pmlogger_daily(1) scripts.  If
          archivefile is a directory, then pmlogger_daily_report will use
          all PCP archives found in that directory to write the report
          (this is known as multi-archive mode, and may be considerably
          slower than specifying a single archive as the input).

          The reports themselves are created by the pmrep(1) utility using
          its default configuration file, see pmrep.conf(5).  The pmrep(1)
          configuration entries used to write the reports is currently
          hardwired into the pmlogger_daily_report script.

          Finally, the input archives must contain sufficient metrics as
          needed by pmrep(1) to write the report.  On platforms that
          support it, the pcp-zeroconf package configures PCP logging as
          required for this - hence pmlogger_daily_report should be used
          with the pmlogger(1) configuration that is set up by pcp-
          zeroconf.  As the name suggests, pcp-zeroconf requires no
          additional configuration after installation in order to capture
          the required archives needed by pmlogger_daily_report.


-------------------------------------------------------

::

          The available command line options are:

          -a archive
               Specifies an alternate input archive file basename or
               directory path.

          -A   Use the start and end times of input archive for the report,
               as opposed to the default behaviour of 24 hours from
               midnight yesterday.

          -f filename
               Specifies an alternate output filename.  -h hostname
               Specifies an alternateA hostname to use within the default
               input archive file path.

          -l file, --logfile=file
               In order to ensure that mail is not unintentionally sent
               when this script is run from systemd(1) diagnostics are
               always sent to a log file.  By default, this file is
               $PCP_LOG_DIR/pmlogger/pmlogger_daily_report.log but this can
               be changed using the -l option.  If this log file already
               exists when the script starts, it will be renamed with a
               .prev suffix (overwriting any log file saved earlier) before
               diagnostics are generated to the log file.

          -p   If this option is specified then the status of the daily
               processing is polled and if the report has not been done in
               the last 24 hours then it is done now.  The intent is to
               have pmlogger_daily_report called regularly with the -p
               option (at 30 mins past the hour, every hour in the default
               systemd(1) setup) to ensure daily processing happens as soon
               as possible if it was missed at the regularly scheduled time
               (2am by default), for example if the system was down or
               suspended at that time.  With this option,
               pmlogger_daily_report simply exits if the previous day's
               processing has already been done.

          -t interval
               Specifies the sampling interval used when generating the
               report, in the format described in PCPIntro(1).  The default
               is every 10 minutes.

          -V, --verbose
               The output from the execution of the script may be extended
               using this option which enables verbose tracing of activity.
               By default the script generates no log output unless some
               error or warning condition is encountered.

          -?, --help
               Display usage message and exit.


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).


---------------------------------------------------------

::

          PCPIntro(1), pmlogger_daily(1), pmlogger(1), pmrep(1), sadc(1),
          systemd(1) and sa2(8).

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCP (Performance Co-Pilot) project.
          Information about the project can be found at 
          ⟨http://www.pcp.io/⟩.  If you have a bug report for this manual
          page, send it to pcp@groups.io.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/performancecopilot/pcp.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Performance Co-Pilot               PCP          PMLOGGER_DAILY_REPORT(1)

--------------

Pages that refer to this page:
`pmlogger_check(1) <../man1/pmlogger_check.1.html>`__

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
