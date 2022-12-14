.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

postgres_pg_stat_tables.9.6(7) — Linux manual page
==================================================

::

   #version psql (PostgreSQL) 9.6.7 #table pg_stat_activity 000
   pg_stat_activity datid 001 pg_stat_activity datname 002
   pg_stat_activity pid 003 pg_stat_activity usesysid 004
   pg_stat_activity usename 005 pg_stat_activity application_name
   006 pg_stat_activity client_addr 007 pg_stat_activity
   client_hostname 008 pg_stat_activity client_port 009
   pg_stat_activity backend_start 010 pg_stat_activity xact_start
   011 pg_stat_activity query_start 012 pg_stat_activity
   state_change 013 pg_stat_activity wait_event_type 014
   pg_stat_activity wait_event 015 pg_stat_activity state 016
   pg_stat_activity backend_xid 017 pg_stat_activity backend_xmin
   018 pg_stat_activity query #table pg_stat_bgwriter 000
   pg_stat_bgwriter checkpoints_timed 001 pg_stat_bgwriter
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
   pg_stat_database stats_reset #table pg_stat_database_conflicts
   000 pg_stat_database_conflicts datid 001
   pg_stat_database_conflicts datname 002 pg_stat_database_conflicts
   confl_tablespace 003 pg_stat_database_conflicts confl_lock 004
   pg_stat_database_conflicts confl_snapshot 005
   pg_stat_database_conflicts confl_bufferpin 006
   pg_stat_database_conflicts confl_deadlock #table
   pg_stat_replication 000 pg_stat_replication pid 001
   pg_stat_replication usesysid 002 pg_stat_replication usename 003
   pg_stat_replication application_name 004 pg_stat_replication
   client_addr 005 pg_stat_replication client_hostname 006
   pg_stat_replication client_port 007 pg_stat_replication
   backend_start 008 pg_stat_replication backend_xmin 009
   pg_stat_replication state 010 pg_stat_replication sent_location
   011 pg_stat_replication write_location 012 pg_stat_replication
   flush_location 013 pg_stat_replication replay_location 014
   pg_stat_replication sync_priority 015 pg_stat_replication
   sync_state #table pg_stat_all_tables 000 pg_stat_all_tables relid
   001 pg_stat_all_tables schemaname 002 pg_stat_all_tables relname
   003 pg_stat_all_tables seq_scan 004 pg_stat_all_tables
   seq_tup_read 005 pg_stat_all_tables idx_scan 006
   pg_stat_all_tables idx_tup_fetch 007 pg_stat_all_tables n_tup_ins
   008 pg_stat_all_tables n_tup_upd 009 pg_stat_all_tables n_tup_del
   010 pg_stat_all_tables n_tup_hot_upd 011 pg_stat_all_tables
   n_live_tup 012 pg_stat_all_tables n_dead_tup 013
   pg_stat_all_tables n_mod_since_analyze 014 pg_stat_all_tables
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
   pg_stat_user_tables 000 pg_stat_user_tables relid 001
   pg_stat_user_tables schemaname 002 pg_stat_user_tables relname
   003 pg_stat_user_tables seq_scan 004 pg_stat_user_tables
   seq_tup_read 005 pg_stat_user_tables idx_scan 006
   pg_stat_user_tables idx_tup_fetch 007 pg_stat_user_tables
   n_tup_ins 008 pg_stat_user_tables n_tup_upd 009
   pg_stat_user_tables n_tup_del 010 pg_stat_user_tables
   n_tup_hot_upd 011 pg_stat_user_tables n_live_tup 012
   pg_stat_user_tables n_dead_tup 013 pg_stat_user_tables
   n_mod_since_analyze 014 pg_stat_user_tables last_vacuum 015
   pg_stat_user_tables last_autovacuum 016 pg_stat_user_tables
   last_analyze 017 pg_stat_user_tables last_autoanalyze 018
   pg_stat_user_tables vacuum_count 019 pg_stat_user_tables
   autovacuum_count 020 pg_stat_user_tables analyze_count 021
   pg_stat_user_tables autoanalyze_count #table pg_stat_all_indexes
   000 pg_stat_all_indexes relid 001 pg_stat_all_indexes indexrelid
   002 pg_stat_all_indexes schemaname 003 pg_stat_all_indexes
   relname 004 pg_stat_all_indexes indexrelname 005
   pg_stat_all_indexes idx_scan 006 pg_stat_all_indexes idx_tup_read
   007 pg_stat_all_indexes idx_tup_fetch #table pg_stat_sys_indexes
   000 pg_stat_sys_indexes relid 001 pg_stat_sys_indexes indexrelid
   002 pg_stat_sys_indexes schemaname 003 pg_stat_sys_indexes
   relname 004 pg_stat_sys_indexes indexrelname 005
   pg_stat_sys_indexes idx_scan 006 pg_stat_sys_indexes idx_tup_read
   007 pg_stat_sys_indexes idx_tup_fetch #table pg_stat_user_indexes
   000 pg_stat_user_indexes relid 001 pg_stat_user_indexes
   indexrelid 002 pg_stat_user_indexes schemaname 003
   pg_stat_user_indexes relname 004 pg_stat_user_indexes
   indexrelname 005 pg_stat_user_indexes idx_scan 006
   pg_stat_user_indexes idx_tup_read 007 pg_stat_user_indexes
   idx_tup_fetch #table pg_statio_all_tables 000
   pg_statio_all_tables relid 001 pg_statio_all_tables schemaname
   002 pg_statio_all_tables relname 003 pg_statio_all_tables
   heap_blks_read 004 pg_statio_all_tables heap_blks_hit 005
   pg_statio_all_tables idx_blks_read 006 pg_statio_all_tables
   idx_blks_hit 007 pg_statio_all_tables toast_blks_read 008
   pg_statio_all_tables toast_blks_hit 009 pg_statio_all_tables
   tidx_blks_read 010 pg_statio_all_tables tidx_blks_hit #table
   pg_statio_sys_tables 000 pg_statio_sys_tables relid 001
   pg_statio_sys_tables schemaname 002 pg_statio_sys_tables relname
   003 pg_statio_sys_tables heap_blks_read 004 pg_statio_sys_tables
   heap_blks_hit 005 pg_statio_sys_tables idx_blks_read 006
   pg_statio_sys_tables idx_blks_hit 007 pg_statio_sys_tables
   toast_blks_read 008 pg_statio_sys_tables toast_blks_hit 009
   pg_statio_sys_tables tidx_blks_read 010 pg_statio_sys_tables
   tidx_blks_hit #table pg_statio_user_tables 000
   pg_statio_user_tables relid 001 pg_statio_user_tables schemaname
   002 pg_statio_user_tables relname 003 pg_statio_user_tables
   heap_blks_read 004 pg_statio_user_tables heap_blks_hit 005
   pg_statio_user_tables idx_blks_read 006 pg_statio_user_tables
   idx_blks_hit 007 pg_statio_user_tables toast_blks_read 008
   pg_statio_user_tables toast_blks_hit 009 pg_statio_user_tables
   tidx_blks_read 010 pg_statio_user_tables tidx_blks_hit #table
   pg_statio_all_indexes 000 pg_statio_all_indexes relid 001
   pg_statio_all_indexes indexrelid 002 pg_statio_all_indexes
   schemaname 003 pg_statio_all_indexes relname 004
   pg_statio_all_indexes indexrelname 005 pg_statio_all_indexes
   idx_blks_read 006 pg_statio_all_indexes idx_blks_hit #table
   pg_statio_sys_indexes 000 pg_statio_sys_indexes relid 001
   pg_statio_sys_indexes indexrelid 002 pg_statio_sys_indexes
   schemaname 003 pg_statio_sys_indexes relname 004
   pg_statio_sys_indexes indexrelname 005 pg_statio_sys_indexes
   idx_blks_read 006 pg_statio_sys_indexes idx_blks_hit #table
   pg_statio_user_indexes 000 pg_statio_user_indexes relid 001
   pg_statio_user_indexes indexrelid 002 pg_statio_user_indexes
   schemaname 003 pg_statio_user_indexes relname 004
   pg_statio_user_indexes indexrelname 005 pg_statio_user_indexes
   idx_blks_read 006 pg_statio_user_indexes idx_blks_hit #table
   pg_statio_all_sequences 000 pg_statio_all_sequences relid 001
   pg_statio_all_sequences schemaname 002 pg_statio_all_sequences
   relname 003 pg_statio_all_sequences blks_read 004
   pg_statio_all_sequences blks_hit #table pg_statio_sys_sequences
   000 pg_statio_sys_sequences relid 001 pg_statio_sys_sequences
   schemaname 002 pg_statio_sys_sequences relname 003
   pg_statio_sys_sequences blks_read 004 pg_statio_sys_sequences
   blks_hit #table pg_statio_user_sequences 000
   pg_statio_user_sequences relid 001 pg_statio_user_sequences
   schemaname 002 pg_statio_user_sequences relname 003
   pg_statio_user_sequences blks_read 004 pg_statio_user_sequences
   blks_hit #table pg_stat_user_functions 000 pg_stat_user_functions
   funcid 001 pg_stat_user_functions schemaname 002
   pg_stat_user_functions funcname 003 pg_stat_user_functions calls
   004 pg_stat_user_functions total_time 005 pg_stat_user_functions
   self_time #table pg_stat_xact_user_functions 000
   pg_stat_xact_user_functions funcid 001
   pg_stat_xact_user_functions schemaname 002
   pg_stat_xact_user_functions funcname 003
   pg_stat_xact_user_functions calls 004 pg_stat_xact_user_functions
   total_time 005 pg_stat_xact_user_functions self_time #table
   pg_stat_xact_all_tables 000 pg_stat_xact_all_tables relid 001
   pg_stat_xact_all_tables schemaname 002 pg_stat_xact_all_tables
   relname 003 pg_stat_xact_all_tables seq_scan 004
   pg_stat_xact_all_tables seq_tup_read 005 pg_stat_xact_all_tables
   idx_scan 006 pg_stat_xact_all_tables idx_tup_fetch 007
   pg_stat_xact_all_tables n_tup_ins 008 pg_stat_xact_all_tables
   n_tup_upd 009 pg_stat_xact_all_tables n_tup_del 010
   pg_stat_xact_all_tables n_tup_hot_upd #table
   pg_stat_xact_sys_tables 000 pg_stat_xact_sys_tables relid 001
   pg_stat_xact_sys_tables schemaname 002 pg_stat_xact_sys_tables
   relname 003 pg_stat_xact_sys_tables seq_scan 004
   pg_stat_xact_sys_tables seq_tup_read 005 pg_stat_xact_sys_tables
   idx_scan 006 pg_stat_xact_sys_tables idx_tup_fetch 007
   pg_stat_xact_sys_tables n_tup_ins 008 pg_stat_xact_sys_tables
   n_tup_upd 009 pg_stat_xact_sys_tables n_tup_del 010
   pg_stat_xact_sys_tables n_tup_hot_upd #table pg_active #table
   pg_stat_xact_user_tables 000 pg_stat_xact_user_tables relid 001
   pg_stat_xact_user_tables schemaname 002 pg_stat_xact_user_tables
   relname 003 pg_stat_xact_user_tables seq_scan 004
   pg_stat_xact_user_tables seq_tup_read 005
   pg_stat_xact_user_tables idx_scan 006 pg_stat_xact_user_tables
   idx_tup_fetch 007 pg_stat_xact_user_tables n_tup_ins 008
   pg_stat_xact_user_tables n_tup_upd 009 pg_stat_xact_user_tables
   n_tup_del 010 pg_stat_xact_user_tables n_tup_hot_upd

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
