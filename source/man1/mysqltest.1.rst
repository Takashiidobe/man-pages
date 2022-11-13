.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mysqltest(1) — Linux manual page
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

   MYSQLTEST(1)             MariaDB Database System            MYSQLTEST(1)

NAME
-------------------------------------------------

::

          mysqltest - program to run test cases
          mysqltest_embedded - program to run embedded test cases


---------------------------------------------------------

::

          mysqltest [options] [db_name]

          mysqltest_embedded [options] [db_name]


---------------------------------------------------------------

::

          The mysqltest program runs a test case against a MariaDB server
          and optionally compares the output with a result file. This
          program reads input written in a special test language.
          Typically, you invoke mysqltest via mysql-test-run.pl rather than
          invoking it directly.

          mysqltest_embedded is similar but is built with support for the
          libmysqld embedded server.

          Features of mysqltest:

          •   Can send SQL statements to MariaDB servers for execution

          •   Can execute external shell commands

          •   Can test whether the result from an SQL statement or shell
              command is as expected

          •   Can connect to one or more standalone mysqld servers and
              switch between connections

          •   Can connect to an embedded server (libmysqld), if MariaDB is
              compiled with support for libmysqld. (In this case, the
              executable is named mysqltest_embedded rather than
              mysqltest.)

          By default, mysqltest reads the test case on the standard input.
          To run mysqltest this way, you normally invoke it like this:

              shell> mysqltest [options] [db_name] < test_file

          You can also name the test case file with a --test-file=file_name
          option.

          The exit value from mysqltest is 0 for success, 1 for failure,
          and 62 if it skips the test case (for example, if after checking
          some preconditions it decides not to run the test).

          mysqltest supports the following options:

          •   --help, -?

              Display a help message and exit.

          •   --basedir=dir_name, -b dir_name

              The base directory for tests.

          •   --character-sets-dir=path

              The directory where character sets are installed.

          •   --compress, -C

              Compress all information sent between the client and the
              server if both support compression.

          •   --connect-timeout=num

              This can be used to set the MYSQL_OPT_CONNECT_TIMEOUT
              parameter of mysql_options to change the number of seconds
              before an unsuccessful connection attempt times out.

          •   --continue-on-error

              Continue test even if we got an error. This is mostly useful
              when testing a storage engine to see what from a test file it
              can execute, or to find all syntax errors in a newly created
              big test file.

          •   --cursor-protocol

              Use cursors for prepared statements.

          •   --database=db_name, -D db_name

              The default database to use.

          •   --debug[=debug_options], -#[debug_options]

              Write a debugging log if MariaDB is built with debugging
              support. The default debug_options value is
              ´d:t:S:i:O,/tmp/mysqltest.trace´.

          •   --debug-check

              Print some debugging information when the program exits.

          •   --debug-info

              Print debugging information and memory and CPU usage
              statistics when the program exits.

          •   --host=host_name, -h host_name

              Connect to the MariaDB server on the given host.

          •   --logdir=dir_name

              The directory to use for log files.

          •   --mark-progress

              Write the line number and elapsed time to test_file.progress.

          •   --max-connect-retries=num

              The maximum number of connection attempts when connecting to
              server.

          •   --max-connections=num

              The maximum number of simultaneous server connections per
              client (that is, per test). If not set, the maximum is 128.
              Minimum allowed limit is 8, maximum is 5120.

          •   --no-defaults

              Do not read default options from any option files. If used,
              this must be the first option.

          •   --non-blocking-api

              Use the non-blocking client API for communication.

          •   --overlay-dir=dir_name

              Overlay directory.

          •   --password[=password], -p[password]

              The password to use when connecting to the server. If you use
              the short option form (-p), you cannot have a space between
              the option and the password. If you omit the password value
              following the --password or -p option on the command line,
              you are prompted for one.

          •   --plugin-dir=dir_name

              Directory for client-side plugins.

          •   --port=port_num, -P port_num

              The TCP/IP port number to use for the connection or 0 for
              default to, in order of preference, my.cnf, $MYSQL_TCP_PORT,
              /etc/services, built-in default (3306).

          •   --prologue=name

              Include the contents of the given file before processing the
              contents of the test file. The included file should have the
              same format as other mysqltest test files. This option has
              the same effect as putting a --source file_name command as
              the first line of the test file.

          •   --protocol={TCP|SOCKET|PIPE|MEMORY}

              The connection protocol to use for connecting to the server.
              It is useful when the other connection parameters normally
              would cause a protocol to be used other than the one you
              want.

          •   --ps-protocol

              Use the prepared-statement protocol for communication.

          •   --quiet

              Suppress all normal output. This is a synonym for --silent.

          •   --record, -r

              Record the output that results from running the test file
              into the file named by the --result-file option, if that
              option is given. It is an error to use this option without
              also using --result-file.

          •   --result-file=file_name, -R file_name

              This option specifies the file for test case expected
              results.  --result-file, together with --record, determines
              how mysqltest treats the test actual and expected results for
              a test case:

              •   If the test produces no results, mysqltest exits with an
                  error message to that effect, unless --result-file is
                  given and the named file is an empty file.

              •   Otherwise, if --result-file is not given, mysqltest sends
                  test results to the standard output.

              •   With --result-file but not --record, mysqltest reads the
                  expected results from the given file and compares them
                  with the actual results. If the results do not match,
                  mysqltest writes a .reject file in the same directory as
                  the result file, outputs a diff of the two files, and
                  exits with an error.

              •   With both --result-file and --record, mysqltest updates
                  the given file by writing the actual test results to it.

          •   --result-format-version=#

              Version of the result file format to use.

          •   --server-arg=value, -A value

              Pass the argument as an argument to the embedded server. For
              example, --server-arg=--tmpdir=/tmp or --server-arg=--core.
              Up to 64 arguments can be given.

          •   --server-file=file_name, -F file_name

              Read arguments for the embedded server from the given file.
              The file should contain one argument per line.

          •   --silent, -s

              Suppress all normal output.

          •   --sleep=num, -T num

              Cause all sleep commands in the test case file to sleep num
              seconds. This option does not affect real_sleep commands.

              An option value of 0 can be used, which effectively disables
              sleep commands in the test case.

          •   --socket=path, -S path

              The socket file to use when connecting to localhost (which is
              the default host).

          •   --sp-protocol

              Execute DML statements within a stored procedure. For every
              DML statement, mysqltest creates and invokes a stored
              procedure that executes the statement rather than executing
              the statement directly.

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

          •   --suite-dir=dir_name

              Suite directory.

          •   --tail-lines=nn

              Specify how many lines of the result to include in the output
              if the test fails because an SQL statement fails. The default
              is 0, meaning no lines of result printed.

          •   --test-file=file_name, -x file_name

              Read test input from this file. The default is to read from
              the standard input.

          •   --timer-file=file_name, -m file_name

              If given, the number of microseconds spent running the test
              will be written to this file. This is used by
              mysql-test-run.pl for its reporting.

          •   --tmpdir=dir_name, -t dir_name

              The temporary directory where socket files are created.

          •   --user=user_name, -u user_name

              The MariaDB user name to use when connecting to the server.

          •   --verbose, -v

              Verbose mode. Print out more information about what the
              program does.

          •   --version, -V

              Display version information and exit.

          •   --view-protocol

              Every SELECT statement is wrapped inside a view.


-----------------------------------------------------------

::

          Copyright © 2007, 2010, Oracle and/or its affiliates, 2010-2020
          MariaDB Foundation

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

   MariaDB 10.6                   15 May 2020                  MYSQLTEST(1)

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
