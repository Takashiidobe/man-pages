.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

audit_log_semanage_message(3) — Linux manual page
=================================================

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

   AUDIT_LOG_SEMANAGE_MESSAGE(3)Linux Audit APIUDIT_LOG_SEMANAGE_MESSAGE(3)

NAME
-------------------------------------------------

::

          audit_log_semanage_message - log a semanage message


---------------------------------------------------------

::

          #include <libaudit.h>

          int audit_log_semanage_message(int audit_fd, int type, const char
          *pgname, const char *op, const char *name, unsigned int id, const
          char *new_seuser, const char *new_role, const char *new_range,
          const char *old_seuser, const char *old_role, const char
          *old_range, const char *host, const char *addr, const char *tty,
          int result)


---------------------------------------------------------------

::

          This function will log a message to the audit system using a
          predefined message format. It should be used for all SE Linux
          user and role manipulation operations. The function parameters
          are as follows:

          audit_fd - The fd returned by audit_open
          type - type of message: AUDIT_ROLE_ASSIGN/REMOVE for changing any SE Linux user or role attributes.
          pgname - program's name
          op  -  operation. "adding-user", "adding-role", "deleting-user", "deleting-role"
          name - user's account. If not available use NULL.
          id  -  uid that the operation is being performed on. This is used only when name is NULL.
          new_seuser - the new seuser that the login user is getting
          new_role - the new_role that the login user is getting
          new_range - the new mls range that the login user is getting
          old_seuser - the old seuser that the login usr had
          old_role - the old role that the login user had
          old_range - the old mls range that the login usr had
          host - The hostname if known
          addr - The network address of the user
          tty  - The tty of the user
          result - 1 is "success" and 0 is "failed"


-----------------------------------------------------------------

::

          It returns the sequence number which is > 0 on success or <= 0 on
          error.


-----------------------------------------------------

::

          This function returns -1 on failure. Examine errno for more info.


---------------------------------------------------------

::

          audit_log_user_message(3), audit_log_acct_message(3),
          audit_log_user_avc_message(3), audit_log_user_comm_message(3).


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

   Red Hat                         Jan 2012   AUDIT_LOG_SEMANAGE_MESSAGE(3)

--------------

Pages that refer to this page:
`audit_encode_nv_string(3) <../man3/audit_encode_nv_string.3.html>`__, 
`audit_log_acct_message(3) <../man3/audit_log_acct_message.3.html>`__, 
`audit_log_user_avc_message(3) <../man3/audit_log_user_avc_message.3.html>`__, 
`audit_log_user_command(3) <../man3/audit_log_user_command.3.html>`__, 
`audit_log_user_comm_message(3) <../man3/audit_log_user_comm_message.3.html>`__, 
`audit_log_user_message(3) <../man3/audit_log_user_message.3.html>`__

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
