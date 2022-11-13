.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmlogextract(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CONFIGURATION FILE SYNTA         |                                   |
| X <#CONFIGURATION_FILE_SYNTAX>`__ |                                   |
| \|                                |                                   |
| `CONFIGURATION FILE EXAMPLE       |                                   |
|  <#CONFIGURATION_FILE_EXAMPLE>`__ |                                   |
| \|                                |                                   |
| `MARK RECORDS <#MARK_RECORDS>`__  |                                   |
| \|                                |                                   |
| `META                             |                                   |
| DATA CHECKS <#METADATA_CHECKS>`__ |                                   |
| \| `CAVEATS <#CAVEATS>`__ \|      |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMLOGEXTRACT(1)          General Commands Manual         PMLOGEXTRACT(1)

NAME
-------------------------------------------------

::

          pmlogextract - reduce, extract, concatenate and merge Performance
          Co-Pilot archives


---------------------------------------------------------

::

          pmlogextract [-dfmwxz?]  [-c configfile] [-S starttime] [-s
          samples] [-T endtime] [-v volsamples] [-Z timezone] input [...]
          output


---------------------------------------------------------------

::

          pmlogextract reads one or more Performance Co-Pilot (PCP) archive
          logs identified by input and creates a temporally merged and/or
          reduced PCP archive log in output.  input is a comma-separated
          list of names, each of which may be the base name of an archive
          or the name of a directory containing one or more archives.  The
          nature of merging is controlled by the number of input archive
          logs, while the nature of data reduction is controlled by the
          command line arguments.  The input(s) must be sets of PCP archive
          logs created by pmlogger(1) with performance data collected from
          the same host, but usually over different time periods and
          possibly (although not usually) with different performance
          metrics being logged.

          If only one input is specified, then the default behavior simply
          copies the input set of PCP archive logs, into the output PCP
          archive log.  When two or more sets of PCP archive logs are
          specified as input, the sets of logs are merged (or concatenated)
          and written to output.

          In the output archive log a <mark> record may be inserted at a
          time just past the end of each of the input archive logs to
          indicate a possible temporal discontinuity between the end of one
          input archive log and the start of the next input archive log.
          See the MARK RECORDS section below for more information.  There
          is no <mark> record after the end of the last (in temporal order)
          of the input archive logs.


-------------------------------------------------------

::

          The available command line options are:

          -c config, --config=config
               Extract only the metrics specified in config from the input
               PCP archive log(s).  The config syntax accepted by
               pmlogextract is explained in more detail in the
               Configuration File Syntax section.

          -d, --desperate
               Desperate mode.  Normally if a fatal error occurs, all trace
               of the partially written PCP archive output is removed.
               With the -d option, the output archive log is not removed.

          -f, --first
               For most common uses, all of the input archive logs will
               have been collected in the same timezone.  But if this is
               not the case, then pmlogextract must choose one of the
               timezones from the input archive logs to be used as the
               timezone for the output archive log.  The default is to use
               the timezone from the last input archive log.  The -f option
               forces the timezone from the first input archive log to be
               used.

          -m, --mark
               As described in the MARK RECORDS section below, sometimes it
               is possible to safely omit <mark> records from the output
               archive.  If the -m option is specified, then the epilogue
               and prologue test is skipped and a <mark> record will always
               be inserted at the end of each input archive (except the
               last).  This is the original behaviour for pmlogextract.

          -S starttime, --start=starttime
               Define the start of a time window to restrict the samples
               retrieved or specify a ``natural'' alignment of the output
               sample times; refer to PCPIntro(1).  See also the -w option.

          -s samples, --samples=samples
               The argument samples defines the number of samples to be
               written to output.  If samples is 0 or -s is not specified,
               pmlogextract will sample until the end of the PCP archive
               log, or the end of the time window as specified by -T,
               whichever comes first.  The -s option will override the -T
               option if it occurs sooner.

          -T endtime, --finish=endtime
               Define the termination of a time window to restrict the
               samples retrieved or specify a ``natural'' alignment of the
               output sample times; refer to PCPIntro(1).  See also the -w
               option.

          -v volsamples
               The output archive log is potentially a multi-volume data
               set, and the -v option causes pmlogextract to start a new
               volume after volsamples log records have been written to the
               archive log.

               Independent of any -v option, each volume of an archive is
               limited to no more than 2^31 bytes, so pmlogextract will
               automatically create a new volume for the archive before
               this limit is reached.

          -w   Where -S and -T specify a time window within the same day,
               the -w flag will cause the data within the time window to be
               extracted, for every day in the archive log.  For example,
               the options -w -S @11:00 -T @15:00 specify that pmlogextract
               should include archive log records only for the periods from
               11am to 3pm on each day.  When -w is used, the output
               archive log will contain <mark> records to indicate the
               temporal discontinuity between the end of one time window
               and the start of the next.

          -x   It is expected that the metadata (name, PMID, type,
               semantics and units) for each metric will be consistent
               across all of the input PCP archive log(s) in which that
               metric appears.  In rare cases, e.g. in development, in QA
               and when a PMDA is upgraded, this may not be the case and
               pmlogextract will report the issue and abort without
               creating the output archive log.  This is done so the
               problem can be fixed with pmlogrewrite(1) before retrying
               the merge.  In unattended or QA environments it may be
               preferable to force the merge and omit the metrics with the
               mismatched metadata.  The -x option does this.

          -Z timezone, --timezone=timezone
               Use timezone when displaying the date and time.  Timezone is
               in the format of the environment variable TZ as described in
               environ(7).  The default is to initially use the timezone of
               the local host.

          -z, --hostzone
               Use the local timezone of the host from the input archive
               logs.  The default is to initially use the timezone of the
               local host.

          -?, --help
               Display usage message and exit.


-------------------------------------------------------------------------------------------

::

          The configfile contains metrics of interest - only those metrics
          (or instances) mentioned explicitly or implicitly in the
          configuration file will be included in the output archive.  Each
          specifications must begin on a new line, and may span multiple
          lines in the configuration file.  Instances may also be
          specified, but they are optional.  The format for each
          specification is

                  metric [[instance[,instance...]]]

          where metric may be a leaf or a non-leaf name in the Performance
          Metrics Name Space (PMNS, see PMNS(5)).  If a metric refers to a
          non-leaf node in the PMNS, pmlogextract will recursively descend
          the PMNS and include all metrics corresponding to descendent leaf
          nodes.

          Instances are optional, and may be specified as a list of one or
          more space (or comma) separated names, numbers or strings
          (enclosed in single or double quotes).  Elements in the list that
          are numbers are assumed to be internal instance identifiers - see
          pmGetInDom(3) for more information.  If no instances are given,
          then all instances of the associated metric(s) will be extracted.

          Any additional white space is ignored and comments may be added
          with a `#' prefix.


---------------------------------------------------------------------------------------------

::

          This is an example of a valid configfile:

                  #
                  # config file for pmlogextract
                  #

                  kernel.all.cpu
                  kernel.percpu.cpu.sys ["cpu0","cpu1"]
                  disk.dev ["dks0d1"]


-----------------------------------------------------------------

::

          When more than one input archive log contributes performance data
          to the output archive log, then <mark> records may be inserted to
          indicate a possible discontinuity in the performance data.

          A <mark> record contains a timestamp and no performance data and
          is used to indicate that there is a time period in the PCP
          archive log where we do not know the values of any performance
          metrics, because there was no pmlogger(1) collecting performance
          data during this period.  Since these periods are often
          associated with the restart of a service or pmcd(1) or a system,
          there may be considerable doubt as to the continuity of
          performance data across this time period.

          Most current archives are created with a prologue record at the
          beginning and an epilogue record at the end.  These records
          identify the state of pmcd(1) at the time, and may be used by
          pmlogextract to determine that there is no discontinuity between
          the end of one archive and the next output record, and as a
          consequence the <mark> record can safely be omitted from the
          output archive.

          The rationale behind <mark> records may be demonstrated with an
          example.  Consider one input archive log that starts at 00:10 and
          ends at 09:15 on the same day, and another input archive log that
          starts at 09:20 on the same day and ends at 00:10 the following
          morning.  This would be a very common case for archives managed
          and rotated by pmlogger_check(1) and pmlogger_daily(1).

          The output archive log created by pmlogextract would contain:
          00:10.000    first record from first input archive log
          ...
          09:15.000    last record from first input archive log
          09:15.001    <mark> record
          09:20.000    first record from second input archive log
          ...
          01:10.000    last record from second input archive log

          The time period where the performance data is missing starts just
          after 09:15 and ends just before 09:20.  When the output archive
          log is processed with any of the PCP reporting tools, the <mark>
          record is used to indicate a period of missing data.  For example
          using the output archive above, imagine one was reporting the
          average I/O rate at 30 minute intervals aligned on the hour and
          half-hour.  The I/O count metric is a counter, so the average I/O
          rate requires two valid values from consecutive sample times.
          There would be values for all the intervals ending at 09:00, then
          no values at 09:30 because of the <mark> record, then no values
          at 10:00 because the ``prior'' value at 09:30 is not available,
          then the rate would be reported again at 10:30 and continue every
          30 minutes until the last reported value at 01:00.

          The presence of <mark> records in a PCP archive log can be
          established using pmdumplog(1) where a timestamp and the
          annotation <mark> is used to indicate a <mark> record.


-----------------------------------------------------------------------

::

          When more than one input archive set is specified, pmlogextract
          performs a number of checks to ensure the metadata is consistent
          for metrics appearing in more than one of the input archive sets.
          These checks include:

          * metric data type is the same
          * metric semantics are the same
          * metric units are the same
          * metric is either always singular or always has the same
            instance domain
          * metrics with the same name have the same PMID
          * metrics with the same PMID have the same name

          If any of these checks fail, pmlogextract reports the details and
          aborts without creating the output archive.

          To address these semantic issues, use pmlogrewrite(1) to
          translate the input archives into equivalent archives with
          consistent metdadata before using pmlogextract.


-------------------------------------------------------

::

          The preamble metrics (pmcd.pmlogger.archive, pmcd.pmlogger.host,
          and pmcd.pmlogger.port), which are automatically recorded by
          pmlogger at the start of the archive, may not be present in the
          archive output by pmlogextract.  These metrics are only relevant
          while the archive is being created, and have no significance once
          recording has finished.


---------------------------------------------------------------

::

          All error conditions detected by pmlogextract are reported on
          stderr with textual (if sometimes terse) explanation.

          If one of the input archives contains no archive records then an
          ``empty archive'' warning is issued and that archive is skipped.

          Should one of the input archive logs be corrupted (this can
          happen if the pmlogger instance writing the log suddenly dies),
          then pmlogextract will detect and report the position of the
          corruption in the file, and any subsequent information from that
          archive log will not be processed.

          If any error is detected, pmlogextract will exit with a non-zero
          status.


---------------------------------------------------

::

          For each of the input and output archive logs, several physical
          files are used.

          archive.meta
               metadata (metric descriptions, instance domains, etc.) for
               the archive log

          archive.0
               initial volume of metrics values (subsequent volumes have
               suffixes 1, 2, ...) - for input these files may have been
               previously compressed with bzip2(1) or gzip(1) and thus may
               have an additional .bz2 or .gz suffix.

          archive.index
               temporal index to support rapid random access to the other
               files in the archive log.


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).

          For environment variables affecting PCP tools, see
          pmGetOptions(3).


---------------------------------------------------------

::

          PCPIntro(1), pmdumplog(1), pmlc(1), pmlogger(1), pmlogreduce(1),
          pmlogrewrite(1), pcp.conf(5), pcp.env(5) and PMNS(5).

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

   Performance Co-Pilot               PCP                   PMLOGEXTRACT(1)

--------------

Pages that refer to this page:
`ganglia2pcp(1) <../man1/ganglia2pcp.1.html>`__, 
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pmdumplog(1) <../man1/pmdumplog.1.html>`__, 
`pmlogcheck(1) <../man1/pmlogcheck.1.html>`__, 
`pmlogger_check(1) <../man1/pmlogger_check.1.html>`__, 
`pmlogger_merge(1) <../man1/pmlogger_merge.1.html>`__, 
`pmloglabel(1) <../man1/pmloglabel.1.html>`__, 
`pmlogpaste(1) <../man1/pmlogpaste.1.html>`__, 
`pmlogreduce(1) <../man1/pmlogreduce.1.html>`__, 
`pmlogrewrite(1) <../man1/pmlogrewrite.1.html>`__, 
`pmlogsummary(1) <../man1/pmlogsummary.1.html>`__, 
`pmrep(1) <../man1/pmrep.1.html>`__, 
`sar2pcp(1) <../man1/sar2pcp.1.html>`__, 
`pmfetch(3) <../man3/pmfetch.3.html>`__, 
`pmfetcharchive(3) <../man3/pmfetcharchive.3.html>`__, 
`LOGARCHIVE(5) <../man5/LOGARCHIVE.5.html>`__

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
