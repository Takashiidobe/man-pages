.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdamysql(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `INSTALLATION <#INSTALLATION>`__  |                                   |
| \|                                |                                   |
| `Binary Status values in text <   |                                   |
| #Binary_Status_values_in_text>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDAMYSQL(1)             General Commands Manual            PMDAMYSQL(1)

NAME
-------------------------------------------------

::

          pmdamysql - MySQL and MariaDB database PMDA


---------------------------------------------------------------

::

          pmdamysql is a Performance Co-Pilot PMDA which extracts live
          performance data from a running MySQL or MariaDB database.


-----------------------------------------------------------------

::

          pmdamysql uses a configuration file from (in this order):

          •   /etc/pcpdbi.conf

          •   $PCP_PMDAS_DIR/mysql/mysql.conf

          This file can contain overridden values (Perl code) for the
          settings listed at the start of pmdamysql.pl, namely:

          •   database name (see DBI(3) for details, default is
              "DBI:mysql:mysql")

          •   database username (default is "dbmonitor")

          •   database password (default is "dbmonitor")

          •   login account (default is "pcp")

          On some versions of MariaDB (10+) the performance schema is
          disabled by default, and must be enabled for the PMDA to
          function.  This is achieved by adding the string
          "performance_schema" into the "[mysqld]" section of the MariaDB
          configuration file (either my.cnf or my.ini).  The "SHOW ENGINES"
          SQL statement shows support for the performance schema.

          Once these initial setup actions are complete, you can access the
          names and values for the mysql performance metrics by doing the
          following as root:

              # cd $PCP_PMDAS_DIR/mysql
              # ./Install

          To uninstall, the following must be done as root:

              # cd $PCP_PMDAS_DIR/mysql
              # ./Remove

          pmdamysql is launched by pmcd(1) and should never be executed
          directly. The Install and Remove scripts notify pmcd(1) when the
          agent is installed or removed.


-------------------------------------------------------------------------------------------------

::

          Some of the status values are in the form of YES/NO or ON/OFF.

          Since these cannot be interpreted by tools like pmie(1), they
          have been duplicated with a _num extension and the values of 1
          (YES/ON) or 0 (NO/OFF).

      Eg:
          •   mysql.slave_status.slave_io_running

          •   mysql.slave_status.slave_io_running_num


---------------------------------------------------

::

          /etc/pcpdbi.conf
              configuration file for all PCP database monitors

          $PCP_PMDAS_DIR/mysql/mysql.conf
              configuration file for pmdamysql

          $PCP_PMDAS_DIR/mysql/Install
              installation script for the pmdamysql agent

          $PCP_PMDAS_DIR/mysql/Remove
              undo installation script for the pmdamysql agent

          $PCP_LOG_DIR/pmcd/mysql.log
              default log file for error messages from pmdamysql


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP. On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).


---------------------------------------------------------

::

          PCPIntro(1), pmcd(1), pmdadbping(1), pmie(1) and DBI(3).

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

   Performance Co-Pilot               PCP                      PMDAMYSQL(1)

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
