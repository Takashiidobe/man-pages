.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mysql_upgrade(1) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MYSQL_UPGRADE(1)         MariaDB Database System        MYSQL_UPGRADE(1)

NAME
-------------------------------------------------

::

          mysql_upgrade - check tables for MariaDB upgrade


---------------------------------------------------------

::

          mysql_upgrade [options]


---------------------------------------------------------------

::

          mysql_upgrade examines all tables in all databases for
          incompatibilities with the current version of the MariaDB Server.
          mysql_upgrade also upgrades the system tables so that you can
          take advantage of new privileges or capabilities that might have
          been added.

          mysql_upgrade should be executed each time you upgrade MariaDB.

          If a table is found to have a possible incompatibility,
          mysql_upgrade performs a table check. If any problems are found,
          a table repair is attempted.

              Note
              On Windows Server 2008 and Windows Vista, you must run
              mysql_upgrade with administrator privileges. You can do this
              by running a Command Prompt as Administrator and running the
              command. Failure to do so may result in the upgrade failing
              to execute correctly.

              Caution
              You should always back up your current MariaDB installation
              before performing an upgrade.

          To use mysql_upgrade, make sure that the server is running, and
          then invoke it like this:

              shell> mysql_upgrade [options]

          After running mysql_upgrade, stop the server and restart it so
          that any changes made to the system tables take effect.

          mysql_upgrade executes the following commands to check and repair
          tables and to upgrade the system tables:

              mysqlcheck --all-databases --check-upgrade --auto-repair
              mysql < fix_priv_tables
              mysqlcheck --all-databases --check-upgrade --fix-db-names --fix-table-names

          Notes about the preceding commands:

          •   Because mysql_upgrade invokes mysqlcheck with the
              --all-databases option, it processes all tables in all
              databases, which might take a long time to complete. Each
              table is locked and therefore unavailable to other sessions
              while it is being processed. Check and repair operations can
              be time-consuming, particularly for large tables.

          •   For details about what checks the --check-upgrade option
              entails, see the description of the FOR UPGRADE option of the
              CHECK TABLE statement.

          •   fix_priv_tables represents a script generated internally by
              mysql_upgrade that contains SQL statements to upgrade the
              tables in the mysql database.

          All checked and repaired tables are marked with the current
          MariaDB version number. This ensures that next time you run
          mysql_upgrade with the same version of the server, it can tell
          whether there is any need to check or repair the table again.

          mysql_upgrade also saves the MariaDB version number in a file
          named mysql_upgrade_info in the data directory. This is used to
          quickly check whether all tables have been checked for this
          release so that table-checking can be skipped. To ignore this
          file and perform the check regardless, use the --force option.

          For this reason, mysql_upgrade needs to be run as a user with
          write access to the data directory.

          If you install MariaDB from RPM packages on Linux, you must
          install the server and client RPMs.  mysql_upgrade is included in
          the server RPM but requires the client RPM because the latter
          includes mysqlcheck.

          mysql_upgrade supports the following options, which can be
          specified on the command line or in the [mysql_upgrade] and
          [client] option file groups. Other options are passed to
          mysqlcheck. For example, it might be necessary to specify the
          --password[=password] option.  mysql_upgrade also supports the
          options for processing option files.

          •   --help, -?

              Display a short help message and exit.

          •   --basedir=path

              Old option accepted for backward compatibility but ignored.

          •   --character-sets-dir=path

              Old option accepted for backward compatibility but ignored.

          •   --datadir=path

              Old option accepted for backward compatibility but ignored.

          •   --debug=path, -# path

              For debug builds, output debug log.

          •   --debug-check

              Print some debugging information when the program exits.

          •   --debug-info, -T

              Print debugging information and memory and CPU usage
              statistics when the program exits.

          •   --default-character-set=name

              Old option accepted for backward compatibility but ignored.

          •   --force

              Ignore the mysql_upgrade_info file and force execution of
              mysqlcheck even if mysql_upgrade has already been executed
              for the current version of MariaDB.

          •   --host

              Connect to MariaDB on the given host.

          •   --password[=password], -p[password]

              The password to use when connecting to the server. If you use
              the short option form (-p), you cannot have a space between
              the option and the password. If you omit the password value
              following the --password or -p option on the command line,
              mysql_upgrade prompts for one.

              Specifying a password on the command line should be
              considered insecure. You can use an option file to avoid
              giving the password on the command line.

          •   --port=port_num, -P port_num

              The TCP/IP port number to use for the connection.

          •   --protocol={TCP|SOCKET|PIPE|MEMORY}

              The connection protocol to use for connecting to the server.
              It is useful when the other connection parameters normally
              would cause a protocol to be used other than the one you
              want.

          •   --silent

              Print less information.

          •   --socket=path, -S path

              For connections to localhost, the Unix socket file to use,
              or, on Windows, the name of the named pipe to use.

          •   --ssl

              Enable SSL for connection (automatically enabled with other
              flags). Disable with --skip-ssl.

          •   --ssl-ca=name

              CA file in PEM format (check OpenSSL docs, implies --ssl).

          •   --ssl-capath=name

              CA directory (check OpenSSL docs, implies --ssl).

          •   --ssl-cert=name

              X509 cert in PEM format (check OpenSSL docs, implies --ssl).

          •   --ssl-cipher=name

              SSL cipher to use (check OpenSSL docs, implies --ssl).

          •   --ssl-key=name

              X509 key in PEM format (check OpenSSL docs, implies --ssl).

          •   --ssl-crl=name

              Certificate revocation list (check OpenSSL docs, implies
              --ssl).

          •   --ssl-crlpath=name

              Certificate revocation list path (check OpenSSL docs, implies
              --ssl).

          •   --ssl-verify-server-cert

              Verify server's "Common Name" in its cert against hostname
              used when connecting. This option is disabled by default.

          •   --tmpdir=path, -t path

              The path name of the directory to use for creating temporary
              files.

          •   --upgrade-system-tables, -s

              Only upgrade the system tables in the mysql database. Tables
              in other databases are not checked or touched.

          •   --user=user_name, -u user_name

              The MariaDB user name to use when connecting to the server
              and not using the current login.

          •   --verbose

              Display more output about the process. Using it twice will
              print connection arguments; using it 3 times will print out
              all CHECK, RENAME and ALTER TABLE commands used during the
              check phase; using it 4 times (added in MariaDB 10.0.14) will
              also write out all mysqlcheck commands used.

          •   --version, -V

              Output version information and exit.

          •   --version-check, -k

              Run this program only if its 'server version' matches the
              version of the server to which it's connecting. Note: the
              'server version' of the program is the version of the MariaDB
              server with which it was built/distributed. Defaults to on;
              use --skip-version-check to disable.

          •   --write-binlog

              Cause binary logging to be enabled while mysql_upgrade runs.


