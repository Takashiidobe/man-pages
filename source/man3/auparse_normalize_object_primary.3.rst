.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

auparse_normalize_functions(3) — Linux manual page
==================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   AUPARSE_NORMALIZE_FUNCTIONS(3)inux Audit APIPARSE_NORMALIZE_FUNCTIONS(3)

NAME
-------------------------------------------------

::

          auparse_normalize_get_event_kind, auparse_normalize_subject_kind, auparse_normalize_get_action, auparse_normalize_object_kind, auparse_normalize_how, auparse_normalize_session, auparse_normalize_subject_primary, auparse_normalize_subject_secondary, auparse_normalize_subject_first_attribute, auparse_normalize_subject_next_attribute, auparse_normalize_object_primary, auparse_normalize_object_secondary, auparse_normalize_object_primary2, auparse_normalize_object_first_attribute, auparse_normalize_object_next_attribute, auparse_normalize_get_results, auparse_normalize_key - Access normalized fields


---------------------------------------------------------

::

          #include <auparse.h>

          Metadata Functions:
          const char *auparse_normalize_get_event_kind(auparse_state_t *au);
          const char *auparse_normalize_subject_kind(auparse_state_t *au);
          const char *auparse_normalize_get_action(auparse_state_t *au);
          const char *auparse_normalize_object_kind(auparse_state_t *au);
          const char *auparse_normalize_how(auparse_state_t *au);

          Positioning Functions:
          int auparse_normalize_session(auparse_state_t *au);
          int auparse_normalize_subject_primary(auparse_state_t *au);
          int auparse_normalize_subject_secondary(auparse_state_t *au);
          int auparse_normalize_subject_first_attribute(auparse_state_t *au);
          int auparse_normalize_subject_next_attribute(auparse_state_t *au);
          int auparse_normalize_object_primary(auparse_state_t *au);
          int auparse_normalize_object_secondary(auparse_state_t *au);
          int auparse_normalize_object_primary2(auparse_state_t *au);
          int auparse_normalize_object_first_attribute(auparse_state_t *au);
          int auparse_normalize_object_next_attribute(auparse_state_t *au);
          int auparse_normalize_get_results(auparse_state_t *au);
          int auparse_normalize_key(auparse_state_t *au);


---------------------------------------------------------------

::

          After calling the auparse_normalize function, you will probably
          want to access the audit event data. These function provide
          access to the results of the normalization. There are 2 kinds of
          function, metadata and positioning.

          The metadata functions all return a pointer to a string that
          describes something about the event. This data does not live
          inside the event but is kept in lookup tables inside the auparse
          library.

          The positioning function are different in that they move the
          internal cursor of auparse to the record and field that contains
          the information you want. You then use field accessor functions
          to retrieve the values.


-----------------------------------------------------------------

::

          The positioning functions return < 0 on error, 0 if
          uninitialized, and 1 on success. The metadata functions return
          NULL on error and a pointer to a string on success.


---------------------------------------------------------

::

          auparse_normalize(3), auparse_get_field_str(3),
          auparse_interpret_field(3).


-----------------------------------------------------

::

          Steve Grubb

COLOPHON
---------------------------------------------------------

::

          This page is part of the audit (Linux Audit) project.
          Information about the project can be found at 
          ⟨http://people.redhat.com/sgrubb/audit/⟩.  If you have a bug
          report for this manual page, send it to linux-audit@redhat.com.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/linux-audit/audit-userspace.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-21.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Red Hat                        March 2017 AUPARSE_NORMALIZE_FUNCTIONS(3)

--------------

Pages that refer to this page:
`auparse_normalize(3) <../man3/auparse_normalize.3.html>`__

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
