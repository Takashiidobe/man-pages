.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mysqld_multi(1) — Linux manual page
===================================

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

   MYSQLD_MULTI(1)          MariaDB Database System         MYSQLD_MULTI(1)

NAME
-------------------------------------------------

::

          mysqld_multi - manage multiple MariaDB servers


---------------------------------------------------------

::

          mysqld_multi [options] {start|stop|report} [GNR[,GNR] ...]


---------------------------------------------------------------

::

          mysqld_multi is designed to manage several mysqld processes that
          listen for connections on different Unix socket files and TCP/IP
          ports. It can start or stop servers, or report their current
          status.

          mysqld_multi searches for groups named [mysqldN] in my.cnf (or in
          the file named by the --config-file option).  N can be any
          positive integer. This number is referred to in the following
          discussion as the option group number, or GNR. Group numbers
          distinguish option groups from one another and are used as
          arguments to mysqld_multi to specify which servers you want to
          start, stop, or obtain a status report for. Options listed in
          these groups are the same that you would use in the [mysqld]
          group used for starting mysqld. However, when using multiple
          servers, it is necessary that each one use its own value for
          options such as the Unix socket file and TCP/IP port number.

          To invoke mysqld_multi, use the following syntax:

              shell> mysqld_multi [options] {start|stop|report} [GNR[,GNR] ...]

          start, stop, and report indicate which operation to perform. You
          can perform the designated operation for a single server or
          multiple servers, depending on the GNR list that follows the
          option name. If there is no list, mysqld_multi performs the
          operation for all servers in the option file.

          Each GNR value represents an option group number or range of
          group numbers. The value should be the number at the end of the
          group name in the option file. For example, the GNR for a group
          named [mysqld17] is 17. To specify a range of numbers, separate
          the first and last numbers by a dash. The GNR value 10-13
          represents groups [mysqld10] through [mysqld13]. Multiple groups
          or group ranges can be specified on the command line, separated
          by commas. There must be no whitespace characters (spaces or
          tabs) in the GNR list; anything after a whitespace character is
          ignored.

          This command starts a single server using option group
          [mysqld17]:

              shell> mysqld_multi start 17

          This command stops several servers, using option groups [mysqld8]
          and [mysqld10] through [mysqld13]:

              shell> mysqld_multi stop 8,10-13

          For an example of how you might set up an option file, use this
          command:

              shell> mysqld_multi --example

          mysqld_multi searches for option files as follows:

          •   With --no-defaults, no option files are read.

          •   With --defaults-file=file_name, only the named file is read.

          •   Otherwise, option files in the standard list of locations are
              read, including any file named by the
              --defaults-extra-file=file_name option, if one is given. (If
              the option is given multiple times, the last value is used.)

          Option files read are searched for [mysqld_multi] and [mysqldN]
          option groups. The [mysqld_multi] group can be used for options
          to mysqld_multi itself.  [mysqldN] groups can be used for options
          passed to specific mysqld instances.

          The [mysqld] or [mysqld_safe] groups can be used for common
          options read by all instances of mysqld or mysqld_safe. You can
          specify a --defaults-file=file_name option to use a different
          configuration file for that instance, in which case the [mysqld]
          or [mysqld_safe] groups from that file will be used for that
          instance.

          mysqld_multi supports the following options.

          •   --help

              Display a help message and exit.

          •   --example

              Display a sample option file.

          •   --log=file_name

              Specify the name of the log file. If the file exists, log
              output is appended to it.

          •   --mysqladmin=prog_name

              The mysqladmin binary to be used to stop servers.

          •   --mysqld=prog_name

              The mysqld binary to be used. Note that you can specify
              mysqld_safe as the value for this option also. If you use
              mysqld_safe to start the server, you can include the mysqld
              or ledir options in the corresponding [mysqldN] option group.
              These options indicate the name of the server that
              mysqld_safe should start and the path name of the directory
              where the server is located. (See the descriptions for these
              options in mysqld_safe(1).) Example:

                  [mysqld38]
                  mysqld = mysqld-debug
                  ledir  = /opt/local/mysql/libexec

          •   --no-log

              Print log information to stdout rather than to the log file.
              By default, output goes to the log file.

          •   --password=password

              The password of the MariaDB account to use when invoking
              mysqladmin. Note that the password value is not optional for
              this option, unlike for other MariaDB programs.

          •   --silent

              Silent mode; disable warnings.

          •   --tcp-ip

              Connect to the MariaDB server(s) via the TCP/IP port instead
              of the UNIX socket. This affects stopping and reporting. If a
              socket file is missing, the server may still be running, but
              can be accessed only via the TCP/IP port. By default
              connecting is done via the UNIX socket. This option affects
              stop and report operations.

          •   --user=user_name

              The user name of the MariaDB account to use when invoking
              mysqladmin.

          •   --verbose

              Be more verbose.

          •   --version

              Display version information and exit.

          •   --wsrep-new-cluster

              Bootstrap a cluster.

          Some notes about mysqld_multi:

          •   Most important: Before using mysqld_multi be sure that you
              understand the meanings of the options that are passed to the
              mysqld servers and why you would want to have separate mysqld
              processes. Beware of the dangers of using multiple mysqld
              servers with the same data directory. Use separate data
              directories, unless you know what you are doing. Starting
              multiple servers with the same data directory does not give
              you extra performance in a threaded system.

          •   Important: Make sure that the data directory for each server
              is fully accessible to the Unix account that the specific
              mysqld process is started as.  Do not use the Unix root
              account for this, unless you know what you are doing.

          •   Make sure that the MariaDB account used for stopping the
              mysqld servers (with the mysqladmin program) has the same
              user name and password for each server. Also, make sure that
              the account has the SHUTDOWN privilege. If the servers that
              you want to manage have different user names or passwords for
              the administrative accounts, you might want to create an
              account on each server that has the same user name and
              password. For example, you might set up a common multi_admin
              account by executing the following commands for each server:

                  shell> mysql -u root -S /tmp/mysql.sock -p
                  Enter password:
                  mysql> GRANT SHUTDOWN ON *.*
                      -> TO ´multi_admin´@´localhost´ IDENTIFIED BY ´multipass´;

              Change the connection parameters appropriately when
              connecting to each one. Note that the host name part of the
              account name must allow you to connect as multi_admin from
              the host where you want to run mysqld_multi.

          •   The Unix socket file and the TCP/IP port number must be
              different for every mysqld. (Alternatively, if the host has
              multiple network addresses, you can use --bind-address to
              cause different servers to listen to different interfaces.)

          •   The --pid-file option is very important if you are using
              mysqld_safe to start mysqld (for example,
              --mysqld=mysqld_safe) Every mysqld should have its own
              process ID file. The advantage of using mysqld_safe instead
              of mysqld is that mysqld_safe monitors its mysqld process and
              restarts it if the process terminates due to a signal sent
              using kill -9 or for other reasons, such as a segmentation
              fault. Please note that the mysqld_safe script might require
              that you start it from a certain place. This means that you
              might have to change location to a certain directory before
              running mysqld_multi. If you have problems starting, please
              see the mysqld_safe script. Check especially the lines:

                  ----------------------------------------------------------------
                  MY_PWD=`pwd`
                  # Check if we are starting this relative (for the binary release)
                  if test -d $MY_PWD/data/mysql -a \
                     -f ./share/mysql/english/errmsg.sys -a \
                     -x ./bin/mysqld
                  ----------------------------------------------------------------

              The test performed by these lines should be successful, or
              you might encounter problems. See mysqld_safe(1).

          •   You might want to use the --user option for mysqld, but to do
              this you need to run the mysqld_multi script as the Unix root
              user. Having the option in the option file doesn´t matter;
              you just get a warning if you are not the superuser and the
              mysqld processes are started under your own Unix account.

          The following example shows how you might set up an option file
          for use with mysqld_multi. The order in which the mysqld programs
          are started or stopped depends on the order in which they appear
          in the option file. Group numbers need not form an unbroken
          sequence. The first and fifth [mysqldN] groups were intentionally
          omitted from the example to illustrate that you can have “gaps”
          in the option file. This gives you more flexibility.

              # This file should probably be in your home dir (~/.my.cnf)
              # or /etc/my.cnf
              # Version 2.1 by Jani Tolonen
              [mysqld_multi]
              mysqld     = /usr/local/bin/mysqld_safe
              mysqladmin = /usr/local/bin/mysqladmin
              user       = multi_admin
              password   = multipass
              [mysqld2]
              socket     = /tmp/mysql.sock2
              port       = 3307
              pid-file   = /usr/local/mysql/var2/hostname.pid2
              datadir    = /usr/local/mysql/var2
              language   = /usr/local/share/mysql/english
              user       = john
              [mysqld3]
              socket     = /tmp/mysql.sock3
              port       = 3308
              pid-file   = /usr/local/mysql/var3/hostname.pid3
              datadir    = /usr/local/mysql/var3
              language   = /usr/local/share/mysql/swedish
              user       = monty
              [mysqld4]
              socket     = /tmp/mysql.sock4
              port       = 3309
              pid-file   = /usr/local/mysql/var4/hostname.pid4
              datadir    = /usr/local/mysql/var4
              language   = /usr/local/share/mysql/estonia
              user       = tonu
              [mysqld6]
              socket     = /tmp/mysql.sock6
              port       = 3311
              pid-file   = /usr/local/mysql/var6/hostname.pid6
              datadir    = /usr/local/mysql/var6
              language   = /usr/local/share/mysql/japanese
              user       = jani


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

   MariaDB 10.6                   15 May 2020               MYSQLD_MULTI(1)

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
