.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdamailq(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `INSTALLATION <#INSTALLATION>`__  |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDAMAILQ(1)             General Commands Manual            PMDAMAILQ(1)

NAME
-------------------------------------------------

::

          pmdamailq - mail queue performance metrics domain agent (PMDA)


---------------------------------------------------------

::

          $PCP_PMDAS_DIR/mailq/pmdamailq [-b binlist] [-d domain] [-l
          logfile] [-r regex] [-U username] [queuedir]


---------------------------------------------------------------

::

          pmdamailq is a Performance Metrics Domain Agent (PMDA) which
          extracts performance metrics describing the state of the e-mail
          queues managed by sendmail(1) and other mail transfer agents.

          The mailq PMDA exports metrics that measure the total number of
          entries in the mail queue, and the subtotals for entries that
          have been queued for various time periods.

          A brief description of the pmdamailq command line options
          follows:

          -b   The binlist argument specifies a list of delay thresholds
               used to ``bin'' the entries in the queue into a a histogram
               based on how long the entry has been in the mail queue.  The
               default thresholds are: 1 hour, 4 hours, 8 hours, 1 day, 3
               days and 7 days.  The entries in binlist are comma separated
               time intervals, using the syntax described in PCPIntro(1)
               for an update or reporting interval, e.g. the default list
               could be specified using the value
               1hr,4hrs,8hrs,1day,3days,7days.

               Values in binlist are assumed to be in ascending order, and
               mail items in the queue less than the first threshold are
               binned into a special bin labeled ``recent''.

          -d   It is absolutely crucial that the performance metrics domain
               number specified here is unique and consistent.  That is,
               domain should be different for every PMDA on the one host,
               and the same domain number should be used for the same PMDA
               on all hosts.

          -l   Location of the log file.  By default, a log file named
               mailq.log is written in the current directory of pmcd(1)
               when pmdamailq is started, i.e.  $PCP_LOG_DIR/pmcd .  If the
               log file cannot be created or is not writable, output is
               written to the standard error instead.

          -r   Use an extended regular expression to match file names in
               the mail queue directory, rather than assuming all "df"
               prefixed files in the directory are mail files (the "df"
               prefix is the sendmail convention, but this convention is
               not followed by other mail daemons).  The regex pattern
               specified should conform to the POSIX format described in
               regex(3), and it describes file names that should be
               considered mail.

          -U   User account under which to run the agent.  The default is
               the unprivileged "pcp" account in current versions of PCP,
               but in older versions the superuser account ("root") was
               used by default.

          The optional queuedir argument defines the directory in which
          pmdamailq expects to find the mail queue.  The default is
          /var/spool/mqueue.


-----------------------------------------------------------------

::

          If you want access to the names, help text and values for the
          mailq performance metrics, do the following as root:

               # cd $PCP_PMDAS_DIR/mailq
               # ./Install

          If you want to undo the installation, do the following as root:

               # cd $PCP_PMDAS_DIR/mailq
               # ./Remove

          pmdamailq is launched by pmcd(1) and should never be executed
          directly.  The Install and Remove scripts notify pmcd(1) when the
          agent is installed or removed.


---------------------------------------------------

::

          $PCP_PMCDCONF_PATH
                 command line options used to launch pmdamailq
          $PCP_PMDAS_DIR/mailq/help
                 default help text file for the mailq metrics
          $PCP_PMDAS_DIR/mailq/Install
                 installation script for the pmdamailq agent
          $PCP_PMDAS_DIR/mailq/Remove
                 undo installation script for the pmdamailq agent
          $PCP_LOG_DIR/pmcd/mailq.log
                 default log file for error messages and other information
                 from pmdamailq


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

          PCPIntro(1), pmcd(1), pcp.conf(5) and pcp.env(5).

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

   Performance Co-Pilot               PCP                      PMDAMAILQ(1)

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
