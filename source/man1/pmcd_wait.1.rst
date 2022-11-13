.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmcd_wait(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMCD_WAIT(1)             General Commands Manual            PMCD_WAIT(1)

NAME
-------------------------------------------------

::

          pmcd_wait - wait for PMCD to accept client connections


---------------------------------------------------------

::

          $PCP_BINADM_DIR/pmcd_wait [-v?]  [-h host] [-t timeout]


---------------------------------------------------------------

::

          pmcd_wait waits for the Performance Metrics Collector Daemon
          (PMCD) to be running and accepting client connections.

          Unless directed to another host by the -h option, pmcd_wait will
          try to contact pmcd(1) on the local host.

          pmcd_wait will timeout and abandon the attempt to connect to pmcd
          after 60 seconds.  This default timeout interval may be changed
          using the -t option, where the interval argument follows the
          syntax described in PCPIntro(1) and in the simplest form may be
          an unsigned integer (the implied units in this case are seconds).

          On successful connection to pmcd an exit status of zero is
          returned.

          If an error or timeout occurs, then a non-zero exit status is
          returned as described below.


-------------------------------------------------------

::

          The available command line options are:

          -h host, --host=host
               Connect pmcd(1) on host, rather than the one on the default
               localhost.

          -t timeout, --interval=timeout
               Timeout after timeout seconds if not connected.  The default
               timeout value is 60 seconds.

          -v, --verbose
               This option turns the verbose mode on.  With the verbose
               mode off (which is the default), no output will be
               generated.  With verbose mode on, error messages will be
               output on stderr.

          -?, --help
               Display usage message and exit.


---------------------------------------------------------------

::

          Error messages will be output to stderr only if the verbose mode
          is on.

          The following exit status codes are returned:

          0      pmcd_wait was able to successfully connect to pmcd within
                 the timeout period.

          1      A usage error occurred, use -v for more details.

          2      No connection was made in the timeout interval.  This will
                 happen if pmcd is running but takes too long to complete
                 the client connection, or if pmcd is not running and all
                 connection attempts in the timeout interval failed with
                 the error ECONNREFUSED.

          3      A UNIX error occurred, use -v for more details.

          4      A PCP error occurred, use -v for more details.


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

   Performance Co-Pilot               PCP                      PMCD_WAIT(1)

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
