.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mysqldump(1) — Linux manual page
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

   MYSQLDUMP(1)             MariaDB Database System            MYSQLDUMP(1)

NAME
-------------------------------------------------

::

          mysqldump - a database backup program


---------------------------------------------------------

::

          mysqldump [options] [db_name [tbl_name ...]]


---------------------------------------------------------------

::

          The mysqldump client is a backup program originally written by
          Igor Romanenko. It can be used to dump a database or a collection
          of databases for backup or transfer to another SQL server (not
          necessarily a MariaDB server). The dump typically contains SQL
          statements to create the table, populate it, or both. However,
          mysqldump can also be used to generate files in CSV, other
          delimited text, or XML format.

          If you are doing a backup on the server and your tables all are
          MyISAM tables, consider using the mysqlhotcopy instead because it
          can accomplish faster backups and faster restores. See
          mysqlhotcopy(1).

          There are four general ways to invoke mysqldump:

              shell> mysqldump [options] db_name [tbl_name ...]
              shell> mysqldump [options] --databases db_name ...
              shell> mysqldump [options] --all-databases
              shell> mysqldump [options] --system={options}

          If you do not name any tables following db_name or if you use the
          --databases or --all-databases option, entire databases are
          dumped.

          mysqldump does not dump the INFORMATION_SCHEMA or
          performance_schema databases by default. To dump these, name them
          explicitly on the command line, although you must also use the
          --skip-lock-tables option.

          To see a list of the options your version of mysqldump supports,
          execute mysqldump --help.

          Some mysqldump options are shorthand for groups of other options:

          •   Use of --opt is the same as specifying --add-drop-table,
              --add-locks, --create-options, --disable-keys,
              --extended-insert, --lock-tables, --quick, and --set-charset.
              All of the options that --opt stands for also are on by
              default because --opt is on by default.

          •   Use of --compact is the same as specifying
              --skip-add-drop-table, --skip-add-locks, --skip-comments,
              --skip-disable-keys, and --skip-set-charset options.

          To reverse the effect of a group option, uses its --skip-xxx form
          (--skip-opt or --skip-compact). It is also possible to select
          only part of the effect of a group option by following it with
          options that enable or disable specific features. Here are some
          examples:

          •   To select the effect of --opt except for some features, use
              the --skip option for each feature. To disable extended
              inserts and memory buffering, use --opt
              --skip-extended-insert --skip-quick. (Actually,
              --skip-extended-insert --skip-quick is sufficient because
              --opt is on by default.)

          •   To reverse --opt for all features except index disabling and
              table locking, use --skip-opt --disable-keys --lock-tables.

          When you selectively enable or disable the effect of a group
          option, order is important because options are processed first to
          last. For example, --disable-keys --lock-tables --skip-opt would
          not have the intended effect; it is the same as --skip-opt by
          itself.

          mysqldump can retrieve and dump table contents row by row, or it
          can retrieve the entire content from a table and buffer it in
          memory before dumping it. Buffering in memory can be a problem if
          you are dumping large tables. To dump tables row by row, use the
          --quick option (or --opt, which enables --quick). The --opt
          option (and hence --quick) is enabled by default, so to enable
          memory buffering, use --skip-quick.

          If you are using a recent version of mysqldump to generate a dump
          to be reloaded into a very old MySQL server, you should not use
          the --opt or --extended-insert option. Use --skip-opt instead.

          mysqldump supports the following options, which can be specified
          on the command line or in the [mysqldump] and [client] option
          file groups.  mysqldump also supports the options for processing
          option file.

          •   --help, -?

              Display a help message and exit.

          •   --add-drop-database

              Add a DROP DATABASE statement before each CREATE DATABASE
              statement. This option is typically used in conjunction with
              the --all-databases or --databases option because no CREATE
              DATABASE statements are written unless one of those options
              is specified.

          •   --add-drop-table

              Add a DROP TABLE statement before each CREATE TABLE
              statement.

          •   --add-drop-trigger

              Add a DROP TRIGGER statement before each CREATE TRIGGER
              statement.

          •   --add-locks

              Surround each table dump with LOCK TABLES and UNLOCK TABLES
              statements. This results in faster inserts when the dump file
              is reloaded.

          •   --all-databases, -A

              Dump all tables in all databases. This is the same as using
              the --databases option and naming all the databases on the
              command line.

          •   --all-tablespaces, -Y

              Adds to a table dump all SQL statements needed to create any
              tablespaces used by an NDBCLUSTER table. This information is
              not otherwise included in the output from mysqldump. This
              option is currently relevant only to MySQL Cluster tables.

          •   --allow-keywords

              Allow creation of column names that are keywords. This works
              by prefixing each column name with the table name.

          •   --apply-slave-statements

              Adds 'STOP SLAVE' prior to 'CHANGE MASTER' and 'START SLAVE'
              to bottom of dump.

          •   --character-sets-dir=path

              The directory where character sets are installed.

          •   --comments, -i

              Write additional information in the dump file such as program
              version, server version, and host. This option is enabled by
              default. To suppress this additional information, use
              --skip-comments.

          •   --compact

              Produce more compact output. This option enables the
              --skip-add-drop-table, --skip-add-locks, --skip-comments,
              --skip-disable-keys, and --skip-set-charset options.

          •   --compatible=name

              Produce output that is more compatible with other database
              systems or with older MySQL servers. The value of name can be
              ansi, mysql323, mysql40, postgresql, oracle, mssql, db2,
              maxdb, no_key_options, no_table_options, or no_field_options.
              To use several values, separate them by commas. These values
              have the same meaning as the corresponding options for
              setting the server SQL mode.

              This option does not guarantee compatibility with other
              servers. It only enables those SQL mode values that are
              currently available for making dump output more compatible.
              For example, --compatible=oracle does not map data types to
              Oracle types or use Oracle comment syntax.

          •   --complete-insert, -c

              Use complete INSERT statements that include column names.

          •   --compress, -C

              Compress all information sent between the client and the
              server if both support compression.

          •   --copy-s3-tables

              By default S3 tables are ignored. With this option set, the
              result file will contain a CREATE statement for a similar
              Aria table, followed by the table data and ending with an
              ALTER TABLE xxx ENGINE=S3.

          •   --create-options, -a

              Include all MariaDB-specific table options in the CREATE
              TABLE statements. Use --skip-create-options to disable.

          •   --databases, -B

              Dump several databases. Normally, mysqldump treats the first
              name argument on the command line as a database name and
              following names as table names. With this option, it treats
              all name arguments as database names.  CREATE DATABASE and
              USE statements are included in the output before each new
              database.

          •   --debug[=debug_options], -# [debug_options]

              Write a debugging log. A typical debug_options string is
              ´d:t:o,file_name´. The default value is
              ´d:t:o,/tmp/mysqldump.trace´.

          •   --debug-check

              Print some debugging information when the program exits.

          •   --debug-info

              Print debugging information and memory and CPU usage
              statistics when the program exits.

          •   --default-auth

              Default authentication client-side plugin to use.

          •   --default-character-set=charset_name

              Use charset_name as the default character set. If no
              character set is specified, mysqldump uses utf8.

          •   --defaults-extra-file=filename

              Set filename as the file to read default options from after
              the global defaults files has been read.  Must be given as
              first option.

          •   --defaults-file=filename

              Set filename as the file to read default options from,
              override global defaults files.  Must be given as first
              option.

          •   --defaults-group-suffix=str,

              Also read groups with a suffix of str. For example, since
              mysqldump normally reads the [client] and [mysqldump] groups,
              --defaults-group-suffix=x would cause it to also read the
              groups [mysqldump_x] and [client_x].

          •   --delayed-insert

              Write INSERT DELAYED statements rather than INSERT
              statements.

          •   --delete-master-logs

              On a master replication server, delete the binary logs by
              sending a PURGE BINARY LOGS statement to the server after
              performing the dump operation. This option automatically
              enables --master-data.

          •   --disable-keys, -K

              For each table, surround the INSERT statements with /*!40000
              ALTER TABLE tbl_name DISABLE KEYS */; and /*!40000 ALTER
              TABLE tbl_name ENABLE KEYS */; statements. This makes loading
              the dump file faster because the indexes are created after
              all rows are inserted. This option is effective only for
              nonunique indexes of MyISAM tables.

          •   --dump-date

              If the --comments option is given, mysqldump produces a
              comment at the end of the dump of the following form:

                  -- Dump completed on DATE

              However, the date causes dump files taken at different times
              to appear to be different, even if the data are otherwise
              identical.  --dump-date and --skip-dump-date control whether
              the date is added to the comment. The default is --dump-date
              (include the date in the comment).  --skip-dump-date
              suppresses date printing

          •   --dump-slave[=value]

              Used for producing a dump file from a replication slave
              server that can be used to set up another slave server with
              the same master. Causes the binary log position and filename
              of the master to be appended to the dumped data output.
              Setting the value to 1 (the default) will print it as a
              CHANGE MASTER command in the dumped data output; if set to 2,
              that command will be prefixed with a comment symbol. This
              option will turn --lock-all-tables on, unless --single-
              transaction is specified too (in which case a global read
              lock is only taken a short time at the beginning of the dump
              - don't forget to read about --single-transaction below). In
              all cases any action on logs will happen at the exact moment
              of the dump. Option automatically turns --lock-tables off.
              Using this option causes mysqldump to stop the slave SQL
              thread before beginning the dump, and restart it again after
              completion.

          •   --events, -E

              Include Event Scheduler events for the dumped databases in
              the output.

          •   --extended-insert, -e

              Use multiple-row INSERT syntax that include several VALUES
              lists. This results in a smaller dump file and speeds up
              inserts when the file is reloaded.

          •   --fields-terminated-by=..., --fields-enclosed-by=...,
              --fields-optionally-enclosed-by=..., --fields-escaped-by=...

              These options are used with the --tab option and have the
              same meaning as the corresponding FIELDS clauses for LOAD
              DATA INFILE.

          •   --first-slave

              Removed in MariaDB 5.5. Use --lock-all-tables instead.

          •   --flashback, -B

              Support flashback mode.

          •   --flush-logs, -F

              Flush the MariaDB server log files before starting the dump.
              This option requires the RELOAD privilege. If you use this
              option in combination with the --all-databases option, the
              logs are flushed for each database dumped. The exception is
              when using --lock-all-tables or --master-data: In this case,
              the logs are flushed only once, corresponding to the moment
              that all tables are locked. If you want your dump and the log
              flush to happen at exactly the same moment, you should use
              --flush-logs together with either --lock-all-tables or
              --master-data.

          •   --flush-privileges

              Send a FLUSH PRIVILEGES statement to the server after dumping
              the mysql database. This option should be used any time the
              dump contains the mysql database and any other database that
              depends on the data in the mysql database for proper
              restoration.

          •   --force, -f

              Continue even if an SQL error occurs during a table dump.

              One use for this option is to cause mysqldump to continue
              executing even when it encounters a view that has become
              invalid because the definition refers to a table that has
              been dropped. Without --force, mysqldump exits with an error
              message. With --force, mysqldump prints the error message,
              but it also writes an SQL comment containing the view
              definition to the dump output and continues executing.

          •   --gtid

              Available from MariaDB 10.0.13, and is used together with
              --master-data and --dump-slave to more conveniently set up a
              new GTID slave. It causes those options to output SQL
              statements that configure the slave to use the global
              transaction ID to connect to the master instead of old-style
              filename/offset positions. The old-style positions are still
              included in comments when --gtid is used; likewise the GTID
              position is included in comments even if --gtid is not used.

          •   --hex-blob

              Dump binary columns using hexadecimal notation (for example,
              ´abc´ becomes 0x616263). The affected data types are BINARY,
              VARBINARY, the BLOB types, and BIT.

          •   --host=host_name, -h host_name

              Dump data from the MariaDB server on the given host. The
              default host is localhost.

          •   --ignore-table=db_name.tbl_name

              Do not dump the given table, which must be specified using
              both the database and table names. To ignore multiple tables,
              use this option multiple times. This option also can be used
              to ignore views.

          •   --include-master-host-port

              Add the MASTER_HOST and MASTER_PORT options for the CHANGE
              MASTER TO statement when using the --dump-slave option for a
              slave dump.

          •   --insert-ignore

              Write INSERT IGNORE statements rather than INSERT statements.

          •   --lines-terminated-by=...

              This option is used with the --tab option and has the same
              meaning as the corresponding LINES clause for LOAD DATA
              INFILE.

          •   --lock-all-tables, -x

              Lock all tables across all databases. This is achieved by
              acquiring a global read lock for the duration of the whole
              dump. This option automatically turns off
              --single-transaction and --lock-tables.

          •   --lock-tables, -l

              For each dumped database, lock all tables to be dumped before
              dumping them. The tables are locked with READ LOCAL to allow
              concurrent inserts in the case of MyISAM tables. For
              transactional tables such as InnoDB, --single-transaction is
              a much better option than --lock-tables because it does not
              need to lock the tables at all.

              Because --lock-tables locks tables for each database
              separately, this option does not guarantee that the tables in
              the dump file are logically consistent between databases.
              Tables in different databases may be dumped in completely
              different states.

              Use --skip-lock-tables to disable.

          •   --log-error=file_name

              Log warnings and errors by appending them to the named file.
              The default is to do no logging.

          •   --log-queries

              When restoring the dump, the server will, if logging is
              turned on, log the queries to the general and slow query log.
              Defaults to on; use --skip-log-queries to disable.

          •   --master-data[=value]

              Use this option to dump a master replication server to
              produce a dump file that can be used to set up another server
              as a slave of the master. It causes the dump output to
              include a CHANGE MASTER TO statement that indicates the
              binary log coordinates (file name and position) of the dumped
              server. These are the master server coordinates from which
              the slave should start replicating after you load the dump
              file into the slave.

              If the option value is 2, the CHANGE MASTER TO statement is
              written as an SQL comment, and thus is informative only; it
              has no effect when the dump file is reloaded. If the option
              value is 1, the statement is not written as a comment and
              takes effect when the dump file is reloaded. If no option
              value is specified, the default value is 1.

              This option requires the RELOAD privilege and the binary log
              must be enabled.

              The --master-data option automatically turns off
              --lock-tables. It also turns on --lock-all-tables, unless
              --single-transaction also is specified. In all cases, any
              action on logs happens at the exact moment of the dump.

              It is also possible to set up a slave by dumping an existing
              slave of the master. To do this, use the following procedure
              on the existing slave:

               1. Stop the slave´s SQL thread and get its current status:

                      mysql> STOP SLAVE SQL_THREAD;
                      mysql> SHOW SLAVE STATUS;

               2. From the output of the SHOW SLAVE STATUS statement, the
                  binary log coordinates of the master server from which
                  the new slave should start replicating are the values of
                  the Relay_Master_Log_File and Exec_Master_Log_Pos fields.
                  Denote those values as file_name and file_pos.

               3. Dump the slave server:

                      shell> mysqldump --master-data=2 --all-databases > dumpfile

               4. Restart the slave:

                      mysql> START SLAVE;

               5. On the new slave, load the dump file:

                      shell> mysql < dumpfile

               6. On the new slave, set the replication coordinates to
                  those of the master server obtained earlier:

                      mysql> CHANGE MASTER TO
                          -> MASTER_LOG_FILE = ´file_name´, MASTER_LOG_POS = file_pos;

                  The CHANGE MASTER TO statement might also need other
                  parameters, such as MASTER_HOST to point the slave to the
                  correct master server host. Add any such parameters as
                  necessary.

          •   --max-allowed-packet=length

              Sets the maximum packet length to send to or receive from
              server.

          •   --net-buffer-length=length

              Sets the buffer size for TCP/IP and socket communication.

          •   --no-autocommit

              Enclose the INSERT statements for each dumped table within
              SET autocommit = 0 and COMMIT statements.

          •   --no-create-db, -n

              This option suppresses the CREATE DATABASE statements that
              are otherwise included in the output if the --databases or
              --all-databases option is given.

          •   --no-create-info, -t

              Do not write CREATE TABLE statements that re-create each
              dumped table.

          •   --no-data, -d

              Do not write any table row information (that is, do not dump
              table contents). This is useful if you want to dump only the
              CREATE TABLE statement for the table (for example, to create
              an empty copy of the table by loading the dump file).

          •   --no-defaults

              Do not read default options from any option file. This must
              be given as the first argument.

          •   --no-set-names, -N

              This has the same effect as --skip-set-charset.

          •   --opt

              This option is shorthand. It is the same as specifying
              --add-drop-table --add-locks --create-options --disable-keys
              --extended-insert --lock-tables --quick --set-charset. It
              should give you a fast dump operation and produce a dump file
              that can be reloaded into a MariaDB server quickly.

              The --opt option is enabled by default. Use --skip-opt to
              disable it.  See the discussion at the beginning of this
              section for information about selectively enabling or
              disabling a subset of the options affected by --opt.

          •   --order-by-primary

              Dump each table´s rows sorted by its primary key, or by its
              first unique index, if such an index exists. This is useful
              when dumping a MyISAM table to be loaded into an InnoDB
              table, but will make the dump operation take considerably
              longer.

          •   --password[=password], -p[password]

              The password to use when connecting to the server. If you use
              the short option form (-p), you cannot have a space between
              the option and the password. If you omit the password value
              following the --password or -p option on the command line,
              mysqldump prompts for one.

              Specifying a password on the command line should be
              considered insecure. You can use an option file to avoid
              giving the password on the command line.

          •   --pipe, -W

              On Windows, connect to the server via a named pipe. This
              option applies only if the server supports named-pipe
              connections.

          •   --plugin-dir

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

          •   --quick, -q

              This option is useful for dumping large tables. It forces
              mysqldump to retrieve rows for a table from the server a row
              at a time rather than retrieving the entire row set and
              buffering it in memory before writing it out.

          •   --print-defaults

              Print the program argument list and exit. This must be given
              as the first argument.

          •   --quote-names, -Q

              Quote identifiers (such as database, table, and column names)
              within “`” characters. If the ANSI_QUOTES SQL mode is
              enabled, identifiers are quoted within “"” characters. This
              option is enabled by default. It can be disabled with
              --skip-quote-names, but this option should be given after any
              option such as --compatible that may enable --quote-names.

          •   --replace

              Write REPLACE statements rather than INSERT statements.

          •   --result-file=file_name, -r file_name

              Direct output to a given file. This option should be used on
              Windows to prevent newline “\n” characters from being
              converted to “\r\n” carriage return/newline sequences. The
              result file is created and its previous contents overwritten,
              even if an error occurs while generating the dump.

          •   --routines, -R

              Included stored routines (procedures and functions) for the
              dumped databases in the output. Use of this option requires
              the SELECT privilege for the mysql.proc table. The output
              generated by using --routines contains CREATE PROCEDURE and
              CREATE FUNCTION statements to re-create the routines.
              However, these statements do not include attributes such as
              the routine creation and modification timestamps. This means
              that when the routines are reloaded, they will be created
              with the timestamps equal to the reload time.

              If you require routines to be re-created with their original
              timestamp attributes, do not use --routines. Instead, dump
              and reload the contents of the mysql.proc table directly,
              using a MariaDB account that has appropriate privileges for
              the mysql database.

          •   --set-charset

              Add SET NAMES default_character_set to the output. This
              option is enabled by default. To suppress the SET NAMES
              statement, use --skip-set-charset.

          •   --single-transaction

              This option sends a START TRANSACTION SQL statement to the
              server before dumping data. It is useful only with
              transactional tables such as InnoDB, because then it dumps
              the consistent state of the database at the time when BEGIN
              was issued without blocking any applications.

              When using this option, you should keep in mind that only
              InnoDB tables are dumped in a consistent state. For example,
              any MyISAM or MEMORY tables dumped while using this option
              may still change state.

              While a --single-transaction dump is in process, to ensure a
              valid dump file (correct table contents and binary log
              coordinates), no other connection should use the following
              statements: ALTER TABLE, CREATE TABLE, DROP TABLE, RENAME
              TABLE, TRUNCATE TABLE. A consistent read is not isolated from
              those statements, so use of them on a table to be dumped can
              cause the SELECT that is performed by mysqldump to retrieve
              the table contents to obtain incorrect contents or fail.

              The --single-transaction option and the --lock-tables option
              are mutually exclusive because LOCK TABLES causes any pending
              transactions to be committed implicitly.

              To dump large tables, you should combine the
              --single-transaction option with --quick.

          •   --skip-add-drop-table

              Disable the --add-drop-table option.

          •   --skip-add-locks

              Disable the --add-locks option.

          •   --skip-comments

              Disable the --comments option.

          •   --skip-compact

              Disable the --compact option.

          •   --skip-disable-keys

              Disable the --disable-keys option.

          •   --skip-extended-insert

              Disable the --extended-insert option.

          •   --skip-opt

              Disable the --opt option.

          •   --skip-quick

              Disable the --quick option.

          •   --skip-quote-names

              Disable the --quote-names option.

          •   --skip-set-charset

              Disable the --set-charset option.

          •   --skip-triggers

              Disable the --triggers option.

          •   --skip-tz-utc

              Disable the --tz-utc option.

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

          •   --system={all, users, plugins, udfs, servers, stats,
              timezones}

              Dump the system tables in the mysql database in a logical
              form. This option is an empty set by default.

              One or more options can be listed in comma separated list.

              The options here are:

              •   all - an alias to enabling all of the below options.
              •   users - the users, roles and their grants outputed as
                  CREATE USER, CREATE ROLE, GRANT, and SET DEFAULT ROLE
                  (ALTER USER for MySQL-8.0+).
              •   plugins - active plugins of the server outputed as
                  INSTALL PLUGIN.
              •   udfs - user define functions outputed as CREATE FUNCTION.
              •   servers - remote (federated) servers as CREATE SERVER.
              •   stats - statistics tables, InnoDB and Engine Independent
                  Table Statistics (EITS), are dumped as REPLACE INTO (or
                  INSERT IGNORE if --insert-into is specified) statements
                  without (re)creating tables.
              •   timezones - timezone related system tables dumped as
                  REPLACE INTO (or INSERT IGNORE if --insert-into is
                  specified) statements without (re)creating tables.

              The format of the output is affected by --replace and
              --insert-into. The --replace option will output CREATE OR
              REPLACE forms of SQL, and also DROP IF EXISTS prior to
              CREATE, if a CREATE OR REPLACE option isn't available.

              With --system=user (or all), and --replace, SQL is generated
              to generate an error if attempting to import the dump with a
              connection user that is being replaced within the dump.

              The --insert-into option will cause CREATE IF NOT EXIST forms
              of SQL to generated if available.

              For stats, and timezones, --replace and --insert-into have
              the usual effects.

              Enabling specific options here will cause the relevant tables
              in the mysql database to be ignored when dumping the mysql
              database or --all-databases.

              To help in migrating from MySQL to MariaDB, this option is
              designed to be able to dump system information from MySQL-5.7
              and 8.0 servers. SQL generated is also experimentally
              compatible with MySQL-5.7/8.0. Mappings of implementation
              specific grants/plugins isn't always one-to-one however
              between MariaDB and MySQL and will require manual changes.

          •   --tab=path, -T path

              Produce tab-separated text-format data files. For each dumped
              table, mysqldump creates a tbl_name.sql file that contains
              the CREATE TABLE statement that creates the table, and the
              server writes a tbl_name.txt file that contains its data. The
              option value is the directory in which to write the files.

                  Note
                  This option should be used only when mysqldump is run on
                  the same machine as the mysqld server. You must have the
                  FILE privilege, and the server must have permission to
                  write files in the directory that you specify.
              By default, the .txt data files are formatted using tab
              characters between column values and a newline at the end of
              each line. The format can be specified explicitly using the
              --fields-xxx and --lines-terminated-by options.

              Column values are converted to the character set specified by
              the --default-character-set option.

          •   --tables

              Override the --databases or -B option.  mysqldump regards all
              name arguments following the option as table names.

          •   --triggers

              Include triggers for each dumped table in the output. This
              option is enabled by default; disable it with
              --skip-triggers.

          •   --tz-utc

              This option enables TIMESTAMP columns to be dumped and
              reloaded between servers in different time zones.  mysqldump
              sets its connection time zone to UTC and adds SET
              TIME_ZONE=´+00:00´ to the dump file. Without this option,
              TIMESTAMP columns are dumped and reloaded in the time zones
              local to the source and destination servers, which can cause
              the values to change if the servers are in different time
              zones.  --tz-utc also protects against changes due to
              daylight saving time.  --tz-utc is enabled by default. To
              disable it, use --skip-tz-utc.

          •   --user=user_name, -u user_name

              The MariaDB user name to use when connecting to the server.

          •   --verbose, -v

              Verbose mode. Print more information about what the program
              does.

          •   --version, -V

              Display version information and exit.

          •   --where=´where_condition´, -w ´where_condition´

              Dump only rows selected by the given WHERE condition. Quotes
              around the condition are mandatory if it contains spaces or
              other characters that are special to your command
              interpreter.

              Examples:

                  --where="user=´jimf´"
                  -w"userid>1"
                  -w"userid<1"

          •   --xml, -X

              Write dump output as well-formed XML.

              NULL, ´NULL´, and Empty Values: For a column named
              column_name, the NULL value, an empty string, and the string
              value ´NULL´ are distinguished from one another in the output
              generated by this option as follows.

              ┌──────────────────────┬─────────────────────────────────────┐
              │Value:                │ XML Representation:                 │
              ├──────────────────────┼─────────────────────────────────────┤
              │NULL (unknown value)  │ <field name="column_name"           │
              │                      │ xsi:nil="true" />                   │
              ├──────────────────────┼─────────────────────────────────────┤
              │´´ (empty string)     │ <field name="column_name"></field>  │
              ├──────────────────────┼─────────────────────────────────────┤
              │´NULL´ (string value) │ <field                              │
              │                      │ name="column_name">NULL</field>     │
              └──────────────────────┴─────────────────────────────────────┘
              The output from the mysql client when run using the --xml
              option also follows the preceding rules. (See the section
              called “MYSQL OPTIONS”.)

              XML output from mysqldump includes the XML namespace, as
              shown here:

                  shell> mysqldump --xml -u root world City
                  <?xml version="1.0"?>
                  <mysqldump xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
                  <database name="world">
                  <table_structure name="City">
                  <field Field="ID" Type="int(11)" Null="NO" Key="PRI" Extra="auto_increment" />
                  <field Field="Name" Type="char(35)" Null="NO" Key="" Default="" Extra="" />
                  <field Field="CountryCode" Type="char(3)" Null="NO" Key="" Default="" Extra="" />
                  <field Field="District" Type="char(20)" Null="NO" Key="" Default="" Extra="" />
                  <field Field="Population" Type="int(11)" Null="NO" Key="" Default="0" Extra="" />
                  <key Table="City" Non_unique="0" Key_name="PRIMARY" Seq_in_index="1" Column_name="ID"
                  Collation="A" Cardinality="4079" Null="" Index_type="BTREE" Comment="" />
                  <options Name="City" Engine="MyISAM" Version="10" Row_format="Fixed" Rows="4079"
                  Avg_row_length="67" Data_length="273293" Max_data_length="18858823439613951"
                  Index_length="43008" Data_free="0" Auto_increment="4080"
                  Create_time="2007-03-31 01:47:01" Update_time="2007-03-31 01:47:02"
                  Collation="latin1_swedish_ci" Create_options="" Comment="" />
                  </table_structure>
                  <table_data name="City">
                  <row>
                  <field name="ID">1</field>
                  <field name="Name">Kabul</field>
                  <field name="CountryCode">AFG</field>
                  <field name="District">Kabol</field>
                  <field name="Population">1780000</field>
                  </row>
                  ...
                  <row>
                  <field name="ID">4079</field>
                  <field name="Name">Rafah</field>
                  <field name="CountryCode">PSE</field>
                  <field name="District">Rafah</field>
                  <field name="Population">92020</field>
                  </row>
                  </table_data>
                  </database>
                  </mysqldump>

          You can also set the following variables by using
          --var_name=value syntax:

          •   max_allowed_packet

              The maximum size of the buffer for client/server
              communication. The maximum is 1GB.

          •   net_buffer_length

              The initial size of the buffer for client/server
              communication. When creating multiple-row INSERT statements
              (as with the --extended-insert or --opt option), mysqldump
              creates rows up to net_buffer_length length. If you increase
              this variable, you should also ensure that the
              net_buffer_length variable in the MariaDB server is at least
              this large.

          A common use of mysqldump is for making a backup of an entire
          database:

              shell> mysqldump db_name > backup-file.sql

          You can load the dump file back into the server like this:

              shell> mysql db_name < backup-file.sql

          Or like this:

              shell> mysql -e "source /path-to-backup/backup-file.sql" db_name

          mysqldump is also very useful for populating databases by copying
          data from one MariaDB server to another:

              shell> mysqldump --opt db_name | mysql --host=remote_host -C db_name

          It is possible to dump several databases with one command:

              shell> mysqldump --databases db_name1 [db_name2 ...] > my_databases.sql

          To dump all databases, use the --all-databases option:

              shell> mysqldump --all-databases > all_databases.sql

          For InnoDB tables, mysqldump provides a way of making an online
          backup:

              shell> mysqldump --all-databases --single-transaction > all_databases.sql

          This backup acquires a global read lock on all tables (using
          FLUSH TABLES WITH READ LOCK) at the beginning of the dump. As
          soon as this lock has been acquired, the binary log coordinates
          are read and the lock is released. If long updating statements
          are running when the FLUSH statement is issued, the MariaDB
          server may get stalled until those statements finish. After that,
          the dump becomes lock free and does not disturb reads and writes
          on the tables. If the update statements that the MariaDB server
          receives are short (in terms of execution time), the initial lock
          period should not be noticeable, even with many updates.

          For point-in-time recovery (also known as “roll-forward,” when
          you need to restore an old backup and replay the changes that
          happened since that backup), it is often useful to rotate the
          binary log or at least know the binary log coordinates to which
          the dump corresponds:

              shell> mysqldump --all-databases --master-data=2 > all_databases.sql

          Or:

              shell> mysqldump --all-databases --flush-logs --master-data=2
                            > all_databases.sql

          The --master-data and --single-transaction options can be used
          simultaneously, which provides a convenient way to make an online
          backup suitable for use prior to point-in-time recovery if tables
          are stored using the InnoDB storage engine.

          If you encounter problems backing up views, please read the
          section that covers restrictions on views which describes a
          workaround for backing up views when this fails due to
          insufficient privileges.


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

   MariaDB 10.6                 24 October 2020                MYSQLDUMP(1)

--------------

Pages that refer to this page: `mysql(1) <../man1/mysql.1.html>`__

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
