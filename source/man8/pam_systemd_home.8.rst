.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_systemd_home(8) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `MODULE TYPES PRO                 |                                   |
| VIDED <#MODULE_TYPES_PROVIDED>`__ |                                   |
| \| `ENVIRONMENT <#ENVIRONMENT>`__ |                                   |
| \| `EXAMPLE <#EXAMPLE>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_SYSTEMD_HOME(8)         pam_systemd_home         PAM_SYSTEMD_HOME(8)

NAME
-------------------------------------------------

::

          pam_systemd_home - Automatically mount home directories managed
          by systemd-homed.service on login, and unmount them on logout


---------------------------------------------------------

::

          pam_systemd_home.so


---------------------------------------------------------------

::

          pam_systemd_home ensures that home directories managed by
          systemd-homed.service(8) are automatically activated (mounted) on
          user login, and are deactivated (unmounted) when the last session
          of the user ends.


-------------------------------------------------------

::

          The following options are understood:

          suspend=
              Takes a boolean argument. If true, the home directory of the
              user will be suspended automatically during system suspend;
              if false it will remain active. Automatic suspending of the
              home directory improves security substantially as secret key
              material is automatically removed from memory before the
              system is put to sleep and must be re-acquired (through user
              re-authentication) when coming back from suspend. It is
              recommended to set this parameter for all PAM applications
              that have support for automatically re-authenticating via PAM
              on system resume. If multiple sessions of the same user are
              open in parallel the user's home directory will be left
              unsuspended on system suspend as long as at least one of the
              sessions does not set this parameter to on. Defaults to off.

              Note that TTY logins generally do not support
              re-authentication on system resume. Re-authentication on
              system resume is primarily a concept implementable in
              graphical environments, in the form of lock screens brought
              up automatically when the system goes to sleep. This means
              that if a user concurrently uses graphical login sessions
              that implement the required re-authentication mechanism and
              console logins that do not, the home directory is not locked
              during suspend, due to the logic explained above. That said,
              it is possible to set this field for TTY logins too, ignoring
              the fact that TTY logins actually don't support the
              re-authentication mechanism. In that case the TTY sessions
              will appear hung until the user logs in on another virtual
              terminal (regardless if via another TTY session or
              graphically) which will resume the home directory and unblock
              the original TTY session. (Do note that lack of screen
              locking on TTY sessions means even though the TTY session
              appears hung, keypresses can still be queued into it, and the
              existing screen contents be read without re-authentication;
              this limitation is unrelated to the home directory management
              pam_systemd_home and systemd-homed.service implement.)

              Turning this option on by default is highly recommended for
              all sessions, but only if the service managing these sessions
              correctly implements the aforementioned re-authentication.
              Note that the re-authentication must take place from a
              component running outside of the user's context, so that it
              does not require access to the user's home directory for
              operation. Traditionally, most desktop environments do not
              implement screen locking this way, and need to be updated
              accordingly.

              This setting may also be controlled via the
              $SYSTEMD_HOME_SUSPEND environment variable (see below), which
              pam_systemd_home reads during initialization and sets for
              sessions. If both the environment variable is set and the
              module parameter specified the latter takes precedence.

          debug[=]
              Takes an optional boolean argument. If yes or without the
              argument, the module will log debugging information as it
              operates.


-----------------------------------------------------------------------------------

::

          The module provides all four management operations: auth,
          account, session, password.


---------------------------------------------------------------

::

          The following environment variables are initialized by the module
          and available to the processes of the user's session:

          $SYSTEMD_HOME=1
              Indicates that the user's home directory is managed by
              systemd-homed.service.

          $SYSTEMD_HOME_SUSPEND=
              Indicates whether the session has been registered with the
              suspend mechanism enabled or disabled (see above). The
              variable's value is either "0" or "1". Note that the module
              both reads the variable when initializing, and sets it for
              sessions.


-------------------------------------------------------

::

          Here's an example PAM configuration fragment that permits users
          managed by systemd-homed.service to log in:

              #%PAM-1.0
              auth      sufficient pam_unix.so
              -auth     sufficient pam_systemd_home.so
              auth      required   pam_deny.so

              account   required   pam_nologin.so
              -account  sufficient pam_systemd_home.so
              account   sufficient pam_unix.so
              account   required   pam_permit.so

              -password sufficient pam_systemd_home.so
              password  sufficient pam_unix.so sha512 shadow try_first_pass use_authtok
              password  required   pam_deny.so

              -session  optional   pam_keyinit.so revoke
              -session  optional   pam_loginuid.so
              -session  optional   pam_systemd_home.so
              -session  optional   pam_systemd.so
              session   required   pam_unix.so


---------------------------------------------------------

::

          systemd(1), systemd-homed.service(8), homed.conf(5), homectl(1),
          pam_systemd(8), pam.conf(5), pam.d(5), pam(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                          PAM_SYSTEMD_HOME(8)

--------------

Pages that refer to this page:
`pam_systemd(8) <../man8/pam_systemd.8.html>`__, 
`systemd-homed.service(8) <../man8/systemd-homed.service.8.html>`__

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