-----------------------------------------------------------

::

          Copyright 2007-2008 MySQL AB, 2008-2010 Sun Microsystems, Inc.,
          2010-2020 MariaDB Foundation

          This documentation is free software; you can redistribute it
          and/or modify it only under the terms of the GNU General Public
          License as published by the Free Software Foundation; version 2
          of the License.

          This documentation is distributed in the hope that it will be
          useful, but WITHOUT ANY WARRANTY; without even the implied
          warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
          See the GNU General Public License for more details.

          You should have received a copy of the GNU General Public License
          along with the program; if not, write to the Free Software
          Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
          02110-1335 USA or see http://www.gnu.org/licenses/.


---------------------------------------------------------

::

          For more information, please refer to the MariaDB Knowledge Base,
          available online at https://mariadb.com/kb/


-----------------------------------------------------

::

          MariaDB Foundation (http://www.mariadb.org/).

COLOPHON
---------------------------------------------------------

::

          This page is part of the MariaDB (MariaDB database server)
          project.  Information about the project can be found at 
          ⟨http://mariadb.org/⟩.  If you have a bug report for this manual
          page, see ⟨https://mariadb.com/kb/en/mariadb/reporting-bugs/⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/MariaDB/server⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   MariaDB 10.6                  20 July 2020              MYSQL_UPGRADE(1)

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
