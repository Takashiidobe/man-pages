.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mysqlimport(1) — Linux manual page
==================================

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

   MYSQLIMPORT(1)           MariaDB Database System          MYSQLIMPORT(1)

NAME
-------------------------------------------------

::

          mysqlimport - a data import program


---------------------------------------------------------

::

          mysqlimport [options] db_name textfile1 ...


---------------------------------------------------------------

::

          The mysqlimport client provides a command-line interface to the
          LOAD DATA INFILE SQL statement. Most options to mysqlimport
          correspond directly to clauses of LOAD DATA INFILE syntax.

          Invoke mysqlimport like this:

              shell> mysqlimport [options] db_name textfile1 [textfile2 ...]

          For each text file named on the command line, mysqlimport strips
          any extension from the file name and uses the result to determine
          the name of the table into which to import the file´s contents.
          For example, files named patient.txt, patient.text, and patient
          all would be imported into a table named patient.

          mysqlimport supports the following options, which can be
          specified on the command line or in the [mysqlimport] and
          [client] option file groups.  mysqlimport also supports the
          options for processing option files.

          •   --help, -?

              Display a help message and exit.

          •   --character-sets-dir=path

              The directory where character sets are installed.

          •   --columns=column_list, -c column_list

              This option takes a comma-separated list of column names as
              its value. The order of the column names indicates how to
              match data file columns with table columns.

          •   --compress, -C

              Compress all information sent between the client and the
              server if both support compression.

          •   --debug[=debug_options], -# [debug_options]

              Write a debugging log. A typical debug_options string is
              ´d:t:o,file_name´. The default is ´d:t:o´.

          •   --debug-check

              Print some debugging information when the program exits.

          •   --debug-info

              Print debugging information and memory and CPU usage
              statistics when the program exits.

          •   --default-auth=plugin_name

              Default authentication client-side plugin to use.

          •   --default-character-set=charset_name

              Use charset_name as the default character set.

          •   --defaults-extra-file=filename

              Set filename as the file to read default options from after
              the global defaults files has been read.  Must be given as
              first option.

          •   --defaults-file=filename

              Set filename as the file to read default options from,
              override global defaults files.  Must be given as first
              option.

          •   --delete, -d

              Empty the table before importing the text file.

          •   --fields-terminated-by=..., --fields-enclosed-by=...,
              --fields-optionally-enclosed-by=..., --fields-escaped-by=...

              These options have the same meaning as the corresponding
              clauses for LOAD DATA INFILE.

          •   --force, -f

              Ignore errors. For example, if a table for a text file does
              not exist, continue processing any remaining files. Without
              --force, mysqlimport exits if a table does not exist.

          •   --host=host_name, -h host_name

              Import data to the MariaDB server on the given host. The
              default host is localhost.

          •   --ignore, -i

              See the description for the --replace option.

          •   --ignore-foreign-keys, -k

              Disable foreign key checks while importing the data.

          •   --ignore-lines=N

              Ignore the first N lines of the data file.

          •   --lines-terminated-by=...

              This option has the same meaning as the corresponding clause
              for LOAD DATA INFILE. For example, to import Windows files
              that have lines terminated with carriage return/linefeed
              pairs, use --lines-terminated-by="\r\n". (You might have to
              double the backslashes, depending on the escaping conventions
              of your command interpreter.).

          •   --local, -L

              Read input files locally from the client host.

          •   --lock-tables, -l

              Lock all tables for writing before processing any text files.
              This ensures that all tables are synchronized on the server.

          •   --low-priority

              Use LOW_PRIORITY when loading the table. This affects only
              storage engines that use only table-level locking (such as
              MyISAM, MEMORY, and MERGE).

          •   --no-defaults

              Do not read default options from any option file. This must
              be given as the first argument.

          •   --password[=password], -p[password]

              The password to use when connecting to the server. If you use
              the short option form (-p), you cannot have a space between
              the option and the password. If you omit the password value
              following the --password or -p option on the command line,
              mysqlimport prompts for one.

              Specifying a password on the command line should be
              considered insecure. You can use an option file to avoid
              giving the password on the command line.

          •   --pipe, -W

              On Windows, connect to the server via a named pipe. This
              option applies only if the server supports named-pipe
              connections.

          •   --plugin-dir=name

               Directory for client-side plugins.

          •   --port=port_num, -P port_num

              The TCP/IP port number to use for the connection.  Forces
              --protocol=tcp when specified on the command line without
              other connection properties.

          •   --protocol={TCP|SOCKET|PIPE|MEMORY}

              The connection protocol to use for connecting to the server.
              It is useful when the other connection parameters normally
              would cause a protocol to be used other than the one you
              want.

          •   --print-defaults

              Print the program argument list and exit.  This must be given
              as the first argument.

          •   --replace, -r

              The --replace and --ignore options control handling of input
              rows that duplicate existing rows on unique key values. If
              you specify --replace, new rows replace existing rows that
              have the same unique key value. If you specify --ignore,
              input rows that duplicate an existing row on a unique key
              value are skipped. If you do not specify either option, an
              error occurs when a duplicate key value is found, and the
              rest of the text file is ignored.

          •   --silent, -s

              Silent mode. Produce output only when errors occur.

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

          •   --use-threads=N

              Load files in parallel using N threads.

          •   --verbose, -v

              Verbose mode. Print more information about what the program
              does.

          •   --version, -V

              Display version information and exit.

          Here is a sample session that demonstrates use of mysqlimport:

              shell> mysql -e ´CREATE TABLE imptest(id INT, n VARCHAR(30))´ test
              shell> ed
              a
              100     Max Sydow
              101     Count Dracula
              .
              w imptest.txt
              32
              q
              shell> od -c imptest.txt
              0000000   1   0   0  \t   M   a   x       S   y   d   o   w  \n   1   0
              0000020   1  \t   C   o   u   n   t       D   r   a   c   u   l   a  \n
              0000040
              shell> mysqlimport --local test imptest.txt
              test.imptest: Records: 2  Deleted: 0  Skipped: 0  Warnings: 0
              shell> mysql -e ´SELECT * FROM imptest´ test
              +------+---------------+
              | id   | n             |
              +------+---------------+
              |  100 | Max Sydow     |
              |  101 | Count Dracula |
              +------+---------------+


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

   MariaDB 10.6                   15 May 2020                MYSQLIMPORT(1)

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
