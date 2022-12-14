.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mysqlcheck(1) — Linux manual page
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

   MYSQLCHECK(1)            MariaDB Database System           MYSQLCHECK(1)

NAME
-------------------------------------------------

::

          mysqlcheck - a table maintenance program


---------------------------------------------------------

::

          mysqlcheck [options] [db_name [tbl_name ...]]


---------------------------------------------------------------

::

          The mysqlcheck client performs table maintenance: It checks,
          repairs, optimizes, or analyzes tables.

          Each table is locked and therefore unavailable to other sessions
          while it is being processed, although for check operations, the
          table is locked with a READ lock only. Table maintenance
          operations can be time-consuming, particularly for large tables.
          If you use the --databases or --all-databases option to process
          all tables in one or more databases, an invocation of mysqlcheck
          might take a long time. (This is also true for mysql_upgrade
          because that program invokes mysqlcheck to check all tables and
          repair them if necessary.)

          mysqlcheck is similar in function to myisamchk, but works
          differently. The main operational difference is that mysqlcheck
          must be used when the mysqld server is running, whereas myisamchk
          should be used when it is not. The benefit of using mysqlcheck is
          that you do not have to stop the server to perform table
          maintenance.

          mysqlcheck uses the SQL statements CHECK TABLE, REPAIR TABLE,
          ANALYZE TABLE, and OPTIMIZE TABLE in a convenient way for the
          user. It determines which statements to use for the operation you
          want to perform, and then sends the statements to the server to
          be executed.

          The MyISAM storage engine supports all four maintenance
          operations, so mysqlcheck can be used to perform any of them on
          MyISAM tables. Other storage engines do not necessarily support
          all operations. In such cases, an error message is displayed. For
          example, if test.t is a MEMORY table, an attempt to check it
          produces this result:

              shell> mysqlcheck test t
              test.t
              note     : The storage engine for the table doesn´t support check

          If mysqlcheck is unable to repair a table, see the MariaDB
          Knowledge Base for manual table repair strategies. This will be
          the case, for example, for InnoDB tables, which can be checked
          with CHECK TABLE, but not repaired with REPAIR TABLE.

          The use of mysqlcheck with partitioned tables is not supported.

              Caution
              It is best to make a backup of a table before performing a
              table repair operation; under some circumstances the
              operation might cause data loss. Possible causes include but
              are not limited to file system errors.

          There are three general ways to invoke mysqlcheck:

              shell> mysqlcheck [options] db_name [tbl_name ...]
              shell> mysqlcheck [options] --databases db_name ...
              shell> mysqlcheck [options] --all-databases

          If you do not name any tables following db_name or if you use the
          --databases or --all-databases option, entire databases are
          checked.

          mysqlcheck has a special feature compared to other client
          programs. The default behavior of checking tables (--check) can
          be changed by renaming the binary. If you want to have a tool
          that repairs tables by default, you should just make a copy of
          mysqlcheck named mysqlrepair, or make a symbolic link to
          mysqlcheck named mysqlrepair. If you invoke mysqlrepair, it
          repairs tables.

          The following names can be used to change mysqlcheck default
          behavior.

          ┌──────────────┬───────────────────────┐
          │mysqlrepair   │ The default option is │
          │              │ --repair              │
          ├──────────────┼───────────────────────┤
          │mysqlanalyze  │ The default option is │
          │              │ --analyze             │
          ├──────────────┼───────────────────────┤
          │mysqloptimize │ The default option is │
          │              │ --optimize            │
          └──────────────┴───────────────────────┘

          mysqlcheck supports the following options, which can be specified
          on the command line or in the [mysqlcheck] and [client] option
          file groups.  The -c, -r, -a and -o options are exclusive to each
          other.

          •   --help, -?

              Display a help message and exit.

          •   --all-databases, -A

              Check all tables in all databases. This is the same as using
              the --databases option and naming all the databases on the
              command line.

          •   --all-in-1, -1

              Instead of issuing a statement for each table, execute a
              single statement for each database that names all the tables
              from that database to be processed.

          •   --analyze, -a

              Analyze the tables.

          •   --auto-repair

              If a checked table is corrupted, automatically fix it. Any
              necessary repairs are done after all tables have been
              checked.

          •   --character-sets-dir=path

              The directory where character sets are installed.

          •   --check, -c

              Check the tables for errors. This is the default operation.

          •   --check-only-changed, -C

              Check only tables that have changed since the last check or
              that have not been closed properly.

          •   --check-upgrade, -g

              Invoke CHECK TABLE with the FOR UPGRADE option to check
              tables for incompatibilities with the current version of the
              server. This option automatically enables the --fix-db-names
              and --fix-table-names options.

          •   --compress

              Compress all information sent between the client and the
              server if both support compression.

          •   --databases, -B

              Process all tables in the named databases. Normally,
              mysqlcheck treats the first name argument on the command line
              as a database name and following names as table names. With
              this option, it treats all name arguments as database names.

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

          •   --extended, -e

              If you are using this option to check tables, it ensures that
              they are 100% consistent but takes a long time.

              If you are using this option to repair tables, it will force
              using the old, slow, repair with keycache method, instead of
              the much faster repair by sorting.

          •   --fast, -F

              Check only tables that have not been closed properly.

          •   --fix-db-names

              Convert database names to the format used since MySQL 5.1.
              Only database names that contain special characters are
              affected.

          •   --fix-table-names

              Convert table names (including views) to the format used
              since MySQL 5.1. Only table names that contain special
              characters are affected.

          •   --flush,

              Flush each table after check. This is useful if you don't
              want to have the checked tables take up space in the caches
              after the check.

          •   --force, -f

              Continue even if an SQL error occurs.

          •   --host=host_name, -h host_name

              Connect to the MariaDB server on the given host.

          •   --medium-check, -m

              Do a check that is faster than an --extended operation. This
              finds only 99.99% of all errors, which should be good enough
              in most cases.

          •   --no-defaults

              Do not read default options from any option file. This must
              be given as the first argument.

          •   --optimize, -o

              Optimize the tables.

          •   --password[=password], -p[password]

              The password to use when connecting to the server. If you use
              the short option form (-p), you cannot have a space between
              the option and the password. If you omit the password value
              following the --password or -p option on the command line,
              mysqlcheck prompts for one.

              Specifying a password on the command line should be
              considered insecure. You can use an option file to avoid
              giving the password on the command line.

          •   --persistent, -Z

              Used with ANALYZE TABLE to append the option PERSISENT FOR
              ALL.

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

          •   --print-defaults

              Print the program argument list and exit.  This must be given
              as the first argument.

          •   --process-tables

              Perform the requested operation on tables. Defaults to on;
              use --skip-process-tables to disable.

          •   --process-views=val

              Perform the requested operation (only CHECK VIEW or REPAIR
              VIEW). Possible values are NO, YES (correct the checksum, if
              necessary, add the mariadb-version field), UPGRADE_FROM_MYSQL
              (same as YES and toggle the algorithm MERGE<->TEMPTABLE.

          •   --protocol={TCP|SOCKET|PIPE|MEMORY}

              The connection protocol to use for connecting to the server.
              It is useful when the other connection parameters normally
              would cause a protocol to be used other than the one you
              want.

          •   --quick, -q

              If you are using this option to check tables, it prevents the
              check from scanning the rows to check for incorrect links.
              This is the fastest check method.

              If you are using this option to repair tables, it tries to
              repair only the index tree. This is the fastest repair
              method.

          •   --repair, -r

              Perform a repair that can fix almost anything except unique
              keys that are not unique.

          •   --silent, -s

              Silent mode. Print only error messages.

          •   --skip-database=db_name

              Don't process the database (case-sensitive) specified as
              argument.

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

          •   --tables

              Override the --databases or -B option. All name arguments
              following the option are regarded as table names.

          •   --use-frm

              For repair operations on MyISAM tables, get the table
              structure from the .frm file so that the table can be
              repaired even if the .MYI header is corrupted.

          •   --user=user_name, -u user_name

              The MariaDB user name to use when connecting to the server.

          •   --verbose, -v

              Verbose mode. Print information about the various stages of
              program operation.  Using one --verbose option will give you
              more information about what mysqlcheck is doing.

              Using two --verbose options will also give you connection
              information.

              Using it 3 times will print out all CHECK, RENAME and ALTER
              TABLE during the check phase.

          •   --version, -V

              Display version information and exit.

          •   --write-binlog

              This option is enabled by default, so that ANALYZE TABLE,
              OPTIMIZE TABLE, and REPAIR TABLE statements generated by
              mysqlcheck are written to the binary log. Use
              --skip-write-binlog to cause NO_WRITE_TO_BINLOG to be added
              to the statements so that they are not logged. Use the
              --skip-write-binlog when these statements should not be sent
              to replication slaves or run when using the binary logs for
              recovery from backup.


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

   MariaDB 10.6                   15 May 2020                 MYSQLCHECK(1)

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
