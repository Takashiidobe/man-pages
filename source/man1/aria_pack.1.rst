.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

aria_pack(1) — Linux manual page
================================

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

   ARIA_PACK(1)                  User Commands                 ARIA_PACK(1)

NAME
-------------------------------------------------

::

          aria_pack - generate compressed, read-only Aria tables


---------------------------------------------------------

::

          aria_pack [OPTIONS] filename...


---------------------------------------------------------------

::

          Pack a Aria-table to take much less space.  Keys are not updated,
          you must run aria_chk -rq on the index (.MAI) file afterwards to
          update the keys.  You should give the .MAI file as the filename
          argument.  To unpack a packed table, run aria_chk -u on the table

          -b, --backup
                 Make a backup of the table as table_name.OLD.

          --character-sets-dir=name
                 Directory where character sets are.

          -#, --debug[=name]
                 Output debug log. Often this is 'd:t:o,filename'.

          -f, --force
                 Force packing of table even if it gets bigger or if
                 tempfile exists.

          -j, --join=name
                 Join all given tables into 'new_table_name'. All tables
                 MUST have identical layouts.

          -?, --help
                 Display this help and exit.

          -s, --silent
                 Be more silent.

          -T, --tmpdir=name
                 Use temporary directory to store temporary table.

          -t, --test
                 Don't pack table, only test packing it.

          -v, --verbose
                 Write info about progress and packing result. Use many -v
                 for more verbosity!

          -V, --version
                 Output version information and exit.

          -w, --wait
                 Wait and retry if table is in use.

          Default options are read from the following files in the given
          order: /etc/my.cnf /etc/mysql/my.cnf ~/.my.cnf

          The following groups are read: ariapack

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

          myisampack(1)

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

   aria_pack Ver 1.0               May 2014                    ARIA_PACK(1)

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
