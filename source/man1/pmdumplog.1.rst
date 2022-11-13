.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdumplog(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDUMPLOG(1)             General Commands Manual            PMDUMPLOG(1)

NAME
-------------------------------------------------

::

          pmdumplog - dump internal details of a performance metrics
          archive log


---------------------------------------------------------

::

          pmdumplog [-adehIilLmMrstxzV?]  [-n pmnsfile] [-S starttime] [-T
          endtime] [-Z timezone] archive [metricname ...]
          pmdumplog [-v file]


---------------------------------------------------------------

::

          pmdumplog dumps assorted control, metadata, index and state
          information from the files of a Performance Co-Pilot (PCP)
          archive log.  The archive log has the base name archive and must
          have been previously created using pmlogger(1).

          Normally pmdumplog operates on the distributed Performance
          Metrics Name Space (PMNS), however if the -n option is specified
          an alternative local PMNS is loaded from the file pmnsfile.

          If any metricname arguments appear, the report will be restricted
          to information relevant to the named performance metrics.  If
          metricname is a non-leaf node in the namespace (see PMNS(5)),
          then pmdumplog will recursively descend the archive's namespace
          and report on all leaf nodes.

          Command line options control the specific information to be
          reported.


-------------------------------------------------------

::

          The available command line options are:

          -a, --all
               Report almost everything, i.e. the flags -d, -i, -L, -m, -s
               and -t.  The optional help text (-h) and label metadata
               strings (-e) are not reported by default.

          -d, --descs
               Display the metadata and descriptions for those performance
               metrics that appear at least once in the archive: see
               pmLookupDesc(3) for more details on the metadata describing
               metrics.

          -e, --labelsets
               Display the label metadata if it is present in the archive.
               See pmLookupLabels(3) for more details on the label metadata
               hierarchy associated with metrics.

          -h, --helptext
               Display metric and instance domain help text if present in
               the archive.  See pmLookupText(3) for more details on the
               help text associated with metrics.

          -i, --insts
               Display the instance domains, and any variations in their
               instance members over the duration of the archive: see
               pmGetInDom(3) for more details on instance domains.

          -I, --on-disk-insts
               Display the on-disk instance domains, which may use a
               different format and encoding than the one visible above the
               Performance Metrics Programming Interface (PMAPI) when using
               pmGetInDom(3) and related routines.  The on-disk format is
               only of interest when investigating the internal structure
               of PCP archives.

          -l, --label
               Dump the archive label, showing the log format version, the
               time and date for the start and (current) end of the
               archive, and the host from which the performance metrics
               values were collected.

          -L   Like -l, just a little more verbose.

          -m, --metrics
               Print the values for the performance metrics from the
               archive.  This is the default display option.

               Metrics without an instance domain are reported as:
                 [timestamp] metric-id (metric-name): value1 value2

               Metrics with an instance domain are reported as:
                 [timestamp] metric-id (metric-name):
                     inst [internal-id or "external-id"] value1 value2

               The timestamp is only reported for the first metric in a
               group of metrics sharing the same timestamp.

          -M, --markrecs
               If no metricname is specified then <mark> records are
               reported when they are found in the archive.  If metricname
               arguments are specified, then <mark> records are not
               reported by default.  The -M option forces <mark> records to
               be reported, even when metricname arguments are specified.

               <mark> records are inserted into a PCP archive log by
               pmlogger(1), pmlogextract(1), and similar tools to indicate
               a temporal discontinuity in the time-series of metric
               values.

          -n pmnsfile, --namespace=pmnsfile
               Load an alternative Performance Metrics Name Space (PMNS(5))
               from the file pmnsfile.

          -r, --reverse
               Process the archive in reverse order, from most recent to
               oldest recorded metric values.

          -s, --sizes
               Report the size in bytes of each physical record in the
               archive.

          -S starttime, --start=starttime
               When using the -m option, the report will be restricted to
               those records logged at or after starttime.  Refer to
               PCPIntro(1) for a complete description of the syntax for
               starttime.

          -t   Dump the temporal index that is used to provide accelerated
               access to large archive files.

               The integrity of the index will also be checked.  If the
               index is found to be corrupted, the ``*.index'' file can be
               renamed or removed and the archive will still be accessible,
               however retrievals may take longer without the index.  Note
               however that a corrupted temporal index is usually
               indicative of a deeper malaise that may infect all files in
               a PCP archive.

          -T endtime, --finish=endtime
               When using the -m option, the report will be restricted to
               those records logged before or at endtime.  Refer to
               PCPIntro(1) for a complete description of the syntax for
               endtime.

          -v file
               Verbose mode.  Dump the records from a physical archive file
               in hexadecimal format.  In this case file is the name of a
               single file, usually a basename (as would otherwise appear
               as the archive command line argument), concatenated with
               ``.'' followed by one of meta (the metadata), index (the
               temporal index), or a digit (one of the volumes of metric
               values).

               Use of -v precludes the use of all other options and
               arguments.

          -V, --version
               Display version number and exit.

          -x   Extended timestamp reporting format that includes the day of
               the week, day of the month, month and year in addition to
               the (default) hours, minutes and seconds time.  This is
               useful for archives that span multiple days.

               A second -x option will also report the timestamp as an
               offset from the start of the archive in units of seconds.
               This is useful in conjunction with debug diagnostics from
               the archive handling routines in libpcp.

          -z, --hostzone
               Change the timezone to the local timezone at the host that
               is the source of the performance metrics, as specified in
               the label record of the archive log.

          -Z timezone, --timezone=timezone
               By default, pmdumplog reports the time of day according to
               the local timezone on the system where pmdumplog is run.
               The -Z option changes the timezone to timezone in the format
               of the environment variable TZ as described in environ(7).

          -?, --help
               Display usage message and exit.


---------------------------------------------------

::

          $PCP_LOG_DIR/pmlogger/<hostname>
               Default directory for PCP archives containing performance
               metric values collected from the host hostname.


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

          PCPIntro(1), pmlogcheck(1), pmlogger(1), pmlogger_check(1),
          pmlogger_daily(1), pmloglabel(1), pmlogextract(1), PMAPI(3),
          pmGetInDom(3), pmLookupDesc(3), pcp.conf(5), pcp.env(5) and
          PMNS(5).

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

   Performance Co-Pilot               PCP                      PMDUMPLOG(1)

--------------

Pages that refer to this page: `pcp-ss(1) <../man1/pcp-ss.1.html>`__, 
`pmie(1) <../man1/pmie.1.html>`__, 
`pminfo(1) <../man1/pminfo.1.html>`__, 
`pmlc(1) <../man1/pmlc.1.html>`__, 
`pmlogcheck(1) <../man1/pmlogcheck.1.html>`__, 
`pmlogextract(1) <../man1/pmlogextract.1.html>`__, 
`pmlogger(1) <../man1/pmlogger.1.html>`__, 
`pmlogreduce(1) <../man1/pmlogreduce.1.html>`__, 
`pmlogrewrite(1) <../man1/pmlogrewrite.1.html>`__, 
`pmlogsize(1) <../man1/pmlogsize.1.html>`__, 
`pmprobe(1) <../man1/pmprobe.1.html>`__, 
`pmrep(1) <../man1/pmrep.1.html>`__, 
`pmval(1) <../man1/pmval.1.html>`__, 
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
