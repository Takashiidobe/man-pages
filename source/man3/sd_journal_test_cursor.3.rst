.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_journal_get_cursor(3) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_JOURNAL_GET_CURSOR(3)  sd_journal_get_cursor SD_JOURNAL_GET_CURSOR(3)

NAME
-------------------------------------------------

::

          sd_journal_get_cursor, sd_journal_test_cursor - Get cursor string
          for or test cursor string against the current journal entry


---------------------------------------------------------

::

          #include <systemd/sd-journal.h>

          int sd_journal_get_cursor(sd_journal *j, char **cursor);

          int sd_journal_test_cursor(sd_journal *j, const char *cursor);


---------------------------------------------------------------

::

          sd_journal_get_cursor() returns a cursor string for the current
          journal entry. A cursor is a serialization of the current journal
          position formatted as text. The string only contains printable
          characters and can be passed around in text form. The cursor
          identifies a journal entry globally and in a stable way and may
          be used to later seek to it via sd_journal_seek_cursor(3). The
          cursor string should be considered opaque and not be parsed by
          clients. Seeking to a cursor position without the specific entry
          being available locally will seek to the next closest (in terms
          of time) available entry. The call takes two arguments: a journal
          context object and a pointer to a string pointer where the cursor
          string will be placed. The string is allocated via libc malloc(3)
          and should be freed after use with free(3).

          Note that sd_journal_get_cursor() will not work before
          sd_journal_next(3) (or related call) has been called at least
          once, in order to position the read pointer at a valid entry.

          sd_journal_test_cursor() may be used to check whether the current
          position in the journal matches the specified cursor. This is
          useful since cursor strings do not uniquely identify an entry:
          the same entry might be referred to by multiple different cursor
          strings, and hence string comparing cursors is not possible. Use
          this call to verify after an invocation of
          sd_journal_seek_cursor(3) whether the entry being sought to was
          actually found in the journal or the next closest entry was used
          instead.


-----------------------------------------------------------------

::

          sd_journal_get_cursor() returns 0 on success or a negative
          errno-style error code.  sd_journal_test_cursor() returns
          positive if the current entry matches the specified cursor, 0 if
          it does not match the specified cursor or a negative errno-style
          error code on failure.


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

          systemd(1), sd-journal(3), sd_journal_open(3),
          sd_journal_seek_cursor(3)

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

   systemd 249                                     SD_JOURNAL_GET_CURSOR(3)

--------------

Pages that refer to this page:
`sd-journal(3) <../man3/sd-journal.3.html>`__, 
`sd_journal_next(3) <../man3/sd_journal_next.3.html>`__, 
`sd_journal_open(3) <../man3/sd_journal_open.3.html>`__, 
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
