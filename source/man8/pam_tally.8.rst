.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_tally(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `MODULE TYPES PRO                 |                                   |
| VIDED <#MODULE_TYPES_PROVIDED>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| RETURN VALUES <#RETURN_VALUES>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_TALLY(8)                Linux-PAM Manual                PAM_TALLY(8)

NAME
-------------------------------------------------

::

          pam_tally - The login counter (tallying) module


---------------------------------------------------------

::

          pam_tally.so [file=/path/to/counter] [onerr=[fail|succeed]]
                       [magic_root] [even_deny_root_account] [deny=n]
                       [lock_time=n] [unlock_time=n] [per_user]
                       [no_lock_time] [no_reset] [audit] [silent]
                       [no_log_info]

          pam_tally [--file /path/to/counter] [--user username]
                    [--reset[=n]] [--quiet]


---------------------------------------------------------------

::

          This module maintains a count of attempted accesses, can reset
          count on success, can deny access if too many attempts fail.

          pam_tally has several limitations, which are solved with
          pam_tally2. For this reason pam_tally is deprecated and will be
          removed in a future release.

          pam_tally comes in two parts: pam_tally.so and pam_tally. The
          former is the PAM module and the latter, a stand-alone program.
          pam_tally is an (optional) application which can be used to
          interrogate and manipulate the counter file. It can display user
          counts, set individual counts, or clear all counts. Setting
          artificially high counts may be useful for blocking users without
          changing their passwords. For example, one might find it useful
          to clear all counts every midnight from a cron job. The
          faillog(8) command can be used instead of pam_tally to to
          maintain the counter file.

          Normally, failed attempts to access root will not cause the root
          account to become blocked, to prevent denial-of-service: if your
          users aren't given shell accounts and root may only login via su
          or at the machine console (not telnet/rsh, etc), this is safe.


-------------------------------------------------------

::

          GLOBAL OPTIONS
              This can be used for auth and account module types.

              onerr=[fail|succeed]
                  If something weird happens (like unable to open the
                  file), return with PAM_SUCCESS if onerr=succeed is given,
                  else with the corresponding PAM error code.

              file=/path/to/counter
                  File where to keep counts. Default is /var/log/faillog.

              audit
                  Will log the user name into the system log if the user is
                  not found.

              silent
                  Don't print informative messages.

              no_log_info
                  Don't log informative messages via syslog(3).

          AUTH OPTIONS
              Authentication phase first checks if user should be denied
              access and if not it increments attempted login counter. Then
              on call to pam_setcred(3) it resets the attempts counter.

              deny=n
                  Deny access if tally for this user exceeds n.

              lock_time=n
                  Always deny for n seconds after failed attempt.

              unlock_time=n
                  Allow access after n seconds after failed attempt. If
                  this option is used the user will be locked out for the
                  specified amount of time after he exceeded his maximum
                  allowed attempts. Otherwise the account is locked until
                  the lock is removed by a manual intervention of the
                  system administrator.

              magic_root
                  If the module is invoked by a user with uid=0 the counter
                  is not incremented. The sysadmin should use this for user
                  launched services, like su, otherwise this argument
                  should be omitted.

              no_lock_time
                  Do not use the .fail_locktime field in /var/log/faillog
                  for this user.

              no_reset
                  Don't reset count on successful entry, only decrement.

              even_deny_root_account
                  Root account can become unavailable.

              per_user
                  If /var/log/faillog contains a non-zero
                  .fail_max/.fail_locktime field for this user then use it
                  instead of deny=n/ lock_time=n parameter.

              no_lock_time
                  Don't use .fail_locktime filed in /var/log/faillog for
                  this user.

          ACCOUNT OPTIONS
              Account phase resets attempts counter if the user is not
              magic root. This phase can be used optionally for services
              which don't call pam_setcred(3) correctly or if the reset
              should be done regardless of the failure of the account phase
              of other modules.

              magic_root
                  If the module is invoked by a user with uid=0 the counter
                  is not incremented. The sysadmin should use this for user
                  launched services, like su, otherwise this argument
                  should be omitted.

              no_reset
                  Don't reset count on successful entry, only decrement.


-----------------------------------------------------------------------------------

::

          The auth and account module types are provided.


-------------------------------------------------------------------

::

          PAM_AUTH_ERR
              A invalid option was given, the module was not able to
              retrieve the user name, no valid counter file was found, or
              too many failed logins.

          PAM_SUCCESS
              Everything was successful.

          PAM_USER_UNKNOWN
              User not known.


---------------------------------------------------------

::

          Add the following line to /etc/pam.d/login to lock the account
          after too many failed logins. The number of allowed fails is
          specified by /var/log/faillog and needs to be set with pam_tally
          or faillog(8) before.

              auth     required       pam_securetty.so
              auth     required       pam_tally.so per_user
              auth     required       pam_env.so
              auth     required       pam_unix.so
              auth     required       pam_nologin.so
              account  required       pam_unix.so
              password required       pam_unix.so
              session  required       pam_limits.so
              session  required       pam_unix.so
              session  required       pam_lastlog.so nowtmp
              session  optional       pam_mail.so standard


---------------------------------------------------

::

          /var/log/faillog
              failure logging file


---------------------------------------------------------

::

          faillog(8), pam.conf(5), pam.d(5), pam(8)


-----------------------------------------------------

::

          pam_tally was written by Tim Baverstock and Tomas Mraz.

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

   Linux-PAM Manual               04/01/2016                   PAM_TALLY(8)

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
