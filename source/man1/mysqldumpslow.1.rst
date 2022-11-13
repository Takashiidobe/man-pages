.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mysqldumpslow(1) — Linux manual page
====================================

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

   MYSQLDUMPSLOW(1)         MariaDB Database System        MYSQLDUMPSLOW(1)

NAME
-------------------------------------------------

::

          mysqldumpslow - Summarize slow query log files


---------------------------------------------------------

::

          mysqldumpslow [options] [log_file ...]


---------------------------------------------------------------

::

          The MariaDB slow query log contains information about queries
          that take a long time to execute.  mysqldumpslow parses MariaDB
          slow query log files and prints a summary of their contents.

          Normally, mysqldumpslow groups queries that are similar except
          for the particular values of number and string data values. It
          “abstracts” these values to N and ´S´ when displaying summary
          output. The -a and -n options can be used to modify value
          abstracting behavior.

          Invoke mysqldumpslow like this:

              shell> mysqldumpslow [options] [log_file ...]

          mysqldumpslow supports the following options.

          •   --help

              Display a help message and exit.

          •   -a

              Do not abstract all numbers to N and strings to ´S´.

          •   --debug, -d

              Run in debug mode.

          •   -g pattern

              Consider only queries that match the (grep-style) pattern.

          •   -h host_name

              Host name of MariaDB server for *-slow.log file name. The
              value can contain a wildcard. The default is * (match all).

          •   -i name

              Name of server instance (if using mysql.server startup
              script).

          •   -l

              Do not subtract lock time from total time.

          •   -n N

              Abstract numbers with at least N digits within names.

          •   -r

              Reverse the sort order.

          •   -s sort_type

              How to sort the output. The value of sort_type should be
              chosen from the following list:

              •   t, aa: Sort by rows affected or average rows affected

              •   l, ae: Sort by rows examined or aggregate rows examined

              •   l, at: Sort by query time or average query time

              •   l, al: Sort by lock time or average lock time

              •   s, as: Sort by rows sent or average rows sent

              •   c: Sort by count

          •   -t N

              Display only the first N queries in the output.

          •   --verbose, -v

              Verbose mode. Print more information about what the program
              does.

          Example of usage:

              shell> mysqldumpslow
              Reading mysql slow query log from /usr/local/mysql/data/mysqld51-apple-slow.log
              Count: 1  Time=4.32s (4s)  Lock=0.00s (0s)  Rows=0.0 (0), root[root]@localhost
               insert into t2 select * from t1
              Count: 3  Time=2.53s (7s)  Lock=0.00s (0s)  Rows=0.0 (0), root[root]@localhost
               insert into t2 select * from t1 limit N
              Count: 3  Time=2.13s (6s)  Lock=0.00s (0s)  Rows=0.0 (0), root[root]@localhost
               insert into t1 select * from t1


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

   MariaDB 10.6                   15 May 2020              MYSQLDUMPSLOW(1)

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
