.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

find-filter(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FIND-FILTER(1)           General Commands Manual          FIND-FILTER(1)

NAME
-------------------------------------------------

::

          find-filter - fine-grained file selection based on time
          attributes


---------------------------------------------------------

::

          $PCP_BINADM_DIR/find-filter [-v?]  predicate


---------------------------------------------------------------

::

          find-filter is a filter for a list of file names read on standard
          input, and if the files match the predicate their names are
          written on standard output.

          The supported predicate forms are based on the file's creation
          time or modification time, and take the form ctime or mtime
          followed by a time specification.  A time specification takes the
          form of a + or - followed by days (a non-negative integer),
          optionally followed by a colon (:) and hours (an integer in the
          range 0 to 23), optionally followed by another colon (:) and
          minutes (an integer in the range 0 to 59).

          The semantics of the time specification are that a file matches
          the predicate if the chosen time attribute for the file is less
          than (+) the current time minus the time specification, else more
          than or equal to (-) the current time minus the time
          specification.  Alternatively, + means before the current time
          minus the time specification, and - means at or after the current
          time minus the time specification.

          find-filter is intended to be used to provide finer-grain and
          platform independent selection compared to the -mtime or -ctime
          options of find(1).  find-filter is expected to be used as a
          post-filter for the output from find(1), and this is how it is
          used in the pmlogger_daily(1) scripts to select files to be
          compressed or culled.


---------------------------------------------------------

::

          The following predicate examples illustrate some typical uses.

          mtime +3    Matches files modified more than 3 days ago.

          ctime -0:2  Matches files created in the last 2 hours.

          ctime +0:0:15
                      Matches files created more than 15 minutes ago.


---------------------------------------------------------------

::

          There are none, unless the -v option is used, in which case some
          diagnostics are written to standard error.

          Exit status is always zero, unless there are errors found when
          parsing the command line arguments.


---------------------------------------------------------

::

          find(1) and pmlogger_daily(1).

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

   Performance Co-Pilot               PCP                    FIND-FILTER(1)

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
