.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

auditd(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SIGNALS <#SIGNALS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   AUDITD(8)            System Administration Utilities           AUDITD(8)

NAME
-------------------------------------------------

::

          auditd - The Linux Audit daemon


---------------------------------------------------------

::

          auditd
          [-f] [-l] [-n] [-s disable|enable|nochange] [-c <config_dir>]


---------------------------------------------------------------

::

          auditd is the userspace component to the Linux Auditing System.
          It's responsible for writing audit records to the disk. Viewing
          the logs is done with the ausearch or aureport utilities.
          Configuring the audit system or loading rules is done with the
          auditctl utility. During startup, the rules in
          /etc/audit/audit.rules are read by auditctl and loaded into the
          kernel. Alternately, there is also an augenrules program that
          reads rules located in /etc/audit/rules.d/ and compiles them into
          an audit.rules file. The audit daemon itself has some
          configuration options that the admin may wish to customize. They
          are found in the auditd.conf file.


-------------------------------------------------------

::

          -f     leave the audit daemon in the foreground for debugging.
                 Messages also go to stderr rather than the audit log.

          -l     allow the audit daemon to follow symlinks for config
                 files.

          -n     no fork. This is useful for running off of inittab or
                 systemd.

          -s=ENABLE_STATE
                 specify when starting if auditd should change the current
                 value for the kernel enabled flag. Valid values for
                 ENABLE_STATE are "disable", "enable" or "nochange". The
                 default is to enable (and disable when auditd terminates).
                 The value of the enabled flag may be changed during the
                 lifetime of auditd using 'auditctl -e'.

          -c     Specify alternate config file directory. Note that this
                 same directory will be passed to the dispatcher. (default:
                 /etc/audit/)


-------------------------------------------------------

::

          SIGHUP causes auditd to reconfigure. This means that auditd re-
                 reads the configuration file. If there are no syntax
                 errors, it will proceed to implement the requested
                 changes. If the reconfigure is successful, a DAEMON_CONFIG
                 event is recorded in the logs. If not successful, error
                 handling is controlled by space_left_action,
                 admin_space_left_action, disk_full_action, and
                 disk_error_action parameters in auditd.conf.

          SIGTERM
                 caused auditd to discontinue processing audit events,
                 write a shutdown audit event, and exit.

          SIGUSR1
                 causes auditd to immediately rotate the logs. It will
                 consult the max_log_file_action to see if it should keep
                 the logs or not.

          SIGUSR2
                 causes auditd to attempt to resume logging and passing
                 events to plugins. This is usually needed after logging
                 has been suspended or the internal queue is overflowed.
                 Either of these conditions depends on the applicable
                 configuration settings.

          SIGCONT
                 causes auditd to dump a report of internal state to
                 /var/run/auditd.state.


---------------------------------------------------

::

          /etc/audit/auditd.conf - configuration file for audit daemon

          /etc/audit/audit.rules - audit rules to be loaded at startup

          /etc/audit/rules.d/ - directory holding individual sets of rules
          to be compiled into one file by augenrules.

          /etc/audit/plugins.d/ - directory holding individual plugin
          configuration files.

          /var/run/auditd.state - report about internal state.


---------------------------------------------------

::

          A boot param of audit=1 should be added to ensure that all
          processes that run before the audit daemon starts is marked as
          auditable by the kernel. Not doing that will make a few processes
          impossible to properly audit.

          The audit daemon can receive audit events from other audit
          daemons via the audisp-remote plugin. The audit daemon may be
          linked with tcp_wrappers to control which machines can connect.
          If this is the case, you can add an entry to hosts.allow and
          deny.


---------------------------------------------------------

::

          auditd.conf(5), auditd-plugins(5), ausearch(8), aureport(8),
          auditctl(8), augenrules(8), audit.rules(7).


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

   Red Hat                         Sept 2013                      AUDITD(8)

--------------

Pages that refer to this page:
`audit_request_status(3) <../man3/audit_request_status.3.html>`__, 
`audit_set_backlog_limit(3) <../man3/audit_set_backlog_limit.3.html>`__, 
`audit_set_backlog_wait_time(3) <../man3/audit_set_backlog_wait_time.3.html>`__, 
`audit_set_enabled(3) <../man3/audit_set_enabled.3.html>`__, 
`audit_set_failure(3) <../man3/audit_set_failure.3.html>`__, 
`audit_set_pid(3) <../man3/audit_set_pid.3.html>`__, 
`audit_set_rate_limit(3) <../man3/audit_set_rate_limit.3.html>`__, 
`get_auditfail_action(3) <../man3/get_auditfail_action.3.html>`__, 
`set_aumessage_mode(3) <../man3/set_aumessage_mode.3.html>`__, 
`auditd.conf(5) <../man5/auditd.conf.5.html>`__, 
`auditd-plugins(5) <../man5/auditd-plugins.5.html>`__, 
`zos-remote.conf(5) <../man5/zos-remote.conf.5.html>`__, 
`audit.rules(7) <../man7/audit.rules.7.html>`__, 
`audispd-zos-remote(8) <../man8/audispd-zos-remote.8.html>`__, 
`auditctl(8) <../man8/auditctl.8.html>`__, 
`augenrules(8) <../man8/augenrules.8.html>`__, 
`aureport(8) <../man8/aureport.8.html>`__, 
`ausearch(8) <../man8/ausearch.8.html>`__, 
`pam_loginuid(8) <../man8/pam_loginuid.8.html>`__, 
`systemd-update-utmp.service(8) <../man8/systemd-update-utmp.service.8.html>`__

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
