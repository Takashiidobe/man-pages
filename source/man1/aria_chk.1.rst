.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

aria_chk(1) — Linux manual page
===============================

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

   ARIA_CHK(1)                   User Commands                  ARIA_CHK(1)

NAME
-------------------------------------------------

::

          aria_chk - Aria table-maintenance utility


---------------------------------------------------------

::

          aria_chk [OPTIONS] tables[.MAI]


---------------------------------------------------------------

::

          Describe, check and repair of Aria tables.  Used without options
          all tables on the command will be checked for errors

      Global options
          -#, --debug=...
                 Output debug log. Often this is 'd:t:o,filename'.

          -H, --HELP
                 Print all argument options sorted alphabetically.

          -?, --help
                 Print all options by groups

          --datadir=path
                 Path for control file (and logs if --logdir not used)

          --logdir=path
                 Path for log files

          --ignore-control-file
                 Don't open the control file. Only use this if you are sure
                 the tables are not in use by another program!

          --require-control-file
                 Abort if we can't find/read the maria_log_control file

          -s, --silent
                 Only print errors.  One can use two -s to make maria_chk
                 very silent.

          -t, --tmpdir=path
                 Path for temporary files. Multiple paths can be specified,
                 separated by colon (:), they will be used in a round-robin
                 fashion.

          -v, --verbose
                 Print more information. This can be used with
                 --description and --check. Use many -v for more verbosity.

          -V, --version
                 Print version and exit.

          -w, --wait
                 Wait if table is locked.

      Check options (check is the default action for aria_chk)
          -c, --check
                 Check table for errors.

          -e, --extend-check
                 Check the table VERY thoroughly.  Only use this in extreme
                 cases as aria_chk should normally be able to find out if
                 the table is ok even without this switch.

          -F, --fast
                 Check only tables that haven't been closed properly.

          -C, --check-only-changed
                 Check only tables that have changed since last check.

          -f, --force
                 Restart with '-r' if there are any errors in the table.
                 States will be updated as with '--update-state'.

          -i, --information
                 Print statistics information about table that is checked.

          -m, --medium-check
                 Faster than extend-check, but only finds 99.99% of all
                 errors.  Should be good enough for most cases.

          -T, --read-only
                 Don't mark table as checked.

          -U, --update-state
                 Mark tables as crashed if any errors were found and clean
                 if check didn't find any errors but table was marked as
                 'not clean' before. This allows one to get rid of warnings
                 like 'table not properly closed'. If table was updated,
                 update also the timestamp for when the check was made.
                 This option is on by default!  Use --skip-update-state to
                 disable.

          --warning-for-wrong-transaction-id

                 Give a warning if we find a transaction id in the table
                 that is bigger than what exists in the control file. Use
                 --skip-... to disable warning

      Recover (repair)/ options (When using '--recover' or '--safe-
          recover')
          -B, --backup
                 Make a backup of the .MAD file as 'filename-time.BAK'.

          --correct-checksum
                 Correct checksum information for table.

          -D, --data-file-length=#
                 Max length of data file (when recreating data file when
                 it's full).

          -e, --extend-check
                 Try to recover every possible row from the data file
                 Normally this will also find a lot of garbage rows; Don't
                 use this option if you are not totally desperate.

          -f, --force
                 Overwrite old temporary files.

          -k, --keys-used=#
                 Tell Aria to update only some specific keys. # is a bit
                 mask of which keys to use. This can be used to get faster
                 inserts.

          --max-record-length=#
                 Skip rows bigger than this if aria_chk can't allocate
                 memory to hold it.

          -r, --recover
                 Can fix almost anything except unique keys that aren't
                 unique.

          -n, --sort-recover
                 Forces recovering with sorting even if the temporary file
                 would be very big.

          -p, --parallel-recover
                 Uses the same technique as '-r' and '-n', but creates all
                 the keys in parallel, in different threads.

          -o, --safe-recover
                 Uses old recovery method; Slower than '-r' but can handle
                 a couple of cases where '-r' reports that it can't fix the
                 data file.

          --transaction-log
                 Log repair command to transaction log. This is needed if
                 one wants to use the aria_read_log to repeat the repair

          --character-sets-dir=...
                 Directory where character sets are.

          --set-collation=name
                 Change the collation used by the index.

          -q, --quick
                 Faster repair by not modifying the data file.  One can
                 give a second '-q' to force aria_chk to modify the
                 original datafile in case of duplicate keys.  NOTE: Tables
                 where the data file is corrupted can't be fixed with this
                 option.

          -u, --unpack
                 Unpack file packed with ariapack.

      Other actions
          -a, --analyze
                 Analyze distribution of keys. Will make some joins in
                 MariaDB faster.  You can check the calculated distribution
                 by using '--description --verbose table_name'.

          --stats_method=name
                 Specifies how index statistics collection code should
                 treat NULLs. Possible values of name are "nulls_unequal"
                 (default for 4.1/5.0), "nulls_equal" (emulate 4.0), and
                 "nulls_ignored".

          -d, --description
                 Prints some information about table.

          -A, --set-auto-increment[=value]
                 Force auto_increment to start at this or higher value If
                 no value is given, then sets the next auto_increment value
                 to the highest used value for the auto key + 1.

          -S, --sort-index
                 Sort index blocks.  This speeds up 'read-next' in
                 applications.

          -R, --sort-records=#
                 Sort records according to an index.  This makes your data
                 much more localized and may speed up things (It may be
                 VERY slow to do a sort the first time!).

          -b,  --block-search=#
                 Find a record, a block at given offset belongs to.

          -z,  --zerofill
                 Fill empty space in data and index files with zeroes.
                 This makes the data file movable between different
                 servers.

          --zerofill-keep-lsn
                 Like --zerofill but does not zero out LSN of data/index
                 pages.

      Variables
          --page_buffer_size=#
                 Size of page buffer. Used by --safe-repair

          --read_buffer_size=#
                 Read buffer size for sequential reads during scanning

          --sort_buffer_size=#
                 Size of sort buffer. Used by --recover

          --sort_key_blocks=#
                 Internal buffer for sorting keys; Don't touch.

          --write_buffer_size=#
                 Write buffer size for sequential writes during repair

          Default options are read from the following files in the given
          order: /etc/my.cnf /etc/mysql/my.cnf ~/.my.cnf

          The following groups are read: aria_chk

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

          myisamchk(1)

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

   aria_chk Ver 1.2                May 2014                     ARIA_CHK(1)

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
