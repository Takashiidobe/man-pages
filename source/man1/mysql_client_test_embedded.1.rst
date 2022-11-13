.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mysql_client_test(1) — Linux manual page
========================================

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

   MYSQL_CLIENT_TEST(1)     MariaDB Database System    MYSQL_CLIENT_TEST(1)

NAME
-------------------------------------------------

::

          mysql_client_test - test client API
          mysql_client_test_embedded - test client API for embedded server


---------------------------------------------------------

::

          mysql_client_test [options] [test_name] ...

          mysql_client_test_embedded [options] [test_name] ...


---------------------------------------------------------------

::

          The mysql_client_test program is used for testing aspects of the
          MariaDB client API that cannot be tested using mysqltest and its
          test language.  mysql_client_test_embedded is similar but used
          for testing the embedded server. Both programs are run as part of
          the test suite.

          The source code for the programs can be found in in
          tests/mysql_client_test.c in a source distribution. The program
          serves as a good source of examples illustrating how to use
          various features of the client API.

          mysql_client_test is used in a test by the same name in the main
          tests suite of mysql-test-run.pl but may also be run directly.
          Unlike the other programs listed here, it does not read an
          external description of what tests to run. Instead, all tests are
          coded into the program, which is written to cover all aspects of
          the C language API.

          mysql_client_test supports the following options:

          •   --help, -?

              Display a help message and exit.

          •   --basedir=dir_name, -b dir_name

              The base directory for the tests.

          •   --count=count, -t count

              The number of times to execute the tests.

          •   --database=db_name, -D db_name

              The database to use.

          •   --debug[=debug_options], -#[debug_options]

              Write a debugging log if MariaDB is built with debugging
              support. The default debug_options value is
              ´d:t:o,/tmp/mysql_client_test.trace´.

          •   --getopt-ll-test=option, -g option

              Option to use for testing bugs in the getopt library.

          •   --host=host_name, -h host_name

              Connect to the MariaDB server on the given host.

          •   --password[=password], -p[password]

              The password to use when connecting to the server. If you use
              the short option form (-p), you cannot have a space between
              the option and the password. If you omit the password value
              following the --password or -p option on the command line,
              you are prompted for one.

          •   --port=port_num, -P port_num

              The TCP/IP port number to use for the connection.

          •   --server-arg=arg, -A arg

              Argument to send to the embedded server.

          •   --show-tests, -T

              Show all test names.

          •   --silent, -s

              Be more silent.

          •   --socket=path, -S path

              The socket file to use when connecting to localhost (which is
              the default host).

          •   --testcase, -c

              The option is used when called from mysql-test-run.pl, so
              that mysql_client_test may optionally behave in a different
              way than if called manually, for example by skipping some
              tests. Currently, there is no difference in behavior but the
              option is included in order to make this possible.

          •   --user=user_name, -u user_name

              The MariaDB user name to use when connecting to the server.

          •   -v dir_name, --vardir=dir_name

              The data directory for tests. The default is mysql-test/var.


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

   MariaDB 10.6                   15 May 2020          MYSQL_CLIENT_TEST(1)

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
