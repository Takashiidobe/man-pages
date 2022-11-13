.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

get_auditfail_action(3) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GET_AUDITFAIL_ACTION(3) Linux Programmer's ManualGET_AUDITFAIL_ACTION(3)

NAME
-------------------------------------------------

::

          get_auditfail_action - Get failure_action tunable value


---------------------------------------------------------

::

          #include <libaudit.h>

          int get_auditfail_action(auditfail_t *failmode);


---------------------------------------------------------------

::

          This function gets the failure_action tunable value stored in
          /etc/libaudit.conf. get_auditfail_action should be called after
          an audit_open call returns an error to see what action the admin
          prefers.

          The failure_action value found in /etc/libaudit.conf is copied
          into the failmode argument upon function return.  This value
          should then be used by the calling application to determine what
          action should be taken when the audit subsystem is unavailable.


-----------------------------------------------------------------

::

          Upon success, get_auditfail_action returns a zero, and the
          failmode argument will hold the failure_action value.  The
          possible values for failure_action are: FAIL_IGNORE (0), FAIL_LOG
          (1), and FAIL_TERMINATE (2). Upon failure, get_auditfail_action
          returns a return code of one.


-----------------------------------------------------

::

          An error is returned if there is an error reading
          /etc/libaudit.conf or if the failure_action tunable is not found
          in the file.


---------------------------------------------------------

::

                 /* Sample code */
                 auditfail_t failmode;

                 if ((fd = audit_open() ) < 0 ) {
                      fprintf (stderr, "Cannot open netlink audit socket");

                      /* Get the failure_action */
                      if ((rc = get_auditfail_action(&failmode)) == 0) {
                          if (failmode == FAIL_LOG)
                               fprintf (stderr, "Audit subsystem
          unavailable");
                          else if (failmode == FAIL_TERMINATE)
                               exit (1);
                          /* If failmode == FAIL_IGNORE, do nothing */
                      }
                 }


---------------------------------------------------------

::

          audit_open(3), auditd(8).


-----------------------------------------------------

::

          Lisa M. Smith.

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

   Linux 2.7                       2006-7-10        GET_AUDITFAIL_ACTION(3)

--------------

Pages that refer to this page:
`libaudit.conf(5) <../man5/libaudit.conf.5.html>`__

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
