.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd-journal(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| THREAD SAFETY <#THREAD_SAFETY>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD-JOURNAL(3)                  sd-journal                  SD-JOURNAL(3)

NAME
-------------------------------------------------

::

          sd-journal - APIs for submitting and querying log entries to and
          from the journal


---------------------------------------------------------

::

          #include <systemd/sd-journal.h>

          pkg-config --cflags --libs libsystemd


---------------------------------------------------------------

::

          sd-journal.h provides APIs to submit and query log entries. The
          APIs exposed act both as client for the
          systemd-journald.service(8) journal service and as parser for the
          journal files on disk.

          See sd_journal_print(3), sd_journal_stream_fd(3),
          sd_journal_open(3), sd_journal_next(3),
          sd_journal_get_realtime_usec(3), sd_journal_add_match(3),
          sd_journal_seek_head(3), sd_journal_enumerate_fields(3),
          sd_journal_get_cursor(3), sd_journal_get_cutoff_realtime_usec(3),
          sd_journal_get_cutoff_monotonic_usec(3), sd_journal_get_usage(3),
          sd_journal_get_catalog(3), sd_journal_get_fd(3),
          sd_journal_has_runtime_files(3) and
          sd_journal_has_persistent_files(3) for more information about the
          functions implemented.

          Command line access for submitting entries to the journal is
          available with the systemd-cat(1) tool. Command line access for
          querying entries from the journal is available with the
          journalctl(1) tool.


-------------------------------------------------------------------

::

          Functions that operate on sd_journal objects are thread agnostic
          — given sd_journal pointer may only be used from one specific
          thread at all times (and it has to be the very same one during
          the entire lifetime of the object), but multiple, independent
          threads may use multiple, independent objects safely. Other
          functions — those that are used to send entries to the journal,
          like sd_journal_print(3) and similar, or those that are used to
          retrieve global information like sd_journal_stream_fd(3) and
          sd_journal_get_catalog_for_message_id(3) — are fully thread-safe
          and may be called from multiple threads in parallel.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd_journal_print(3), sd_journal_stream_fd(3),
          sd_journal_open(3), sd_journal_next(3), sd_journal_get_data(3),
          sd_journal_get_realtime_usec(3), sd_journal_add_match(3),
          sd_journal_seek_head(3), sd_journal_enumerate_fields(3),
          sd_journal_get_cursor(3), sd_journal_get_cutoff_realtime_usec(3),
          sd_journal_get_cutoff_monotonic_usec(3), sd_journal_get_usage(3),
          sd_journal_get_fd(3), sd_journal_query_unique(3),
          sd_journal_get_catalog(3), sd_journal_has_runtime_files(3),
          sd_journal_has_persistent_files(3), journalctl(1), sd-id128(3),
          pkg-config(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                                SD-JOURNAL(3)

--------------

Pages that refer to this page:
`sd_journal_add_match(3) <../man3/sd_journal_add_match.3.html>`__, 
`sd_journal_enumerate_fields(3) <../man3/sd_journal_enumerate_fields.3.html>`__, 
`sd_journal_get_catalog(3) <../man3/sd_journal_get_catalog.3.html>`__, 
`sd_journal_get_cursor(3) <../man3/sd_journal_get_cursor.3.html>`__, 
`sd_journal_get_cutoff_realtime_usec(3) <../man3/sd_journal_get_cutoff_realtime_usec.3.html>`__, 
`sd_journal_get_data(3) <../man3/sd_journal_get_data.3.html>`__, 
`sd_journal_get_fd(3) <../man3/sd_journal_get_fd.3.html>`__, 
`sd_journal_get_realtime_usec(3) <../man3/sd_journal_get_realtime_usec.3.html>`__, 
`sd_journal_get_usage(3) <../man3/sd_journal_get_usage.3.html>`__, 
`sd_journal_has_runtime_files(3) <../man3/sd_journal_has_runtime_files.3.html>`__, 
`sd_journal_next(3) <../man3/sd_journal_next.3.html>`__, 
`sd_journal_open(3) <../man3/sd_journal_open.3.html>`__, 
`sd_journal_print(3) <../man3/sd_journal_print.3.html>`__, 
`sd_journal_query_unique(3) <../man3/sd_journal_query_unique.3.html>`__, 
`sd_journal_seek_head(3) <../man3/sd_journal_seek_head.3.html>`__, 
`sd_journal_stream_fd(3) <../man3/sd_journal_stream_fd.3.html>`__, 
`systemd.journal-fields(7) <../man7/systemd.journal-fields.7.html>`__, 
`systemd-coredump(8) <../man8/systemd-coredump.8.html>`__, 
`systemd-journald.service(8) <../man8/systemd-journald.service.8.html>`__

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
