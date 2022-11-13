.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

PAM(8) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `ERRORS <#ERRORS>`__ \|           |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM(8)                      Linux-PAM Manual                      PAM(8)

NAME
-------------------------------------------------

::

          PAM, pam - Pluggable Authentication Modules for Linux


---------------------------------------------------------------

::

          This manual is intended to offer a quick introduction to
          Linux-PAM. For more information the reader is directed to the
          Linux-PAM system administrators' guide.

          Linux-PAM is a system of libraries that handle the authentication
          tasks of applications (services) on the system. The library
          provides a stable general interface (Application Programming
          Interface - API) that privilege granting programs (such as
          login(1) and su(1)) defer to to perform standard authentication
          tasks.

          The principal feature of the PAM approach is that the nature of
          the authentication is dynamically configurable. In other words,
          the system administrator is free to choose how individual
          service-providing applications will authenticate users. This
          dynamic configuration is set by the contents of the single
          Linux-PAM configuration file /etc/pam.conf. Alternatively, the
          configuration can be set by individual configuration files
          located in the /etc/pam.d/ directory. The presence of this
          directory will cause Linux-PAM to ignore/etc/pam.conf.

          Vendor-supplied PAM configuration files might be installed in the
          system directory /usr/lib/pam.d/ instead of the machine
          configuration directory /etc/pam.d/. If no machine configuration
          file is found, the vendor-supplied file is used. All files in
          /etc/pam.d/ override files with the same name in /usr/lib/pam.d/.

          From the point of view of the system administrator, for whom this
          manual is provided, it is not of primary importance to understand
          the internal behavior of the Linux-PAM library. The important
          point to recognize is that the configuration file(s) define the
          connection between applications (services) and the pluggable
          authentication modules (PAMs) that perform the actual
          authentication tasks.

          Linux-PAM separates the tasks of authentication into four
          independent management groups: account management; authentication
          management; password management; and session management. (We
          highlight the abbreviations used for these groups in the
          configuration file.)

          Simply put, these groups take care of different aspects of a
          typical user's request for a restricted service:

          account - provide account verification types of service: has the
          user's password expired?; is this user permitted access to the
          requested service?

          authentication - authenticate a user and set up user credentials.
          Typically this is via some challenge-response request that the
          user must satisfy: if you are who you claim to be please enter
          your password. Not all authentications are of this type, there
          exist hardware based authentication schemes (such as the use of
          smart-cards and biometric devices), with suitable modules, these
          may be substituted seamlessly for more standard approaches to
          authentication - such is the flexibility of Linux-PAM.

          password - this group's responsibility is the task of updating
          authentication mechanisms. Typically, such services are strongly
          coupled to those of the auth group. Some authentication
          mechanisms lend themselves well to being updated with such a
          function. Standard UN*X password-based access is the obvious
          example: please enter a replacement password.

          session - this group of tasks cover things that should be done
          prior to a service being given and after it is withdrawn. Such
          tasks include the maintenance of audit trails and the mounting of
          the user's home directory. The session management group is
          important as it provides both an opening and closing hook for
          modules to affect the services available to a user.


---------------------------------------------------

::

          /etc/pam.conf
              the configuration file

          /etc/pam.d
              the Linux-PAM configuration directory. Generally, if this
              directory is present, the /etc/pam.conf file is ignored.

          /usr/lib/pam.d
              the Linux-PAM vendor configuration directory. Files in
              /etc/pam.d override files with the same name in this
              directory.


-----------------------------------------------------

::

          Typically errors generated by the Linux-PAM system of libraries,
          will be written to syslog(3).


-------------------------------------------------------------------

::

          DCE-RFC 86.0, October 1995. Contains additional features, but
          remains backwardly compatible with this RFC.


---------------------------------------------------------

