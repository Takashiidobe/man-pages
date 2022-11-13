.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

audit_add_rule_data(3) — Linux manual page
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

   AUDIT_ADD_RULE_DATA(3)       Linux Audit API      AUDIT_ADD_RULE_DATA(3)

NAME
-------------------------------------------------

::

          audit_add_rule_data - Add new audit rule


---------------------------------------------------------

::

          #include <libaudit.h>

          int audit_add_rule_data(int fd, struct audit_rule_data *rule, int
          flags, int action);


---------------------------------------------------------------

::

          audit_add_rule_data adds an audit rule previously constructed
          with audit_rule_fieldpair_data(3) to one of several kernel event
          filters. The filter is specified by the flags argument. Possible
          values for flags are:

          •  AUDIT_FILTER_USER - Apply rule to userspace generated
             messages. This is the user filter. Normally all user space
             originating events are accepted. Rules on this filter are
             typically written to block specific events.

          •  AUDIT_FILTER_TASK - Apply rule at task creation (not syscall).
             This is the task filter. It's normally used to exclude an
             application from being audited.

          •  AUDIT_FILTER_EXIT - Apply rule at syscall exit. This is the
             main filter that is used for syscalls and filesystem watches.
             Normally all syscall do not trigger events, so this is
             normally used to specify events that are of interest.

          •  AUDIT_FILTER_EXCLUDE - Apply rule at audit_log_start. This is
             the exclude filter which discards any records that match.  The
             action type is ignored for this filter, defaulting to "never".

          •      AUDIT_FILTER_FS - Apply rule when adding PATH auxiliary
                 records to SYSCALL events. This is the filesystem filter.
                 This is used to ignore PATH records that are not of
                 interest.

          The rule's action has two possible values:

          •  AUDIT_NEVER - Do not build context if rule matches.

          •  AUDIT_ALWAYS - Generate audit record if rule matches.


-----------------------------------------------------------------

::

          The return value is <= 0 on error, otherwise it is the netlink
          sequence id number. This function can have any error that sendto
          would encounter.


---------------------------------------------------------

::

          audit_rule_fieldpair_data(3), audit_delete_rule_data(3),
          auditctl(8).


-----------------------------------------------------

::

          Steve Grubb.

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

   Red Hat                         Aug 2009          AUDIT_ADD_RULE_DATA(3)

--------------

Pages that refer to this page:
`audit_add_watch(3) <../man3/audit_add_watch.3.html>`__, 
`audit_delete_rule_data(3) <../man3/audit_delete_rule_data.3.html>`__, 
`audit_request_rules_list_data(3) <../man3/audit_request_rules_list_data.3.html>`__, 
`audit_set_enabled(3) <../man3/audit_set_enabled.3.html>`__, 
`audit_update_watch_perms(3) <../man3/audit_update_watch_perms.3.html>`__

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
