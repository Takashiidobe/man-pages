.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mysqladmin(1) — Linux manual page
=================================

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

   MYSQLADMIN(1)            MariaDB Database System           MYSQLADMIN(1)

NAME
-------------------------------------------------

::

          mysqladmin - client for administering a MariaB server


---------------------------------------------------------

::

          mysqladmin [options] command [command-arg] [command
                                                                                 [command-arg]]
                                                                                 ...


---------------------------------------------------------------

::

          mysqladmin is a client for performing administrative operations.
          You can use it to check the server´s configuration and current
          status, to create and drop databases, and more.

          Invoke mysqladmin like this:

              shell> mysqladmin [options] command [command-arg] [command [command-arg]] ...

          mysqladmin supports the following commands. Some of the commands
          take an argument following the command name.

          •   create db_name

              Create a new database named db_name.

          •   debug

              Tell the server to write debug information to the error log.

              This also includes information about the Event Scheduler.

          •   drop db_name

              Delete the database named db_name and all its tables.

          •   extended-status

              Display the server status variables and their values.

          •   flush-all-statistics

              Flush all statistics tables.

          •   flush-all-status

              Flush all status and statistics.

          •   flush-binary-log

              Flush the binary log.

          •   flush-client-statistics

              Flush client statistics.

          •   flush-engine-log

              Flush engine log.

          •   flush-error-log

              Flush error log.

          •   flush-general-log

              Flush general query log.

          •   flush-hosts

              Flush all information in the host cache.

          •   flush-index-statistics

              Flush index statistics.

          •   flush-logs

              Flush all logs.

          •   flush-privileges

              Reload the grant tables (same as reload).

          •   flush-relay-log

              Flush relay log.

          •   flush-slow-log

              Flush slow query log.

          •   flush-ssl

              Flush SSL certificates.

          •   flush-status

              Clear status variables.

          •   flush-table-statistics

              Flush table statistics.

          •   flush-tables

              Flush all tables.

          •   flush-threads

              Flush the thread cache.

          •   flush-user-resources

              Flush user resources.

          •   kill id,id,...

              Kill server threads. If multiple thread ID values are given,
              there must be no spaces in the list.

          •   old-password new-password

              This is like the password command but stores the password
              using the old (pre MySQL 4.1) password-hashing format.

          •   password new-password

              Set a new password. This changes the password to new-password
              for the account that you use with mysqladmin for connecting
              to the server. Thus, the next time you invoke mysqladmin (or
              any other client program) using the same account, you will
              need to specify the new password.

              If the new-password value contains spaces or other characters
              that are special to your command interpreter, you need to
              enclose it within quotes. On Windows, be sure to use double
              quotes rather than single quotes; single quotes are not
              stripped from the password, but rather are interpreted as
              part of the password. For example:

                  shell> mysqladmin password "my new password"

                  Caution
                  Do not use this command used if the server was started
                  with the --skip-grant-tables option. No password change
                  will be applied. This is true even if you precede the
                  password command with flush-privileges on the same
                  command line to re-enable the grant tables because the
                  flush operation occurs after you connect. However, you
                  can use mysqladmin flush-privileges to re-enable the
                  grant table and then use a separate mysqladmin password
                  command to change the password.

          •   ping

              Check whether the server is alive. The return status from
              mysqladmin is 0 if the server is running, 1 if it is not.
              This is 0 even in case of an error such as Access denied,
              because this means that the server is running but refused the
              connection, which is different from the server not running.

          •   processlist

              Show a list of active server threads. This is like the output
              of the SHOW PROCESSLIST statement. If the --verbose option is
              given, the output is like that of SHOW FULL PROCESSLIST.

          •   reload

              Reload the grant tables.

          •   refresh

              Flush all tables and close and open log files.

          •   shutdown

              Stop the server.

          •   start-all-slaves

              Start all slaves.

          •   start-slave

              Start replication on a slave server.

          •   status

              Display a short server status message.

          •   stop-all-slaves

              Stop all slaves.

          •   stop-slave

              Stop replication on a slave server.

          •   variables

              Display the server system variables and their values.

          •   version

              Display version information from the server.

          All commands can be shortened to any unique prefix. For example:

              shell> mysqladmin proc stat
              +----+-------+-----------+----+---------+------+-------+------------------+
              | Id | User  | Host      | db | Command | Time | State | Info             |
              +----+-------+-----------+----+---------+------+-------+------------------+
              | 51 | monty | localhost |    | Query   | 0    |       | show processlist |
              +----+-------+-----------+----+---------+------+-------+------------------+
              Uptime: 1473624  Threads: 1  Questions: 39487
              Slow queries: 0  Opens: 541  Flush tables: 1
              Open tables: 19  Queries per second avg: 0.0268

          The mysqladmin status command result displays the following
          values:

          •   Uptime

              The number of seconds the MariaDB server has been running.

          •   Threads

              The number of active threads (clients).

          •   Questions

              The number of questions (queries) from clients since the
              server was started.

          •   Slow queries

              The number of queries that have taken more than
              long_query_time seconds.

          •   Opens

              The number of tables the server has opened.

          •   Flush tables

              The number of flush-*, refresh, and reload commands the
              server has executed.

          •   Open tables

              The number of tables that currently are open.

          •   Memory in use

              The amount of memory allocated directly by mysqld. This value
              is displayed only when MariaDB has been compiled with
              --with-debug=full.

          •   Maximum memory used

              The maximum amount of memory allocated directly by mysqld.
              This value is displayed only when MariaDB has been compiled
              with --with-debug=full.

          If you execute mysqladmin shutdown when connecting to a local
          server using a Unix socket file, mysqladmin waits until the
          server´s process ID file has been removed, to ensure that the
          server has stopped properly.

          mysqladmin supports the following options, which can be specified
          on the command line or in the [mysqladmin] and [client] option
          file groups.

          •   --help, -?

              Display help and exit.

          •   --character-sets-dir=path

              The directory where character sets are installed.

          •   --compress, -C

              Compress all information sent between the client and the
              server if both support compression.

          •   --connect-timeout=timeout

              Equivalent to --connect_timeout, see the end of this section.

          •   --count=N, -c N

              The number of iterations to make for repeated command
              execution if the --sleep option is given.

          •   --debug[=debug_options], -# [debug_options]

              Write a debugging log. A typical debug_options string is
              ´d:t:o,file_name´. The default is
              ´d:t:o,/tmp/mysqladmin.trace´.

          •   --debug-check

              Check memory and open file usage at exit..

          •   --debug-info

              Print debugging information and memory and CPU usage
              statistics when the program exits.

          •   --default-auth

              Default authentication client-side plugin to use.

          •   --default-character-set=charset_name

              Use charset_name as the default character set.

          •   --defaults-extra-file=filename

              Set filename as the file to read default options from after
              the global defaults files has been read.  Must be given as
              first option.

          •   --defaults-file=filename

              Set filename as the file to read default options from,
              override global defaults files. Must be given as first
              option.

          •   --force, -f

              Do not ask for confirmation for the drop db_name command.
              With multiple commands, continue even if an error occurs.

          •   --host=host_name, -h host_name

              Connect to the MariaDB server on the given host.

          •   --local, -l

              Suppress the SQL command(s) from being written to the binary
              log by using FLUSH LOCAL or enabling sql_log_bin=0 for the
              session.

          •   --no-beep, -b

              Suppress the warning beep that is emitted by default for
              errors such as a failure to connect to the server.

          •   --no-defaults

              Do not read default options from any option file. This must
              be given as the first argument.

          •   --password[=password], -p[password]

              The password to use when connecting to the server. If you use
              the short option form (-p), you cannot have a space between
              the option and the password. If you omit the password value
              following the --password or -p option on the command line,
              mysqladmin prompts for one.

              Specifying a password on the command line should be
              considered insecure.

          •   --pipe, -W

              On Windows, connect to the server via a named pipe. This
              option applies only if the server supports named-pipe
              connections.

          •   --port=port_num, -P port_num

              The TCP/IP port number to use for the connection or 0 for
              default to, in order of preference, my.cnf, $MYSQL_TCP_PORT,
              /etc/services, built-in default (3306).  Forces
              --protocol=tcp when specified on the command line without
              other connection properties.

          •   --print-defaults

              Print the program argument list and exit. This must be given
              as the first argument.

          •   --protocol={TCP|SOCKET|PIPE|MEMORY}

              The connection protocol to use for connecting to the server.
              It is useful when the other connection parameters normally
              would cause a protocol to be used other than the one you
              want.

          •   --relative, -r

              Show the difference between the current and previous values
              when used with the --sleep option. Currently, this option
              works only with the extended-status command.

          •   --shutdown-timeouttimeout

              Equivalent of --shutdown_timeout, see the end of this
              section.

          •   --silent, -s

              Exit silently if a connection to the server cannot be
              established.

          •   --sleep=delay, -i delay

              Execute commands repeatedly, sleeping for delay seconds in
              between. The --count option determines the number of
              iterations. If --count is not given, mysqladmin executes
              commands indefinitely until interrupted.

          •   --socket=path, -S path

              For connections to localhost, the Unix socket file to use,
              or, on Windows, the name of the named pipe to use.  Forces
              --protocol=socket when specified on the command line without
              other connection properties; on Windows, forces
              --protocol=pipe.

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

          •   --tls-version=name,

              Accepts a comma-separated list of TLS protocol versions. A
              TLS protocol version will only be enabled if it is present in
              this list. All other TLS protocol versions will not be
              permitted.

          •   --user=user_name, -u user_name

              The MariaDB user name to use when connecting to the server.

          •   --verbose, -v

              Verbose mode. Print more information about what the program
              does.

          •   --version, -V

              Display version information and exit.

          •   --vertical, -E

              Print output vertically. This is similar to --relative, but
              prints output vertically.

          •   --wait[=count], -w[count]

              If the connection cannot be established, wait and retry
              instead of aborting. If a count value is given, it indicates
              the number of times to retry. The default is one time.

          •   --wait-for-all-slaves

              Wait for the last binlog event to be sent to all connected
              slaves before shutting down.  This option is off by default.

          You can also set the following variables by using
          --var_name=value

          •   connect_timeout

              The maximum number of seconds before connection timeout. The
              default value is 43200 (12 hours).

          •   shutdown_timeout

              The maximum number of seconds to wait for server shutdown.
              The default value is 3600 (1 hour).


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

   MariaDB 10.6                   15 May 2020                 MYSQLADMIN(1)

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
