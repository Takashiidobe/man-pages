.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mysql-test-run.pl(1) — Linux manual page
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

   MYSQL-TEST-RUN()                                        MYSQL-TEST-RUN()

NAME
-------------------------------------------------

::

          mysql-test-run.pl - run MariaDB test suite


---------------------------------------------------------

::

          mysql-test-run.pl [options]


---------------------------------------------------------------

::

          The mysql-test-run.pl Perl script is the main application used to
          run the MariaDB test suite. It invokes mysqltest to run
          individual test cases.

          Invoke mysql-test-run.pl in the mysql-test directory like this:

              shell> mysql-test-run.pl [options] [test_name] ...

          Each test_name argument names a test case. The test case file
          that corresponds to the test name is t/test_name.test.

          For each test_name argument, mysql-test-run.pl runs the named
          test case. With no test_name arguments, mysql-test-run.pl runs
          all .test files in the t subdirectory.

          If no suffix is given for the test name, a suffix of .test is
          assumed. Any leading path name is ignored. These commands are
          equivalent:

              shell> mysql-test-run.pl mytest
              shell> mysql-test-run.pl mytest.test
              shell> mysql-test-run.pl t/mytest.test

          A suite name can be given as part of the test name. That is, the
          syntax for naming a test is:

              [suite_name.]test_name[.suffix]

          If a suite name is given, mysql-test-run.pl looks in that suite
          for the test. The test file corresponding to a test named
          suite_name.test_name is found in
          suite/suite_name/t/test_name.test. There is also an implicit
          suite name main for the tests in the top t directory. With no
          suite name, mysql-test-run.pl looks in the default list of suites
          for a match and runs the test in any suites where it finds the
          test. Suppose that the default suite list is main, binlog, rpl,
          and that a test mytest.test exists in the main and rpl suites.
          With an argument of mytest or mytest.test, mysql-test-run.pl will
          run mytest.test from the main and rpl suites.

          To run a family of test cases for which the names share a common
          prefix, use the --do-test=prefix option. For example,
          --do-test=rpl runs the replication tests (test cases that have
          names beginning with rpl).  --skip-test has the opposite effect
          of skipping test cases for which the names share a common prefix.

          The argument for the --do-test and --skip-test options also
          allows more flexible specification of which tests to perform or
          skip. If the argument contains a pattern metacharacter other than
          a lone period, it is interpreted as a Perl regular expression and
          applies to test names that match the pattern. If the argument
          contains a lone period or does not contain any pattern
          metacharacters, it is interpreted the same way as previously and
          matches test names that begin with the argument value. For
          example, --do-test=testa matches tests that begin with testa,
          --do-test=main.testa matches tests in the main test suite that
          begin with testa, and --do-test=main.*testa matches test names
          that contain main followed by testa with anything in between. In
          the latter case, the pattern match is not anchored to the
          beginning of the test name, so it also matches names such as
          xmainytesta.

          To perform setup prior to running tests, mysql-test-run.pl needs
          to invoke mysqld with the --bootstrap and --skip-grant-tables
          options. If MySQL was configured with the --disable-grant-options
          option, --bootstrap, --skip-grant-tables, and --init-file will be
          disabled. To handle this, set the MYSQLD_BOOTSTRAP environment
          variable to the full path name of a server that has all options
          enabled.  mysql-test-run.pl will use that server to perform
          setup; it is not used to run the tests.

          The init_file test will fail if --init-file is disabled. This is
          an expected failure that can be handled as follows:

              shell> export MYSQLD_BOOTSTRAP
              shell> MYSQLD_BOOTSTRAP=/full/path/to/mysqld
              shell> make test force="--skip-test=init_file"

          To run mysql-test-run.pl on Windows, you´ll need either Cygwin or
          ActiveState Perl to run it. You may also need to install the
          modules required by the script. To run the test script, change
          location into the mysql-test directory, set the MTR_VS_CONFIG
          environment variable to the configuration you selected earlier
          (or use the --vs-config option), and invoke mysql-test-run.pl.
          For example (using Cygwin and the bash shell):

              shell> cd mysql-test
              shell> export MTR_VS_CONFIG=debug
              shell> ./mysqltest-run.pl --force --timer
              shell> ./mysqltest-run.pl --force --timer --ps-protocol

          mysql-test-run.pl uses several environment variables. Some of
          them are listed in the following table. Some of these are set
          from the outside and used by mysql-test-run.pl, others are set by
          mysql-test-run.pl instead, and may be referred to in tests.

          ┌─────────────────┬────────────────────────────┐
          │Variable         │ Meaning                    │
          ├─────────────────┼────────────────────────────┤
          │MTR_VERSION      │ If set to 1, will run      │
          │                 │ the older version 1 of     │
          │                 │ mysql-test-run.pl. This    │
          │                 │ will affect what           │
          │                 │ functionailty is           │
          │                 │ available and what         │
          │                 │ command line options are   │
          │                 │ supported.                 │
          ├─────────────────┼────────────────────────────┤
          │MTR_MEM          │ If set to anything, will   │
          │                 │ run tests with files in    │
          │                 │ "memory" using tmpfs or    │
          │                 │                 ramdisk.   │
          │                 │ Not available on           │
          │                 │ Windows. Same as           │
          │                 │                 --mem      │
          │                 │ option                     │
          ├─────────────────┼────────────────────────────┤
          │MTR_PARALLEL     │ If set, defines number     │
          │                 │ of parallel threads        │
          │                 │ executing tests. Same as   │
          │                 │                 --parallel │
          │                 │ option                     │
          ├─────────────────┼────────────────────────────┤
          │MTR_BUILD_THREAD │ If set, defines which port │
          │                 │ number range is used for   │
          │                 │ the server                 │
          ├─────────────────┼────────────────────────────┤
          │MTR_PORT_BASE    │ If set, defines which port │
          │                 │ number range is used for   │
          │                 │ the server                 │
          ├─────────────────┼────────────────────────────┤
          │MTR_NAME_TIMEOUT │ Setting of a timeout in    │
          │                 │ minutes or seconds,        │
          │                 │ corresponding to command   │
          │                 │ line option                │
          │                 │ --name-timeout. Available  │
          │                 │ timeout names are          │
          │                 │ TESTCASE, SUITE (both in   │
          │                 │ minutes) and START,        │
          │                 │ SHUTDOWN (both in          │
          │                 │ seconds). These variables  │
          │                 │ are supported from MySQL   │
          │                 │ 5.1.44.                    │
          ├─────────────────┼────────────────────────────┤
          │MYSQL_TEST       │ Path name to mysqltest     │
          │                 │ binary                     │
          ├─────────────────┼────────────────────────────┤
          │MYSQLD_BOOTSTRAP │ Full path name to mysqld   │
          │                 │ that has all options       │
          │                 │ enabled                    │
          ├─────────────────┼────────────────────────────┤
          │MYSQLTEST_VARDIR │ Path name to the var       │
          │                 │ directory that is used for │
          │                 │                 logs,      │
          │                 │ temporary files, and so    │
          │                 │ forth                      │
          ├─────────────────┼────────────────────────────┤
          │MYSQL_TEST_DIR   │ Full path to the           │
          │                 │ mysql-test directory where │
          │                 │ tests                      │
          │                 │                 are being  │
          │                 │ run from                   │
          ├─────────────────┼────────────────────────────┤
          │MYSQL_TMP_DIR    │ Path to temp directory     │
          │                 │ used for temporary files   │
          │                 │ during tests               │
          └─────────────────┴────────────────────────────┘

          The variable MTR_PORT_BASE was added in MySQL 5.1.45 as a more
          logical replacement for MTR_BUILD_THREAD. It gives the actual
          port number directly (will be rounded down to a multiple of 10).
          If you use MTR_BUILD_THREAD, the port number is found by
          multiplying this by 10 and adding 10000.

          Tests sometimes rely on certain environment variables being
          defined. For example, certain tests assume that MYSQL_TEST is
          defined so that mysqltest can invoke itself with exec
          $MYSQL_TEST.

          Other tests may refer to the last three variables listed in the
          preceding table, to locate files to read or write. For example,
          tests that need to create files will typically put them in
          $MYSQL_TMP_DIR/file_name.

          If you are running mysql-test-run.pl version 1 by setting
          MTR_VERSION, note that this only affects the test driver, not the
          test client (and its language) or the tests themselves.

          A few tests might not run with version 1 because they depend on
          some feature of version 2. You may have those tests skipped by
          adding the test name to the file lib/v1/incompatible.tests. This
          feature is available from MySQL 5.1.40.

          mysql-test-run.pl supports the options in the following list. An
          argument of -- tells mysql-test-run.pl not to process any
          following arguments as options.

          •   --help, -h

              Display a help message and exit.

          •   --big-test

              Allow tests marked as "big" to run. Tests can be thus marked
              by including the line --source include/big_test.inc, and they
              will only be run if this option is given, or if the
              environment variable BIG_TEST is set to 1. Repeat this option
              twice to run only "big" tests.

              This is typically used for tests that take a very long to
              run, or that use many resources, so that they are not
              suitable for running as part of a normal test suite run.

          •   --boot-dbx

              Run the mysqld server used for bootstrapping the database
              through the dbx debugger.

          •   --boot-ddd

              Run the mysqld server used for bootstrapping the database
              through the ddd debugger.

          •   --boot-gdb

              Run the mysqld server used for bootstrapping the database
              through the gdb debugger.

          •   --[mtr-]build-thread=number

              Specify a number to calculate port numbers from. The formula
              is 10 * build_thread + 10000. Instead of a number, it can be
              set to auto, which is also the default value, in which case
              mysql-test-run.pl will allocate a number unique to this host.

              The value (number or auto) can also be set with the
              MTR_BUILD_THREAD environment variable.

              The more logical --port-base is supported as an alternative.

          •   --callgrind

              Instructs valgrind to use callgrind.

          •   --check-testcases

              Check test cases for side effects. This is done by checking
              system state before and after each test case; if there is any
              difference, a warning to that effect will be written, but the
              test case will not be marked as failed because of it. This
              check is enabled by default.

          •   --client-bindir=path

              The path to the directory where client binaries are located.

          •   --client-dbx

              Start mysqltest in the dbx debugger.

          •   --client-ddd

              Start mysqltest in the ddd debugger.

          •   --client-debugger=debugger

              Start mysqltest in the named debugger.

          •   --client-gdb

              Start mysqltest in the gdb debugger.

          •   --client-libdir=path

              The path to the directory where client libraries are located.

          •   --combination=value

              Extra options to pass to mysqld. The value should consist of
              one or more comma-separated mysqld options. This option is
              similar to --mysqld but should be given two or more times.
              mysql-test-run.pl executes multiple test runs, using the
              options for each instance of --combination in successive
              runs. If --combination is given only once, it has no effect.
              For test runs specific to a given test suite, an alternative
              to the use of --combination is to create a combinations file
              in the suite directory. The file should contain a section of
              options for each test run.

          •   --comment=str

              Write str to the output within lines filled with #, as a form
              of banner.

          •   --compress

              Compress all information sent between the client and the
              server if both support compression.

          •   --cursor-protocol

              Use the cursor protocol between client and server (implies
              --ps-protocol).

          •   --dbx

              Start the mysqld(s) in the dbx debugger.

          •   --ddd

              Start the mysqld(s) in the ddd debugger.

          •   --debug

              Dump trace output for all clients and servers.

          •   --debug-common

              Same as --debug, but sets the 'd' debug flags to
              "query,info,error,enter,exit".

          •   --debug-server

              Use debug version of server, but without turning on tracing.

          •   --debugger=debugger

              Start mysqld using the named debugger.

          •   --debug-sync-timeout=N

              Controls whether the Debug Sync facility for testing and
              debugging is enabled. The option value is a timeout in
              seconds. The default value is 300. A value of 0 disables
              Debug Sync. The value of this option also becomes the default
              timeout for individual synchronization points.

              mysql-test-run.pl passes --loose-debug-sync-timeout=N to
              mysqld. The --loose prefix is used so that mysqld does not
              fail if Debug Sync is not compiled in.

          •   --defaults-file=file_name

              Use the named file as fixed config file template for all
              tests.

          •   --defaults_extra_file=file_name

              Add setting from the named file to all generated configs.

          •   --do-test=prefix|regex

              Run all test cases having a name that begins with the given
              prefix value, or fulfils the regex. This option provides a
              convenient way to run a family of similarly named tests.

              The argument for the --do-test option also allows more
              flexible specification of which tests to perform. If the
              argument contains a pattern metacharacter other than a lone
              period, it is interpreted as a Perl regular expression and
              applies to test names that match the pattern. If the argument
              contains a lone period or does not contain any pattern
              metacharacters, it is interpreted the same way as previously
              and matches test names that begin with the argument value.
              For example, --do-test=testa matches tests that begin with
              testa, --do-test=main.testa matches tests in the main test
              suite that begin with testa, and --do-test=main.*testa
              matches test names that contain main followed by testa with
              anything in between. In the latter case, the pattern match is
              not anchored to the beginning of the test name, so it also
              matches names such as xmainytestz.

          •   --dry-run

              Don't run any tests, print the list of tests that were
              selected for execution.

          •   --embedded-server

              Use a version of mysqltest built with the embedded server.

          •   --enable-disabled

              Ignore any disabled.def file, and also run tests marked as
              disabled. Success or failure of those tests will be reported
              the same way as other tests.

          •   --experimental=file_name

              Specify a file that contains a list of test cases that should
              be displayed with the [ exp-fail ] code rather than [ fail ]
              if they fail.

              For an example of a file that might be specified via this
              option, see mysql-test/collections/default.experimental.

          •   --extern option=value

              Use an already running server. The option/value pair is what
              is needed by the mysql client to connect to the server. Each
              --extern option can only take one option/value pair as an
              argument, so you need to repeat --extern for each pair
              needed. Example:

                        ./mysql-test-run.pl --extern socket=var/tmp/mysqld.1.sock alias

              Note: If a test case has an .opt file that requires the
              server to be restarted with specific options, the file will
              not be used. The test case likely will fail as a result.

          •   --fast

              Do not perform controlled shutdown when servers need to be
              restarted or at the end of the test run. This is equivalent
              to using --shutdown-timeout=0.

          •   --force-restart

              Always restart servers between tests.

          •   --force

              Normally, mysql-test-run.pl exits if a test case fails.
              --force causes execution to continue regardless of test case
              failure.

          •   --gcov

              Collect coverage information after the test. The result is a
              gcov file per source and header file.

          •   --gcov-src-dir

              Colllect coverage only within the given subdirectory. For
              example, if you're only developing the SQL layer, it makes
              sense to use --gcov-src-dir=sql.

          •   --gdb

              Start the mysqld(s) in the gdb debugger.

          •   --gprof

              Collect profiling information using the gprof profiling tool.

          •   --manual-dbx

              Use a server that has already been started by the user in the
              dbx debugger.

          •   --manual-ddd

              Use a server that has already been started by the user in the
              ddd debugger.

          •   --manual-debug

              Use a server that has already been started by the user in a
              debugger.

          •   --manual-gdb

              Use a server that has already been started by the user in the
              gdb debugger.

          •   --manual-lldb

              Use a server that has already been started by the user in the
              lldb debugger.

          •   --mark-progress

              Marks progress with timing (in milliseconds) and line number
              in var/log/testname.progress.

          •   --max-connections=num

              The maximum number of simultaneous server connections that
              may be used per test. If not set, the maximum is 128. Minimum
              allowed limit is 8, maximum is 5120. Corresponds to the same
              option for mysqltest.

          •   --max-save-core=N

              Limit the number of core files saved, to avoid filling up
              disks in case of a frequently crashing server. Defaults to 5,
              set to 0 for no limit. May also be set with the environment
              variable MTR_MAX_SAVE_CORE

          •   --max-save-datadir=N

              Limit the number of data directories saved after failed
              tests, to avoid filling up disks in case of frequent
              failures. Defaults to 20, set to 0 for no limit. May also be
              set with the environment variable MTR_MAX_SAVE_DATADIR

          •   --max-test-fail=N

              Stop execution after the specified number of tests have
              failed, to avoid using up resources (and time) in case of
              massive failures. retries are not counted, nor are failures
              of tests marked experimental. Defaults to 10, set to 0 for no
              limit. May also be set with the environment variable
              MTR_MAX_TEST_FAIL

          •   --mem

              This option is not supported on Windows.

              Run the test suite in memory, using tmpfs or ramdisk. This
              can decrease test times significantly, in particular if you
              would otherwise be running over a remote file system.
              mysql-test-run.pl attempts to find a suitable location using
              a built-in list of standard locations for tmpfs and puts the
              var directory there. This option also affects placement of
              temporary files, which are created in var/tmp.

              The default list includes /dev/shm. You can also enable this
              option by setting the environment variable
              MTR_MEM[=dir_name]. If dir_name is given, it is added to the
              beginning of the list of locations to search, so it takes
              precedence over any built-in locations.

              Once you have run tests with --mem within a
              mysql-testdirectory, a soflink var will have been set up to
              the temporary directory, and this will be re-used the next
              time, until the soflink is deleted. Thus, you do not have to
              repeat the --mem option next time.

          •   --mysqld=value

              Extra options to pass to mysqld. The value should consist of
              one or more comma-separated mysqld options.

          •   --mysqld-env=VAR=VAL

              Specify additional environment settings for "mysqld". Use
              additional --mysqld-env options to set more than one
              variable.

          •   --nocheck-testcases

              Disable the check for test case side effects; see
              --check-testcases for a description.

          •   --noreorder

              Do not reorder tests to reduce number of restarts, but run
              them in exactly the order given. If a whole suite is to be
              run, the tests are run in alphabetical order, though similar
              combinations will be grouped together. If more than one suite
              is listed, the tests are run one suite at a time, in the
              order listed.

          •   --notimer

              Cause mysqltest not to generate a timing file. The effect of
              this is that the report from each test case does not include
              the timing in milliseconds as it normally does.

          •   --nowarnings

              Do not look for and report errors and warning in the server
              logs.

          •   --parallel={N|auto}

              Run tests using N parallel threads. By default, 1 thread is
              used. Use --parallel=auto for auto-setting of N.

          •   --[mtr-]port-base=P

              Specify base of port numbers to be used; a block of 10 will
              be allocated.  P should be divisible by 10; if it is not, it
              will be rounded down. If running with more than one parallel
              test thread, thread 2 will use the next block of 10 and so
              on.

              If the port number is given as auto, which is also the
              default, mysql-test-run.pl will allocate a number unique to
              this host. The value may also be given with the environment
              variable MTR_PORT_BASE.

              If both --build-thread and --port-base are used, --port-base
              takes precedence.

          •   --print-testcases

              Do not run any tests, but print details about all tests, in
              the order they would have been run.

          •   --ps-protocol

              Use the binary protocol between client and server.

          •   --record

              Pass the --record option to mysqltest. This option requires a
              specific test case to be named on the command line.

          •   --reorder

              Reorder tests to minimize the number of server restarts
              needed. This is the default behavior. There is no guarantee
              that a particular set of tests will always end up in the same
              order.

          •   --repeat=N

              Run each test N number of times.

          •   --report-features

              First run a "test" that reports MariaDB features, displaying
              the output of SHOW ENGINES and SHOW VARIABLES. This can be
              used to verify that binaries are built with all required
              features.

          •   --report-times

              Report how much time has been spent on different phases of
              test execution.

          •   --retry=N

              If a test fails, it is retried up to a maximum of N runs
              (default 1). Retries are also limited by the maximum number
              of failures before stopping, set with the --retry-failure
              option. This option has no effect unless --force is also
              used; without it, test execution will terminate after the
              first failure.

              The --retry and --retry-failure options do not affect how
              many times a test repeated with --repeat may fail in total,
              as each repetition is considered a new test case, which may
              in turn be retried if it fails.

          •   --retry-failure=N

              When using the --retry option to retry failed tests, stop
              when N failures have occurred (default 2). Setting it to 0 or
              1 effectively turns off retries.

          •   --shutdown-timeout=SECONDS

              Max number of seconds to wait for servers to do controlled
              shutdown before killing them. Default is 10.

          •   --skip-combinations

              Do not apply combinations; ignore combinations file or
              option.

          •   --skip-rpl

              Skip replication test cases.

          •   --skip-ssl

              Do not start mysqld with support for SSL connections.

          •   --skip-test=regex|regex

              Specify a regular expression to be applied to test case
              names. Cases with names that match the expression are
              skipped. tests to skip.

              The argument for the --skip-test option allows more flexible
              specification of which tests to skip. If the argument
              contains a pattern metacharacter other than a lone period, it
              is interpreted as a Perl regular expression and applies to
              test names that match the pattern. See the description of the
              --do-test option for details.

          •   --skip-test-list=FILE

              Skip the tests listed in FILE. Each line in the file is an
              entry and should be formatted as: <TESTNAME> : <COMMENT>

          •   --skip-*

              --skip-* options not otherwise recognized by
              mysql-test-run.pl are passed to the master server.

          •   --sleep=N

              Pass --sleep=N to mysqltest.

          •   --sp-protocol

              Create a stored procedure to execute all queries.

          •   --ssl

              If mysql-test-run.pl is started with the --ssl option, it
              sets up a secure connection for all test cases. In this case,
              if mysqld does not support SSL, mysql-test-run.pl exits with
              an error message: Couldn´t find support for SSL

          •   --staging-run

              Run a limited number of tests (no slow tests). Used for
              running staging trees with valgrind.

          •   --start

              Initialize and start servers with the startup settings for
              the specified test case. You can use this option to start a
              server to which you can connect later. For example, after
              building a source distribution you can start a server and
              connect to it with the mysql client like this:

                  shell> cd mysql-test
                  shell> ./mysql-test-run.pl --start alias &
                  shell> ../mysql -S ./var/tmp/master.sock -h localhost -u root

              If no tests are named on the command line, the server(s) will
              be started with settings for the first test that would have
              been run without the --start option.

              mysql-test-run.pl will stop once the server has been started,
              but will terminate if the server dies. If killed, it will
              also shut down the server.

          •   --start-and-exit

              Same --start, but mysql-test-run terminates and leaves just
              the server running.

          •   --start-dirty

              This is similar to --start, but will skip the database
              initialization phase and assume that database files are
              already available. Usually this means you must have run
              another test first.

          •   --start-from=test_name

              mysql-test-run.pl sorts the list of names of the test cases
              to be run, and then begins with test_name.

          •   --strace

              Run the "mysqld" executables using strace. Default options
              are -f -o var/log/'mysqld-name'.strace.

          •   --strace-client

              Create strace output for mysqltest, optionally specifying
              name and path to the trace program to use.

              Example: ./mysql-test-run.pl --strace-client=ktrace

          •   --strace-option=ARGS

              Option to give strace, replaces default option(s).

          •   --stress=ARGS

              Run stress test, providing options to mysql-stress-test.pl.
              Options are separated by comma.

          •   --suite[s]=suite_name...

              Comma separated list of suite names to run. The default is:
              "main-,archive-,binlog-,csv-,federated-,funcs_1-,funcs_2-,
              handler-,heap-,innodb-,innodb_fts-,innodb_zip-,maria-,
              multi_source-,optimizer_unfixed_bugs-,parts-,perfschema-,
              plugins-,roles-,rpl-,sys_vars-,unit-,vcol-".

          •   --stop-file=file

              If this file is detected, mysqltest will not start new tests
              until the file is removed (also MTR_STOP_FILE environment
              variable).

          •   --stop-keep-alive=sec

              Works with --stop-file, print messages every sec seconds when
              mysqltest is waiting to remove the file (for buildbot) (also
              MTR_STOP_KEEP_ALIVE environment variable).

          •   --suite-timeout=minutes

              Specify the maximum test suite runtime in minutes. The
              default is 360.

          •   --testcase-timeout

              Specify the maximum test case runtime in minutes. The default
              is 15.

          •   --timediff

              Used with --timestamp, also print time passed since the
              previous test started.

          •   --timer

              Cause mysqltest to generate a timing file. The default file
              is named ./var/log/timer.

          •   --timestamp

              Prints a timestamp before the test case name in each test
              report line, showing when the test ended.

          •   --tmpdir=path

              The directory where temporary file are stored. The default
              location is ./var/tmp. The environment variable MYSQL_TMP_DIR
              will be set to the path for this directory, whether it has
              the default value or has been set explicitly. This may be
              referred to in tests.

          •   --user=user_name

              The MariaDB user name to use when connecting to the server
              (default root).

          •   --user-args

              In combination with start* and no test name, drops arguments
              to mysqld except those specified with --mysqld (if any).

          •   --valgrind[-all]

              Run mysqltest and mysqld with valgrind. This and the
              following --valgrind options require that the executables
              have been built with valgrind support.

          •   --valgrind-mysqld

              Run the mysqld server with valgrind.

          •   --valgrind-mysqltest

              Run the mysqltest and mysql_client_test executables with
              valgrind.

          •   --valgrind-option=str

              Option to give valgrind. Replaces default option(s). Can be
              specified more then once&.

          •   --valgrind-path=path

              Path to the valgrind executable.

          •   --vardir=path

              Specify the path where files generated during the test run
              are stored. The default location is ./var. The environment
              variable MYSQLTEST_VARDIR will be set to the path for this
              directory, whether it has the default value or has been set
              explicitly. This may be referred to in tests.

          •   --verbose

              Give more verbose output regarding test execution. Use the
              option twice to get even more output. Note that the output
              generated within each test case is not affected.

          •   --verbose-restart

              Write when and why servers are restarted between test cases.

          •   --view-protocol

              Create a view to execute all non updating queries.

          •   --vs-config=config_val

              Visual Studio configuration used to create executables
              (default: MTR_VS_CONFIG environment variable) This option is
              for Windows only.

          •   --wait-all

              If --start or --start-dirty is used, wait for all servers to
              exit before termination. Otherwise, it will terminate if one
              (of several) servers is restarted.

          •   --warnings

              Search the server log for errors or warning after each test
              and report any suspicious ones; if any are found, the test
              will be marked as failed. This is the default behavior, it
              may be turned off with --nowarnings.


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

                                                           MYSQL-TEST-RUN()

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
