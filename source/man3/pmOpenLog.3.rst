.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmopenlog(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMOPENLOG(3)            Library Functions Manual            PMOPENLOG(3)

NAME
-------------------------------------------------

::

          pmOpenLog - create a log file for diagnostics and debug output


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          FILE *pmOpenLog(const char *progname, const char *logname,
                  FILE *oldstream, int *status);

          cc ... -lpcp


---------------------------------------------------------------

::

          pmOpenLog reassigns the standard I/O stream oldstream (normally
          stderr) to be associated with the file logname.  If logname is
          not "-" and already exists, it will be removed and recreated if
          possible (to ensure correct ownership and permissions from the
          caller to pmOpenLog).

          As a special case, if logname is "-" then no removal or reopening
          is performed and the function simply sets status to 1 and returns
          oldstream.  This is useful when the caller wants diagnostics on
          oldstream stream (normally stderr) rather than a file, e.g.
          pmlogger -l- or pmcd -f -l-.  Logging to stderr is also useful
          for PMDAs in a containerized environment where it is beneficial
          for all PMDA logs to be written to pmcd's stderr stream (and thus
          to a single destination), whether that is a file such as pmcd.log
          or the original stream inherited from the shell.

          On return, the function value is the standard I/O stream,
          possibly replacing oldstream.  In the event of an error, the
          return value will be oldstream unchanged and status will be 0.

          For success, status is 1, and a standard preamble is written to
          logname
               Log for progname on hostname started date and time
          and an atexit(3) handler is installed to write the postscript
          message to logname
               Log finished date and time
          when the processes exits.

          progname is only used to annotate messages.


---------------------------------------------------------

::

          atexit(3) and freopen(3).

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

   Performance Co-Pilot               PCP                      PMOPENLOG(3)

--------------

Pages that refer to this page:
`pmnotifyerr(3) <../man3/pmnotifyerr.3.html>`__

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
