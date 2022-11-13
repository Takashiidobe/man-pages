.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

LOGARCHIVE(5) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMM                             |                                   |
| ON FEATURES <#COMMON_FEATURES>`__ |                                   |
| \|                                |                                   |
| `ARCHIVE VOLUM                    |                                   |
| E (.0, .1, ...) RECORDS <#ARCHIVE |                                   |
| _VOLUME_(.0,_.1,_...)_RECORDS>`__ |                                   |
| \|                                |                                   |
| `METADATA FILE (.meta) RECORDS <# |                                   |
| METADATA_FILE_(.meta)_RECORDS>`__ |                                   |
| \|                                |                                   |
| `INDEX FILE (.index) RECORDS      |                                   |
| <#INDEX_FILE_(.index)_RECORDS>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LOGARCHIVE(5)              File Formats Manual             LOGARCHIVE(5)

NAME
-------------------------------------------------

::

          LOGARCHIVE - performance metrics archive format


---------------------------------------------------------------

::

          Performance Co-Pilot (PCP) archives store historical values about
          arbitrary metrics recorded from a single host.  Archives are
          machine independent and self-contained - all metadata required
          for off-line or off-site analysis is stored.

          The format is stable in order to allow long-term historical
          storage and processing by PMAPI client tools.

          Archives may be read by most PCP client tools, using the
          -a/--archive NAME option, or dumped raw by pmdumplog(1).
          Archives are created primarily by pmlogger(1), however they can
          also be created using the LOGIMPORT(3) programming interface.

          Archives may be merged, analyzed, modified and subsampled using
          pmlogreduce(1), pmlogsummary(1), pmlogrewrite(1) and
          pmlogextract(1).  In addition, PCP archives may be examined in
          sets or grouped together into "archive folios", which are created
          and managed by the mkaf(1) and pmafm(1) tools.

          Archives consist of several physical files that share a common
          arbitrary prefix, e.g.  myarchive.

          myarchive.0, myarchive.1, ...
                 One or more data volumes containing the metric values and
                 any error codes encountered during metric sampling.
                 Typically the largest of the files and may grow very
                 rapidly, depending on the pmlogger sampling interval(s)
                 being used.

          myarchive.meta
                 Information for PMAPI functions such as pmLookupDesc(3),
                 pmLookupLabels(3) and pmLookupInDom(3).  The metadata file
                 may grow sporadically as logged metrics, instance domains
                 and labels vary over time.

          myarchive.index
                 A temporal index, mapping timestamps to offsets in the
                 other files.


-----------------------------------------------------------------------

::

          All three types of files have a similar record-based structure, a
          convention of network-byte-order (big-endian) encoding, and
          32-bit fields for tagging/padding for those records.  Strings are
          stored as 8-bit characters without assuming a specific encoding,
          so normally ASCII.  See also the __pmLog* types in libpcp.h.

      RECORD FRAMING
          The volume and meta files are divided into self-identifying
          records.

       ┌───────┬────────┬─────────────────────────────────────────────────────┐
       │Offset │ Length │                        Name                         │
       ├───────┼────────┼─────────────────────────────────────────────────────┤
       │  0    │   4    │ N, length of record, in bytes, including this field │
       │  4    │  N-8   │ record payload, usually starting with a 32-bit tag  │
       │ N-4   │   4    │ N, length of record (again)                         │
       └───────┴────────┴─────────────────────────────────────────────────────┘

      ARCHIVE LOG LABEL
          All three types of files begin with a "log label" header, which
          identifies the host name, the time interval covered, and a time
          zone.

        ┌───────┬────────┬────────────────────────────────────────────────────┐
        │Offset │ Length │                        Name                        │
        ├───────┼────────┼────────────────────────────────────────────────────┤
        │  0    │   4    │ tag, PM_LOG_MAGIC | PM_LOG_VERS02=0x50052602       │
        │  4    │   4    │ pid of pmlogger process that wrote file            │
        │  8    │   4    │ log start time, seconds part (past UNIX epoch)     │
        │  12   │   4    │ log start time, microseconds part                  │
        │  16   │   4    │ current log volume number (or -1=.meta, -2=.index) │
        │  20   │   64   │ name of collection host                            │
        │  80   │   40   │ time zone string ($TZ environment variable)        │
        └───────┴────────┴────────────────────────────────────────────────────┘

          All fields, except for the current log volume number field, match
          for all archive-related files produced by a single run of the
          tool.


-----------------------------------------------------------------------------------------------------------------

::

      pmResult
          After the archive log label record, an archive volume file
          contains metric values corresponding to the pmResult set of one
          pmFetch operation, which is almost identical to the form on disk.
          The record size may vary according to number of PMIDs being
          fetched, the number of instances for their domains.  File size is
          limited to 2GiB, due to storage of 32-bit offsets within the
          temporal index.

           ┌────────┬────────┬───────────────────────────────────────────┐
           │Offset  │ Length │                   Name                    │
           ├────────┼────────┼───────────────────────────────────────────┤
           │   0    │   4    │ timestamp, seconds part (past UNIX epoch) │
           │   4    │   4    │ timestamp, microseconds part              │
           │   8    │   4    │ number of PMIDs with data following       │
           │  12    │   M    │ pmValueSet #0                             │
           │ 12+M   │   N    │ pmValueSet #1                             │
           │12+M+N  │  ...   │ ...                                       │
           │  NOP   │   X    │ pmValueBlock #0                           │
           │ NOP+X  │   Y    │ pmValueBlock #1                           │
           │NOP+X+Y │  ...   │ ...                                       │
           └────────┴────────┴───────────────────────────────────────────┘

          Records with a number-of-PMIDs equal to zero are "mark records",
          and represent interruptions, missing data, or time
          discontinuities in logging.

      pmValueSet
          This subrecord represents the measurements for one metric.

          ┌───────┬────────┬────────────────────────────────────────────────┐
          │Offset │ Length │                      Name                      │
          ├───────┼────────┼────────────────────────────────────────────────┤
          │  0    │   4    │ PMID                                           │
          │  4    │   4    │ number of values                               │
          │  8    │   4    │ storage mode, PM_VAL_INSITU=0 or PM_VAL_DPTR=1 │
          │  12   │   M    │ pmValue #0                                     │
          │ 12+M  │   N    │ pmValue #1                                     │
          │12+M+N │  ...   │ ...                                            │
          └───────┴────────┴────────────────────────────────────────────────┘

          The metric-description metadata for PMIDs is found in the .meta
          files.  These entries are not timestamped, so the metadata is
          assumed to be unchanging throughout the archiving session.

      pmValue
          This subrecord represents one measurement for one instance of the
          metric.  It is a variant type, depending on the parent
          pmValueSet's value-format field.  This allows small numbers to be
          encoded compactly, but retain flexibility for larger or variable-
          length data to be stored later in the pmResult record.

          ┌───────┬────────┬───────────────────────────────────────────────┐
          │Offset │ Length │                     Name                      │
          ├───────┼────────┼───────────────────────────────────────────────┤
          │  0    │   4    │ number in instance-domain (or PM_IN_NULL=-1)  │
          │  4    │   4    │ value (INSITU) or                             │
          │       │        │ offset in pmResult to our pmValueBlock (DPTR) │
          └───────┴────────┴───────────────────────────────────────────────┘

          The instance-domain metadata for PMIDs is found in the .meta
          files.  Since the numeric mappings may change during the lifetime
          of the logging session, it is important to match up the timestamp
          of the measurement record with the corresponding instance-domain
          record.  That is, the instance-domain corresponding to a
          measurement at time T are the records with largest timestamps T'
          <= T.

      pmValueBlock
          Instances of this subrecord are placed at the end of the
          pmValueSet, after all the pmValue subrecords.  If (and only if)
          needed, they are padded at the end to the next-higher 32-bit
          boundary.

          ┌───────┬────────┬────────────────────────────────────────────────┐
          │Offset │ Length │                      Name                      │
          ├───────┼────────┼────────────────────────────────────────────────┤
          │  0    │   1    │ value type (same as pmDesc.type)               │
          │  1    │   3    │ 4 + N, the length of the subrecord             │
          │  4    │   N    │ bytes that make up the raw value               │
          │ 4+N   │  0-3   │ padding (not included in the 4+N length field) │
          └───────┴────────┴────────────────────────────────────────────────┘

          Note that for PM_TYPE_STRING, the length includes an explicit
          NULL terminator byte.  For PM_TYPE_EVENT, the value bytestring is
          further structured.


---------------------------------------------------------------------------------------------------

::

          After the archive log label record, the metadata file contains
          interleaved metric-description and timestamped instance-domain
          descriptors.  File size is limited to 2GiB, due to storage of
          32-bit offsets within the temporal index.  Unlike the data
          volumes, these records are not forced to 32-bit alignment.  See
          also libpcp/logmeta.c.

      pmDesc
          Instances of this record represent the metric description, giving
          a name, type, instance-domain identifier, and a set of names to
          each PMID used in the archive volume.

        ┌───────┬────────┬───────────────────────────────────────────────────┐
        │Offset │ Length │                       Name                        │
        ├───────┼────────┼───────────────────────────────────────────────────┤
        │  0    │   4    │ tag, TYPE_DESC=1                                  │
        │  4    │   4    │ PMID                                              │
        │  8    │   4    │ type (PM_TYPE_*)                                  │
        │  12   │   4    │ instance domain number                            │
        │  16   │   4    │ semantics of value (PM_SEM_*)                     │
        │  20   │   4    │ units: bit-packed pmUnits                         │
        │  4    │   4    │ number of alternative names for this PMID         │
        │  28   │   4    │ N: number of bytes in this name                   │
        │  32   │   N    │ bytes of the name, no NULL terminator nor padding │
        │ 32+N  │   4    │ N2: number of bytes in next name                  │
        │ 36+N  │   N2   │ bytes of the name, no NULL terminator nor padding │
        │ ...   │  ...   │ ...                                               │
        └───────┴────────┴───────────────────────────────────────────────────┘

      pmLogIndom
          Instances of this record represent the number-string mapping
          table of an instance domain.  The instance domain number will
          have already been mentioned in a prior pmDesc record.  As new
          instances may appear over a long archiving run these records are
          timestamped, and must be searched when decoding pmResult records
          from the archive data volumes.  Instance names may be reused
          between instance numbers, so an offset-based string table is used
          that facilitates sharing.

         ┌─────────┬────────┬───────────────────────────────────────────────┐
         │ Offset  │ Length │                     Name                      │
         ├─────────┼────────┼───────────────────────────────────────────────┤
         │   0     │   4    │ tag, TYPE_INDOM=2                             │
         │   4     │   4    │ timestamp, seconds part (past UNIX epoch)     │
         │   8     │   4    │ timestamp, microseconds part                  │
         │   12    │   4    │ instance domain number                        │
         │   16    │   4    │ N: number of instances in domain, normally >0 │
         │   20    │   4    │ first instance number                         │
         │   24    │   4    │ second instance number (if appropriate)       │
         │  ...    │  ...   │ ...                                           │
         │ 20+4*N  │   4    │ first offset into string table (see below)    │
         │20+4*N+4 │   4    │ second offset into string table (etc.)        │
         │  ...    │  ...   │ ...                                           │
         │ 20+8*N  │   M    │ base of string table, containing              │
         │         │        │ packed, NULL-terminated instance names        │
         └─────────┴────────┴───────────────────────────────────────────────┘

          Records of this form replace the existing instance-domain: prior
          records are not searched for resolving instance numbers in
          measurements after this timestamp.

      pmLogLabelSet
          Instances of this record represent sets of name:value pairs
          associated with labels of the context, instance domains and
          individual performance metrics - refer to pmLookupLabels(3) for
          further details.

          Any instance domain number will have already been mentioned in a
          prior pmDesc record.  As new labels can appear during an
          archiving session, these records are timestamped and must be
          searched when decoding pmResult records from the archive data
          volumes.

       ┌────────────┬────────┬────────────────────────────────────────────────┐
       │  Offset    │ Length │                      Name                      │
       ├────────────┼────────┼────────────────────────────────────────────────┤
       │     0      │   4    │ tag, TYPE_LABEL=3                              │
       │     4      │   4    │ timestamp, seconds part (past UNIX epoch)      │
       │     8      │   4    │ timestamp, microseconds part                   │
       │    12      │   4    │ label type (PM_LABEL_* type macros.)           │
       │    16      │   4    │ numeric identifier - domain, PMID, etc         │
       │            │        │ or PM_IN_NULL=-1 for context labels            │
       │    20      │   4    │ N: number of label sets in this record,        │
       │            │        │ usually 1 except in the case of instances      │
       │    24      │   4    │ offset to the start of the JSONB labels string │
       │    28      │   L1   │ first labelset array entry (see below)         │
       │    ...     │  ...   │ ...                                            │
       │   28+L1    │   LN   │ N-th labelset array entry (see below)          │
       │    ...     │  ...   │ ...                                            │
       │28+L1+...LN │   M    │ concatenated JSONB strings for all labelsets   │
       └────────────┴────────┴────────────────────────────────────────────────┘

          Records of this form replace the existing labels for a given
          type: prior records are not searched for resolving that class of
          label in measurements after this timestamp.

          The individual labelset array entries are variable length,
          depending on the number of labels present within that set.  These
          entries contain the instance identifiers (in the case of type
          PM_LABEL_INSTANCES labels), lengths and offsets of each label
          name and value, and also any flags set for each label.

            ┌───────┬────────┬───────────────────────────────────────────┐
            │Offset │ Length │                   Name                    │
            ├───────┼────────┼───────────────────────────────────────────┤
            │  0    │   4    │ instance identifier (or PM_IN_NULL=-1)    │
            │  4    │   4    │ length of JSONB label string              │
            │  8    │   4    │ N: number of labels in this labelset      │
            │  12   │   2    │ first label name offset                   │
            │  14   │   1    │ first label name length                   │
            │  15   │   1    │ first label flags (e.g. optionality)      │
            │  16   │   2    │ first label value offset                  │
            │  18   │   2    │ first label value length                  │
            │  20   │   2    │ second label name offset (if appropriate) │
            │ ...   │  ...   │ ...                                       │
            └───────┴────────┴───────────────────────────────────────────┘

      pmLogText
          This record stores help text associated with a metric or an
          instance domain - as provided by pmLookupText(3) and
          pmLookupInDomText(3).

          The metric identifier and instance domain number will have
          already been mentioned in a prior pmDesc record.

          ┌───────┬────────┬──────────────────────────────────────────────┐
          │Offset │ Length │                     Name                     │
          ├───────┼────────┼──────────────────────────────────────────────┤
          │  0    │   4    │ tag, TYPE_TEXT=4                             │
          │  4    │   4    │ text and identifier type (PM_TEXT_* macros.) │
          │  8    │   4    │ numeric identifier - PMID or instance domain │
          │  12   │   M    │ help text string, arbitrary text             │
          └───────┴────────┴──────────────────────────────────────────────┘


-----------------------------------------------------------------------------------------------

::

          After the archive log label record, the temporal index file
          contains a plainly concatenated, unframed group of tuples, which
          relate timestamps to 32-bit seek offsets in the volume and meta
          files.  These records are fixed-size, fixed-format, and are not
          enclosed in the standard length/payload/length wrapper: they take
          up the entire remainder of the .index file.  See also
          libpcp/logutil.c.

        ┌───────┬────────┬───────────────────────────────────────────────────┐
        │Offset │ Length │                       Name                        │
        ├───────┼────────┼───────────────────────────────────────────────────┤
        │  0    │   4    │ event time, seconds part (past UNIX epoch)        │
        │  4    │   4    │ event time, microseconds part                     │
        │  8    │   4    │ archive volume number (0...N)                     │
        │  12   │   4    │ byte offset in .meta file of pmDesc or pmLogIndom │
        │  16   │   4    │ byte offset in archive volume file of pmResult    │
        └───────┴────────┴───────────────────────────────────────────────────┘

          Since the temporal index is optional, and exists only to speed up
          time-based random access to metrics and their metadata, the index
          records are emitted only intermittently.  An archive reader
          program should not presume any particular rate of data flow into
          the index.  However, common events that may trigger a new
          temporal-index record include changes in instance-domains,
          switching over to a new archive volume, and starting or stopping
          logging.  One reliable invariant however is that, for each index
          entry, there are to be no meta or archive-volume records with a
          timestamp after that in the index, but physically before the
          byte-offset in the index.


---------------------------------------------------

::

          Several PCP tools create archives in standard locations:

          $HOME/.pcp/pmlogger
                 default location for the interactive chart recording mode
                 in pmchart(1)
          $PCP_LOG_DIR/pmlogger
                 default location for pmlogger_daily(1) and
                 pmlogger_check(1) scripts


---------------------------------------------------------

::

          PCPIntro(1), PMAPI(3), pmLookupDesc(3), pmLookupInDom(3),
          pmLookupInDomText(3), pmLookupLabels(3), pmLookupText(3),
          mkaf(1), pmafm(1), pmchart(1), pmdumplog(1), pmlogger(1),
          pmlogger_check(1), pmlogger_daily(1), pmlogreduce(1),
          pmlogrewrite(1), pmlogsummary(1), pcp.conf(5), and pcp.env(5).

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

   Performance Co-Pilot                                       LOGARCHIVE(5)

--------------

Pages that refer to this page:
`pcp2elasticsearch(1) <../man1/pcp2elasticsearch.1.html>`__, 
`pcp2graphite(1) <../man1/pcp2graphite.1.html>`__, 
`pcp2influxdb(1) <../man1/pcp2influxdb.1.html>`__, 
`pcp2json(1) <../man1/pcp2json.1.html>`__, 
`pcp2spark(1) <../man1/pcp2spark.1.html>`__, 
`pcp2template(1) <../man1/pcp2template.1.html>`__, 
`pcp2xlsx(1) <../man1/pcp2xlsx.1.html>`__, 
`pcp2xml(1) <../man1/pcp2xml.1.html>`__, 
`pcp2zabbix(1) <../man1/pcp2zabbix.1.html>`__, 
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pmrep(1) <../man1/pmrep.1.html>`__

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
