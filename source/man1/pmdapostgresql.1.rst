.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdapostgresql(1) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \|                                |                                   |
| `INSTALLATION <#INSTALLATION>`__  |                                   |
| \|                                |                                   |
| `SUPPORTED                        |                                   |
| VERSIONS <#SUPPORTED_VERSIONS>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDAPOSTGRESQL(1)        General Commands Manual       PMDAPOSTGRESQL(1)

NAME
-------------------------------------------------

::

          pmdapostgresql - PostgreSQL database PMDA


---------------------------------------------------------------

::

          pmdapostgresql is a Performance Co-Pilot (PCP) Performance
          Metrics Domain Agent (PMDA) which extracts live performance data
          from a running PostgreSQL database server.

          Many of the statistics available from a PostgreSQL server may not
          be enabled by default.  Refer to the online documentation
          https://www.postgresql.org/docs/current/static/monitoring-stats.html 
          which describes each of the available parameters related to
          statistics collection and how to enable them.


-------------------------------------------------------------------

::

          pmdapostgresql reads a mandatory ini-style configuration file:

                 $PCP_PMDAS_DIR/postgresql/postgresql.conf

          This file currently contains only one section [authentication]
          which specifies values for the following settings (their default
          values are shown in parenthesis):

          host (local)
                 Hostname to connect to.

          port (5432)
                 Port number to use.

          dbname (postgres)
                 Database name.

          username (postgres)
                 Username to run as and to connect to the database.

          password (password)
                 Password to connect to the database.

          osuser (unset)
                 Operating system user the PMDA runs as.

          The defaults (as above) will result in the PMDA running as the
          current user, using a UNIX domain socket connection to the
          PostgreSQL server on the localhost.

          If osuser is not specified in the configuration file, the PMDA
          will run as the current user.  A host specification of local will
          use a UNIX domain socket, which uses peer authentication, see
          comments in the pg_hba.conf file.  In this case, the osuser
          setting should probably be set to postgres.

          It is generally not necessary to alter the default configuration
          file for monitoring the local PostgreSQL server instance with a
          default server configuration.  Note that the port number is
          required even for a UNIX domain connection because it's used as
          the socket filename by the server.


-----------------------------------------------------------------

::

          To install, the following must be done as root:

              # cd $PCP_PMDAS_DIR/postgresql
              # ./Install

          To uninstall, the following must be done as root:

              # cd $PCP_PMDAS_DIR/postgresql
              # ./Remove

          pmdapostgresql is launched by pmcd(1) and should never be
          executed directly.  The Install and Remove scripts notify pmcd(1)
          when the agent is installed or removed.

          pmdapostgresql will automatically attempt to reconnect to the
          PostgreSQL server if its connection is lost - e.g. if the
          PostgreSQL service is restarted.


-----------------------------------------------------------------------------

::

          This version of pmdapostgresql has been tested and verified with
          PostgreSQL server version 10.2 and earlier.  Later versions will
          probably also work correctly because the PMDA probes the various
          performance tables on start-up to determine the column ordering.
          It also tolerates missing or renamed tables and/or columns.


---------------------------------------------------

::

          $PCP_PMDAS_DIR/postgresql/pmdapostgresql.conf
               configuration file for the pmdapostgresql agent

          $PCP_PMDAS_DIR/postgresql/Install
               installation script for the pmdapostgresql agent

          $PCP_PMDAS_DIR/postgresql/Remove
               undo installation script for the pmdapostgresql agent

          $PCP_LOG_DIR/pmcd/postgresql.log
               default log file for messages from the pmdapostgresql agent

          Note that the usual/default value for $PCP_PMDAS_DIR is
          /var/lib/pcp/pmdas and the default for $PCP_LOG_DIR is
          /var/log/pcp but these settings are platform dependent.


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

          PCPIntro(1), pmcd(1) and
          https://www.postgresql.org/docs/current/static/monitoring-stats.html .

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

   Performance Co-Pilot               PCP                 PMDAPOSTGRESQL(1)

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
