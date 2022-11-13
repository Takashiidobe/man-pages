.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

auparse_next_record(3) — Linux manual page
==========================================

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

   AUPARSE_NEXT_RECORD(3)       Linux Audit API      AUPARSE_NEXT_RECORD(3)

NAME
-------------------------------------------------

::

          auparse_next_record - move record cursor


---------------------------------------------------------

::

          #include <auparse.h>

          int auparse_next_record(auparse_state_t *au);


---------------------------------------------------------------

::

          auparse_next_record will move the internal library cursors to
          point to the next record of the current event. You should not
          call this function from a feed interface callback function. Doing
          so will deadlock the code. In that scenario, you should check the
          number of records in the current event with
          auparse_get_num_records and only call this if there are more
          records.


-----------------------------------------------------------------

::

          Returns -1 if an error occurs, 0 if no more records in current
          event, or 1 for success.


---------------------------------------------------------

::

          auparse_next_event(3),auparse_get_num_records(3).


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

   Red Hat                         Feb 2007          AUPARSE_NEXT_RECORD(3)

--------------

Pages that refer to this page:
`auparse_first_record(3) <../man3/auparse_first_record.3.html>`__, 
`auparse_get_filename(3) <../man3/auparse_get_filename.3.html>`__, 
`auparse_get_line_number(3) <../man3/auparse_get_line_number.3.html>`__, 
`auparse_get_num_fields(3) <../man3/auparse_get_num_fields.3.html>`__, 
`auparse_get_num_records(3) <../man3/auparse_get_num_records.3.html>`__, 
`auparse_get_record_text(3) <../man3/auparse_get_record_text.3.html>`__, 
`auparse_get_type(3) <../man3/auparse_get_type.3.html>`__, 
`auparse_get_type_name(3) <../man3/auparse_get_type_name.3.html>`__, 
`auparse_goto_record_num(3) <../man3/auparse_goto_record_num.3.html>`__, 
`auparse_next_event(3) <../man3/auparse_next_event.3.html>`__, 
`auparse_next_field(3) <../man3/auparse_next_field.3.html>`__

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
