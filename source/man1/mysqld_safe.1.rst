.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mysqld_safe(1) — Linux manual page
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

   MYSQLD_SAFE(1)           MariaDB Database System          MYSQLD_SAFE(1)

NAME
-------------------------------------------------

::

          mysqld_safe - MariaDB server startup script


---------------------------------------------------------

::

          mysqld_safe options


---------------------------------------------------------------

::

          mysqld_safe is the recommended way to start a mysqld server on
          Unix.  mysqld_safe adds some safety features such as restarting
          the server when an error occurs and logging runtime information
          to an error log file. Descriptions of error logging is given
          later in this section.

          mysqld_safe tries to start an executable named mysqld. To
          override the default behavior and specify explicitly the name of
          the server you want to run, specify a --mysqld or
          --mysqld-version option to mysqld_safe. You can also use --ledir
          to indicate the directory where mysqld_safe should look for the
          server.

          Many of the options to mysqld_safe are the same as the options to
          mysqld.

          Options unknown to mysqld_safe are passed to mysqld if they are
          specified on the command line, but ignored if they are specified
          in the [mysqld_safe] or [mariadb_safe] groups of an option file.

          mysqld_safe reads all options from the [mysqld], [server],
          [mysqld_safe], and [mariadb_safe] sections in option files. For
          example, if you specify a [mysqld] section like this, mysqld_safe
          will find and use the --log-error option:

              [mysqld]
              log-error=error.log

          For backward compatibility, mysqld_safe also reads [safe_mysqld]
          sections, although you should rename such sections to
          [mysqld_safe] in current installations.

          mysqld_safe supports the options in the following list. It also
          reads option files and supports the options for processing them.

          •   --help

              Display a help message and exit.

          •   --basedir=path

              The path to the MariaDB installation directory.

          •   --core-file-size=size

              The size of the core file that mysqld should be able to
              create. The option value is passed to ulimit -c.

          •   --crash-script=file

              Script to call in the event of mysqld crashing.

          •   --datadir=path

              The path to the data directory.

          •   --defaults-extra-file=path

              The name of an option file to be read in addition to the
              usual option files. This must be the first option on the
              command line if it is used. If the file does not exist or is
              otherwise inaccessible, the server will exit with an error.

          •   --defaults-file=file_name

              The name of an option file to be read instead of the usual
              option files. This must be the first option on the command
              line if it is used.

          •   --flush-caches

              Flush and purge buffers/caches before starting the server.

          •   --ledir=path

              If mysqld_safe cannot find the server, use this option to
              indicate the path name to the directory where the server is
              located.

          •   --log-error=file_name

              Write the error log to the given file.

          •   --malloc-lib=lib

              Preload shared library lib if available.

          •   --mysqld=prog_name

              The name of the server program (in the ledir directory) that
              you want to start. This option is needed if you use the
              MariaDB binary distribution but have the data directory
              outside of the binary distribution. If mysqld_safe cannot
              find the server, use the --ledir option to indicate the path
              name to the directory where the server is located.

          •   --mysqld-version=suffix

              This option is similar to the --mysqld option, but you
              specify only the suffix for the server program name. The
              basename is assumed to be mysqld. For example, if you use
              --mysqld-version=debug, mysqld_safe starts the mysqld-debug
              program in the ledir directory. If the argument to
              --mysqld-version is empty, mysqld_safe uses mysqld in the
              ledir directory.

          •   --nice=priority

              Use the nice program to set the server´s scheduling priority
              to the given value.

          •   --no-auto-restart

              Exit after starting mysqld.

          •   --no-defaults

              Do not read any option files. This must be the first option
              on the command line if it is used.

          •   --no-auto-restart

              Exit after starting mysqld.

          •   --numa-interleave

              Run mysqld with its memory interleaved on all NUMA nodes.

          •   --open-files-limit=count

              The number of files that mysqld should be able to open. The
              option value is passed to ulimit -n. Note that you need to
              start mysqld_safe as root for this to work properly!

          •   --pid-file=file_name

              The path name of the process ID file.

          •   --plugin-dir=dir_name

              Directory for client-side plugins.

          •   --port=port_num

              The port number that the server should use when listening for
              TCP/IP connections. The port number must be 1024 or higher
              unless the server is started by the root system user.

          •   --skip-kill-mysqld

              Do not try to kill stray mysqld processes at startup. This
              option works only on Linux.

          •   --socket=path

              The Unix socket file that the server should use when
              listening for local connections.

          •   --syslog, --skip-syslog

              --syslog causes error messages to be sent to syslog on
              systems that support the logger program.  --skip-syslog
              suppresses the use of syslog; messages are written to an
              error log file.

          •   --syslog-tag=tag

              For logging to syslog, messages from mysqld_safe and mysqld
              are written with a tag of mysqld_safe and mysqld,
              respectively. To specify a suffix for the tag, use
              --syslog-tag=tag, which modifies the tags to be
              mysqld_safe-tag and mysqld-tag.

          •   --timezone=timezone

              Set the TZ time zone environment variable to the given option
              value. Consult your operating system documentation for legal
              time zone specification formats.

          •   --user={user_name|user_id}

              Run the mysqld server as the user having the name user_name
              or the numeric user ID user_id. (“User” in this context
              refers to a system login account, not a MariaDB user listed
              in the grant tables.)

          If you execute mysqld_safe with the --defaults-file or
          --defaults-extra-file option to name an option file, the option
          must be the first one given on the command line or the option
          file will not be used. For example, this command will not use the
          named option file:

              mysql> mysqld_safe --port=port_num --defaults-file=file_name

          Instead, use the following command:

              mysql> mysqld_safe --defaults-file=file_name --port=port_num

          The mysqld_safe script is written so that it normally can start a
          server that was installed from either a source or a binary
          distribution of MariaDB, even though these types of distributions
          typically install the server in slightly different locations.
          mysqld_safe expects one of the following conditions to be true:

          •   The server and databases can be found relative to the working
              directory (the directory from which mysqld_safe is invoked).
              For binary distributions, mysqld_safe looks under its working
              directory for bin and data directories. For source
              distributions, it looks for libexec and var directories. This
              condition should be met if you execute mysqld_safe from your
              MariaDB installation directory (for example, /usr/local/mysql
              for a binary distribution).

          •   If the server and databases cannot be found relative to the
              working directory, mysqld_safe attempts to locate them by
              absolute path names. Typical locations are /usr/local/libexec
              and /usr/local/var. The actual locations are determined from
              the values configured into the distribution at the time it
              was built. They should be correct if MariaDB is installed in
              the location specified at configuration time.

          Because mysqld_safe tries to find the server and databases
          relative to its own working directory, you can install a binary
          distribution of MariaDB anywhere, as long as you run mysqld_safe
          from the MariaDB installation directory:

              shell> cd mysql_installation_directory
              shell> bin/mysqld_safe &

          If mysqld_safe fails, even when invoked from the MariaDB
          installation directory, you can specify the --ledir and --datadir
          options to indicate the directories in which the server and
          databases are located on your system.

          When you use mysqld_safe to start mysqld, mysqld_safe arranges
          for error (and notice) messages from itself and from mysqld to go
          to the same destination.

          There are several mysqld_safe options for controlling the
          destination of these messages:

          •   --syslog: Write error messages to syslog on systems that
              support the logger program.

          •   --skip-syslog: Do not write error messages to syslog.
              Messages are written to the default error log file
              (host_name.err in the data directory), or to a named file if
              the --log-error option is given.

          •   --log-error=file_name: Write error messages to the named
              error file.

          If none of these options is given, the default is --skip-syslog.

              Note
          If --syslog and --log-error are both given, a warning is issued
          and --log-error takes precedence.

          When mysqld_safe writes a message, notices go to the logging
          destination (syslog or the error log file) and stdout. Errors go
          to the logging destination and stderr.

          Normally, you should not edit the mysqld_safe script. Instead,
          configure mysqld_safe by using command-line options or options in
          the [mysqld_safe] section of a my.cnf option file. In rare cases,
          it might be necessary to edit mysqld_safe to get it to start the
          server properly. However, if you do this, your modified version
          of mysqld_safe might be overwritten if you upgrade MariaDB in the
          future, so you should make a copy of your edited version that you
          can reinstall.

          On NetWare, mysqld_safe is a NetWare Loadable Module (NLM) that
          is ported from the original Unix shell script. It starts the
          server as follows:

           1. Runs a number of system and option checks.

           2. Runs a check on MyISAM tables.

           3. Provides a screen presence for the MariaDB server.

           4. Starts mysqld, monitors it, and restarts it if it terminates
              in error.

           5. Sends error messages from mysqld to the host_name.err file in
              the data directory.

           6. Sends mysqld_safe screen output to the host_name.safe file in
              the data directory.


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

   MariaDB 10.6                   15 May 2020                MYSQLD_SAFE(1)

--------------

Pages that refer to this page:
`mysqld_multi(1) <../man1/mysqld_multi.1.html>`__

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
