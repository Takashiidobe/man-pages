.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_journal_enumerate_fields(3) — Linux manual page
==================================================

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

   SD_JOURNAL_ENUMERATE_FIELDS(3)nal_enumerate_fieldsAL_ENUMERATE_FIELDS(3)

NAME
-------------------------------------------------

::

          sd_journal_enumerate_fields, sd_journal_restart_fields,
          SD_JOURNAL_FOREACH_FIELD - Read used field names from the journal


---------------------------------------------------------

::

          #include <systemd/sd-journal.h>

          int sd_journal_enumerate_fields(sd_journal *j,
                                          const char **field);

          void sd_journal_restart_fields(sd_journal *j);

          SD_JOURNAL_FOREACH_FIELD(sd_journal *j, const char *field);


---------------------------------------------------------------

::

          sd_journal_enumerate_fields() may be used to iterate through all
          field names used in the opened journal files. On each invocation
          the next field name is returned. The order of the returned field
          names is not defined. It takes two arguments: the journal context
          object, plus a pointer to a constant string pointer where the
          field name is stored in. The returned data is in a read-only
          memory map and is only valid until the next invocation of
          sd_journal_enumerate_fields(). Note that this call is subject to
          the data field size threshold as controlled by
          sd_journal_set_data_threshold().

          sd_journal_restart_fields() resets the field name enumeration
          index to the beginning of the list. The next invocation of
          sd_journal_enumerate_fields() will return the first field name
          again.

          The SD_JOURNAL_FOREACH_FIELD() macro may be used as a handy
          wrapper around sd_journal_restart_fields() and
          sd_journal_enumerate_fields().

          These functions currently are not influenced by matches set with
          sd_journal_add_match() but this might change in a later version
          of this software.

          To retrieve the possible values a specific field can take use
          sd_journal_query_unique(3).


-----------------------------------------------------------------

::

          sd_journal_enumerate_fields() returns a positive integer if the
          next field name has been read, 0 when no more field names are
          known, or a negative errno-style error code.
          sd_journal_restart_fields() returns nothing.


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

          Use the SD_JOURNAL_FOREACH_FIELD() macro to iterate through all
          field names in use in the current journal.

              #include <stdio.h>
              #include <string.h>
              #include <systemd/sd-journal.h>

              int main(int argc, char *argv[]) {
                      sd_journal *j;
                      const char *field;
                      int r;

                      r = sd_journal_open(&j, SD_JOURNAL_LOCAL_ONLY);
                      if (r < 0) {
                              fprintf(stderr, "Failed to open journal: %s\n", strerror(-r));
                              return 1;
                      }
                      SD_JOURNAL_FOREACH_FIELD(j, field)
                              printf("%s\n", field);
                      sd_journal_close(j);
                      return 0;
              }


---------------------------------------------------------

::

          systemd(1), systemd.journal-fields(7), sd-journal(3),
          sd_journal_open(3), sd_journal_query_unique(3),
          sd_journal_get_data(3), sd_journal_add_match(3)

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

   systemd 249                               SD_JOURNAL_ENUMERATE_FIELDS(3)

--------------

Pages that refer to this page:
`sd-journal(3) <../man3/sd-journal.3.html>`__, 
`sd_journal_query_unique(3) <../man3/sd_journal_query_unique.3.html>`__

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
