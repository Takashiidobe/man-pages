.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ausearch_add_item(3) — Linux manual page
========================================

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

   AUSEARCH_ADD_ITEM(3)         Linux Audit API        AUSEARCH_ADD_ITEM(3)

NAME
-------------------------------------------------

::

          ausearch_add_item - build up search rule


---------------------------------------------------------

::

          #include <auparse.h>

          int ausearch_add_item(auparse_state_t *au, const char *field,
          const char *op, const char *value, ausearch_rule_t how);


---------------------------------------------------------------

::

          ausearch_add_item adds one search condition to the current audit
          search expression. The search conditions can then be used to scan
          logs, files, or buffers for something of interest. The field
          value is the field name that the value will be checked for. The
          op variable describes what kind of check is to be done. Legal op
          values are:

                 exists
                         just check that a field name exists

                 =
                         locate the field name and check that the value
                        associated with it is equal to the value given in
                        this rule.

                 !=
                         locate the field name and check that the value
                        associated with it is NOT equal to the value given
                        in this rule.

          The value parameter is compared to the uninterpreted field value.
          If you are trying to match against a field who's type is
          AUPARSE_TYPE_ESCAPED, you will want to use the
          ausearch_add_interpreted_item() function instead.

          The how value determines how this search condition will affect
          the existing search expression if one is already defined. The
          possible values are:

                 AUSEARCH_RULE_CLEAR
                        Clear the current search expression, if any, and
                        use only this search condition.

                 AUSEARCH_RULE_OR
                        If a search expression E is already configured,
                        replace it by (E || this_search_condition).

                 AUSEARCH_RULE_AND
                        If a search expression E is already configured,
                        replace it by (E && this_search_condition).


-----------------------------------------------------------------

::

          Returns -1 if an error occurs; otherwise, 0 for success.


---------------------------------------------------------

::

          ausearch_add_expression(3), ausearch_add_interpreted_item(3),
          ausearch_add_timestamp_item(3), ausearch_add_regex(3),
          ausearch_set_stop(3), ausearch_clear(3), ausearch_next_event(3),
          ausearch-expression(5).


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

   Red Hat                         Feb 2012            AUSEARCH_ADD_ITEM(3)

--------------

Pages that refer to this page:
`ausearch_add_expression(3) <../man3/ausearch_add_expression.3.html>`__, 
`ausearch_add_interpreted_item(3) <../man3/ausearch_add_interpreted_item.3.html>`__, 
`ausearch_add_regex(3) <../man3/ausearch_add_regex.3.html>`__, 
`ausearch_add_timestamp_item(3) <../man3/ausearch_add_timestamp_item.3.html>`__, 
`ausearch_add_timestamp_item_ex(3) <../man3/ausearch_add_timestamp_item_ex.3.html>`__, 
`ausearch_clear(3) <../man3/ausearch_clear.3.html>`__, 
`ausearch_next_event(3) <../man3/ausearch_next_event.3.html>`__, 
`ausearch_set_stop(3) <../man3/ausearch_set_stop.3.html>`__

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
