.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mysqlbinlog(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `MYSQLBINLOG HEX DUMP FORMAT      |                                   |
| <#MYSQLBINLOG_HEX_DUMP_FORMAT>`__ |                                   |
| \|                                |                                   |
| `MYSQLBINLOG ROW EVENT DISPLAY <# |                                   |
| MYSQLBINLOG_ROW_EVENT_DISPLAY>`__ |                                   |
| \| `COPYRIGHT <#COPYRIGHT>`__ \|  |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MYSQLBINLOG(1)           MariaDB Database System          MYSQLBINLOG(1)

NAME
-------------------------------------------------

::

          mysqlbinlog - utility for processing binary log files


---------------------------------------------------------

::

          mysqlbinlog [options] log_file ...


---------------------------------------------------------------

::

          The server´s binary log consists of files containing “events”
          that describe modifications to database contents. The server
          writes these files in binary format. To display their contents in
          text format, use the mysqlbinlog utility. You can also use
          mysqlbinlog to display the contents of relay log files written by
          a slave server in a replication setup because relay logs have the
          same format as binary logs.

          Invoke mysqlbinlog like this:

              shell> mysqlbinlog [options] log_file ...

          For example, to display the contents of the binary log file named
          binlog.000003, use this command:

              shell> mysqlbinlog binlog.0000003

          The output includes events contained in binlog.000003. For
          statement-based logging, event information includes the SQL
          statement, the ID of the server on which it was executed, the
          timestamp when the statement was executed, how much time it took,
          and so forth. For row-based logging, the event indicates a row
          change rather than an SQL statement.

          Events are preceded by header comments that provide additional
          information. For example:

              # at 141
              #100309  9:28:36 server id 123  end_log_pos 245
                Query thread_id=3350  exec_time=11  error_code=0

          In the first line, the number following at indicates the starting
          position of the event in the binary log file.

          The second line starts with a date and time indicating when the
          statement started on the server where the event originated. For
          replication, this timestamp is propagated to slave servers.
          server id is the server_id value of the server where the event
          originated.  end_log_pos indicates where the next event starts
          (that is, it is the end position of the current event + 1).
          thread_id indicates which thread executed the event.  exec_time
          is the time spent executing the event, on a master server. On a
          slave, it is the difference of the end execution time on the
          slave minus the beginning execution time on the master. The
          difference serves as an indicator of how much replication lags
          behind the master.  error_code indicates the result from
          executing the event. Zero means that no error occurred.

          The output from mysqlbinlog can be re-executed (for example, by
          using it as input to mysql) to redo the statements in the log.
          This is useful for recovery operations after a server crash. For
          other usage examples, see the discussion later in this section.

          Normally, you use mysqlbinlog to read binary log files directly
          and apply them to the local MariaDB server. It is also possible
          to read binary logs from a remote server by using the
          --read-from-remote-server option. To read remote binary logs, the
          connection parameter options can be given to indicate how to
          connect to the server. These options are --host, --password,
          --port, --protocol, --socket, and --user; they are ignored except
          when you also use the --read-from-remote-server option.

          mysqlbinlog supports the following options, which can be
          specified on the command line or in the [mysqlbinlog] and
          [client] option file groups.

          •   --help, -?

              Display a help message and exit.

          •   --base64-output=value

              This option determines when events should be displayed
              encoded as base-64 strings using BINLOG statements. The
              option has these allowable values (not case sensitive):

              •   AUTO ("automatic") or UNSPEC ("unspecified") displays
                  BINLOG statements automatically when necessary (that is,
                  for format description events and row events). This is
                  the default if no --base64-output option is given.

                      Note
                      Automatic BINLOG display is the only safe behavior if
                      you intend to use the output of mysqlbinlog to
                      re-execute binary log file contents. The other option
                      values are intended only for debugging or testing
                      purposes because they may produce output that does
                      not include all events in executable form.

              •   NEVER causes BINLOG statements not to be displayed.
                  mysqlbinlog exits with an error if a row event is found
                  that must be displayed using BINLOG.

              •   DECODE-ROWS specifies to mysqlbinlog that you intend for
                  row events to be decoded and displayed as commented SQL
                  statements by also specifying the --verbose option. Like
                  NEVER, DECODE-ROWS suppresses display of BINLOG
                  statements, but unlike NEVER, it does not exit with an
                  error if a row event is found.
                  The --base64-output can be given as --base64-output or
                  --skip-base64-output (with the sense of AUTO or NEVER).

                  For examples that show the effect of --base64-output and
                  --verbose on row event output, see the section called
                  “MYSQLBINLOG ROW EVENT DISPLAY”.

          •   --binlog-row-event-max-size=path

              The directory where character sets are installed.

          •   --character-sets-dir=path

              The directory where character sets are installed.

          •   --database=db_name, -d db_name

              This option causes mysqlbinlog to output entries from the
              binary log (local log only) that occur while db_name has been
              selected as the default database by USE.

              The --database option for mysqlbinlog is similar to the
              --binlog-do-db option for mysqld, but can be used to specify
              only one database. If --database is given multiple times,
              only the last instance is used.

              The effects of this option depend on whether the
              statement-based or row-based logging format is in use, in the
              same way that the effects of --binlog-do-db depend on whether
              statement-based or row-based logging is in use.

              Statement-based logging. The --database option works as
              follows:

              •   While db_name is the default database, statements are
                  output whether they modify tables in db_name or a
                  different database.

              •   Unless db_name is selected as the default database,
                  statements are not output, even if they modify tables in
                  db_name.

              •   There is an exception for CREATE DATABASE, ALTER
                  DATABASE, and DROP DATABASE. The database being created,
                  altered, or dropped is considered to be the default
                  database when determining whether to output the
                  statement.
                  Suppose that the binary log was created by executing
                  these statements using statement-based-logging:

                      INSERT INTO test.t1 (i) VALUES(100);
                      INSERT INTO db2.t2 (j)  VALUES(200);
                      USE test;
                      INSERT INTO test.t1 (i) VALUES(101);
                      INSERT INTO t1 (i)      VALUES(102);
                      INSERT INTO db2.t2 (j)  VALUES(201);
                      USE db2;
                      INSERT INTO test.t1 (i) VALUES(103);
                      INSERT INTO db2.t2 (j)  VALUES(202);
                      INSERT INTO t2 (j)      VALUES(203);

                  mysqlbinlog --database=test does not output the first two
                  INSERT statements because there is no default database.
                  It outputs the three INSERT statements following USE
                  test, but not the three INSERT statements following USE
                  db2.

                  mysqlbinlog --database=db2 does not output the first two
                  INSERT statements because there is no default database.
                  It does not output the three INSERT statements following
                  USE test, but does output the three INSERT statements
                  following USE db2.

                  Row-based logging.  mysqlbinlog outputs only entries that
                  change tables belonging to db_name. The default database
                  has no effect on this. Suppose that the binary log just
                  described was created using row-based logging rather than
                  statement-based logging.  mysqlbinlog --database=test
                  outputs only those entries that modify t1 in the test
                  database, regardless of whether USE was issued or what
                  the default database is.  If a server is running with
                  binlog_format set to MIXED and you want it to be possible
                  to use mysqlbinlog with the --database option, you must
                  ensure that tables that are modified are in the database
                  selected by USE. (In particular, no cross-database
                  updates should be used.)

                      Note
                      This option did not work correctly for mysqlbinlog
                      with row-based logging prior to MySQL 5.1.37.

          •   --debug[=debug_options], -# [debug_options]

              Write a debugging log. A typical debug_options string is
              ´d:t:o,file_name´. The default is
              ´d:t:o,/tmp/mysqlbinlog.trace´.

          •   --debug-check

              Print some debugging information when the program exits.

          •   --debug-info

              Print debugging information and memory and CPU usage
              statistics when the program exits.

          •   --defaults-extra-file=name

              Read this file after the global files are read.

          •   --defaults-file=name

              Only read default options from the given file.

          •   --default-auth=name

              Default authentication client-side plugin to use.

          •   --disable-log-bin, -D

              Disable binary logging. This is useful for avoiding an
              endless loop if you use the --to-last-log option and are
              sending the output to the same MariaDB server. This option
              also is useful when restoring after a crash to avoid
              duplication of the statements you have logged.

              This option requires that you have the SUPER privilege. It
              causes mysqlbinlog to include a SET sql_log_bin = 0 statement
              in its output to disable binary logging of the remaining
              output. The SET statement is ineffective unless you have the
              SUPER privilege.

          •   --force-if-open

              Force if binlog was not closed properly. Defaults to on; use
              --skip-force-if-open to disable.

          •   --force-read, -f

              With this option, if mysqlbinlog reads a binary log event
              that it does not recognize, it prints a warning, ignores the
              event, and continues. Without this option, mysqlbinlog stops
              if it reads such an event.

          •   --hexdump, -H

              Display a hex dump of the log in comments, as described in
              the section called “MYSQLBINLOG HEX DUMP FORMAT”. The hex
              output can be helpful for replication debugging.

          •   --host=host_name, -h host_name

              Get the binary log from the MariaDB server on the given host.

          •   --local-load=path, -l path

              Prepare local temporary files for LOAD DATA INFILE in the
              specified directory.

          •   --no-defaults

              Don't read default options from any option file.

          •   --offset=N, -o N

              Skip the first N entries in the log.

          •   --open-files-limit=NUM

              Sets the open_files_limit variable, which is used to reserve
              file descriptors for mysqlbinlog.

          •   --password[=password], -p[password]

              The password to use when connecting to the server. If you use
              the short option form (-p), you cannot have a space between
              the option and the password. If you omit the password value
              following the --password or -p option on the command line,
              mysqlbinlog prompts for one.

              Specifying a password on the command line should be
              considered insecure. You can use an option file to avoid
              giving the password on the command line.

          •   --plugin-dir=dir_name

              Directory for client-side plugins.

          •   --print-defaults

              Print the program argument list from all option files and
              exit.

          •   --port=port_num, -P port_num

              The TCP/IP port number to use for connecting to a remote
              server, or 0 for default to, in order of preference, my.cnf,
              $MYSQL_TCP_PORT, /etc/services, built-in default (3306).
              Forces --protocol=tcp when specified on the command line
              without other connection properties.

          •   --protocol={TCP|SOCKET|PIPE|MEMORY}

              The connection protocol to use for connecting to the server.
              It is useful when the other connection parameters normally
              would cause a protocol to be used other than the one you
              want.

          •   --raw

              Requires -R. Output raw binlog data instead of SQL
              statements. Output files named after server logs.

          •   --read-from-remote-server, -R

              Read the binary log from a MariaDB server rather than reading
              a local log file. Any connection parameter options are
              ignored unless this option is given as well. These options
              are --host, --password, --port, --protocol, --socket, and
              --user.

              This option requires that the remote server be running. It
              works only for binary log files on the remote server, not
              relay log files.

          •   --result-file=name, -r name

              Direct output to the given file. With --raw this is a prefix
              for the file names.

          •   --rewrite-db=name, -r name

              Updates to a database with a different name than the
              original.  Example: rewrite-db='from->to'. For events that
              are binlogged as statements, rewriting the database
              constitutes changing a statement's default database from db1
              to db2. There is no statement analysis or rewrite of any
              kind, that is, if one specifies "db1.tbl" in the statement
              explicitly, that occurrence won't be changed to "db2.tbl".
              Row-based events are rewritten correctly to use the new
              database name. Filtering (e.g. with --database=name) happens
              after the database rewrites have been performed. If you use
              this option on the command line and ">" has a special meaning
              to your command interpreter, quote the value (e.g. --rewrite-
              db="oldname->newname".

          •   --server-id=id

              Display only those events created by the server having the
              given server ID.

          •   --set-charset=charset_name

              Add a SET NAMES charset_name statement to the output to
              specify the character set to be used for processing log
              files.

          •   --short-form, -s

              Display only the statements contained in the log, no extra
              info and no row-based events. This is for testing only, and
              should not be used in production systems. If you want to
              suppress base64-output, consider using --base64-output=never
              instead.

          •   --socket=path, -S path

              For connections to localhost, the Unix socket file to use,
              or, on Windows, the name of the named pipe to use.  Forces
              --protocol=socket when specified on the command line without
              other connection properties; on Windows, forces
              --protocol=pipe.

          •   --start-datetime=datetime

              Start reading the binary log at the first event having a
              timestamp equal to or later than the datetime argument. The
              datetime value is relative to the local time zone on the
              machine where you run mysqlbinlog. The value should be in a
              format accepted for the DATETIME or TIMESTAMP data types. For
              example:

                  shell> mysqlbinlog --start-datetime="2014-12-25 11:25:56" binlog.000003

              This option is useful for point-in-time recovery.

          •   --start-position=N, -j N

              Start reading the binary log at the first event having a
              position equal to or greater than N. This option applies to
              the first log file named on the command line.

              This option is useful for point-in-time recovery.

          •   --stop-datetime=datetime

              Stop reading the binary log at the first event having a
              timestamp equal to or later than the datetime argument. This
              option is useful for point-in-time recovery. See the
              description of the --start-datetime option for information
              about the datetime value.

              This option is useful for point-in-time recovery.

          •   --stop-never

              Wait for more data from the server instead of stopping at the
              end of the last log. Implies --to-last-log.

          •   --stop-never-slave-server-id

              The slave server_id used for --read-from-remote-server
              --stop-never.

          •   --stop-position=N

              Stop reading the binary log at the first event having a
              position equal to or greater than N. This option applies to
              the last log file named on the command line.

              This option is useful for point-in-time recovery.

          •   --table, -T

              List entries for just this table (local log only).

          •    --to-last-log, -t

              Do not stop at the end of the requested binary log from a
              MariaDB server, but rather continue printing until the end of
              the last binary log. If you send the output to the same
              MariaDB server, this may lead to an endless loop, so this
              option requires --read-from-remote-server.

          •   --user=user_name, -u user_name

              The MariaDB username to use when connecting to a remote
              server.

          •   --verbose, -v

              Reconstruct row events and display them as commented SQL
              statements. If this option is given twice, the output
              includes comments to indicate column data types and some
              metadata.

              For examples that show the effect of --base64-output and
              --verbose on row event output, see the section called
              “MYSQLBINLOG ROW EVENT DISPLAY”.

          •   --version, -V

              Display version information and exit.

          You can also set the following variable by using --var_name=value
          syntax:

          •   open_files_limit

              Specify the number of open file descriptors to reserve.

          You can pipe the output of mysqlbinlog into the mysql client to
          execute the events contained in the binary log. This technique is
          used to recover from a crash when you have an old backup. For
          example:

              shell> mysqlbinlog binlog.000001 | mysql -u root -p

          Or:

              shell> mysqlbinlog binlog.[0-9]* | mysql -u root -p

          You can also redirect the output of mysqlbinlog to a text file
          instead, if you need to modify the statement log first (for
          example, to remove statements that you do not want to execute for
          some reason). After editing the file, execute the statements that
          it contains by using it as input to the mysql program:

              shell> mysqlbinlog binlog.000001 > tmpfile
              shell> ... edit tmpfile ...
              shell> mysql -u root -p < tmpfile

          When mysqlbinlog is invoked with the --start-position option, it
          displays only those events with an offset in the binary log
          greater than or equal to a given position (the given position
          must match the start of one event). It also has options to stop
          and start when it sees an event with a given date and time. This
          enables you to perform point-in-time recovery using the
          --stop-datetime option (to be able to say, for example, “roll
          forward my databases to how they were today at 10:30 a.m.”).

          If you have more than one binary log to execute on the MariaDB
          server, the safe method is to process them all using a single
          connection to the server. Here is an example that demonstrates
          what may be unsafe:

              shell> mysqlbinlog binlog.000001 | mysql -u root -p # DANGER!!
              shell> mysqlbinlog binlog.000002 | mysql -u root -p # DANGER!!

          Processing binary logs this way using different connections to
          the server causes problems if the first log file contains a
          CREATE TEMPORARY TABLE statement and the second log contains a
          statement that uses the temporary table. When the first mysql
          process terminates, the server drops the temporary table. When
          the second mysql process attempts to use the table, the server
          reports “unknown table.”

          To avoid problems like this, use a single mysql process to
          execute the contents of all binary logs that you want to process.
          Here is one way to do so:

              shell> mysqlbinlog binlog.000001 binlog.000002 | mysql -u root -p

          Another approach is to write all the logs to a single file and
          then process the file:

              shell> mysqlbinlog binlog.000001 >  /tmp/statements.sql
              shell> mysqlbinlog binlog.000002 >> /tmp/statements.sql
              shell> mysql -u root -p -e "source /tmp/statements.sql"

          mysqlbinlog can produce output that reproduces a LOAD DATA INFILE
          operation without the original data file.  mysqlbinlog copies the
          data to a temporary file and writes a LOAD DATA LOCAL INFILE
          statement that refers to the file. The default location of the
          directory where these files are written is system-specific. To
          specify a directory explicitly, use the --local-load option.

          Because mysqlbinlog converts LOAD DATA INFILE statements to LOAD
          DATA LOCAL INFILE statements (that is, it adds LOCAL), both the
          client and the server that you use to process the statements must
          be configured with the LOCAL capability enabled.

              Warning
              The temporary files created for LOAD DATA LOCAL statements
              are not automatically deleted because they are needed until
              you actually execute those statements. You should delete the
              temporary files yourself after you no longer need the
              statement log. The files can be found in the temporary file
              directory and have names like original_file_name-#-#.


-----------------------------------------------------------------------------------------------

::

          The --hexdump option causes mysqlbinlog to produce a hex dump of
          the binary log contents:

              shell> mysqlbinlog --hexdump master-bin.000001

          The hex output consists of comment lines beginning with #, so the
          output might look like this for the preceding command:

              /*!40019 SET @@session.max_insert_delayed_threads=0*/;
              /*!50003 SET @OLD_COMPLETION_TYPE=@@COMPLETION_TYPE,COMPLETION_TYPE=0*/;
              # at 4
              #051024 17:24:13 server id 1  end_log_pos 98
              # Position  Timestamp   Type   Master ID        Size      Master Pos    Flags
              # 00000004 9d fc 5c 43   0f   01 00 00 00   5e 00 00 00   62 00 00 00   00 00
              # 00000017 04 00 35 2e 30 2e 31 35  2d 64 65 62 75 67 2d 6c |..5.0.15.debug.l|
              # 00000027 6f 67 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |og..............|
              # 00000037 00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00 |................|
              # 00000047 00 00 00 00 9d fc 5c 43  13 38 0d 00 08 00 12 00 |.......C.8......|
              # 00000057 04 04 04 04 12 00 00 4b  00 04 1a                |.......K...|
              #       Start: binlog v 4, server v 5.0.15-debug-log created 051024 17:24:13
              #       at startup
              ROLLBACK;

          Hex dump output currently contains the elements in the following
          list. This format is subject to change. (For more information
          about binary log format, see
          http://forge.mysql.com/wiki/MySQL_Internals_Binary_Log .)

          •   Position: The byte position within the log file.

          •   Timestamp: The event timestamp. In the example shown, ´9d fc
              5c 43´ is the representation of ´051024 17:24:13´ in
              hexadecimal.

          •   Type: The event type code. In the example shown, ´0f´
              indicates a FORMAT_DESCRIPTION_EVENT. The following table
              lists the possible type codes.

              ┌─────┬──────────────────────────┬───────────────────────────┐
              │Type │ Name                     │ Meaning                   │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │00   │ UNKNOWN_EVENT            │ This event should never   │
              │     │                          │ be present in the log.    │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │01   │ START_EVENT_V3           │ This indicates the start  │
              │     │                          │ of a log file written by  │
              │     │                          │ MySQL 4 or earlier.       │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │02   │ QUERY_EVENT              │ The most common type of   │
              │     │                          │ events. These contain     │
              │     │                          │ statements executed on    │
              │     │                          │ the master.               │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │03   │ STOP_EVENT               │ Indicates that master has │
              │     │                          │ stopped.                  │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │04   │ ROTATE_EVENT             │ Written when the master   │
              │     │                          │ switches to a new log     │
              │     │                          │ file.                     │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │05   │ INTVAR_EVENT             │ Used for AUTO_INCREMENT   │
              │     │                          │ values or when the        │
              │     │                          │ LAST_INSERT_ID() function │
              │     │                          │ is used in the statement. │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │06   │ LOAD_EVENT               │ Used for LOAD DATA INFILE │
              │     │                          │ in MySQL 3.23.            │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │07   │ SLAVE_EVENT              │ Reserved for future use.  │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │08   │ CREATE_FILE_EVENT        │ Used for LOAD DATA INFILE │
              │     │                          │ statements. This          │
              │     │                          │ indicates the start of    │
              │     │                          │ execution of such a       │
              │     │                          │ statement. A temporary    │
              │     │                          │ file is created on the    │
              │     │                          │ slave. Used in MySQL 4    │
              │     │                          │ only.                     │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │09   │ APPEND_BLOCK_EVENT       │ Contains data for use in  │
              │     │                          │ a LOAD DATA INFILE        │
              │     │                          │ statement. The data is    │
              │     │                          │ stored in the temporary   │
              │     │                          │ file on the slave.        │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │0a   │ EXEC_LOAD_EVENT          │ Used for LOAD DATA INFILE │
              │     │                          │ statements. The contents  │
              │     │                          │ of the temporary file is  │
              │     │                          │ stored in the table on    │
              │     │                          │ the slave.  Used in MySQL │
              │     │                          │ 4 only.                   │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │0b   │ DELETE_FILE_EVENT        │ Rollback of a LOAD DATA   │
              │     │                          │ INFILE statement. The     │
              │     │                          │ temporary file should be  │
              │     │                          │ deleted on the slave.     │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │0c   │ NEW_LOAD_EVENT           │ Used for LOAD DATA INFILE │
              │     │                          │ in MySQL 4 and earlier.   │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │0d   │ RAND_EVENT               │ Used to send information  │
              │     │                          │ about random values if    │
              │     │                          │ the RAND() function is    │
              │     │                          │ used in the statement.    │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │0e   │ USER_VAR_EVENT           │ Used to replicate user    │
              │     │                          │ variables.                │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │0f   │ FORMAT_DESCRIPTION_EVENT │ This indicates the start  │
              │     │                          │ of a log file written by  │
              │     │                          │ MySQL 5 or later.         │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │10   │ XID_EVENT                │ Event indicating commit   │
              │     │                          │ of an XA transaction.     │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │11   │ BEGIN_LOAD_QUERY_EVENT   │ Used for LOAD DATA INFILE │
              │     │                          │ statements in MySQL 5 and │
              │     │                          │ later.                    │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │12   │ EXECUTE_LOAD_QUERY_EVENT │ Used for LOAD DATA INFILE │
              │     │                          │ statements in MySQL 5 and │
              │     │                          │ later.                    │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │13   │ TABLE_MAP_EVENT          │ Information about a table │
              │     │                          │ definition. Used in MySQL │
              │     │                          │ 5.1.5 and later.          │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │14   │ PRE_GA_WRITE_ROWS_EVENT  │ Row data for a single     │
              │     │                          │ table that should be      │
              │     │                          │ created. Used in MySQL    │
              │     │                          │ 5.1.5 to 5.1.17.          │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │15   │ PRE_GA_UPDATE_ROWS_EVENT │ Row data for a single     │
              │     │                          │ table that needs to be    │
              │     │                          │ updated. Used in MySQL    │
              │     │                          │ 5.1.5 to 5.1.17.          │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │16   │ PRE_GA_DELETE_ROWS_EVENT │ Row data for a single     │
              │     │                          │ table that should be      │
              │     │                          │ deleted. Used in MySQL    │
              │     │                          │ 5.1.5 to 5.1.17.          │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │17   │ WRITE_ROWS_EVENT         │ Row data for a single     │
              │     │                          │ table that should be      │
              │     │                          │ created. Used in MySQL    │
              │     │                          │ 5.1.18 and later.         │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │18   │ UPDATE_ROWS_EVENT        │ Row data for a single     │
              │     │                          │ table that needs to be    │
              │     │                          │ updated. Used in MySQL    │
              │     │                          │ 5.1.18 and later.         │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │19   │ DELETE_ROWS_EVENT        │ Row data for a single     │
              │     │                          │ table that should be      │
              │     │                          │ deleted. Used in MySQL    │
              │     │                          │ 5.1.18 and later.         │
              ├─────┼──────────────────────────┼───────────────────────────┤
              │1a   │ INCIDENT_EVENT           │ Something out of the      │
              │     │                          │ ordinary happened. Added  │
              │     │                          │ in MySQL 5.1.18.          │
              └─────┴──────────────────────────┴───────────────────────────┘

          •   Master ID: The server ID of the master that created the
              event.

          •   Size: The size in bytes of the event.

          •   Master Pos: The position of the next event in the original
              master log file.

          •   Flags: 16 flags. Currently, the following flags are used. The
              others are reserved for future use.

              ┌─────┬─────────────────────────────┬────────────────────────────┐
              │Flag │ Name                        │ Meaning                    │
              ├─────┼─────────────────────────────┼────────────────────────────┤
              │01   │ LOG_EVENT_BINLOG_IN_USE_F   │ Log file correctly         │
              │     │                             │ closed. (Used only in      │
              │     │                             │ FORMAT_DESCRIPTION_EVENT.) │
              │     │                             │ If this flag is set        │
              │     │                             │ (if the flags are, for     │
              │     │                             │ example, ´01 00´) in a     │
              │     │                             │ FORMAT_DESCRIPTION_EVENT,  │
              │     │                             │ the log file has not       │
              │     │                             │ been properly closed.      │
              │     │                             │ Most probably this is      │
              │     │                             │ because of a master        │
              │     │                             │ crash (for example,        │
              │     │                             │ due to power failure).     │
              ├─────┼─────────────────────────────┼────────────────────────────┤
              │02   │                             │ Reserved for future use.   │
              ├─────┼─────────────────────────────┼────────────────────────────┤
              │04   │ LOG_EVENT_THREAD_SPECIFIC_F │ Set if the event is        │
              │     │                             │ dependent on the           │
              │     │                             │ connection it was executed │
              │     │                             │ in (for example, ´04 00´), │
              │     │                             │ for example, if the event  │
              │     │                             │ uses temporary tables.     │
              ├─────┼─────────────────────────────┼────────────────────────────┤
              │08   │ LOG_EVENT_SUPPRESS_USE_F    │ Set in some circumstances  │
              │     │                             │ when the event is not      │
              │     │                             │ dependent on the default   │
              │     │                             │ database.                  │
              └─────┴─────────────────────────────┴────────────────────────────┘


---------------------------------------------------------------------------------------------------

::

          The following examples illustrate how mysqlbinlog displays row
          events that specify data modifications. These correspond to
          events with the WRITE_ROWS_EVENT, UPDATE_ROWS_EVENT, and
          DELETE_ROWS_EVENT type codes. The --base64-output=DECODE-ROWS and
          --verbose options may be used to affect row event output.

          Suppose that the server is using row-based binary logging and
          that you execute the following sequence of statements:

              CREATE TABLE t
              (
                id   INT NOT NULL,
                name VARCHAR(20) NOT NULL,
                date DATE NULL
              ) ENGINE = InnoDB;
              START TRANSACTION;
              INSERT INTO t VALUES(1, ´apple´, NULL);
              UPDATE t SET name = ´pear´, date = ´2009-01-01´ WHERE id = 1;
              DELETE FROM t WHERE id = 1;
              COMMIT;

          By default, mysqlbinlog displays row events encoded as base-64
          strings using BINLOG statements. Omitting extraneous lines, the
          output for the row events produced by the preceding statement
          sequence looks like this:

              shell> mysqlbinlog log_file
              ...
              # at 218
              #080828 15:03:08 server id 1  end_log_pos 258     Write_rows: table id 17 flags: STMT_END_F
              BINLOG ´
              fAS3SBMBAAAALAAAANoAAAAAABEAAAAAAAAABHRlc3QAAXQAAwMPCgIUAAQ=
              fAS3SBcBAAAAKAAAAAIBAAAQABEAAAAAAAEAA//8AQAAAAVhcHBsZQ==
              ´/*!*/;
              ...
              # at 302
              #080828 15:03:08 server id 1  end_log_pos 356     Update_rows: table id 17 flags: STMT_END_F
              BINLOG ´
              fAS3SBMBAAAALAAAAC4BAAAAABEAAAAAAAAABHRlc3QAAXQAAwMPCgIUAAQ=
              fAS3SBgBAAAANgAAAGQBAAAQABEAAAAAAAEAA////AEAAAAFYXBwbGX4AQAAAARwZWFyIbIP
              ´/*!*/;
              ...
              # at 400
              #080828 15:03:08 server id 1  end_log_pos 442     Delete_rows: table id 17 flags: STMT_END_F
              BINLOG ´
              fAS3SBMBAAAALAAAAJABAAAAABEAAAAAAAAABHRlc3QAAXQAAwMPCgIUAAQ=
              fAS3SBkBAAAAKgAAALoBAAAQABEAAAAAAAEAA//4AQAAAARwZWFyIbIP
              ´/*!*/;

          To see the row events as comments in the form of “pseudo-SQL”
          statements, run mysqlbinlog with the --verbose or -v option. The
          output will contain lines beginning with ###:

              shell> mysqlbinlog -v log_file
              ...
              # at 218
              #080828 15:03:08 server id 1  end_log_pos 258     Write_rows: table id 17 flags: STMT_END_F
              BINLOG ´
              fAS3SBMBAAAALAAAANoAAAAAABEAAAAAAAAABHRlc3QAAXQAAwMPCgIUAAQ=
              fAS3SBcBAAAAKAAAAAIBAAAQABEAAAAAAAEAA//8AQAAAAVhcHBsZQ==
              ´/*!*/;
              ### INSERT INTO test.t
              ### SET
              ###   @1=1
              ###   @2=´apple´
              ###   @3=NULL
              ...
              # at 302
              #080828 15:03:08 server id 1  end_log_pos 356     Update_rows: table id 17 flags: STMT_END_F
              BINLOG ´
              fAS3SBMBAAAALAAAAC4BAAAAABEAAAAAAAAABHRlc3QAAXQAAwMPCgIUAAQ=
              fAS3SBgBAAAANgAAAGQBAAAQABEAAAAAAAEAA////AEAAAAFYXBwbGX4AQAAAARwZWFyIbIP
              ´/*!*/;
              ### UPDATE test.t
              ### WHERE
              ###   @1=1
              ###   @2=´apple´
              ###   @3=NULL
              ### SET
              ###   @1=1
              ###   @2=´pear´
              ###   @3=´2009:01:01´
              ...
              # at 400
              #080828 15:03:08 server id 1  end_log_pos 442     Delete_rows: table id 17 flags: STMT_END_F
              BINLOG ´
              fAS3SBMBAAAALAAAAJABAAAAABEAAAAAAAAABHRlc3QAAXQAAwMPCgIUAAQ=
              fAS3SBkBAAAAKgAAALoBAAAQABEAAAAAAAEAA//4AQAAAARwZWFyIbIP
              ´/*!*/;
              ### DELETE FROM test.t
              ### WHERE
              ###   @1=1
              ###   @2=´pear´
              ###   @3=´2009:01:01´

          Specify --verbose or -v twice to also display data types and some
          metadata for each column. The output will contain an additional
          comment following each column change:

              shell> mysqlbinlog -vv log_file
              ...
              # at 218
              #080828 15:03:08 server id 1  end_log_pos 258     Write_rows: table id 17 flags: STMT_END_F
              BINLOG ´
              fAS3SBMBAAAALAAAANoAAAAAABEAAAAAAAAABHRlc3QAAXQAAwMPCgIUAAQ=
              fAS3SBcBAAAAKAAAAAIBAAAQABEAAAAAAAEAA//8AQAAAAVhcHBsZQ==
              ´/*!*/;
              ### INSERT INTO test.t
              ### SET
              ###   @1=1 /* INT meta=0 nullable=0 is_null=0 */
              ###   @2=´apple´ /* VARSTRING(20) meta=20 nullable=0 is_null=0 */
              ###   @3=NULL /* VARSTRING(20) meta=0 nullable=1 is_null=1 */
              ...
              # at 302
              #080828 15:03:08 server id 1  end_log_pos 356     Update_rows: table id 17 flags: STMT_END_F
              BINLOG ´
              fAS3SBMBAAAALAAAAC4BAAAAABEAAAAAAAAABHRlc3QAAXQAAwMPCgIUAAQ=
              fAS3SBgBAAAANgAAAGQBAAAQABEAAAAAAAEAA////AEAAAAFYXBwbGX4AQAAAARwZWFyIbIP
              ´/*!*/;
              ### UPDATE test.t
              ### WHERE
              ###   @1=1 /* INT meta=0 nullable=0 is_null=0 */
              ###   @2=´apple´ /* VARSTRING(20) meta=20 nullable=0 is_null=0 */
              ###   @3=NULL /* VARSTRING(20) meta=0 nullable=1 is_null=1 */
              ### SET
              ###   @1=1 /* INT meta=0 nullable=0 is_null=0 */
              ###   @2=´pear´ /* VARSTRING(20) meta=20 nullable=0 is_null=0 */
              ###   @3=´2009:01:01´ /* DATE meta=0 nullable=1 is_null=0 */
              ...
              # at 400
              #080828 15:03:08 server id 1  end_log_pos 442     Delete_rows: table id 17 flags: STMT_END_F
              BINLOG ´
              fAS3SBMBAAAALAAAAJABAAAAABEAAAAAAAAABHRlc3QAAXQAAwMPCgIUAAQ=
              fAS3SBkBAAAAKgAAALoBAAAQABEAAAAAAAEAA//4AQAAAARwZWFyIbIP
              ´/*!*/;
              ### DELETE FROM test.t
              ### WHERE
              ###   @1=1 /* INT meta=0 nullable=0 is_null=0 */
              ###   @2=´pear´ /* VARSTRING(20) meta=20 nullable=0 is_null=0 */
              ###   @3=´2009:01:01´ /* DATE meta=0 nullable=1 is_null=0 */

          You can tell mysqlbinlog to suppress the BINLOG statements for
          row events by using the --base64-output=DECODE-ROWS option. This
          is similar to --base64-output=NEVER but does not exit with an
          error if a row event is found. The combination of
          --base64-output=DECODE-ROWS and --verbose provides a convenient
          way to see row events only as SQL statements:

              shell> mysqlbinlog -v --base64-output=DECODE-ROWS log_file
              ...
              # at 218
              #080828 15:03:08 server id 1  end_log_pos 258     Write_rows: table id 17 flags: STMT_END_F
              ### INSERT INTO test.t
              ### SET
              ###   @1=1
              ###   @2=´apple´
              ###   @3=NULL
              ...
              # at 302
              #080828 15:03:08 server id 1  end_log_pos 356     Update_rows: table id 17 flags: STMT_END_F
              ### UPDATE test.t
              ### WHERE
              ###   @1=1
              ###   @2=´apple´
              ###   @3=NULL
              ### SET
              ###   @1=1
              ###   @2=´pear´
              ###   @3=´2009:01:01´
              ...
              # at 400
              #080828 15:03:08 server id 1  end_log_pos 442     Delete_rows: table id 17 flags: STMT_END_F
              ### DELETE FROM test.t
              ### WHERE
              ###   @1=1
              ###   @2=´pear´
              ###   @3=´2009:01:01´

              Note
              You should not suppress BINLOG statements if you intend to
              re-execute mysqlbinlog output.

          The SQL statements produced by --verbose for row events are much
          more readable than the corresponding BINLOG statements. However,
          they do not correspond exactly to the original SQL statements
          that generated the events. The following limitations apply:

          •   The original column names are lost and replaced by @N, where
              N is a column number.

          •   Character set information is not available in the binary log,
              which affects string column display:

              •   There is no distinction made between corresponding binary
                  and nonbinary string types (BINARY and CHAR, VARBINARY
                  and VARCHAR, BLOB and TEXT). The output uses a data type
                  of STRING for fixed-length strings and VARSTRING for
                  variable-length strings.

              •   For multi-byte character sets, the maximum number of
                  bytes per character is not present in the binary log, so
                  the length for string types is displayed in bytes rather
                  than in characters. For example, STRING(4) will be used
                  as the data type for values from either of these column
                  types:

                      CHAR(4) CHARACTER SET latin1
                      CHAR(2) CHARACTER SET ucs2

              •   Due to the storage format for events of type
                  UPDATE_ROWS_EVENT, UPDATE statements are displayed with
                  the WHERE clause preceding the SET clause.

          Proper interpretation of row events requires the information from
          the format description event at the beginning of the binary log.
          Because mysqlbinlog does not know in advance whether the rest of
          the log contains row events, by default it displays the format
          description event using a BINLOG statement in the initial part of
          the output.

          If the binary log is known not to contain any events requiring a
          BINLOG statement (that is, no row events), the
          --base64-output=NEVER option can be used to prevent this header
          from being written.


-----------------------------------------------------------

::

          Copyright 2007-2008 MySQL AB, 2008-2010 Sun Microsystems, Inc.,
          2010-2021 MariaDB Foundation

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


---------------------------------------------------

::

           1. Bug#42941
              http://bugs.mysql.com/bug.php?id=42941


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

   MariaDB 10.6                  14 April 2021               MYSQLBINLOG(1)

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
