.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

myrocks_hotbackup(1) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MYROCKS_HOTBACKUP(1)     MariaDB Database System    MYROCKS_HOTBACKUP(1)

NAME
-------------------------------------------------

::

          myrocks_hotbackup - streaming backup for MariaDB MyRocks


---------------------------------------------------------------

::

          Usage:

          Backup: set -o pipefail; myrocks_hotbackup --user=root
          --password=pw --port=3306 --checkpoint_dir=<directory where
          temporary backup hard links are created> | ssh -o NoneEnabled=yes
          remote_server 'tar -xi -C <directory on remote server where
          backups will be sent>' . You need to execute backup command on a
          server where you take backups.

          Backup using WDT: myrocks_hotbackup --user=root --password=pw
          --stream=wdt --checkpoint_dir=<directory where temporary backup
          hard links are created> --destination=<remote host name>
          --backup_dir=<remote directory name>. This has to be executed at
          the src host.

          Move-Back: myrocks_hotbackup --move_back --datadir=<dest mysql
          datadir> --rocksdb_datadir=<dest rocksdb datadir>
          --rocksdb_waldir=<dest rocksdb wal dir> --backup_dir=<where
          backup files are stored> . You need to execute move-back command
          on a server where backup files are sent.


-------------------------------------------------------

::

          -h, --help
                 show this help message and exit

          -i CHECKPOINT_INTERVAL, --interval=CHECKPOINT_INTERVAL
                 Number of seconds to renew checkpoint

          -c CHECKPOINT_DIRECTORY, --checkpoint_dir=CHECKPOINT_DIRECTORY
                 Local directory name where checkpoints will be created.

          -d DATADIR, --datadir=DATADIR
                 backup mode: src MySQL datadir. move_back mode: dest MySQL
                 datadir

          -s OUTPUT_STREAM, --stream=OUTPUT_STREAM
                 Setting streaming backup options. Currently tar, WDT and
                 xbstream are supported. Default is tar

          --destination=DESTINATION
                 Remote server name. Only used for WDT mode so far.

          --avg_mbytes_per_sec=AVG_MBYTES_PER_SEC
                 Average backup rate in MBytes/sec. WDT only.

          --extra_wdt_sender_options=EXTRA_WDT_SENDER_OPTIONS
                 Extra options for WDT sender

          --extra_wdt_receiver_options=EXTRA_WDT_RECEIVER_OPTIONS
                 Extra options for WDT receiver

          -u MYSQL_USER, --user=MYSQL_USER
                 MySQL user name

          -p MYSQL_PASSWORD, --password=MYSQL_PASSWORD
                 MySQL password name

          -P MYSQL_PORT, --port=MYSQL_PORT
                 MySQL port number

          -S MYSQL_SOCKET, --socket=MYSQL_SOCKET
                 MySQL socket path. Takes precedence over --port.

          -m, --move_back
                 Moving MyRocks backup files to proper locations.

          -r ROCKSDB_DATADIR, --rocksdb_datadir=ROCKSDB_DATADIR
                 RocksDB target data directory where backup data files will
                 be moved. Must be empty.

          -w ROCKSDB_WALDIR, --rocksdb_waldir=ROCKSDB_WALDIR
                 RocksDB target data directory where backup wal files will
                 be moved. Must be empty.

          -b BACKUPDIR, --backup_dir=BACKUPDIR
                 backup mode for WDT: Remote directory to store backup.
                 move_back mode: Locations where backup files are stored.

          -f, --skip_check_frm_timestamp
                 skipping to check if frm files are updated after starting
                 backup.

          -D DEBUG_SIGNAL_FILE, --debug_signal_file=DEBUG_SIGNAL_FILE
                 debugging purpose: waiting until the specified file is
                 created


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

   MariaDB 10.6                   15 May 2020          MYROCKS_HOTBACKUP(1)

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
