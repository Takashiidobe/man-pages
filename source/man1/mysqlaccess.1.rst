.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mysqlaccess(1) — Linux manual page
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

   MYSQLACCESS(1)           MariaDB Database System          MYSQLACCESS(1)

NAME
-------------------------------------------------

::

          mysqlaccess - client for checking access privileges


---------------------------------------------------------

::

          mysqlaccess [host_name [user_name [db_name]]] [options]


---------------------------------------------------------------

::

          mysqlaccess is a diagnostic tool written by Yves Carlier. It
          checks the access privileges for a host name, user name, and
          database combination. Note that mysqlaccess checks access using
          only the user, db, and host tables. It does not check table,
          column, or routine privileges specified in the tables_priv,
          columns_priv, or procs_priv tables.

          Invoke mysqlaccess like this:

              shell> mysqlaccess [host_name [user_name [db_name]]] [options]

          mysqlaccess supports the following options.

          •   --help, -?

              Display a help message and exit.

          •   --brief, -b

              Generate reports in single-line tabular format.

          •   --commit

              Copy the new access privileges from the temporary tables to
              the original grant tables. The grant tables must be flushed
              for the new privileges to take effect. (For example, execute
              a mysqladmin reload command.)

          •   --copy

              Reload the temporary grant tables from original ones.

          •   --db=db_name, -d db_name

              Specify the database name.

          •   --debug=N

              Specify the debug level.  N can be an integer from 0 to 3.

          •   --host=host_name, -h host_name

              The host name to use in the access privileges.

          •   --howto

              Display some examples that show how to use mysqlaccess.

          •   --old_server

              Connect to a very old MySQL server (before MySQL 3.21) that
              does not know how to handle full WHERE clauses.

          •   --password[=password], -p[password]

              The password to use when connecting to the server. If you
              omit the password value following the --password or -p option
              on the command line, mysqlaccess prompts for one.

              Specifying a password on the command line should be
              considered insecure. See Section 5.3.2.2, “End-User
              Guidelines for Password Security”.

          •   --plan

              Display suggestions and ideas for future releases.

          •   --preview

              Show the privilege differences after making changes to the
              temporary grant tables.

          •   --relnotes

              Display the release notes.

          •   --rhost=host_name, -H host_name

              Connect to the MariaDB server on the given host.

          •   --rollback

              Undo the most recent changes to the temporary grant tables.

          •   --spassword[=password], -P[password]

              The password to use when connecting to the server as the
              superuser. If you omit the password value following the
              --spassword or -p option on the command line, mysqlaccess
              prompts for one.

              Specifying a password on the command line should be
              considered insecure. See Section 5.3.2.2, “End-User
              Guidelines for Password Security”.

          •   --superuser=user_name, -U user_name

              Specify the user name for connecting as the superuser.

          •   --table, -t

              Generate reports in table format.

          •   --user=user_name, -u user_name

              The user name to use in the access privileges.

          •   --version, -v

              Display version information and exit.

          If your MariaDB distribution is installed in some non-standard
          location, you must change the location where mysqlaccess expects
          to find the mysql client. Edit the mysqlaccess script at
          approximately line 18. Search for a line that looks like this:

              $MYSQL     = ´/usr/local/bin/mysql´;    # path to mysql executable

          Change the path to reflect the location where mysql actually is
          stored on your system. If you do not do this, a Broken pipe error
          will occur when you run mysqlaccess.


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

   MariaDB 10.6                   15 May 2020                MYSQLACCESS(1)

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
