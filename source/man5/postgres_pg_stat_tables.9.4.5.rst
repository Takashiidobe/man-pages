.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

postgres_pg_stat_tables.9.4(5) — Linux manual page
==================================================

::

   #version psql (PostgreSQL) 9.4.5 #table pg_stat_all_tables 000
   pg_stat_all_tables relid 001 pg_stat_all_tables schemaname 002
   pg_stat_all_tables relname 003 pg_stat_all_tables seq_scan 004
   pg_stat_all_tables seq_tup_read 005 pg_stat_all_tables idx_scan
   006 pg_stat_all_tables idx_tup_fetch 007 pg_stat_all_tables
   n_tup_ins 008 pg_stat_all_tables n_tup_upd 009 pg_stat_all_tables
   n_tup_del 010 pg_stat_all_tables n_tup_hot_upd 011
   pg_stat_all_tables n_live_tup 012 pg_stat_all_tables n_dead_tup
   013 pg_stat_all_tables n_mod_since_analyze 014 pg_stat_all_tables
   last_vacuum 015 pg_stat_all_tables last_autovacuum 016
   pg_stat_all_tables last_analyze 017 pg_stat_all_tables
   last_autoanalyze 018 pg_stat_all_tables vacuum_count 019
   pg_stat_all_tables autovacuum_count 020 pg_stat_all_tables
   analyze_count 021 pg_stat_all_tables autoanalyze_count #table
   pg_stat_activity 000 pg_stat_activity datid 001 pg_stat_activity
   datname 002 pg_stat_activity pid 003 pg_stat_activity usesysid
   004 pg_stat_activity usename 005 pg_stat_activity
   application_name 006 pg_stat_activity client_addr 007
   pg_stat_activity client_hostname 008 pg_stat_activity client_port
   009 pg_stat_activity backend_start 010 pg_stat_activity
   xact_start 011 pg_stat_activity query_start 012 pg_stat_activity
   state_change 013 pg_stat_activity waiting 014 pg_stat_activity
   state 015 pg_stat_activity backend_xid 016 pg_stat_activity
   backend_xmin 017 pg_stat_activity query #table pg_stat_bgwriter
   000 pg_stat_bgwriter checkpoints_timed 001 pg_stat_bgwriter
   checkpoints_req 002 pg_stat_bgwriter checkpoint_write_time 003
   pg_stat_bgwriter checkpoint_sync_time 004 pg_stat_bgwriter
   buffers_checkpoint 005 pg_stat_bgwriter buffers_clean 006
   pg_stat_bgwriter maxwritten_clean 007 pg_stat_bgwriter
   buffers_backend 008 pg_stat_bgwriter buffers_backend_fsync 009
   pg_stat_bgwriter buffers_alloc 010 pg_stat_bgwriter stats_reset
   #table pg_stat_database 000 pg_stat_database datid 001
   pg_stat_database datname 002 pg_stat_database numbackends 003
   pg_stat_database xact_commit 004 pg_stat_database xact_rollback
   005 pg_stat_database blks_read 006 pg_stat_database blks_hit 007
   pg_stat_database tup_returned 008 pg_stat_database tup_fetched
   009 pg_stat_database tup_inserted 010 pg_stat_database
   tup_updated 011 pg_stat_database tup_deleted 012 pg_stat_database
   conflicts 013 pg_stat_database temp_files 014 pg_stat_database
   temp_bytes 015 pg_stat_database deadlocks 016 pg_stat_database
   blk_read_time 017 pg_stat_database blk_write_time 018
   pg_stat_database stats_reset #table pg_stat_all_tables 000
   pg_stat_all_tables relid 001 pg_stat_all_tables schemaname 002
   pg_stat_all_tables relname 003 pg_stat_all_tables seq_scan 004
   pg_stat_all_tables seq_tup_read 005 pg_stat_all_tables idx_scan
   006 pg_stat_all_tables idx_tup_fetch 007 pg_stat_all_tables
   n_tup_ins 008 pg_stat_all_tables n_tup_upd 009 pg_stat_all_tables
   n_tup_del 010 pg_stat_all_tables n_tup_hot_upd 011
   pg_stat_all_tables n_live_tup 012 pg_stat_all_tables n_dead_tup
   013 pg_stat_all_tables n_mod_since_analyze 014 pg_stat_all_tables
   last_vacuum 015 pg_stat_all_tables last_autovacuum 016
   pg_stat_all_tables last_analyze 017 pg_stat_all_tables
   last_autoanalyze 018 pg_stat_all_tables vacuum_count 019
   pg_stat_all_tables autovacuum_count 020 pg_stat_all_tables
   analyze_count 021 pg_stat_all_tables autoanalyze_count #table
   pg_stat_sys_tables 000 pg_stat_sys_tables relid 001
   pg_stat_sys_tables schemaname 002 pg_stat_sys_tables relname 003
   pg_stat_sys_tables seq_scan 004 pg_stat_sys_tables seq_tup_read
   005 pg_stat_sys_tables idx_scan 006 pg_stat_sys_tables
   idx_tup_fetch 007 pg_stat_sys_tables n_tup_ins 008
   pg_stat_sys_tables n_tup_upd 009 pg_stat_sys_tables n_tup_del 010
   pg_stat_sys_tables n_tup_hot_upd 011 pg_stat_sys_tables
   n_live_tup 012 pg_stat_sys_tables n_dead_tup 013
   pg_stat_sys_tables n_mod_since_analyze 014 pg_stat_sys_tables
   last_vacuum 015 pg_stat_sys_tables last_autovacuum 016
   pg_stat_sys_tables last_analyze 017 pg_stat_sys_tables
   last_autoanalyze 018 pg_stat_sys_tables vacuum_count 019
   pg_stat_sys_tables autovacuum_count 020 pg_stat_sys_tables
   analyze_count 021 pg_stat_sys_tables autoanalyze_count #table
   pg_stat_all_indexes 000 pg_stat_all_indexes relid 001
   pg_stat_all_indexes indexrelid 002 pg_stat_all_indexes schemaname
   003 pg_stat_all_indexes relname 004 pg_stat_all_indexes
   indexrelname 005 pg_stat_all_indexes idx_scan 006
   pg_stat_all_indexes idx_tup_read 007 pg_stat_all_indexes
   idx_tup_fetch #table pg_stat_sys_indexes 000 pg_stat_sys_indexes
   relid 001 pg_stat_sys_indexes indexrelid 002 pg_stat_sys_indexes
   schemaname 003 pg_stat_sys_indexes relname 004
   pg_stat_sys_indexes indexrelname 005 pg_stat_sys_indexes idx_scan
   006 pg_stat_sys_indexes idx_tup_read 007 pg_stat_sys_indexes
   idx_tup_fetch

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
