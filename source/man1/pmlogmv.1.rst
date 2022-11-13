.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmlogmv(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMLOGMV(1)               General Commands Manual              PMLOGMV(1)

NAME
-------------------------------------------------

::

          pmlogmv - move (rename) Performance Co-Pilot archive files


---------------------------------------------------------

::

          pmlogmv [-fNV?]  oldname newname


---------------------------------------------------------------

::

          A Performance Co-Pilot (PCP) archive consists of multiple files
          as created by pmlogger(1).  pmlogmv allows all the files of a
          single PCP archive to be moved or renamed as a group in a single
          operation.

          The oldname argument identifies the target archive, and may be
          either the basename that is common to all files in that archive
          or one of the archive's files.  The new archive's basename is
          newname.

          Because PCP archives are important records of system activity,
          special care is taken to ensure the integrity of an archive's
          files.  For recoverable problems encountered during the execution
          of pmlogmv, all the files associated with oldname will be
          preserved, and no new files with the newname prefix will be
          created.  ``Recoverable problems'' include signals that can be
          caught (such as SIGHUP, SIGINT, SIGQUIT and SIGTERM), permissions
          issues, new files already existing, file system full events, etc.

          The implementation of pmlogmv uses hard links in the file system
          and so follows the semantic restrictions of ln(2) which for most
          systems means the directories containing both the oldname and the
          newname PCP archive files need to be writeable and within the
          same file system.


-------------------------------------------------------

::

          The available command line options are:

          -f, --force
               Normally pmlogmv takes a conservative view in respect of
               newname and will not proceed if newname contains any
               characters that are likely to cause a problem for sh(1).
               This includes ``glob'' characters like ``?'', ``*'' and
               ``['', shell syntax meta characters like ``('', ``|'', ``;''
               and ``&'', shell I/O redirection characters like ``<'' and
               ``>'', the dollar sign, a space, etc.

               The -f flag forces pmlogmv to proceed, even if newname
               contains any of these ``unsafe'' characters.

          -N, --showme
               Perform a dry-run, checking and reporting what changes would
               be made without making any changes.

          -V, --verbose
               Enable verbose mode.

          -?, --help
               Display usage message and exit.


---------------------------------------------------------------

::

          All error and warning messages are intended to be easily
          understood and errors produce a non-zero exit status.


---------------------------------------------------------

::

          ln(1) and pmlogger(1).

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

   Performance Co-Pilot               PCP                        PMLOGMV(1)

--------------

Pages that refer to this page:
`pmgetopt(1) <../man1/pmgetopt.1.html>`__, 
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
