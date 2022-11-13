.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmgetoptions(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FLAGS VALUES <#FLAGS_VALUES>`__  |                                   |
| \|                                |                                   |
| `OPTIONS                          |                                   |
|  VIA ENVIRONMENT VARIABLES <#OPTI |                                   |
| ONS_VIA_ENVIRONMENT_VARIABLES>`__ |                                   |
| \|                                |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMGETOPTIONS(3)         Library Functions Manual         PMGETOPTIONS(3)

NAME
-------------------------------------------------

::

          pmgetopt_r, pmGetOptions, pmGetContextOptions, pmFreeOptions,
          pmUsageMessage - command line handling for PMAPI tools


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmgetopt_r(int argc, char *const *argv, pmOptions *opts);
          int pmGetOptions(int argc, char *const *argv, pmOptions *opts);
          int pmGetContextOptions(int ctx, pmOptions *opts);
          void pmUsageMessage(pmOptions *opts);
          void pmFreeOptions(pmOptions *opts);

          cc ... -lpcp


---------------------------------------------------------------

::

          The pmGetOptions function provides command line option processing
          services for both monitor and collector PMAPI(3) tools.  It is
          modelled on the thread-safe variants of the GNU getopt_long(3)
          API, and primarily differs in its focus on providing generalised
          processing for the (de-facto) standard PCP command line options
          described in PCPIntro(1).  These common options include the host
          and archive specification, time windows, timezones, sample
          counts, time intervals, and so on.

          The primary interface is pmGetOptions, which should be passed the
          argc argument count and argv array, as passed to the main()
          function on program invocation.  The final opts argument
          describes the set of long and short options the tools is prepared
          to process, and other metadata regarding how those options should
          be processed.

          The pmgetopt_r interface, used internally by pmGetOptions,
          behaves in a similar fashion, but it does not perform any common
          option processing.  It is more suited to PCP collector processes,
          whereas PCP monitor tools tend to use pmGetOptions.

          The opts argument consists of an array of pmLongOpts entries
          describing the arguments, as well as the enclosing pmOptions
          struct, which are defined as follows (internal fields are not
          presented, for brevity):

            typedef struct {
                const char *        long_opt;
                int                 has_arg;
                int                 short_opt;
                const char *        argname;
                const char *        message;
            } pmLongOptions;

            typedef struct {
                int                 version;
                int                 flags;
                const char *        short_options;
                pmLongOptions *     long_options;
                const char *        short_usage;
                pmOptionOverride    override;

                int                 index;
                int                 optind;
                int                 opterr;
                int                 optopt;
                char                *optarg;
                /* [internal fields, undocumented] */

                int                 errors;
                int                 context; /* PM_CONTEXT_{HOST,ARCHIVE,LOCAL} */
                int                 nhosts;
                int                 narchives;
                char **             hosts;
                char **             archives;
                struct timeval      start;
                struct timeval      finish;
                struct timeval      origin;
                struct timeval      interval;
                char *              align_optarg;
                char *              start_optarg;
                char *              finish_optarg;
                char *              origin_optarg;
                char *              guiport_optarg;
                char *              timezone;
                int                 samples;
                int                 guiport;
                int                 padding;
                unsigned int        guiflag : 1;
                unsigned int        tzflag  : 1;
                unsigned int        nsflag  : 1;
                unsigned int        Lflag   : 1;
                unsigned int        zeroes  : 28;
            } pmOptions;

          The initial flags and version fields describe how the rest of the
          pmOptions structure is to be interpreted.  These fields can be
          zeroed, specifying a default interpretation.  Alternatively, the
          PMAPI_VERSION macro can be used to specify the API level to use
          (currently, values of 2 or less are allowed).  The flags field
          can be used to modify option processing behaviour as described in
          the ``FLAGS VALUES'' section below.

          The array of long_options pmLongOpts structures must be
          terminated by a sentinel and the PMAPI_OPTIONS_END macro can be
          used to effect this termination.  Individual records within the
          long_options array can be of two types - options headers, or
          actual options.  An options header is constructed using the
          PMAPI_OPTIONS_HEADER macro, and is used for usage message option
          grouping.  Free form text can be inserted into the usage message
          at any point using the PMAPI_OPTIONS_TEXT macro - this is
          intended for additional explanatory text covering detailed usage
          that is beyond the scope of the individual headers or options.
          Otherwise, the array entry specifies an option.  These should be
          named (long_opt) if a long-option form is allowed, specify
          whether or not they take an argument (has_arg), specify the
          single character variant argument (short_opt) if a short-option
          form is allowed, and finally specify how to present the option in
          the usage message.  This latter component consists of a short,
          one-word description of the optional argument (argname) and a
          one-line description of what the command-line option does
          (message).

          The short_usage string is also used only when constructing the
          usage message.  It forms the component of the usage message that
          follows the program name (i.e. argv[0]).

          The optional short_options string is the normal getopt command-
          line option specification string, using individual characters
          (those with arguments are designated as such using the ':'
          character) - as used by all getopt implementations.

          A facility is provided to extend the existing set of common
          options with additional options, as well as to re-task the
          standard options into non-standard roles for individual tools.
          The latter is achieved using the override method, which allows a
          callback function to be provided which will be called on receipt
          of every argument, prior to common processing.  If this callback
          returns a non-zero value the common processing will be short-
          circuited for that option, otherwise processing continues.  Thus,
          aach client tool is free to choose exactly which of the standard
          options they wish to support - this can be all, some, or none,
          and no matter what they choose, each tool always has access to
          the long option parsing capability and the usage message
          generation facility.

          The remaining pmOptions structure fields are filled in as a
          result of processing the arguments, and are largely self-
          explanatory.  Further discussion of these is deferred to the
          ``FLAGS VALUES'' section below.  The error field contains a count
          of errors detected during option processing.  These can be either
          usage or runtime errors, as indicated by the flags field (set,
          and passed out to the caller).  Typically, a command line tool
          will fail to start successfully and will produce an error message
          (e.g. via pmUsageMessage) if the error field is non-zero at the
          end of either pmGetOptions or pmGetContextOptions.

          Some command line option post-processing can only be performed
          once the tool has established a PMAPI context via
          pmNewContext(3).  This processing includes use of context-aware
          timezones (-z), and time window processing (-A, -O, -S, -T) that
          may be affected by the timezone, for example.  The
          pmGetContextOptions function is available for such situations,
          and it completes any remaining processing of opts with respect to
          the ctx context identifier given.

          The pmUsageMessage function generates a usage message for the
          tool, and included both standard PCP options and custom options
          for each tool, as specified by the pmLongOptions array.  It
          supports grouping of options (via PMAPI_OPTIONS_HEADER) as well
          as neat formatting of all options - short and long - their
          arguments, and individual explanatory messages.  It will build
          this usage message using pmprintf(3) upon which it will issue a
          single pmflush(3) before returning to the caller, provided the
          PM_OPTFLAG_USAGE_ERR flag is set in flags, which will happen
          automatically during option parsing, when usage errors are
          detected.

          In certain situations, such as recording lists of host
          specifications or PCP archive paths, the pmGetOptions routine may
          allocate memory, and store pointers to it within opts.  Should a
          program wish to free this memory before exiting, it can use the
          pmFreeOptions routine to do so.  This is safe to call
          irrespective of whether memory was allocated dynamically,
          provided that opts was zeroed initially.


-----------------------------------------------------------------

::

          PM_OPTFLAG_INIT
                 Used internally within the library to indicate
                 initialisation has been done, so that on subsequent calls
                 it will not be done again.

          PM_OPTFLAG_DONE
                 Used primarily internally within the library to indicate
                 that the final option processing has been completed.  This
                 processing involves cross-referencing a number of the
                 options, to check for mutual exclusion, for example.
                 There may be other post-processing at this stage also,
                 provided it does not require a PMAPI context.

          PM_OPTFLAG_MULTI
                 Allow more than one host or set of archives to be
                 specified.  The default is to allow one source of metrics
                 only, however some of the more sophisticated tools permit
                 multiple metric sources, each of which is handled within a
                 separate context.  See also PM_OPTFLAG_MIXED.

          PM_OPTFLAG_USAGE_ERR
                 Indicates that the library has detected a command-line
                 usage error.  This is an error such as when an option
                 requires an argument but none is supplied, or conflicting
                 options are specified (such as -s and -T).

          PM_OPTFLAG_RUNTIME_ERR
                 Indicates that the library has detected an error at run
                 time.  This is an error such as failing to retrieve
                 timezone information from pmcd(1) or failing to load an
                 alternate metric namespace from a local file (via the -n
                 option).

          PM_OPTFLAG_EXIT
                 Indicates a suggestion from the library that the tool exit
                 cleanly.  This is used when the version number is
                 requested, for example (the -V option and PMOPT_VERSION
                 macro).

          PM_OPTFLAG_POSIX
                 Use strict POSIX command line argument handling.  This
                 means options and following arguments will not be
                 reordered, so additional options cannot follow command
                 line arguments.  This may be important for tools where the
                 arguments can be negative numbers, for example, as these
                 should not be treated as command line options in this
                 case.

          PM_OPTFLAG_MIXED
                 Allow both live and archive metric sources to be
                 specified.  The default is to allow one type of metric
                 context only, however some of the more sophisticated tools
                 permit multiple context types.  See also PM_OPTFLAG_MULTI.

          PM_OPTFLAG_ENV_ONLY
                 Many options can be specified through the either the
                 command line or from similarly-named environment
                 variables.  This flag disables all argument parsing, and
                 only changes opts based on the environment variables.
                 This may be useful for tools wishing to ensure no command
                 line option conflicts occur between their own set and the
                 standard PCP option set (such as an existing tool,
                 reimplemented using PMAPI services).

          PM_OPTFLAG_LONG_ONLY
                 Only process long options, not short options.

          PM_OPTFLAG_BOUNDARIES
                 The default pmGetOptions behaviour is to parse the time
                 window options (namely, -A, -O, -S and -T), only if one of
                 those options has been specified on the command line.
                 However, this flag can be used (particularly with archive
                 contexts) to find the start and finish times associated
                 with the context(s) even if no time window options were
                 specified.  In the case of multiple archives, the time
                 window is defined as the time window spanning all of the
                 archives.

          PM_OPTFLAG_STDOUT_TZ
                 The timezone being used will be reported on the standard
                 output stream during option parsing.  The default
                 behaviour is to not report, but simply return timezone
                 information via the timezone (-Z) and tzflag (-z) fields
                 in the opts structure.

          PM_OPTFLAG_NOFLUSH
                 The final pmflush call issued by pmUsageMessage will be
                 skipped if this flag is set.  This is useful in situations
                 where the caller wishes to append additional test to the
                 generated usage message before flushing.

          PM_OPTFLAG_QUIET
                 Suppress messages from pmgetopt_r about unrecognised
                 command line options.  This is the equivalent to setting
                 the opterr field in the opt parameter (which mimics the
                 getopt variable of the same name).


-----------------------------------------------------------------------------------------------------------

::

          Some environment variables may be used as an alternative to the
          command line options.  The use of these mechanisms is primarily
          for internal use by PCP tools.  General users should choose the
          command line options as this provides a clearer indication of
          intent, makes debugging issues easier and avoids confusion over
          possible conflicts between the command line options and the
          environment variables (where the command line options usually
          ``win'').

          The following table describes the environment variables that may
          be used to set values as an alternative to command line options.

          ┌──────────────────┬───────┬─────────────────┬───────────────────┐
          │   Environment    │Short  │      Long       │     Meaning       │
          │                  │Option │     Option      │                   │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_ALIGN_TIME   │-A     │ --align         │align sample       │
          │                  │       │                 │times on           │
          │                  │       │                 │natural            │
          │                  │       │                 │boundaries         │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_ARCHIVE      │-a     │ --archive       │metrics source     │
          │                  │       │                 │is a PCP           │
          │                  │       │                 │archive            │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_ARCHIVE_LIST │       │ --archive-list  │comma-             │
          │                  │       │                 │separated list     │
          │                  │       │                 │of metric          │
          │                  │       │                 │source             │
          │                  │       │                 │archives           │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_FOLIO        │       │ --archive-folio │metric source      │
          │                  │       │                 │is a mkaf(1)       │
          │                  │       │                 │archives folio     │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_DEBUG        │-D     │ --debug         │a comma-           │
          │                  │       │                 │separated list     │
          │                  │       │                 │of                 │
          │                  │       │                 │pmSetDebug(3)      │
          │                  │       │                 │debugging          │
          │                  │       │                 │options            │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_GUIMODE      │-g     │ --guimode       │start in GUI       │
          │                  │       │                 │mode with new      │
          │                  │       │                 │pmtime(1) time     │
          │                  │       │                 │control            │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_HOST         │-h     │ --host          │metrics source     │
          │                  │       │                 │is pmcd(1) on      │
          │                  │       │                 │a host             │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_HOST_LIST    │       │ --host-list     │comma-             │
          │                  │       │                 │separated list     │
          │                  │       │                 │of metric          │
          │                  │       │                 │source hosts       │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_SPECLOCAL    │-K     │ --spec-local    │optional           │
          │                  │       │                 │additional DSO     │
          │                  │       │                 │PMDA               │
          │                  │       │                 │specification      │
          │                  │       │                 │for local          │
          │                  │       │                 │connection,        │
          │                  │       │                 │see                │
          │                  │       │                 │pmSpecLocalPMDA(3) │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_LOCALPMDA or │-L     │ --local-PMDA    │metrics source is  │
          │$PCP_LOCALMODE    │       │                 │local connection   │
          │                  │       │                 │to a DSO PMDA      │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_NAMESPACE    │-n     │ --namespace     │use an alternative │
          │                  │       │                 │Performance        │
          │                  │       │                 │Metrics Name Space │
          │                  │       │                 │(PMNS)             │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_UNIQNAMES    │-N     │ --uniqnames     │like -n but only   │
          │                  │       │                 │one name allowed   │
          │                  │       │                 │for each metric in │
          │                  │       │                 │the PMNS           │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_ORIGIN or    │-O     │ --origin        │initial sample     │
          │$ORIGIN_TIME      │       │                 │time within the    │
          │                  │       │                 │time window        │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_GUIPORT      │-p     │ --guiport       │port for           │
          │                  │       │                 │connection to an   │
          │                  │       │                 │existing pmtime(1) │
          │                  │       │                 │time control       │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_START_TIME   │-S     │ --start         │start of the time  │
          │                  │       │                 │window             │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_SAMPLES      │-s     │ --samples       │terminate after    │
          │                  │       │                 │this many samples  │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_FINISH_TIME  │-T     │ --finish        │end of the time    │
          │                  │       │                 │window             │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_INTERVAL     │-t     │ --interval      │sampling interval  │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_TIMEZONE     │-Z     │ --timezone      │set reporting      │
          │                  │       │                 │timezone           │
          ├──────────────────┼───────┼─────────────────┼───────────────────┤
          │$PCP_HOSTZONE     │-z     │ --hostzone      │set reporting      │
          │                  │       │                 │timezone to local  │
          │                  │       │                 │time of metrics    │
          │                  │       │                 │source             │
          └──────────────────┴───────┴─────────────────┴───────────────────┘


-----------------------------------------------------------------

::

          The pmGetOptions function returns either when it detects a
          command-line option that is not one of the standard PCP set, or
          when the end of the command line options has been reached (at
          which point -1 is returned).  Both the pmgetopt_r and
          pmGetOptions routines return control to the caller in the same
          way that a regular getopt call would, with the return value
          indicating either the end of all processing (-1), or the single
          character form of the option currently being processed, or zero
          for the special long-option-only case.  For all option-processing
          cases, the opts structure is returned containing filled out
          optarg, opterr, optopt, optind, and index fields as normal (do
          NOT use the global optarg or optind from your platform C library,
          these will NOT be modified).

          pmGetOptions does not return to the caller when any of the
          standard PCP options are being processed (although the override
          mechanism can be used to still detect such options if needed).

          The pmGetContextOptions function returns zero on success, or a
          negative PCP error code on failure.  The error field within the
          opts parameter will also be non-zero in the latter case.


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).  Values for these variables may be obtained
          programmatically using the pmGetOptions(3) function.


