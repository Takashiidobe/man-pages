.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmlogger_merge(1) — Linux manual page
=====================================

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

   PMLOGGER_MERGE(1)        General Commands Manual       PMLOGGER_MERGE(1)

NAME
-------------------------------------------------

::

          pmlogger_merge - helper script to merge Performance Co-Pilot
          archives


---------------------------------------------------------

::

          $PCP_BINADM_DIR/pmlogger_merge [-fNVE?]  [input-basename ...
          output-name]


---------------------------------------------------------------

::

          pmlogger_merge is a helper script that is used by
          pmlogger_daily(1) when merging all of the Performance Co-Pilot
          (PCP) archives for a single host on a single day into a combined
          PCP archive.

          pmlogger_merge is a wrapper script for pmlogextract(1) that
          merges all of the archive logs matching the input-basename
          arguments, and creates a new archive using output-name as the
          base name for the physical files that constitute an archive log.
          The input-basename arguments may contain meta characters in the
          style of sh(1).


-------------------------------------------------------

::

          The available command line options are:

          -f, --force
               This option causes all of the input files to be removed once
               the output archive has been created.

          -N, --showme
               Runs pmlogger_merge in a ``show me'' or ``dry run'' mode
               where the tasks that would be performed are reported, but no
               changes are made.  This is typically used for debugging in
               combination with one (verbose) or two (very verbose) -V
               options.

          -V, --verbose
               Increase verbosity in the output progress report.

          -E, --expunge
               When metric metadata differences are encountered between
               archives to be merged, the default behaviour is for
               pmlogger_merge to fail with a fatal error and the output-
               name archive is not created.  The -E flag instead issues a
               warning and excludes the affected metrics from the merged
               output archive.  This is intended for automated daily log
               rotation where it is highly desirable for unattended daily
               archive merging, rewriting and compression to succeed.  See
               also pmlogger_daily(1) and the -x flag to pmlogextract(1).

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

          PCPIntro(1), pmlogextract(1), pmlogger(1) and pmlogger_daily(1).

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

   Performance Co-Pilot               PCP                 PMLOGGER_MERGE(1)

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
