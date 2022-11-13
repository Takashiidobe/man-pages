.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mysql-stress-test.pl(1) — Linux manual page
===========================================

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

   MYSQL-STRESS-TE(1)       MariaDB Database System      MYSQL-STRESS-TE(1)

NAME
-------------------------------------------------

::

          mysql-stress-test.pl - server stress test program


---------------------------------------------------------

::

          mysql-stress-test.pl [options]


---------------------------------------------------------------

::

          The mysql-stress-test.pl Perl script performs stress-testing of
          the MariaDB server.

          mysql-stress-test.pl requires a version of Perl that has been
          built with threads support.

          Invoke mysql-stress-test.pl like this:

              shell> mysql-stress-test.pl [options]

          mysql-stress-test.pl supports the following options:

          •   --help

              Display a help message and exit.

          •   --abort-on-error=N

              Causes the program to abort if an error with severity less
              than or equal to N was encountered. Set to 1 to abort on any
              error.

          •   --check-tests-file

              Periodically check the file that lists the tests to be run.
              If it has been modified, reread the file. This can be useful
              if you update the list of tests to be run during a stress
              test.

          •   --cleanup

              Force cleanup of the working directory.

          •   --log-error-details

              Log error details in the global error log file.

          •   --loop-count=N

              In sequential test mode, the number of loops to execute
              before exiting.

          •   --mysqltest=path

              The path name to the mysqltest program.

          •   --server-database=db_name

              The database to use for the tests. The default is test.

          •   --server-host=host_name

              The host name of the local host to use for making a TCP/IP
              connection to the local server. By default, the connection is
              made to localhost using a Unix socket file.

          •   --server-logs-dir=path

              This option is required.  path is the directory where all
              client session logs will be stored. Usually this is the
              shared directory that is associated with the server used for
              testing.

          •   --server-password=password

              The password to use when connecting to the server.

          •   --server-port=port_num

              The TCP/IP port number to use for connecting to the server.
              The default is 3306.

          •   --server-socket=file_name

              For connections to localhost, the Unix socket file to use,
              or, on Windows, the name of the named pipe to use. The
              default is /tmp/mysql.sock.

          •   --server-user=user_name

              The MariaDB user name to use when connecting to the server.
              The default is root.

          •   --sleep-time=N

              The delay in seconds between test executions.

          •   --stress-basedir=path

              This option is required.  path is the working directory for
              the test run. It is used as the temporary location for result
              tracking during testing.

          •   --stress-datadir=path

              The directory of data files to be used during testing. The
              default location is the data directory under the location
              given by the --stress-suite-basedir option.

          •   --stress-init-file[=path]

              file_name is the location of the file that contains the list
              of tests to be run once to initialize the database for the
              testing. If missing, the default file is stress_init.txt in
              the test suite directory.

          •   --stress-mode=mode

              This option indicates the test order in stress-test mode. The
              mode value is either random to select tests in random order
              or seq to run tests in each thread in the order specified in
              the test list file. The default mode is random.

          •   --stress-suite-basedir=path

              This option is required.  path is the directory that has the
              t and r subdirectories containing the test case and result
              files. This directory is also the default location of the
              stress-test.txt file that contains the list of tests. (A
              different location can be specified with the
              --stress-tests-file option.)

          •   --stress-tests-file[=file_name]

              Use this option to run the stress tests.  file_name is the
              location of the file that contains the list of tests. If
              file_name is omitted, the default file is stress-test.txt in
              the stress suite directory. (See --stress-suite-basedir.)

          •   --suite=suite_name

              Run the named test suite. The default name is main (the
              regular test suite located in the mysql-test directory).

          •   --test-count=N

              The number of tests to execute before exiting.

          •   --test-duration=N

              The duration of stress testing in seconds.

          •   --threads=N

              The number of threads. The default is 1.

          •   --verbose

              Verbose mode. Print more information about what the program
              does.


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

   MariaDB 10.6                   15 May 2020            MYSQL-STRESS-TE(1)

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
