.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mysqlslap(1) — Linux manual page
================================

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

   MYSQLSLAP(1)             MariaDB Database System            MYSQLSLAP(1)

NAME
-------------------------------------------------

::

          mysqlslap - load emulation client


---------------------------------------------------------

::

          mysqlslap [options]


---------------------------------------------------------------

::

          mysqlslap is a diagnostic program designed to emulate client load
          for a MariaDB server and to report the timing of each stage. It
          works as if multiple clients are accessing the server.

          Invoke mysqlslap like this:

              shell> mysqlslap [options]

          Some options such as --create or --query enable you to specify a
          string containing an SQL statement or a file containing
          statements. If you specify a file, by default it must contain one
          statement per line. (That is, the implicit statement delimiter is
          the newline character.) Use the --delimiter option to specify a
          different delimiter, which enables you to specify statements that
          span multiple lines or place multiple statements on a single
          line. You cannot include comments in a file; mysqlslap does not
          understand them.

          mysqlslap runs in three stages:

           1. Create schema, table, and optionally any stored programs or
              data you want to using for the test. This stage uses a single
              client connection.

           2. Run the load test. This stage can use many client
              connections.

           3. Clean up (disconnect, drop table if specified). This stage
              uses a single client connection.

          Examples:

          Supply your own create and query SQL statements, with 50 clients
          querying and 200 selects for each:

              mysqlslap --delimiter=";" \
                --create="CREATE TABLE a (b int);INSERT INTO a VALUES (23)" \
                --query="SELECT * FROM a" --concurrency=50 --iterations=200

          Let mysqlslap build the query SQL statement with a table of two
          INT columns and three VARCHAR columns. Use five clients querying
          20 times each. Do not create the table or insert the data (that
          is, use the previous test´s schema and data):

              mysqlslap --concurrency=5 --iterations=20 \
                --number-int-cols=2 --number-char-cols=3 \
                --auto-generate-sql

          Tell the program to load the create, insert, and query SQL
          statements from the specified files, where the create.sql file
          has multiple table creation statements delimited by ´;´ and
          multiple insert statements delimited by ´;´. The --query file
          will have multiple queries delimited by ´;´. Run all the load
          statements, then run all the queries in the query file with five
          clients (five times each):

              mysqlslap --concurrency=5 \
                --iterations=5 --query=query.sql --create=create.sql \
                --delimiter=";"

          mysqlslap supports the following options, which can be specified
          on the command line or in the [mysqlslap] and [client] option
          file groups.  mysqlslap also supports the options for processing
          option files.

          •   --help, -?

              Display a help message and exit.

          •   --auto-generate-sql, -a

              Generate SQL statements automatically when they are not
              supplied in files or via command options.

          •   --auto-generate-sql-add-autoincrement

              Add an AUTO_INCREMENT column to automatically generated
              tables.

          •   --auto-generate-sql-execute-number=N

              Specify how many queries to generate automatically.

          •   --auto-generate-sql-guid-primary

              Add a GUID-based primary key to automatically generated
              tables.

          •   --auto-generate-sql-load-type=type

              Specify the test load type. The allowable values are read
              (scan tables), write (insert into tables), key (read primary
              keys), update (update primary keys), or mixed (half inserts,
              half scanning selects). The default is mixed.

          •   --auto-generate-sql-secondary-indexes=N

              Specify how many secondary indexes to add to automatically
              generated tables. By default, none are added.

          •   --auto-generate-sql-unique-query-number=N

              How many different queries to generate for automatic tests.
              For example, if you run a key test that performs 1000
              selects, you can use this option with a value of 1000 to run
              1000 unique queries, or with a value of 50 to perform 50
              different selects. The default is 10.

          •   --auto-generate-sql-unique-write-number=N

              How many different queries to generate for
              --auto-generate-sql-write-number. The default is 10.

          •   --auto-generate-sql-write-number=N

              How many row inserts to perform on each thread. The default
              is 100.

          •   --commit=N

              How many statements to execute before committing. The default
              is 0 (no commits are done).

          •   --compress, -C

              Compress all information sent between the client and the
              server if both support compression.

          •   --concurrency=N, -c N

              The number of clients to simulate when issuing the SELECT
              statement.

          •   --create=value

              The file or string containing the statement to use for
              creating the table.

          •   --create-schema=value

              The schema in which to run the tests.

          •   --csv[=file_name]

              Generate output in comma-separated values format. The output
              goes to the named file, or to the standard output if no file
              is given.

          •   --debug[=debug_options], -# [debug_options]

              Write a debugging log. A typical debug_options string is
              ´d:t:o,file_name´. The default is
              ´d:t:o,/tmp/mysqlslap.trace´.

          •   --debug-check

              Print some debugging information when the program exits.

          •   --debug-info, -T

              Print debugging information and memory and CPU usage
              statistics when the program exits.

          •   --default-auth=name

              Default authentication client-side plugin to use.

          •   --defaults-extra-file=filename

              Set filename as the file to read default options from after
              the global defaults files has been read.  Must be given as
              first option.

          •   --defaults-file=filename

              Set filename as the file to read default options from,
              override global defaults files.  Must be given as first
              option.

          •   --delimiter=str, -F str

              The delimiter to use in SQL statements supplied in files or
              via command options.

          •   --detach=N

              Detach (close and reopen) each connection after each N
              statements. The default is 0 (connections are not detached).

          •   --engine=engine_name, -e engine_name

              Comma separated list of storage engines to use for creating
              the table. The test is run for each engine. You can also
              specify an option for an engine after a colon, for example
              memory:max_row=2300.

          •   --host=host_name, -h host_name

              Connect to the MariaDB server on the given host.

          •   --init-command=str

              SQL Command to execute when connecting to MariaDB server.
              Will automatically be re-executed when reconnecting.

          •   --iterations=N, -i N

              The number of times to run the tests.

          •   --no-defaults

              Do not read default options from any option file. This must
              be given as the first argument.

          •   --no-drop

              Do not drop any schema created during the test after the test
              is complete.

          •   --number-char-cols=N, -x N

              The number of VARCHAR columns to use if --auto-generate-sql
              is specified.

          •   --number-int-cols=N, -y N

              The number of INT columns to use if --auto-generate-sql is
              specified.

          •   --number-of-queries=N

              Limit each client to approximately this many queries. Query
              counting takes into account the statement delimiter. For
              example, if you invoke mysqlslap as follows, the ; delimiter
              is recognized so that each instance of the query string
              counts as two queries. As a result, 5 rows (not 10) are
              inserted.

                  shell> mysqlslap --delimiter=";" --number-of-queries=10
                           --query="use test;insert into t values(null)"

          •   --only-print

              Do not connect to databases.  mysqlslap only prints what it
              would have done.

          •   --password[=password], -p[password]

              The password to use when connecting to the server. If you use
              the short option form (-p), you cannot have a space between
              the option and the password. If you omit the password value
              following the --password or -p option on the command line,
              mysqlslap prompts for one.

              Specifying a password on the command line should be
              considered insecure. You can use an option file to avoid
              giving the password on the command line.

          •   --pipe, -W

              On Windows, connect to the server via a named pipe. This
              option applies only if the server supports named-pipe
              connections.

          •   --plugin-dir=dir_name

              Directory for client-side plugins.

          •   --port=port_num, -P port_num

              The TCP/IP port number to use for the connection.  Forces
              --protocol=tcp when specified on the command line without
              other connection properties.

          •   --post-query=value

              The file or string containing the statement to execute after
              the tests have completed. This execution is not counted for
              timing purposes.

          •   --post-system=str

              The string to execute via system() after the tests have
              completed. This execution is not counted for timing purposes.

          •   --pre-query=value

              The file or string containing the statement to execute before
              running the tests. This execution is not counted for timing
              purposes.

          •   --pre-system=str

              The string to execute via system() before running the tests.
              This execution is not counted for timing purposes.

          •   --print-defaults

              Print the program argument list and exit.  This must be given
              as the first argument.

          •   --protocol={TCP|SOCKET|PIPE|MEMORY}

              The connection protocol to use for connecting to the server.
              It is useful when the other connection parameters normally
              would cause a protocol to be used other than the one you
              want.

          •   --query=value, -q value

              The file or string containing the SELECT statement to use for
              retrieving data.

          •   --shared-memory-base-name=name

              On Windows, the shared-memory name to use, for connections
              made via shared memory to a local server. This option applies
              only if the server supports shared-memory connections.

          •   --silent, -s

              Silent mode. No output.

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

          •   --user=user_name, -u user_name

              The MariaDB user name to use when connecting to the server.

          •   --verbose, -v

              Verbose mode. Print more information about what the program
              does. This option can be used multiple times to increase the
              amount of information.

          •   --version, -V

              Display version information and exit.


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

   MariaDB 10.6                   15 May 2020                  MYSQLSLAP(1)

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
