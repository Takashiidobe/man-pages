.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam.conf(5) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM.CONF(5)                 Linux-PAM Manual                 PAM.CONF(5)

NAME
-------------------------------------------------

::

          pam.conf, pam.d - PAM configuration files


---------------------------------------------------------------

::

          When a PAM aware privilege granting application is started, it
          activates its attachment to the PAM-API. This activation performs
          a number of tasks, the most important being the reading of the
          configuration file(s): /etc/pam.conf. Alternatively, this may be
          the contents of the /etc/pam.d/ directory. The presence of this
          directory will cause Linux-PAM to ignore /etc/pam.conf.

          These files list the PAMs that will do the authentication tasks
          required by this service, and the appropriate behavior of the
          PAM-API in the event that individual PAMs fail.

          The syntax of the /etc/pam.conf configuration file is as follows.
          The file is made up of a list of rules, each rule is typically
          placed on a single line, but may be extended with an escaped end
          of line: `\<LF>'. Comments are preceded with `#' marks and extend
          to the next end of line.

          The format of each rule is a space separated collection of
          tokens, the first three being case-insensitive:

           service type control module-path module-arguments

          The syntax of files contained in the /etc/pam.d/ directory, are
          identical except for the absence of any service field. In this
          case, the service is the name of the file in the /etc/pam.d/
          directory. This filename must be in lower case.

          An important feature of PAM, is that a number of rules may be
          stacked to combine the services of a number of PAMs for a given
          authentication task.

          The service is typically the familiar name of the corresponding
          application: login and su are good examples. The service-name,
          other, is reserved for giving default rules. Only lines that
          mention the current service (or in the absence of such, the other
          entries) will be associated with the given service-application.

          The type is the management group that the rule corresponds to. It
          is used to specify which of the management groups the subsequent
          module is to be associated with. Valid entries are:

          account
              this module type performs non-authentication based account
              management. It is typically used to restrict/permit access to
              a service based on the time of day, currently available
              system resources (maximum number of users) or perhaps the
              location of the applicant user -- 'root' login only on the
              console.

          auth
              this module type provides two aspects of authenticating the
              user. Firstly, it establishes that the user is who they claim
              to be, by instructing the application to prompt the user for
              a password or other means of identification. Secondly, the
              module can grant group membership or other privileges through
              its credential granting properties.

          password
              this module type is required for updating the authentication
              token associated with the user. Typically, there is one
              module for each 'challenge/response' based authentication
              (auth) type.

          session
              this module type is associated with doing things that need to
              be done for the user before/after they can be given service.
              Such things include the logging of information concerning the
              opening/closing of some data exchange with a user, mounting
              directories, etc.

          If the type value from the list above is prepended with a -
          character the PAM library will not log to the system log if it is
          not possible to load the module because it is missing in the
          system. This can be useful especially for modules which are not
          always installed on the system and are not required for correct
          authentication and authorization of the login session.

          The third field, control, indicates the behavior of the PAM-API
          should the module fail to succeed in its authentication task.
          There are two types of syntax for this control field: the simple
          one has a single simple keyword; the more complicated one
          involves a square-bracketed selection of value=action pairs.

          For the simple (historical) syntax valid control values are:

          required
              failure of such a PAM will ultimately lead to the PAM-API
              returning failure but only after the remaining stacked
              modules (for this service and type) have been invoked.

          requisite
              like required, however, in the case that such a module
              returns a failure, control is directly returned to the
              application or to the superior PAM stack. The return value is
              that associated with the first required or requisite module
              to fail. Note, this flag can be used to protect against the
              possibility of a user getting the opportunity to enter a
              password over an unsafe medium. It is conceivable that such
              behavior might inform an attacker of valid accounts on a
              system. This possibility should be weighed against the not
              insignificant concerns of exposing a sensitive password in a
              hostile environment.

          sufficient
              if such a module succeeds and no prior required module has
              failed the PAM framework returns success to the application
              or to the superior PAM stack immediately without calling any
              further modules in the stack. A failure of a sufficient
              module is ignored and processing of the PAM module stack
              continues unaffected.

          optional
              the success or failure of this module is only important if it
              is the only module in the stack associated with this
              service+type.

          include
              include all lines of given type from the configuration file
              specified as an argument to this control.

          substack
              include all lines of given type from the configuration file
              specified as an argument to this control. This differs from
              include in that evaluation of the done and die actions in a
              substack does not cause skipping the rest of the complete
              module stack, but only of the substack. Jumps in a substack
              also can not make evaluation jump out of it, and the whole
              substack is counted as one module when the jump is done in a
              parent stack. The reset action will reset the state of a
              module stack to the state it was in as of beginning of the
              substack evaluation.

          For the more complicated syntax valid control values have the
          following form:

                    [value1=action1 value2=action2 ...]

          Where valueN corresponds to the return code from the function
          invoked in the module for which the line is defined. It is
          selected from one of these: success, open_err, symbol_err,
          service_err, system_err, buf_err, perm_denied, auth_err,
          cred_insufficient, authinfo_unavail, user_unknown, maxtries,
          new_authtok_reqd, acct_expired, session_err, cred_unavail,
          cred_expired, cred_err, no_module_data, conv_err, authtok_err,
          authtok_recover_err, authtok_lock_busy, authtok_disable_aging,
          try_again, ignore, abort, authtok_expired, module_unknown,
          bad_item, conv_again, incomplete, and default.

          The last of these, default, implies 'all valueN's not mentioned
          explicitly. Note, the full list of PAM errors is available in
          /usr/include/security/_pam_types.h. The actionN can take one of
          the following forms:

          ignore
              when used with a stack of modules, the module's return status
              will not contribute to the return code the application
              obtains.

          bad
              this action indicates that the return code should be thought
              of as indicative of the module failing. If this module is the
              first in the stack to fail, its status value will be used for
              that of the whole stack.

          die
              equivalent to bad with the side effect of terminating the
              module stack and PAM immediately returning to the
              application.

          ok
              this tells PAM that the administrator thinks this return code
              should contribute directly to the return code of the full
              stack of modules. In other words, if the former state of the
              stack would lead to a return of PAM_SUCCESS, the module's
              return code will override this value. Note, if the former
              state of the stack holds some value that is indicative of a
              modules failure, this 'ok' value will not be used to override
              that value.

          done
              equivalent to ok with the side effect of terminating the
              module stack and PAM immediately returning to the
              application.

          N (an unsigned integer)
              equivalent to ok with the side effect of jumping over the
              next N modules in the stack. Note that N equal to 0 is not
              allowed (and it would be identical to ok in such case).

          reset
              clear all memory of the state of the module stack and start
              again with the next stacked module.

          Each of the four keywords: required; requisite; sufficient; and
          optional, have an equivalent expression in terms of the [...]
          syntax. They are as follows:

          required
              [success=ok new_authtok_reqd=ok ignore=ignore default=bad]

          requisite
              [success=ok new_authtok_reqd=ok ignore=ignore default=die]

          sufficient
              [success=done new_authtok_reqd=done default=ignore]

          optional
              [success=ok new_authtok_reqd=ok default=ignore]

          module-path is either the full filename of the PAM to be used by
          the application (it begins with a '/'), or a relative pathname
          from the default module location: /lib/security/ or
          /lib64/security/, depending on the architecture.

          module-arguments are a space separated list of tokens that can be
          used to modify the specific behavior of the given PAM. Such
          arguments will be documented for each individual module. Note, if
          you wish to include spaces in an argument, you should surround
          that argument with square brackets.

                  squid auth required pam_mysql.so user=passwd_query passwd=mada \
                        db=eminence [query=select user_name from internet_service \
                        where user_name='%u' and password=PASSWORD('%p') and \
                      service='web_proxy']

          When using this convention, you can include `[' characters inside
          the string, and if you wish to include a `]' character inside the
          string that will survive the argument parsing, you should use
          `\]'. In other words:

                  [..[..\]..]    -->   ..[..]..

          Any line in (one of) the configuration file(s), that is not
          formatted correctly, will generally tend (erring on the side of
          caution) to make the authentication process fail. A corresponding
          error is written to the system log files with a call to
          syslog(3).

          More flexible than the single configuration file is it to
          configure libpam via the contents of the /etc/pam.d/ directory.
          In this case the directory is filled with files each of which has
          a filename equal to a service-name (in lower-case): it is the
          personal configuration file for the named service.

          The syntax of each file in /etc/pam.d/ is similar to that of the
          /etc/pam.conf file and is made up of lines of the following form:

              type  control  module-path  module-arguments

          The only difference being that the service-name is not present.
          The service-name is of course the name of the given configuration
          file. For example, /etc/pam.d/login contains the configuration
          for the login service.


---------------------------------------------------------

::

          pam(3), PAM(8), pam_start(3)

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

   Linux-PAM Manual               04/01/2016                    PAM.CONF(5)

--------------

Pages that refer to this page:
`access.conf(5) <../man5/access.conf.5.html>`__, 
`group.conf(5) <../man5/group.conf.5.html>`__, 
`limits.conf(5) <../man5/limits.conf.5.html>`__, 
`namespace.conf(5) <../man5/namespace.conf.5.html>`__, 
`pam_env.conf(5) <../man5/pam_env.conf.5.html>`__, 
`sepermit.conf(5) <../man5/sepermit.conf.5.html>`__, 
`time.conf(5) <../man5/time.conf.5.html>`__, 
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
