.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_pwhistory(8) — Linux manual page
====================================

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

   PAM_PWHISTORY(8)            Linux-PAM Manual            PAM_PWHISTORY(8)

NAME
-------------------------------------------------

::

          pam_pwhistory - PAM module to remember last passwords


---------------------------------------------------------

::

          pam_pwhistory.so [debug] [use_authtok] [enforce_for_root]
                           [remember=N] [retry=N] [authtok_type=STRING]


---------------------------------------------------------------

::

          This module saves the last passwords for each user in order to
          force password change history and keep the user from alternating
          between the same password too frequently.

          This module does not work together with kerberos. In general, it
          does not make much sense to use this module in conjunction with
          NIS or LDAP, since the old passwords are stored on the local
          machine and are not available on another machine for password
          history checking.


-------------------------------------------------------

::

          debug
              Turns on debugging via syslog(3).

          use_authtok
              When password changing enforce the module to use the new
              password provided by a previously stacked password module
              (this is used in the example of the stacking of the
              pam_cracklib module documented below).

          enforce_for_root
              If this option is set, the check is enforced for root, too.

          remember=N
              The last N passwords for each user are saved in
              /etc/security/opasswd. The default is 10. Value of 0 makes
              the module to keep the existing contents of the opasswd file
              unchanged.

          retry=N
              Prompt user at most N times before returning with error. The
              default is 1.

          authtok_type=STRING
              See pam_get_authtok(3) for more details.


-----------------------------------------------------------------------------------

::

          Only the password module type is provided.


-------------------------------------------------------------------

::

          PAM_AUTHTOK_ERR
              No new password was entered, the user aborted password change
              or new password couldn't be set.

          PAM_IGNORE
              Password history was disabled.

          PAM_MAXTRIES
              Password was rejected too often.

          PAM_USER_UNKNOWN
              User is not known to system.


---------------------------------------------------------

::

          An example password section would be:

              #%PAM-1.0
              password     required       pam_pwhistory.so
              password     required       pam_unix.so        use_authtok

          In combination with pam_cracklib:

              #%PAM-1.0
              password     required       pam_cracklib.so    retry=3
              password     required       pam_pwhistory.so   use_authtok
              password     required       pam_unix.so        use_authtok


---------------------------------------------------

::

          /etc/security/opasswd
              File with password history


---------------------------------------------------------

::

          pam.conf(5), pam.d(5), pam(8)pam_get_authtok(3)


-----------------------------------------------------

::

          pam_pwhistory was written by Thorsten Kukuk <kukuk@thkukuk.de>

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

   Linux-PAM Manual               04/01/2016               PAM_PWHISTORY(8)

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
