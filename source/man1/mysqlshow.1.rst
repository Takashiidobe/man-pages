.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mysqlshow(1) — Linux manual page
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

   MYSQLSHOW(1)             MariaDB Database System            MYSQLSHOW(1)

NAME
-------------------------------------------------

::

          mysqlshow - display database, table, and column information


---------------------------------------------------------

::

          mysqlshow [options] [db_name [tbl_name [col_name]]]


---------------------------------------------------------------

::

          The mysqlshow client can be used to quickly see which databases
          exist, their tables, or a table´s columns or indexes.

          mysqlshow provides a command-line interface to several SQL SHOW
          statements. The same information can be obtained by using those
          statements directly. For example, you can issue them from the
          mysql client program.

          Invoke mysqlshow like this:

              shell> mysqlshow [options] [db_name [tbl_name [col_name]]]

          •   If no database is given, a list of database names is shown.

          •   If no table is given, all matching tables in the database are
              shown.

          •   If no column is given, all matching columns and column types
              in the table are shown.

          The output displays only the names of those databases, tables, or
          columns for which you have some privileges.

          If the last argument contains shell or SQL wildcard characters
          (“*”, “?”, “%”, or “_”), only those names that are matched by the
          wildcard are shown. If a database name contains any underscores,
          those should be escaped with a backslash (some Unix shells
          require two) to get a list of the proper tables or columns.  “*”
          and “?”  characters are converted into SQL “%” and “_” wildcard
          characters. This might cause some confusion when you try to
          display the columns for a table with a “_” in the name, because
          in this case, mysqlshow shows you only the table names that match
          the pattern. This is easily fixed by adding an extra “%” last on
          the command line as a separate argument.

          mysqlshow supports the following options, which can be specified
          on the command line or in the [mysqlshow] and [client] option
          file groups.  mysqlshow also supports the options for processing
          option files described.

          •   --help, -?

              Display a help message and exit.

          •   --character-sets-dir=path, -c path

              The directory where character sets are installed.

          •   --compress, -C

              Compress all information sent between the client and the
              server if both support compression.

          •   --count

              Show the number of rows per table. This can be slow for
              non-MyISAM tables.

          •   --debug[=debug_options], -# [debug_options]

              Write a debugging log. A typical debug_options string is
              ´d:t:o,file_name´. The default is ´d:t:o´.

          •   --debug-check

              Print some debugging information when the program exits.

          •   --debug-info

              Print debugging information and memory and CPU usage
              statistics when the program exits.

          •   --default-auth=name

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

          •   --defaults-group-suffix=suffix

              In addition to the groups named on the command line, read
              groups that have the given suffix.

          •   --host=host_name, -h host_name

              Connect to the MariaDB server on the given host.

          •   --keys, -k

              Show table indexes.

          •   --no-defaults

              Do not read default options from any option file. This must
              be given as the first argument.

          •   --password[=password], -p[password]

              The password to use when connecting to the server. If you use
              the short option form (-p), you cannot have a space between
              the option and the password. If you omit the password value
              following the --password or -p option on the command line,
              mysqlshow prompts for one.

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

          •   --protocol={TCP|SOCKET|PIPE|MEMORY}

              The connection protocol to use for connecting to the server.
              It is useful when the other connection parameters normally
              would cause a protocol to be used other than the one you
              want.

          •   --print-defaults

              Print the program argument list and exit.  This must be given
              as the first argument.

          •   --show-table-type, -t

              Show a column indicating the table type, as in SHOW FULL
              TABLES. The type is BASE TABLE or VIEW.

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

          •   --status, -i

              Display extra information about each table.

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

   MariaDB 10.6                   15 May 2020                  MYSQLSHOW(1)

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
