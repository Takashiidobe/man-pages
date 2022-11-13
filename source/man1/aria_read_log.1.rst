.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

aria_read_log(1) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ARIA_READ_LOG(1)              User Commands             ARIA_READ_LOG(1)

NAME
-------------------------------------------------

::

          aria_read_log - display Aria log file contents


---------------------------------------------------------

::

          aria_read_log OPTIONS


---------------------------------------------------------------

::

          Display and apply log records from a Aria transaction log found
          in the current directory (for now)

          Note: Aria is compiled without -DIDENTICAL_PAGES_AFTER_RECOVERY
          which means that the table files are not byte-to-byte identical
          to files created during normal execution. This should be ok,
          except for test scripts that tries to compare files before and
          after recovery.

          You need to use one of -d or -a

          -a, --apply
                 Apply log to tables: modifies tables! you should make a
                 backup first!  Displays a lot of information if not run
                 with --silent

          --character-sets-dir=name
                 Directory where character sets are.

          -c, --check
                 if --display-only, check if record is fully readable (for
                 debugging)

          -#, --debug[=name]
                 Output debug log. Often the argument is 'd:t:o,filename'.

          --force-crash=#
                 Force crash after # recovery events

          -?, --help
                 Display this help and exit.

          -d, --display-only
                 display brief info read from records' header

          -e, --end-lsn=#
                 Stop applying at this lsn. If end-lsn is used, UNDO:s will
                 not be applied

          -h, --aria-log-dir-path=name
                 Path to the directory where to store transactional log

          -P, --page-buffer-size=#
                 The size of the buffer used for index blocks for Aria
                 tables

          -o, --start-from-lsn=#
                 Start reading log from this lsn

          -C, --start-from-checkpoint
                 Start applying from last checkpoint

          -s, --silent
                 Print less information during apply/undo phase

          -T, --tables-to-redo=name
                 List of tables separated with , that we should apply REDO
                 on. Use this if you only want to recover some tables

          -t, --tmpdir=name
                 Path for temporary files. Multiple paths can be specified,
                 separated by colon (:)

          --translog-buffer-size=#
                 The size of the buffer used for transaction log for Aria
                 tables

          -u, --undo
                 Apply UNDO records to tables. (disable with
                 --disable-undo) (Defaults to on; use --skip-undo to
                 disable.)

          -v, --verbose
                 Print more information during apply/undo phase

          -V, --version
                 Print version and exit.

          Default options are read from the following files in the given
          order: /etc/my.cnf /etc/mysql/my.cnf ~/.my.cnf

          The following groups are read: aria_read_log

          The following options may be given as the first argument:

          --print-defaults
                 Print the program argument list and exit.

          --no-defaults
                 Don't read default options from any option file.

          --defaults-file=#
                 Only read default options from the given file #.

          --defaults-extra-file=#
                 Read this file after the global files are read.


---------------------------------------------------------

::

          myisamlog(1)

          For more information, please refer to the MariaDB Knowledge Base,
          available online at https://mariadb.com/kb/

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

   aria_read_log Ver 1.3           May 2014                ARIA_READ_LOG(1)

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
