.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_chauthtok(3) — Linux manual page
====================================

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

   PAM_CHAUTHTOK(3)            Linux-PAM Manual            PAM_CHAUTHTOK(3)

NAME
-------------------------------------------------

::

          pam_chauthtok - updating authentication tokens


---------------------------------------------------------

::

          #include <security/pam_appl.h>

          int pam_chauthtok(pam_handle_t *pamh, int flags);


---------------------------------------------------------------

::

          The pam_chauthtok function is used to change the authentication
          token for a given user (as indicated by the state associated with
          the handle pamh).

          The pamh argument is an authentication handle obtained by a prior
          call to pam_start(). The flags argument is the binary or of zero
          or more of the following values:

          PAM_SILENT
              Do not emit any messages.

          PAM_CHANGE_EXPIRED_AUTHTOK
              This argument indicates to the modules that the user's
              authentication token (password) should only be changed if it
              has expired. If this argument is not passed, the application
              requires that all authentication tokens are to be changed.


-------------------------------------------------------------------

::

          PAM_AUTHTOK_ERR
              A module was unable to obtain the new authentication token.

          PAM_AUTHTOK_RECOVERY_ERR
              A module was unable to obtain the old authentication token.

          PAM_AUTHTOK_LOCK_BUSY
              One or more of the modules was unable to change the
              authentication token since it is currently locked.

          PAM_AUTHTOK_DISABLE_AGING
              Authentication token aging has been disabled for at least one
              of the modules.

          PAM_PERM_DENIED
              Permission denied.

          PAM_SUCCESS
              The authentication token was successfully updated.

          PAM_TRY_AGAIN
              Not all of the modules were in a position to update the
              authentication token(s). In such a case none of the user's
              authentication tokens are updated.

          PAM_USER_UNKNOWN
              User unknown to password service.


---------------------------------------------------------

::

          pam_start(3), pam_authenticate(3), pam_setcred(3),
          pam_get_item(3), pam_strerror(3), pam(8)

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

   Linux-PAM Manual               04/01/2016               PAM_CHAUTHTOK(3)

--------------

Pages that refer to this page: `pam(3) <../man3/pam.3.html>`__, 
`pam_acct_mgmt(3) <../man3/pam_acct_mgmt.3.html>`__, 
`pam_authenticate(3) <../man3/pam_authenticate.3.html>`__, 
`pam_sm_chauthtok(3) <../man3/pam_sm_chauthtok.3.html>`__, 
`pam_filter(8) <../man8/pam_filter.8.html>`__

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
