.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_journal_next(3) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_JOURNAL_NEXT(3)           sd_journal_next          SD_JOURNAL_NEXT(3)

NAME
-------------------------------------------------

::

          sd_journal_next, sd_journal_previous, sd_journal_next_skip,
          sd_journal_previous_skip, SD_JOURNAL_FOREACH,
          SD_JOURNAL_FOREACH_BACKWARDS - Advance or set back the read
          pointer in the journal


---------------------------------------------------------

::

          #include <systemd/sd-journal.h>

          int sd_journal_next(sd_journal *j);

          int sd_journal_previous(sd_journal *j);

          int sd_journal_next_skip(sd_journal *j, uint64_t skip);

          int sd_journal_previous_skip(sd_journal *j, uint64_t skip);

          SD_JOURNAL_FOREACH(sd_journal *j);

          SD_JOURNAL_FOREACH_BACKWARDS(sd_journal *j);


---------------------------------------------------------------

::

          sd_journal_next() advances the read pointer into the journal by
          one entry. The only argument taken is a journal context object as
          allocated via sd_journal_open(3). After successful invocation the
          entry may be read with functions such as sd_journal_get_data(3).

          Similarly, sd_journal_previous() sets the read pointer back one
          entry.

          sd_journal_next_skip() and sd_journal_previous_skip() advance/set
          back the read pointer by multiple entries at once, as specified
          in the skip parameter. The skip parameter must be less than or
          equal to 2147483647 (2^31-1).

          The journal is strictly ordered by reception time, and hence
          advancing to the next entry guarantees that the entry then
          pointing to is later in time than then previous one, or has the
          same timestamp.

          Note that sd_journal_get_data(3) and related calls will fail
          unless sd_journal_next() has been invoked at least once in order
          to position the read pointer on a journal entry.

          Note that the SD_JOURNAL_FOREACH() macro may be used as a wrapper
          around sd_journal_seek_head(3) and sd_journal_next() in order to
          make iterating through the journal easier. See below for an
          example. Similarly, SD_JOURNAL_FOREACH_BACKWARDS() may be used
          for iterating the journal in reverse order.


-----------------------------------------------------------------

::

          The four calls return the number of entries advanced/set back on
          success or a negative errno-style error code. When the end or
          beginning of the journal is reached, a number smaller than
          requested is returned. More specifically, if sd_journal_next() or
          sd_journal_previous() reach the end/beginning of the journal they
          will return 0, instead of 1 when they are successful. This should
          be considered an EOF marker.


---------------------------------------------------

::

          All functions listed here are thread-agnostic and only a single
          specific thread may operate on a given object during its entire
          lifetime. It's safe to allocate multiple independent objects and
          use each from a specific thread in parallel. However, it's not
          safe to allocate such an object in one thread, and operate or
          free it from any other, even if locking is used to ensure these
          threads don't operate on it at the very same time.

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          Iterating through the journal:

              #include <stdio.h>
              #include <string.h>
              #include <systemd/sd-journal.h>

              int main(int argc, char *argv[]) {
                int r;
                sd_journal *j;
                r = sd_journal_open(&j, SD_JOURNAL_LOCAL_ONLY);
                if (r < 0) {
                  fprintf(stderr, "Failed to open journal: %s\n", strerror(-r));
                  return 1;
                }
                SD_JOURNAL_FOREACH(j) {
                  const char *d;
                  size_t l;

                  r = sd_journal_get_data(j, "MESSAGE", (const void **)&d, &l);
                  if (r < 0) {
                    fprintf(stderr, "Failed to read message field: %s\n", strerror(-r));
                    continue;
                  }

                  printf("%.*s\n", (int) l, d);
                }
                sd_journal_close(j);
                return 0;
              }


---------------------------------------------------------

::

          systemd(1), sd-journal(3), sd_journal_open(3),
          sd_journal_get_data(3), sd_journal_get_realtime_usec(3),
          sd_journal_get_cursor(3)

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

   systemd 249                                           SD_JOURNAL_NEXT(3)

--------------

Pages that refer to this page:
`sd-journal(3) <../man3/sd-journal.3.html>`__, 
`sd_journal_add_match(3) <../man3/sd_journal_add_match.3.html>`__, 
`sd_journal_get_catalog(3) <../man3/sd_journal_get_catalog.3.html>`__, 
`sd_journal_get_cursor(3) <../man3/sd_journal_get_cursor.3.html>`__, 
`sd_journal_get_data(3) <../man3/sd_journal_get_data.3.html>`__, 
`sd_journal_get_fd(3) <../man3/sd_journal_get_fd.3.html>`__, 
`sd_journal_get_realtime_usec(3) <../man3/sd_journal_get_realtime_usec.3.html>`__, 
`sd_journal_open(3) <../man3/sd_journal_open.3.html>`__, 
`sd_journal_query_unique(3) <../man3/sd_journal_query_unique.3.html>`__, 
`sd_journal_seek_head(3) <../man3/sd_journal_seek_head.3.html>`__

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
