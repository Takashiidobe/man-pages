.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mysql_install_db(1) — Linux manual page
=======================================

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

   MYSQL_INSTALL_DB(1)      MariaDB Database System     MYSQL_INSTALL_DB(1)

NAME
-------------------------------------------------

::

          mysql_install_db - initialize MariaDB data directory


---------------------------------------------------------

::

          mysql_install_db [options]


---------------------------------------------------------------

::

          mysql_install_db initializes the MariaDB data directory and
          creates the system tables that it contains, if they do not exist.

          To invoke mysql_install_db, use the following syntax:

              shell> mysql_install_db [options]

          Because the MariaDB server, mysqld, needs to access the data
          directory when it runs later, you should either run
          mysql_install_db from the same account that will be used for
          running mysqld or run it as root and use the --user option to
          indicate the user name that mysqld will run as. It might be
          necessary to specify other options such as --basedir or --datadir
          if mysql_install_db does not use the correct locations for the
          installation directory or data directory. For example:

              shell> bin/mysql_install_db --user=mysql \
                       --basedir=/opt/mysql/mysql \
                       --datadir=/opt/mysql/mysql/data

          mysql_install_db needs to invoke mysqld with the --bootstrap and
          --skip-grant-tables options (see Section 2.3.2, “Typical
          configure Options”). If MariaDB was configured with the
          --disable-grant-options option, --bootstrap and
          --skip-grant-tables will be disabled. To handle this, set the
          MYSQLD_BOOTSTRAP environment variable to the full path name of a
          server that has all options enabled.  mysql_install_db will use
          that server.

          mysql_install_db supports the following options, which can be
          specified on the command line or in the [mysql_install_db] and
          (if they are common to mysqld) [mysqld] option file groups.

          •   --basedir=path

              The path to the MariaDB installation directory.

          •   --builddir=path

              If using --srcdir with out-of-directory builds, you will need
              to set this to the location of the build directory where
              built files reside..

          •   --cross-bootstrap

              For internal use. Used when building the MariaDB system
              tables on a different host than the target..

          •   --datadir=path, --ldata=path

              The path to the MariaDB data directory.

          •   --defaults-extra-file=filename

              Set filename as the file to read default options from after
              the global defaults files has been read.  Must be given as
              first option.

          •   --defaults-file=filename

              Set filename as the file to read default options from,
              override global defaults files.  Must be given as first
              option.

          •   --defaults-group-suffix=name

              In addition to the given groups, also read groups with this
              suffix.

          •   --force

              Cause mysql_install_db to run even if DNS does not work. In
              that case, grant table entries that normally use host names
              will use IP addresses.

          •   --help

              Display a help message and exit.

          •   --no-defaults

              Do not read default options from any option file. This must
              be given as the first argument.

          •   --print-defaults

              Print the program argument list and exit.  This must be given
              as the first argument.

          •   --rpm

              For internal use. This option is used by RPM files during the
              MariaDB installation process.

          •   --skip-name-resolve

              Use IP addresses rather than host names when creating grant
              table entries. This option can be useful if your DNS does not
              work.

          •   --srcdir=path

              For internal use. The directory under which mysql_install_db
              looks for support files such as the error message file and
              the file for populating the help tables.4.

          •   --user=user_name

              The login user name to use for running mysqld. Files and
              directories created by mysqld will be owned by this user. You
              must be root to use this option. By default, mysqld runs
              using your current login name and files and directories that
              it creates will be owned by you.

          •   --verbose

              Verbose mode. Print more information about what the program
              does.

          •   --windows

              For internal use. This option is used for creating Windows
              distributions.


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

   MariaDB 10.6                   15 May 2020           MYSQL_INSTALL_DB(1)

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
