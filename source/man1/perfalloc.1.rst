.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

perfalloc(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PERFALLOC(1)             General Commands Manual            PERFALLOC(1)

NAME
-------------------------------------------------

::

          perfalloc - notify pmdaperfevent(1) to disable hardware counter
          allocation.


---------------------------------------------------------

::

          $PCP_PMDAS_DIR/perfevent/perfalloc [-D] [-d] [-f lockfile] [-h]
          [-v] [COMMAND]


---------------------------------------------------------------

::

          perfalloc is a command that notifies the pmdaperfevent(1) to
          disable hardware counter event collection.  This allow
          unprivileged processes to use the hardware counters.

          If the reservation request fails, then perfalloc exits
          immediately with exit code EXIT_FAILURE.  If successful, the
          perfalloc will run until a kill signal is received.  The
          reservation request persists while perfalloc is running.

          Note that pmdaperfevent is affected by the value of the
          kernel.perf_event_paranoid setting, which can be adjusted by
          sysctl(8).

          If a commandline is given, this is executed as a subprocess of
          the agent.  When the command dies, so does the agent.

          A brief description of the command line options follows:

          -D   run in the foreground (the default)

          -d   run in the background

          -f FILE
               use FILE as the lock file (default
               $PCP_PMDAS_DIR/perfevent/perflock)

          -h   display a help message and exit

          -v   output version number and exit


-------------------------------------------------

::

          There may be a delay of up to 100 miliseconds between perfalloc
          requesting the hardware counter disabling and the perfevent PMDA
          processing the request.

          The perfalloc process does not check the status of the request
          and therefore is not able to provide a positive confirmation that
          the request succeeded and the hardware counters are disabled.


---------------------------------------------------------

::

          pmdaperfevent(1), perfevent.conf(3) and sysctl(8).

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

   Performance Co-Pilot               PCP                      PERFALLOC(1)

--------------

Pages that refer to this page:
`pmdaperfevent(1) <../man1/pmdaperfevent.1.html>`__

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
