.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_journal_query_unique(3) — Linux manual page
==============================================

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

   SD_JOURNAL_QUERY_UNIQUE(3)d_journal_query_unique_JOURNAL_QUERY_UNIQUE(3)

NAME
-------------------------------------------------

::

          sd_journal_query_unique, sd_journal_enumerate_unique,
          sd_journal_enumerate_available_unique, sd_journal_restart_unique,
          SD_JOURNAL_FOREACH_UNIQUE - Read unique data fields from the
          journal


---------------------------------------------------------

::

          #include <systemd/sd-journal.h>

          int sd_journal_query_unique(sd_journal *j, const char *field);

          int sd_journal_enumerate_available_unique(sd_journal *j,
                                                    const void **data,
                                                    size_t *length);

          int sd_journal_enumerate_unique(sd_journal *j, const void **data,
                                          size_t *length);

          void sd_journal_restart_unique(sd_journal *j);

          SD_JOURNAL_FOREACH_UNIQUE(sd_journal *j, const void *data,
                                    size_t length);


---------------------------------------------------------------

::

          sd_journal_query_unique() queries the journal for all unique
          values the specified field can take. It takes two arguments: the
          journal to query and the field name to look for. Well-known field
          names are listed on systemd.journal-fields(7), but any field can
          be specified. Field names must be specified without a trailing
          "=". After this function has been executed successfully the field
          values may be queried using sd_journal_enumerate_unique() and
          sd_journal_enumerate_available_unique(). Invoking one of those
          calls will change the field name being queried and reset the
          enumeration index to the first field value that matches.

          sd_journal_enumerate_unique() may be used to iterate through all
          data fields which match the previously selected field name as set
          with sd_journal_query_unique(). On each invocation the next field
          data matching the field name is returned. The order of the
          returned data fields is not defined. It takes three arguments:
          the journal object, plus a pair of pointers to pointer/size
          variables where the data object and its size shall be stored. The
          returned data is in a read-only memory map and is only valid
          until the next invocation of sd_journal_enumerate_unique(). Note
          that the data returned will be prefixed with the field name and
          "=". Note that this call is subject to the data field size
          threshold as controlled by sd_journal_set_data_threshold() and
          only the initial part of the field up to the threshold is
          returned. An error is returned for fields which cannot be
          retrieved. See the error list below for details.

          sd_journal_enumerate_available_unique() is similar to
          sd_journal_enumerate_unique(), but silently skips any fields
          which may be valid, but are too large or not supported by current
          implementation.

          sd_journal_restart_unique() resets the data enumeration index to
          the beginning of the list. The next invocation of
          sd_journal_enumerate_unique() will return the first field data
          matching the field name again.

          Note that the SD_JOURNAL_FOREACH_UNIQUE() macro may be used as a
          handy wrapper around sd_journal_restart_unique() and
          sd_journal_enumerate_available_unique().

          Note that these functions currently are not influenced by matches
          set with sd_journal_add_match() but this might change in a later
          version of this software.

          To enumerate all field names currently in use (and thus all
          suitable field parameters for sd_journal_query_unique()), use the
          sd_journal_enumerate_fields(3) call.


-----------------------------------------------------------------

::

          sd_journal_query_unique() returns 0 on success or a negative
          errno-style error code.  sd_journal_enumerate_unique() and
          sd_journal_query_available_unique() return a positive integer if
          the next field data has been read, 0 when no more fields remain,
          or a negative errno-style error code.
          sd_journal_restart_unique() doesn't return anything.

      Errors
          Returned errors may indicate the following problems:

          -EINVAL
              One of the required parameters is NULL or invalid.

          -ECHILD
              The journal object was created in a different process.

          -EADDRNOTAVAIL
              The read pointer is not positioned at a valid entry;
              sd_journal_next(3) or a related call has not been called at
              least once.

          -ENOENT
              The current entry does not include the specified field.

          -ENOBUFS
              A compressed entry is too large.

          -E2BIG
              The data field is too large for this computer architecture
              (e.g. above 4 GB on a 32-bit architecture).

          -EPROTONOSUPPORT
              The journal is compressed with an unsupported method or the
              journal uses an unsupported feature.

          -EBADMSG
              The journal is corrupted (possibly just the entry being
              iterated over).

          -EIO
              An I/O error was reported by the kernel.


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

          Use the SD_JOURNAL_FOREACH_UNIQUE() macro to iterate through all
          values a field of the journal can take (and which can be accessed
          on the given architecture and are not compressed with an
          unsupported mechanism). The following example lists all unit
          names referenced in the journal:

              #include <stdio.h>
              #include <string.h>
              #include <systemd/sd-journal.h>

              int main(int argc, char *argv[]) {
                sd_journal *j;
                const void *d;
                size_t l;
                int r;

                r = sd_journal_open(&j, SD_JOURNAL_LOCAL_ONLY);
                if (r < 0) {
                  fprintf(stderr, "Failed to open journal: %s\n", strerror(-r));
                  return 1;
                }
                r = sd_journal_query_unique(j, "_SYSTEMD_UNIT");
                if (r < 0) {
                  fprintf(stderr, "Failed to query journal: %s\n", strerror(-r));
                  return 1;
                }
                SD_JOURNAL_FOREACH_UNIQUE(j, d, l)
                  printf("%.*s\n", (int) l, (const char*) d);
                sd_journal_close(j);
                return 0;
              }


---------------------------------------------------------

::

          systemd(1), systemd.journal-fields(7), sd-journal(3),
          sd_journal_open(3), sd_journal_enumerate_fields(3),
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

   systemd 249                                   SD_JOURNAL_QUERY_UNIQUE(3)

--------------

Pages that refer to this page:
`sd-journal(3) <../man3/sd-journal.3.html>`__, 
`sd_journal_enumerate_fields(3) <../man3/sd_journal_enumerate_fields.3.html>`__, 
`sd_journal_get_data(3) <../man3/sd_journal_get_data.3.html>`__

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
