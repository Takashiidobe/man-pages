.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd_journal_get_catalog(3) — Linux manual page
=============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD_JOURNAL_GET_CATALOG(3)sd_journal_get_catalogSD_JOURNAL_GET_CATALOG(3)

NAME
-------------------------------------------------

::

          sd_journal_get_catalog, sd_journal_get_catalog_for_message_id -
          Retrieve message catalog entry


---------------------------------------------------------

::

          #include <systemd/sd-journal.h>

          int sd_journal_get_catalog(sd_journal *j, char **ret);

          int sd_journal_get_catalog_for_message_id(sd_id128_t id,
                                                    char **ret);


---------------------------------------------------------------

::

          sd_journal_get_catalog() retrieves a message catalog entry for
          the current journal entry. This will look up an entry in the
          message catalog by using the "MESSAGE_ID=" field of the current
          journal entry. Before returning the entry all journal field names
          in the catalog entry text enclosed in "@" will be replaced by the
          respective field values of the current entry. If a field name
          referenced in the message catalog entry does not exist, in the
          current journal entry, the "@" will be removed, but the field
          name otherwise left untouched.

          sd_journal_get_catalog_for_message_id() works similar to
          sd_journal_get_catalog() but the entry is looked up by the
          specified message ID (no open journal context is necessary for
          this), and no field substitution is performed.

          For more information about the journal message catalog please
          refer to the Journal Message Catalogs[1] documentation page.


-----------------------------------------------------------------

::

          sd_journal_get_catalog() and
          sd_journal_get_catalog_for_message_id() return 0 on success or a
          negative errno-style error code. If no matching message catalog
          entry is found, -ENOENT is returned.

          On successful return, ret points to a new string, which must be
          freed with free(3).


---------------------------------------------------

::

          Function sd_journal_get_catalog() is thread-agnostic and only a
          single specific thread may operate on a given object during its
          entire lifetime. It's safe to allocate multiple independent
          objects and use each from a specific thread in parallel. However,
          it's not safe to allocate such an object in one thread, and
          operate or free it from any other, even if locking is used to
          ensure these threads don't operate on it at the very same time.

          Function sd_journal_get_catalog_for_message_id() is are
          thread-safe and may be called in parallel from multiple threads.

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), systemd.journal-fields(7), sd-journal(3),
          sd_journal_open(3), sd_journal_next(3), sd_journal_get_data(3),
          malloc(3)

.. _notes-top-1:


---------------------------------------------------

::

           1. Journal Message Catalogs
              https://www.freedesktop.org/wiki/Software/systemd/catalog

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

   systemd 249                                    SD_JOURNAL_GET_CATALOG(3)

--------------

Pages that refer to this page:
`sd-journal(3) <../man3/sd-journal.3.html>`__

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
