.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_journal_add_match(3) — Linux manual page
===========================================

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

   SD_JOURNAL_ADD_MATCH(3)   sd_journal_add_match   SD_JOURNAL_ADD_MATCH(3)

NAME
-------------------------------------------------

::

          sd_journal_add_match, sd_journal_add_disjunction,
          sd_journal_add_conjunction, sd_journal_flush_matches - Add or
          remove entry matches


---------------------------------------------------------

::

          #include <systemd/sd-journal.h>

          int sd_journal_add_match(sd_journal *j, const void *data,
                                   size_t size);

          int sd_journal_add_disjunction(sd_journal *j);

          int sd_journal_add_conjunction(sd_journal *j);

          void sd_journal_flush_matches(sd_journal *j);


---------------------------------------------------------------

::

          sd_journal_add_match() adds a match by which to filter the
          entries of the journal file. Matches applied with this call will
          filter what can be iterated through and read from the journal
          file via calls like sd_journal_next(3) and
          sd_journal_get_data(3). Parameter data must be of the form
          "FIELD=value", where the FIELD part is a short uppercase string
          consisting only of 0–9, A–Z and the underscore; it may not begin
          with two underscores or be the empty string. The value part may
          be anything, including binary. Parameter size specifies the
          number of bytes in data (i.e. the length of FIELD, plus one, plus
          the length of value). Parameter size may also be specified as 0,
          in which case data must be a NUL-terminated string, and the bytes
          before the terminating zero are used as the match.

          If a match is applied, only entries with this field set will be
          iterated. Multiple matches may be active at the same time: If
          they apply to different fields, only entries with both fields set
          like this will be iterated. If they apply to the same fields,
          only entries where the field takes one of the specified values
          will be iterated. Well known fields are documented in
          systemd.journal-fields(7). Whenever a new match is added the
          current entry position is reset, and sd_journal_next(3) (or a
          similar call) needs to be called before entries can be read
          again.

          sd_journal_add_disjunction() may be used to insert a disjunction
          (i.e. logical OR) in the match list. If this call is invoked, all
          previously added matches since the last invocation of
          sd_journal_add_disjunction() or sd_journal_add_conjunction() are
          combined in an OR with all matches added afterwards, until
          sd_journal_add_disjunction() or sd_journal_add_conjunction() is
          invoked again to begin the next OR or AND term.

          sd_journal_add_conjunction() may be used to insert a conjunction
          (i.e. logical AND) in the match list. If this call is invoked,
          all previously added matches since the last invocation of
          sd_journal_add_conjunction() are combined in an AND with all
          matches added afterwards, until sd_journal_add_conjunction() is
          invoked again to begin the next AND term. The combination of
          sd_journal_add_match(), sd_journal_add_disjunction() and
          sd_journal_add_conjunction() may be used to build complex search
          terms, even though full logical expressions are not available.
          Note that sd_journal_add_conjunction() operates one level
          'higher' than sd_journal_add_disjunction(). It is hence possible
          to build an expression of AND terms, consisting of OR terms,
          consisting of AND terms, consisting of OR terms of matches (the
          latter OR expression is implicitly created for matches with the
          same field name, see above).

          sd_journal_flush_matches() may be used to flush all matches,
          disjunction and conjunction terms again. After this call all
          filtering is removed and all entries in the journal will be
          iterated again.

          Note that filtering via matches only applies to the way the
          journal is read, it has no effect on storage on disk.


-----------------------------------------------------------------

::

          sd_journal_add_match(), sd_journal_add_disjunction() and
          sd_journal_add_conjunction() return 0 on success or a negative
          errno-style error code.  sd_journal_flush_matches() returns
          nothing.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          The following example adds matches to a journal context object to
          iterate only through messages generated by the Avahi service at
          the four error log levels, plus all messages of the message ID
          03bb1dab98ab4ecfbf6fff2738bdd964 coming from any service (this
          example lacks the necessary error checking):

              ...
              int add_matches(sd_journal *j) {
                sd_journal_add_match(j, "_SYSTEMD_UNIT=avahi-daemon.service", 0);
                sd_journal_add_match(j, "PRIORITY=0", 0);
                sd_journal_add_match(j, "PRIORITY=1", 0);
                sd_journal_add_match(j, "PRIORITY=2", 0);
                sd_journal_add_match(j, "PRIORITY=3", 0);
                sd_journal_add_disjunction(j);
                sd_journal_add_match(j, "MESSAGE_ID=03bb1dab98ab4ecfbf6fff2738bdd964", 0);
              }


---------------------------------------------------------

::

          systemd(1), sd-journal(3), sd_journal_open(3),
          sd_journal_next(3), sd_journal_get_data(3),
          systemd.journal-fields(7)

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

   systemd 249                                      SD_JOURNAL_ADD_MATCH(3)

--------------

Pages that refer to this page:
`sd-journal(3) <../man3/sd-journal.3.html>`__, 
`sd_journal_enumerate_fields(3) <../man3/sd_journal_enumerate_fields.3.html>`__, 
`sd_journal_query_unique(3) <../man3/sd_journal_query_unique.3.html>`__, 
`systemd.journal-fields(7) <../man7/systemd.journal-fields.7.html>`__

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
