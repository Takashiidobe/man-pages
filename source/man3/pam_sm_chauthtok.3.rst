.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_sm_chauthtok(3) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| RETURN VALUES <#RETURN_VALUES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_SM_CHAUTHTOK(3)         Linux-PAM Manual         PAM_SM_CHAUTHTOK(3)

NAME
-------------------------------------------------

::

          pam_sm_chauthtok - PAM service function for authentication token
          management


---------------------------------------------------------

::

          #define PAM_SM_PASSWORD

          #include <security/pam_modules.h>

          int pam_sm_chauthtok(pam_handle_t *pamh, int flags, int argc,
                               const char **argv);


---------------------------------------------------------------

::

          The pam_sm_chauthtok function is the service module's
          implementation of the pam_chauthtok(3) interface.

          This function is used to (re-)set the authentication token of the
          user.

          Valid flags, which may be logically OR'd with PAM_SILENT, are:

          PAM_SILENT
              Do not emit any messages.

          PAM_CHANGE_EXPIRED_AUTHTOK
              This argument indicates to the module that the user's
              authentication token (password) should only be changed if it
              has expired. This flag is optional and must be combined with
              one of the following two flags. Note, however, the following
              two options are mutually exclusive.

          PAM_PRELIM_CHECK
              This indicates that the modules are being probed as to their
              ready status for altering the user's authentication token. If
              the module requires access to another system over some
              network it should attempt to verify it can connect to this
              system on receiving this flag. If a module cannot establish
              it is ready to update the user's authentication token it
              should return PAM_TRY_AGAIN, this information will be passed
              back to the application.

              If the control value sufficient is used in the password
              stack, the PAM_PRELIM_CHECK section of the modules following
              that control value is not always executed.

          PAM_UPDATE_AUTHTOK
              This informs the module that this is the call it should
              change the authorization tokens. If the flag is logically
              OR'd with PAM_CHANGE_EXPIRED_AUTHTOK, the token is only
              changed if it has actually expired.

          The PAM library calls this function twice in succession. The
          first time with PAM_PRELIM_CHECK and then, if the module does not
          return PAM_TRY_AGAIN, subsequently with PAM_UPDATE_AUTHTOK. It is
          only on the second call that the authorization token is
          (possibly) changed.


-------------------------------------------------------------------

::

          PAM_AUTHTOK_ERR
              The module was unable to obtain the new authentication token.

          PAM_AUTHTOK_RECOVERY_ERR
              The module was unable to obtain the old authentication token.

          PAM_AUTHTOK_LOCK_BUSY
              Cannot change the authentication token since it is currently
              locked.

          PAM_AUTHTOK_DISABLE_AGING
              Authentication token aging has been disabled.

          PAM_PERM_DENIED
              Permission denied.

          PAM_TRY_AGAIN
              Preliminary check was unsuccessful. Signals an immediate
              return to the application is desired.

          PAM_SUCCESS
              The authentication token was successfully updated.

          PAM_USER_UNKNOWN
              User unknown to password service.


---------------------------------------------------------

::

          pam(3), pam_chauthtok(3), pam_sm_chauthtok(3), pam_strerror(3),
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

   Linux-PAM Manual               04/01/2016            PAM_SM_CHAUTHTOK(3)

--------------

Pages that refer to this page:
`pam_get_authtok(3) <../man3/pam_get_authtok.3.html>`__, 
`pam_get_item(3) <../man3/pam_get_item.3.html>`__, 
`pam_set_item(3) <../man3/pam_set_item.3.html>`__, 
`pam_sm_acct_mgmt(3) <../man3/pam_sm_acct_mgmt.3.html>`__, 
`pam_sm_chauthtok(3) <../man3/pam_sm_chauthtok.3.html>`__, 
`pam_debug(8) <../man8/pam_debug.8.html>`__

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
