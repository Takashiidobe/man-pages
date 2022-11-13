.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmrecord(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMRECORD(3)             Library Functions Manual             PMRECORD(3)

NAME
-------------------------------------------------

::

          pmRecordSetup, pmRecordAddHost, pmRecordControl - record mode
          support for PMAPI clients


-------------------------------------------------------------

::

          #include <pcp/pmafm.h>

          FILE *pmRecordSetup(const char *folio, const char *creator,
                  int replay);
          int pmRecordAddHost(const char *host, int isdefault,
                  pmRecordHost **rhp);
          int pmRecordControl(pmRecordHost *rhp, int request,
                  const char *options);

          cc ... -lpcp_gui


---------------------------------------------------------------

::

          These routines may be used to create a Performance Co-Pilot (PCP)
          archive ``on the fly'' to support ``record mode'' services for
          PMAPI client applications.

          Each record mode ``session'' involves one or more PCP archive
          logs each created using a dedicated pmlogger(1) process, with an
          overall Archive Folio format as understood by pmafm(1), to name
          and collect all of the archive logs associated with a single
          recording session.

          The pmRecordHost structure is used to maintain state information
          between the creator of the recording session and the associated
          pmlogger process(es).  The structure is defined as:
            typedef struct {
                FILE   *f_config;    /* caller writes pmlogger configuration here */
                int    fd_ipc;       /* IPC channel to pmlogger */
                char   *logfile;     /* full pathname for pmlogger error logfile */
                pid_t  pid;          /* process id for pmlogger */
                int    status;       /* exit status, -1 if unknown */
            } pmRecordHost;

          The routines are used in combination to create a recording
          session as follows.

          1.  Call pmRecordSetup to establish a new recording session.  A
              new Archive Folio will be created using the name folio; if
              the file or directory folio already exists, or the file folio
              cannot be created, this is an error.  The application that is
              creating the session is identified by creator (most often
              this would be the same as the global PMAPI application name,
              as returned by pmGetProgname(3)).  If the application knows
              how to create its own configuration file to replay the
              recorded session, then replay should be non-zero.

              pmRecordSetup returns a stdio stream onto which the
              application should write the text of the required replay
              configuration file, if any.

          2.  For each host that is to be included in the recording
              session, call pmRecordAddHost.  A new pmRecordHost structure
              is returned via rhp.  It is assumed that pmcd(1) is running
              on host as this is how pmlogger(1) will retrieve the required
              performance metrics.

              If this host is the default host for this recording session,
              then isdefault should be non-zero.  This will ensure that the
              corresponding archive appears first in the PCP archive folio,
              and hence the tools used to replay the archive folio will
              make the correct determination of the archive associated with
              the default host.  At most one host per recording session may
              be nominated as the default host.

              The calling application should write the desired pmlogger
              configuration onto the stdio stream returned via the f_config
              field in the pmRecordHost structure.

          3.  Optionally add arguments to the command line that will be
              used to launch pmlogger(1) by calling pmRecordControl with a
              request of PM_REC_SETARG.  The argument is passed via options
              and one call to pmRecordControl is required for each distinct
              argument.

              An argument may be added for a particular pmlogger instance
              identified by rhp, or if the rhp argument is NULL the
              argument is added for all pmlogger instances that will be
              launched in the current recording session.

              Independent of any calls to pmRecordControl with a request of
              PM_REC_SETARG, each pmlogger instance will automatically be
              launched with the following arguments: -c, -h, -l, -x and the
              basename for the PCP archive log.

          4.  To commence the recording session, call pmRecordControl with
              a request of PM_REC_ON, and rhp must be NULL.  This will
              launch one pmlogger(1) process for each host in the recording
              session, and initialize the fd_ipc, logfile, pid and status
              fields in the associated pmRecordHost structure(s).

          5.  To terminate a pmlogger instance identified by rhp, call
              pmRecordControl with a request of PM_REC_OFF.  If the rhp
              argument to pmRecordControl is NULL, the termination request
              is broadcast to all pmlogger processes in the current
              recording session.

              An informative dialog is generated directly by each pmlogger
              process and hence note the comments on the disposition of
              output from pmlogger below.

              Alternatively, pmlogger can be started with options to limit
              the duration of logging, e.g. the -T or -s arguments, in
              which case there is no need to call pmRecordControl with a
              request of PM_REC_OFF and no dialog is generated.

          6.  To display the current status of the pmlogger instance
              identified by rhp, call pmRecordControl with a request of
              PM_REC_STATUS.  If the rhp argument to pmRecordControl is
              NULL, the status request is broadcast to all pmlogger
              processes in the current recording session.

              The display is generated directly by each pmlogger process
              and hence note the comments on the disposition of output from
              pmlogger below.

          7.  To detach a pmlogger instance identified by rhp and allow it
              to continue independent of the application that launched the
              recording session, call pmRecordControl with a request of
              PM_REC_DETACH.  If the rhp argument to pmRecordControl is
              NULL, the detach request is broadcast to all pmlogger
              processes in the current recording session.

              An informative dialog is generated directly by each pmlogger
              process and hence note the comments on the disposition of
              output from pmlogger below.

          The calling application should not close any of the returned
          stdio streams; this will be done by pmRecordControl when
          recording is commenced.

          Once pmlogger has been started for a recording session, then
          pmlogger will assume responsibility for any dialog with the user
          in the event that the application that launched the recording
          session should exit, particularly without terminating the
          recording session.

          By default, information and dialogs from pmlogger will be
          displayed using pmquery(1) on the assumption that most
          applications wishing to launch a recording session are GUI-based.
          In the event that pmquery fails to display the information (for
          example, because the DISPLAY environment variable is not set),
          pmlogger will write on its own stderr stream (not the stderr
          stream of the launching process); the output will be assigned to
          the XXXXXX.host.log file described in the FILES section below.
          For convenience, the full pathname to this file is provided via
          the logfile field in the pmRecordHost structure.

          If the options argument to pmRecordControl is not NULL, this
          string may be used to pass additional arguments to pmquery(1) in
          those cases where a dialog is to be displayed.  One use of this
          capability would be to provide a -geometry string to control the
          placement of the dialog.

          Premature termination of a launched pmlogger process may be
          determined using the pmRecordHost structure, by calling select(2)
          on the fd_ipc field or polling the status field that will contain
          the termination status from waitpid(2) if known, else -1.


---------------------------------------------------------------

::

          pmRecordSetup may return NULL in the event of an error.  Check
          errno for the real cause, but the value EINVAL typically means
          that the order of calls to these routines is not correct (there
          is obvious state associated with the current recording session
          that is maintained across calls to these routines).  For example
          the following calls would produce this EINVAL error; calling
          pmRecordControl before calling pmRecordAddHost at least once, or
          calling pmRecordAddHost before calling pmRecordSetup.

          pmRecordControl and pmRecordAddHost both return 0 on success,
          else a value less than 0 suitable for decoding with pmErrStr(3)
          on failure.  The value -EINVAL has the same interpretation as
          errno being set to EINVAL as described above.

          pmRecordControl will return PM_ERR_IPC if the associated pmlogger
          process has already exited.


---------------------------------------------------

::

          These routines create a number of files in the same directory as
          the folio file named in the call to pmRecordSetup.  In all cases,
          the ``XXXXXX'' component is the result of calling mktemp(3).

          XXXXXX If replay is non-zero, this is the creator's replay
                 configuration file, else an empty control file, used to
                 guarantee uniqueness.
          folio  The PCP Archive Folio, suitable for use with pmafm(1).
          XXXXXX.host.config
                 The pmlogger(1) configuration for each host - if the same
                 host is used in different calls to pmRecordAddHost within
                 the same recording session then one of the letters ``a''
                 through ``z'' will be appended to the ``XXXXXX'' part of
                 all associated file names to ensure uniqueness.
          XXXXXX.host.log
                 stdout and stderr for the pmlogger(1) instance for each
                 host.
          XXXXXX.host.{0,meta,index}
                 The files comprising a single PCP archive for each host.


---------------------------------------------------------

::

          pmafm(1), pmlogger(1), pmquery(1) and PMAPI(3).

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

   Performance Co-Pilot               PCP                       PMRECORD(3)

--------------

Pages that refer to this page: `pmafm(1) <../man1/pmafm.1.html>`__

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
