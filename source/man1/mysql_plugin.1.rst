.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mysql_plugin(1) — Linux manual page
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

   MYSQL_PLUGIN(1)          MariaDB Database System         MYSQL_PLUGIN(1)

NAME
-------------------------------------------------

::

          mysql_plugin - configure MariaDB server plugins


---------------------------------------------------------

::

          mysql_plugin [options] plugin {ENABLE|DISABLE}


---------------------------------------------------------------

::

          The mysql_plugin utility enables MariaDB administrators to manage
          which plugins a MariaDB server loads. It provides an alternative
          to manually specifying the --plugin-load option at server startup
          or using the INSTALL PLUGIN and UNINSTALL PLUGIN statements at
          runtime.

          Depending on whether mysql_plugin is invoked to enable or disable
          plugins, it inserts or deletes rows in the mysql.plugin table
          that serves as a plugin registry. (To perform this operation,
          mysql_plugin invokes the MariaDB server in bootstrap mode. This
          means that the server must not already be running.) For normal
          server startups, the server loads and enables plugins listed in
          mysql.plugin automatically. For additional control over plugin
          activation, use --plugin_name options named for specific plugins.

          Each invocation of mysql_plugin reads a configuration file to
          determine how to configure the plugins contained in a single
          plugin library object file. To invoke mysql_plugin, use this
          syntax:

              mysql_plugin [options] plugin {ENABLE|DISABLE}

          plugin is the name of the plugin to configure.  ENABLE or DISABLE
          (not case sensitive) specify whether to enable or disable
          components of the plugin library named in the configuration file.
          The order of the plugin and ENABLE or DISABLE arguments does not
          matter.

          For example, to configure components of a plugin library file
          named myplugins.so on Linux or myplugins.dll on Windows, specify
          a plugin value of myplugins. Suppose that this plugin library
          contains three plugins, plugin1, plugin2, and plugin3, all of
          which should be configured under mysql_plugin control. By
          convention, configuration files have a suffix of .ini and the
          same basename as the plugin library, so the default configuration
          file name for this plugin library is myplugins.ini. The
          configuration file contents look like this:

              myplugins
              plugin1
              plugin2
              plugin3

          The first line in the myplugins.ini file is the name of the
          library object file, without any extension such as .so or .dll.
          The remaining lines are the names of the components to be enabled
          or disabled. Each value in the file should be on a separate line.
          Lines on which the first character is '#' are taken as comments
          and ignored.

          To enable the plugins listed in the configuration file, invoke
          mysql_plugin this way:

              shell> mysql_plugin myplugins ENABLE

          To disable the plugins, use DISABLE rather than ENABLE.

          An error occurs if mysql_plugin cannot find the configuration
          file or plugin library file, or if mysql_plugin cannot start the
          MariaDB server.

          mysql_plugin supports the following options, which can be
          specified on the command line or in the [mysqld] group of any
          option file. For options specified in a [mysqld] group,
          mysql_plugin recognizes the --basedir, --datadir, and
          --plugin-dir options and ignores others.

          mysql_plugin Options

          •   --help, -?

              Display a help message and exit.

          •   --basedir=path, -b path

              The server base directory.

          •   --datadir=path, -d path

              The server data directory.

          •   --my-print-defaults=path, -b path

              The path to the my_print_defaults program.

          •   --mysqld=path, -b path

              The path to the mysqld server.

          •   --no-defaults, -p

              Do not read values from the configuration file. This option
              enables an administrator to skip reading defaults from the
              configuration file.

              With mysql_plugin, this option need not be given first on the
              command line, unlike most other MariaDB programs that support
              --no-defaults.

          •   --plugin-dir=path, -p path

              The server plugin directory.

          •   --plugin-ini=file_name, -i file_name

              The mysql_plugin configuration file. Relative path names are
              interpreted relative to the current directory. If this option
              is not given, the default is plugin.ini in the plugin
              directory, where plugin is the plugin argument on the command
              line.

          •   --print-defaults, -P

              Display the default values from the configuration file. This
              option causes mysql_plugin to print the defaults for
              --basedir, --datadir, and --plugin-dir if they are found in
              the configuration file. If no value for a variable is found,
              nothing is shown.

              With mysql_plugin, this option need not be given first on the
              command line, unlike most other MariaDB programs that support
              --print-defaults.

          •   --verbose, -v

              Verbose mode. Print more information about what the program
              does. This option can be used multiple times to increase the
              amount of information.

          •   --version, -V

              Display version information and exit.


-----------------------------------------------------------

::

          Copyright © 1997, 2013, Oracle and/or its affiliates. All rights
          reserved., 2013-2019 MariaDB Foundation

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

   MariaDB 10.6                   15 May 2020               MYSQL_PLUGIN(1)

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
