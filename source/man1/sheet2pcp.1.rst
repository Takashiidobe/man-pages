.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sheet2pcp(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `MAPPING CONFIGUR                 |                                   |
| ATION <#MAPPING_CONFIGURATION>`__ |                                   |
| \| `CAVEATS <#CAVEATS>`__ \|      |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SHEET2PCP(1)             General Commands Manual            SHEET2PCP(1)

NAME
-------------------------------------------------

::

          sheet2pcp - import spreadsheet data and create a PCP archive


---------------------------------------------------------

::

          sheet2pcp [-h host] [-Z timezone] infile mapfile outfile


---------------------------------------------------------------

::

          sheet2pcp is intended to read a data spreadsheet (infile)
          translate this into a Performance Co-Pilot (PCP) archive with the
          basename outfile.

          The input spreadsheet can be in any of the common formats,
          provided the appropriate Perl modules have been installed (see
          the CAVEATS section below).  The spreadsheet must be
          ``normalized'' so that each row contains data for the same time
          interval, and one of the columns contains the date and time for
          the data in each row.

          The resultant PCP archive may be used with all the PCP client
          tools to graph subsets of the data using pmchart(1), perform data
          reduction and reporting, filter with the PCP inference engine
          pmie(1), etc.

          The mapfile controls the import process and defines the data
          mapping from the spreadsheet columns onto the PCP data model.
          The file is written in XML and conforms to the syntax defined in
          the MAPPING CONFIGURATION section below.

          A series of physical files will be created with the prefix
          outfile.  These are outfile.0 (the performance data),
          outfile.meta (the metadata that describes the performance data)
          and outfile.index (a temporal index to improve efficiency of
          replay operations for the archive).  If any of these files exists
          already, then sheet2pcp will not overwrite them and will exit
          with an error message.

          The -h option is an alternate to the hostname attribute of the
          <sheet> element in mapfile described below.  If both are
          specified, the value from mapfile is used.

          The -Z option is an alternate to the timezone attribute of the
          <sheet> element in mapfile described below.  If both are
          specified, the value from mapfile is used.

          sheet2pcp is a Perl script that uses the PCP::LogImport Perl
          wrapper around the PCP libpcp_import library, and as such could
          be used as an example to develop new tools to import other types
          of performance data and create PCP archives.


-----------------------------------------------------------------------------------

::

          The mapfile contains specifications in standard XML format.

          The whole specification is wrapped in a <sheet> ... </sheet>
          element.  The  sheet tag supports the following optional
          attributes:

          heading   Specifies the number of heading rows to skip at the
                    start of the spreadsheet before processing data.
                    Example: heading=``1''.

          hostname  Set the source hostname in the PCP archive (the default
                    is to use the hostname of the local host).  Example:
                    hostname=``some.where.com''.

          timezone  Set the source timezone in the PCP archive (the default
                    is to use UTC).  The timezone must have the format
                    +HHMM (for hours and minutes East of UTC) or -HHMM (for
                    hours and minutes West of UTC).  Note in particular
                    that neither the zoneinfo (aka Olson) format, e.g.
                    Europe/Paris, nor the Posix TZ format, e.g.  EST+5 is
                    allowed.  Example: timezone=``+1100''.

          datefmt   The format of the date imported from the spreadsheet
                    may be specified as a concatenation of values that
                    specify the order of the year (Y), month (M) and day
                    (D) fields in a date.  The supported variants are DMY
                    (the default), MDY and YMD.  Example: datefmt=``YMD''.

          A <sheet> element contains one or more metric specifications of
          the form <metric>metricname</metric>.  The metric tag supports
          the following optional attributes:

          pmid      The Performance Metrics Identifier (PMID), specified as
                    3 numbers separated by a periods (.) to set the domain,
                    cluster and item fields of the PMID, see PMNS(5) for
                    more details of PMIDs.  If omitted, the PMID will be
                    automatically assigned by pmiAddMetric(3).  The value
                    PM_ID_NULL may be used to explicitly nominate the
                    default behaviour.  Examples: pmid=``60.0.2'',
                    pmid=``PM_ID_NULL''.

          indom     Each metric may have one or more values.  If a metric
                    always has one value, it is singular and the Instance
                    Domain should be set to PM_INDOM_NULL.  Otherwise indom
                    should be specified as 2 numbers separated by a period
                    (.)  to set the domain and ordinal fields of the
                    Instance Domain.  Examples: indom=``PM_INDOM_NULL'',
                    indom=``60.3'', indom=``PMI_DOMAIN.4''.

                    More than one metric can share the same Instance Domain
                    when the metrics have defined values over similar sets
                    of instances, e.g. all the metrics for each network
                    interface.  It is standard practice for the domain
                    field to be the same for the pmid and the indom; if the
                    pmid attribute is missing, then the domain field for
                    the indom should be the reserved domain PMI_DOMAIN.

                    If the indom attribute is omitted then the default
                    Instance Domain for the metric is PM_INDOM_NULL.

          units     The scale and dimension of the metric values along the
                    axes of space, time and count (events, messages,
                    packets, etc.) is specified with a 6-tuple.  These
                    values are passed to the pmiUnits(3) function to
                    generate a pmUnits structure.  Refer to pmLookupDesc(3)
                    for a full description of all the fields of this
                    structure.  The default is to assign no scale or
                    dimension to the metric, i.e. units=``0,0,0,0,0,0''.
                    Examples: units=``0,1,0,0,PM_TIME_MSEC,0''
                    (milliseconds),
                    units=``1,-1,0,PM_SPACE_MBYTE,PM_TIME_SEC,0''
                    (Mbytes/sec),
                    units=``0,1,-1,0,PM_TIME_USEC,PM_COUNT_ONE''
                    (microseconds/event).

          type      Defines the data type for the metric.  Refer to
                    pmLookupDesc(3) for a full description of the possible
                    type values; the default is PM_TYPE_FLOAT.  Examples:
                    type=``PM_TYPE_32'', type=``PM_TYPE_U64'',
                    type=``PM_TYPE_STRING''.

          sem       Defines the semantics of the metric.  Refer to
                    pmLookupDesc(3) for a full description of the possible
                    values; the default is PM_SEM_INSTANT.  Examples:
                    sem=``PM_SEM_COUNTER'', type=``PM_SEM_DISCRETE''.

          The remaining specifications define the data columns in order
          using exactly one <datetime></datetime> element, one or more
          <data>metricspec</data> elements and one or more <skip></skip>
          elements.

          The <datetime> element defines the column in which a date and
          time will be found to form the timestamp in the PCP archive for
          all the data in each row of the PCP archive.

          For the <data> element, a metricspec consists of a metric name
          (as defined in an earlier <metric> element), optionally followed
          by an instance name that is enclosed by square brackets, e.g.
          <data>hinv.ncpu</data>, <data>kernel.all.load[1 minute]</data>.

          The skip tag defines the column that should be skipped when
          preparing data for the PCP archive.

          The order of the <datetime>, <data> and <skip> elements matches
          the order of columns in the spreadsheet.  If the number of
          elements is not the same as the number of columns a warning is
          issued, and the extra elements or columns generate no metric
          values in the output archive.

      EXAMPLE
          The mapfile ...

                <?xml version="1.0" encoding="UTF-8"?>
                <sheet heading="1">
                    <!-- simple example -->
                    <metric pmid="60.0.2" indom="60.0" units="0,1,0,0,PM_TIME_MSEC,0"
                        type="PM_TYPE_U64" sem="PM_SEM_COUNTER">
                    kernel.percpu.cpu.sys</metric>
                    <datetime></datetime>
                    <skip></skip>
                    <data>kernel.percpu.cpu.sys[cpu0]</data>
                    <data>kernel.percpu.cpu.sys[cpu1]</data>
                </sheet>

          could be used for a spreadsheet in which the first few rows are
          ...

                Date;"Status";"SysTime - 0";"SysTime - 1";
                26/01/2001 14:05:22;"Some Busy";0.750;0.133
                26/01/2001 14:05:37;"OK";0.150;0.273
                26/01/2001 14:05:52;"All Busy";0.733;0.653


-------------------------------------------------------

::

          Only the first sheet from infile will be processed.

          Additional Perl modules must be installed for the various
          spreadsheet formats, although these are checked for ar run-time
          so only the modules required for the specific types of
          spreadsheets you wish to process need be installed:

          *.csv Spreadsheets in the Comma Separated Values (CSV) format
                require Text::CSV_XS(3pm).

          *.sxc or *.ods
                OpenOffice documents require Spreadsheet::ReadSXC(3pm),
                which in turn requires Archive::Zip(3pm).

          *.xls Classical Microsoft Office documents require
                Spreadsheet::ParseExcel(3pm), which in turn requires
                OLE::Storage_Lite(3pm).

          *.xlsx
                Microsoft OpenXML documents require Spreadsheet::XLSX(3pm).
                sheet2pcp does not appear to work with OpenXML documents
                saved from OpenOffice.


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

          pmchart(1), pmie(1), pmlogger(1), sed(1), pmiAddMetric(3),
          pmLookupDesc(3), pmiUnits(3), Archive::Zip(3pm),
          Date::Format(3pm), Date::Parse(3pm), PCP::LogImport(3pm),
          OLE::Storage_Lite(3pm), Spreadsheet::ParseExcel(3pm),
          Spreadsheet::ReadSXC(3pm), Spreadsheet::XLSX(3pm),
          Text::CSV_XS(3pm), XML::TokeParser(3pm) and LOGIMPORT(3).

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

   Performance Co-Pilot               PCP                      SHEET2PCP(1)

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
