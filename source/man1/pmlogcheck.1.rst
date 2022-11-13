.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmlogcheck(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `OPERATION <#OPERATION>`__ \|     |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMLOGCHECK(1)            General Commands Manual           PMLOGCHECK(1)

NAME
-------------------------------------------------

::

          pmlogcheck - checks for invalid data in a PCP archive


---------------------------------------------------------

::

          pmlogcheck [-lmvwz?]  [-n pmnsfile] [-S start] [-T finish] [-Z
          timezone] archive


---------------------------------------------------------------

::

          pmlogcheck prints information about the nature of any invalid
          data which it detects in the files of a PCP archive.

          The archive has the base name archive and must have been
          previously created using pmlogger(1).


-------------------------------------------------------

::

          The available command line options are:

          -l, --label
               Print the archive label, showing the log format version, the
               time and date for the start and (current) end of the
               archive, and the host from which the performance metrics
               values were collected.

          -m, --metadataonly
               Skip Pass 3 (see below) and only check the archive meta
               data.  This can run substantially faster in cases where the
               volume data doesn't need to be checked, especially on
               archives with compressed data volume(s).

          -n pmnsfile, --namespace=pmnsfile
               Load an alternative Performance Metrics Name Space (PMNS(5))
               from the file pmnsfile.

          -S starttime, --start=starttime
               Specify the starttime of time window over which metrics
               should be checked in Pass 3 (see below).  Refer to
               PCPIntro(1) for a complete description of the syntax for
               starttime.

          -T endtime, --finish=endtime
               Specify the endtime of time window over which metrics should
               be checked in Pass 3 (see below).  Refer to PCPIntro(1) for
               a complete description of the syntax for endtime.

          -v, --verbose
               Enable verbose mode.

          -w, --nowrap
               Suppress reporting of counter wraps.

          -z, --hostzone
               Use the local timezone of the host that is the source of the
               performance metrics archive.  The default is to use the
               timezone of the local host.

          -Z timezone, --timezone=timezone
               Use timezone for the date and time.  Timezone is in the
               format of the environment variable TZ as described in
               environ(7).  The default is to use the timezone of the local
               host.

          -?, --help
               Display usage message and exit.


-----------------------------------------------------------

::

          The checking proceeds in a number of passes, each designed to
          validate progressively more complex semantic relationships
          between the information in a PCP archive.

      Pass 0
          Each physical file of the PCP archive is processed to ensure the
          label records are valid and consistent, and that each file
          contains an integral number of physical records with correct
          header and trailer fields.

          Any errors at this stage are usually fatal.  The PCP archive is
          probably damaged beyond repair, and no more passes of pmlogcheck
          are attempted.

      Pass 1
          Validates the integrity of the temporal index, usually
          archive.index.

          As the temporal index is (strictly speaking) optional, errors at
          this stage are handled by marking the index as bad and ignoring
          it for the remainder of the pmlogcheck passes.

          Permanent repair can be achieved by removing the temporal index
          file and then making a copy of the PCP archive using
          pmlogrewrite(1) or pmlogextract(1).  This will create a new
          temporal index for the copied archive as a side-effect.

      Pass 2
          Validates the integrity of the metadata file, usually
          archive.meta.

      Pass 3
          Validates the integrity of each of the log volumes of the PCP
          archive, usually archive.0, archive.1, etc.

          There is some basic integrity checks to ensure the encoding of
          values for each metric remains consistent and the values are well
          formed across all the observations in the archive.

          Also the timestamps for the observations are expected to be
          monotonically increasing as the archive is tranversed.

          Additional attention is given to counter metrics (type from
          pmLookupDesc(3) is PM_SEM_COUNTER) which are expected to have
          monotonically increasing values.  If the values are not monotonic
          increasing this may suggest a counter wrap has happened or there
          has been some interruption or reset to the underlying source of
          the performance data that is no captured in the archive.

          For each counter metric which has been detected as having wrapped
          at some point in the archive, pmlogcheck produces output
          describing the metric name (with instance identifiers where
          appropriate), the internal storage type for the metric, the value
          of the metric before the counter wrap (with its associated
          timestamp), and the value of the metric after the wrap (also with
          a timestamp).

          The -w option may be used to suppress reporting of counter wraps.

          pmlogcheck produces two different timestamp formats, depending on
          the interval over which it is run.  For an interval greater than
          24 hours, the date is displayed in addition to the time at which
          the counter wrap occurred.  If the extent of the data being
          checked is less than 24 hours, a more precise format is used
          (time is displayed with millisecond precision, but without the
          date).


---------------------------------------------------

::

          $PCP_VAR_DIR/pmns/*
               default PMNS specification files

          $PCP_LOG_DIR/pmlogger/<hostname>
               default directory for PCP archives containing performance
               data collected from the host hostname.


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

          PCPIntro(1), pmdumplog(1), pmlogextract(1), pmlogger(1),
          pmlogrewrite(1), pmlogsummary(1), pmLookupDesc(3), pcp.conf(5),
          pcp.env(5) and PMNS(5).

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

   Performance Co-Pilot               PCP                     PMLOGCHECK(1)

--------------

Pages that refer to this page:
`pmdumplog(1) <../man1/pmdumplog.1.html>`__, 
`pmloglabel(1) <../man1/pmloglabel.1.html>`__, 
`pmlogsize(1) <../man1/pmlogsize.1.html>`__

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
