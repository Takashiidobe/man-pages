.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

audit_open(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   AUDIT_OPEN(3)                Linux Audit API               AUDIT_OPEN(3)

NAME
-------------------------------------------------

::

          audit_open - Open a audit netlink socket connection


---------------------------------------------------------

::

          #include <libaudit.h>

          int audit_open(void);


---------------------------------------------------------------

::

          audit_open creates a NETLINK_AUDIT socket for communication with
          the kernel part of the Linux Audit Subsystem. The audit system
          uses the ACK feature of netlink. This means that every message to
          the kernel will return a netlink status packet even if the
          operation succeeds.


-----------------------------------------------------------------

::

          Returns -1 if an error occurs; otherwise, the return value is a
          descriptor referencing the socket.


-----------------------------------------------------

::

          The audit_open() function may fail and set errno for any of the
          errors specified for the socket(2) and fcntl(2) routines.


---------------------------------------------------------

::

          netlink(7).


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

   Red Hat                         Oct 2006                   AUDIT_OPEN(3)

--------------

Pages that refer to this page:
`audit_close(3) <../man3/audit_close.3.html>`__, 
`audit_get_reply(3) <../man3/audit_get_reply.3.html>`__, 
`audit_is_enabled(3) <../man3/audit_is_enabled.3.html>`__, 
`audit_request_rules_list_data(3) <../man3/audit_request_rules_list_data.3.html>`__, 
`audit_request_signal_info(3) <../man3/audit_request_signal_info.3.html>`__, 
`audit_request_status(3) <../man3/audit_request_status.3.html>`__, 
`audit_set_backlog_limit(3) <../man3/audit_set_backlog_limit.3.html>`__, 
`audit_set_backlog_wait_time(3) <../man3/audit_set_backlog_wait_time.3.html>`__, 
`audit_set_failure(3) <../man3/audit_set_failure.3.html>`__, 
`audit_set_pid(3) <../man3/audit_set_pid.3.html>`__, 
`audit_set_rate_limit(3) <../man3/audit_set_rate_limit.3.html>`__, 
`get_auditfail_action(3) <../man3/get_auditfail_action.3.html>`__, 
`set_aumessage_mode(3) <../man3/set_aumessage_mode.3.html>`__

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