---------------------------------------------------------

::

          PCPIntro(1), pmcd(1), pminfo(1), pmstat(1), getopt(3),
          getopt_long(3), pmNewContext(3), pmGetConfig(3), pmprintf(3),
          pmflush(3) and PMAPI(3).

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

   Performance Co-Pilot               PCP                   PMGETOPTIONS(3)

--------------

Pages that refer to this page: `chkhelp(1) <../man1/chkhelp.1.html>`__, 
`collectl2pcp(1) <../man1/collectl2pcp.1.html>`__, 
`dbpmda(1) <../man1/dbpmda.1.html>`__, 
`newhelp(1) <../man1/newhelp.1.html>`__, 
`pcp(1) <../man1/pcp.1.html>`__, 
`pcp2elasticsearch(1) <../man1/pcp2elasticsearch.1.html>`__, 
`pcp2graphite(1) <../man1/pcp2graphite.1.html>`__, 
`pcp2influxdb(1) <../man1/pcp2influxdb.1.html>`__, 
`pcp2json(1) <../man1/pcp2json.1.html>`__, 
`pcp2spark(1) <../man1/pcp2spark.1.html>`__, 
`pcp2template(1) <../man1/pcp2template.1.html>`__, 
`pcp2xlsx(1) <../man1/pcp2xlsx.1.html>`__, 
`pcp2xml(1) <../man1/pcp2xml.1.html>`__, 
`pcp2zabbix(1) <../man1/pcp2zabbix.1.html>`__, 
`pcp-atop(1) <../man1/pcp-atop.1.html>`__, 
`pcp-atopsar(1) <../man1/pcp-atopsar.1.html>`__, 
`pcp-dmcache(1) <../man1/pcp-dmcache.1.html>`__, 
`pcp-dstat(1) <../man1/pcp-dstat.1.html>`__, 
`pcp-free(1) <../man1/pcp-free.1.html>`__, 
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pcp-iostat(1) <../man1/pcp-iostat.1.html>`__, 
`pcp-ipcs(1) <../man1/pcp-ipcs.1.html>`__, 
`pcp-mpstat(1) <../man1/pcp-mpstat.1.html>`__, 
`pcp-numastat(1) <../man1/pcp-numastat.1.html>`__, 
`pcp-pidstat(1) <../man1/pcp-pidstat.1.html>`__, 
`pcp-ss(1) <../man1/pcp-ss.1.html>`__, 
`pcp-tapestat(1) <../man1/pcp-tapestat.1.html>`__, 
`pcp-uptime(1) <../man1/pcp-uptime.1.html>`__, 
`pcp-verify(1) <../man1/pcp-verify.1.html>`__, 
`pmcd(1) <../man1/pmcd.1.html>`__, 
`pmclient(1) <../man1/pmclient.1.html>`__, 
`pmcpp(1) <../man1/pmcpp.1.html>`__, 
`pmdumptext(1) <../man1/pmdumptext.1.html>`__, 
`pmgetopt(1) <../man1/pmgetopt.1.html>`__, 
`pminfo(1) <../man1/pminfo.1.html>`__, 
`pmlogextract(1) <../man1/pmlogextract.1.html>`__, 
`pmlogrewrite(1) <../man1/pmlogrewrite.1.html>`__, 
`pmprobe(1) <../man1/pmprobe.1.html>`__, 
`pmproxy(1) <../man1/pmproxy.1.html>`__, 
`pmrep(1) <../man1/pmrep.1.html>`__, 
`pmsearch(1) <../man1/pmsearch.1.html>`__, 
`pmseries(1) <../man1/pmseries.1.html>`__, 
`pmstat(1) <../man1/pmstat.1.html>`__, 
`pmval(1) <../man1/pmval.1.html>`__, 
`sar2pcp(1) <../man1/sar2pcp.1.html>`__, 
`sheet2pcp(1) <../man1/sheet2pcp.1.html>`__, 
`pmdagetoptions(3) <../man3/pmdagetoptions.3.html>`__, 
`pmgetoptions(3) <../man3/pmgetoptions.3.html>`__, 
`pcp-dstat(5) <../man5/pcp-dstat.5.html>`__, 
`pmrep.conf(5) <../man5/pmrep.conf.5.html>`__

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
