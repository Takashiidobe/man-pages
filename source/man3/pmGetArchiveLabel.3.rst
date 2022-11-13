.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmgetarchivelabel(3) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMGETARCHIVELABEL(3)    Library Functions Manual    PMGETARCHIVELABEL(3)

NAME
-------------------------------------------------

::

          pmGetArchiveLabel - fetch the label record from a set of
          performance metrics archive logs


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmGetArchiveLabel(pmLogLabel *lp);

          cc ... -lpcp


---------------------------------------------------------------

::

          Within the framework of the Performance Co-Pilot (PCP), archive
          logs of performance metrics values may be accumulated and saved
          using the program pmlogger(1).

          The routine pmGetArchiveLabel may be used to fetch the label
          record from a set of archive logs that has already been opened
          using pmNewContext(3), or pmDupContext(3), and thereby associated
          with the current Performance Metrics Application Programming
          Interface (PMAPI) context.

          The result returned via the pointer lp is a structure that must
          be pre-allocated by the caller and has the following format
          (defined in pmapi.h).

            /*
             * Label Record at the start of every log file
             */
            typedef struct {
              int        ll_magic;    /* PM_LOG_MAGIC | log format version no. */
              pid_t      ll_pid;      /* PID of logger */
              struct timeval ll_start;/* start of this log */
              char       ll_hostname[PM_LOG_MAXHOSTLEN]; /* name of collection host */
              char       ll_tz[40];   /* $TZ at collection host */
            } pmLogLabel;

          For an application, the most useful information from the archive
          label is likely to be in the fields ll_start, ll_hostname or
          ll_tz.

          Note that the size of the ll_hostname field is PM_LOG_MAXHOSTLEN
          (64 bytes) which is less than MAXHOSTNAMELEN (see
          gethostbyname(3)) on some platforms.  These semantics are
          necessary to retain backwards compatibility with the PCP archive
          file format.

          pmGetArchiveLabel returns zero for success.


---------------------------------------------------------------

::

          PM_ERR_NOCONTEXT
                 the current PMAPI context is either invalid, or not
                 associated with a set of archive logs


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).  Values for these variables may be obtained
          programmatically using the pmGetConfig(3) function.


---------------------------------------------------------

::

          pmlogger(1), PMAPI(3), pmDupContext(3), pmGetConfig(3),
          pmNewContext(3), pcp.conf(5) and pcp.env(5).

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

   Performance Co-Pilot               PCP              PMGETARCHIVELABEL(3)

--------------

Pages that refer to this page:
`pmgetarchiveend(3) <../man3/pmgetarchiveend.3.html>`__, 
`pmgetcontexthostname(3) <../man3/pmgetcontexthostname.3.html>`__, 
`\__pmparsetime(3) <../man3/__pmparsetime.3.html>`__, 
`pmparsetimewindow(3) <../man3/pmparsetimewindow.3.html>`__

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