::

          pam(3), pam_authenticate(3), pam_sm_setcred(3), pam_strerror(3),
          PAM(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the linux-pam (Pluggable Authentication
          Modules for Linux) project.  Information about the project can be
          found at ⟨http://www.linux-pam.org/⟩.  If you have a bug report
          for this manual page, see ⟨//www.linux-pam.org/⟩.  This page was
          obtained from the tarball Linux-PAM-1.3.0.tar.bz2 fetched from
          ⟨http://www.linux-pam.org/library/⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Linux-PAM Manual               04/01/2016                         PAM(8)

--------------

Pages that refer to this page: `runuser(1) <../man1/runuser.1.html>`__, 
`su(1) <../man1/su.1.html>`__, 
`misc_conv(3) <../man3/misc_conv.3.html>`__, 
`pam_acct_mgmt(3) <../man3/pam_acct_mgmt.3.html>`__, 
`pam_authenticate(3) <../man3/pam_authenticate.3.html>`__, 
`pam_chauthtok(3) <../man3/pam_chauthtok.3.html>`__, 
`pam_conv(3) <../man3/pam_conv.3.html>`__, 
`pam_error(3) <../man3/pam_error.3.html>`__, 
`pam_get_authtok(3) <../man3/pam_get_authtok.3.html>`__, 
`pam_getenv(3) <../man3/pam_getenv.3.html>`__, 
`pam_getenvlist(3) <../man3/pam_getenvlist.3.html>`__, 
`pam_info(3) <../man3/pam_info.3.html>`__, 
`pam_misc_drop_env(3) <../man3/pam_misc_drop_env.3.html>`__, 
`pam_misc_paste_env(3) <../man3/pam_misc_paste_env.3.html>`__, 
`pam_misc_setenv(3) <../man3/pam_misc_setenv.3.html>`__, 
`pam_prompt(3) <../man3/pam_prompt.3.html>`__, 
`pam_putenv(3) <../man3/pam_putenv.3.html>`__, 
`pam_sm_acct_mgmt(3) <../man3/pam_sm_acct_mgmt.3.html>`__, 
`pam_sm_authenticate(3) <../man3/pam_sm_authenticate.3.html>`__, 
`pam_sm_chauthtok(3) <../man3/pam_sm_chauthtok.3.html>`__, 
`pam_sm_close_session(3) <../man3/pam_sm_close_session.3.html>`__, 
`pam_sm_open_session(3) <../man3/pam_sm_open_session.3.html>`__, 
`pam_sm_setcred(3) <../man3/pam_sm_setcred.3.html>`__, 
`pam_strerror(3) <../man3/pam_strerror.3.html>`__, 
`pam_syslog(3) <../man3/pam_syslog.3.html>`__, 
`access.conf(5) <../man5/access.conf.5.html>`__, 
`default_contexts(5) <../man5/default_contexts.5.html>`__, 
`failsafe_context(5) <../man5/failsafe_context.5.html>`__, 
`group.conf(5) <../man5/group.conf.5.html>`__, 
`limits.conf(5) <../man5/limits.conf.5.html>`__, 
`login.defs(5) <../man5/login.defs.5.html>`__, 
`namespace.conf(5) <../man5/namespace.conf.5.html>`__, 
`pam.conf(5) <../man5/pam.conf.5.html>`__, 
`pam_env.conf(5) <../man5/pam_env.conf.5.html>`__, 
`selinux_config(5) <../man5/selinux_config.5.html>`__, 
`sepermit.conf(5) <../man5/sepermit.conf.5.html>`__, 
`service_seusers(5) <../man5/service_seusers.5.html>`__, 
`seusers(5) <../man5/seusers.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`time.conf(5) <../man5/time.conf.5.html>`__, 
`user_contexts(5) <../man5/user_contexts.5.html>`__, 
`user@.service(5) <../man5/user@.service.5.html>`__, 
`environ(7) <../man7/environ.7.html>`__, 
`cron(8) <../man8/cron.8.html>`__,  `PAM(8) <../man8/PAM.8.html>`__, 
`pam_access(8) <../man8/pam_access.8.html>`__, 
`pam_cracklib(8) <../man8/pam_cracklib.8.html>`__, 
`pam_debug(8) <../man8/pam_debug.8.html>`__, 
`pam_deny(8) <../man8/pam_deny.8.html>`__, 
`pam_echo(8) <../man8/pam_echo.8.html>`__, 
`pam_env(8) <../man8/pam_env.8.html>`__, 
`pam_exec(8) <../man8/pam_exec.8.html>`__, 
`pam_faildelay(8) <../man8/pam_faildelay.8.html>`__, 
`pam_filter(8) <../man8/pam_filter.8.html>`__, 
`pam_ftp(8) <../man8/pam_ftp.8.html>`__, 
`pam_group(8) <../man8/pam_group.8.html>`__, 
`pam_issue(8) <../man8/pam_issue.8.html>`__, 
`pam_keyinit(8) <../man8/pam_keyinit.8.html>`__, 
`pam_lastlog(8) <../man8/pam_lastlog.8.html>`__, 
`pam_limits(8) <../man8/pam_limits.8.html>`__, 
`pam_listfile(8) <../man8/pam_listfile.8.html>`__, 
`pam_localuser(8) <../man8/pam_localuser.8.html>`__, 
`pam_loginuid(8) <../man8/pam_loginuid.8.html>`__, 
`pam_mail(8) <../man8/pam_mail.8.html>`__, 
`pam_mkhomedir(8) <../man8/pam_mkhomedir.8.html>`__, 
`pam_motd(8) <../man8/pam_motd.8.html>`__, 
`pam_namespace(8) <../man8/pam_namespace.8.html>`__, 
`pam_nologin(8) <../man8/pam_nologin.8.html>`__, 
`pam_permit(8) <../man8/pam_permit.8.html>`__, 
`pam_pwhistory(8) <../man8/pam_pwhistory.8.html>`__, 
`pam_rhosts(8) <../man8/pam_rhosts.8.html>`__, 
`pam_rootok(8) <../man8/pam_rootok.8.html>`__, 
`pam_securetty(8) <../man8/pam_securetty.8.html>`__, 
`pam_selinux(8) <../man8/pam_selinux.8.html>`__, 
`pam_sepermit(8) <../man8/pam_sepermit.8.html>`__, 
`pam_shells(8) <../man8/pam_shells.8.html>`__, 
`pam_succeed_if(8) <../man8/pam_succeed_if.8.html>`__, 
`pam_systemd(8) <../man8/pam_systemd.8.html>`__, 
`pam_systemd_home(8) <../man8/pam_systemd_home.8.html>`__, 
`pam_tally2(8) <../man8/pam_tally2.8.html>`__, 
`pam_tally(8) <../man8/pam_tally.8.html>`__, 
`pam_time(8) <../man8/pam_time.8.html>`__, 
`pam_timestamp(8) <../man8/pam_timestamp.8.html>`__, 
`pam_timestamp_check(8) <../man8/pam_timestamp_check.8.html>`__, 
`pam_tty_audit(8) <../man8/pam_tty_audit.8.html>`__, 
`pam_umask(8) <../man8/pam_umask.8.html>`__, 
`pam_unix(8) <../man8/pam_unix.8.html>`__, 
`pam_userdb(8) <../man8/pam_userdb.8.html>`__, 
`pam_warn(8) <../man8/pam_warn.8.html>`__, 
`pam_wheel(8) <../man8/pam_wheel.8.html>`__, 
`pam_xauth(8) <../man8/pam_xauth.8.html>`__

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
