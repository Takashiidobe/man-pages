.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdamssql(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \|                                |                                   |
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

   PMDAMSSQL(1)             General Commands Manual            PMDAMSSQL(1)

NAME
-------------------------------------------------

::

          pmdamssql - Microsoft SQL Server database PMDA


---------------------------------------------------------------

::

          pmdamssql is a Performance Co-Pilot (PCP) Performance Metrics
          Domain Agent (PMDA) which extracts live performance data from a
          running Microsoft SQL Server database server.


-------------------------------------------------------------------

::

          Firstly, pmdamssql requires installation of these support
          packages:

          mssql-server
               The primary Microsoft SQL Server database package.

          msodbcsql17 or (msodbcsql)
               Latest Microsoft SQL Server ODBC bindings.

          pyodbc
               General Python ODBC module with Microsoft SQL Server support
               enabled.

          Next, pmdamssql reads an optional ini-style configuration file:

                 $PCP_PMDAS_DIR/mssql/mssql.conf

          This file currently allows for two sections, one for configuring
          the library that connects to SQL server, the other for
          authenticating with SQL server.

          [connection] section specifies values for the following settings
          (their default values are shown in parenthesis):

          driver ({ODBC Driver 17 for SQL Server})
                 ODBC driver string.

          server (tcp:localhost)
                 SQL Server socket connection string.

          timeout (2)
                 Connection timeout setting, in seconds.

          [authentication] section specifies values for the two supported
          modes of authentication with SQL Server.

          The default is to use SQL Server authentication, which requires a
          username and password to be provided.  These are the following
          configuration settings (their default values are shown in
          parenthesis):

          username (sa)
                 Username to connect to the database.

          password (unset)
                 Password to connect to the database.

          The second option is Windows authentication mode, where logins
          are created in SQL Server that are not based on operating system
          user accounts.

          trusted (false)
                 Set to true to use Windows authentication when connecting
                 to the database.

          This is a Kerberos-style connection and credentials must be
          available before the PMDA is started (see kinit(1) for further
          details).


-----------------------------------------------------------------

::

          To install, the following must be done as root:

              # cd $PCP_PMDAS_DIR/mssql
              # ./Install

          To uninstall, the following must be done as root:

              # cd $PCP_PMDAS_DIR/mssql
              # ./Remove

          pmdamssql is launched by pmcd(1) and should never be executed
          directly.  The Install and Remove scripts notify pmcd(1) when the
          agent is installed or removed.

          pmdamssql will automatically attempt to reconnect to the SQL
          Server if its connection is lost - e.g. if the SQL Server service
          is restarted.


---------------------------------------------------

::

          $PCP_PMDAS_DIR/mssql/mssql.conf
               configuration file for the pmdamssql agent

          $PCP_PMDAS_DIR/mssql/Install
               installation script for the pmdamssql agent

          $PCP_PMDAS_DIR/mssql/Remove
               undo installation script for the pmdamssql agent

          $PCP_LOG_DIR/pmcd/mssql.log
               default log file for messages from the pmdamssql agent

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

          PCPIntro(1), kinit(1) and pmcd(1).

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

   Performance Co-Pilot               PCP                      PMDAMSSQL(1)

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
