.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_debug(8) — Linux manual page
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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_DEBUG(8)                Linux-PAM Manual                PAM_DEBUG(8)

NAME
-------------------------------------------------

::

          pam_debug - PAM module to debug the PAM stack


---------------------------------------------------------

::

          pam_debug.so [auth=value] [cred=value] [acct=value]
                       [prechauthtok=value] [chauthtok=value] [auth=value]
                       [open_session=value] [close_session=value]


---------------------------------------------------------------

::

          The pam_debug PAM module is intended as a debugging aide for
          determining how the PAM stack is operating. This module returns
          what its module arguments tell it to return.


-------------------------------------------------------

::

          auth=value
              The pam_sm_authenticate(3) function will return value.

          cred=value
              The pam_sm_setcred(3) function will return value.

          acct=value
              The pam_sm_acct_mgmt(3) function will return value.

          prechauthtok=value
              The pam_sm_chauthtok(3) function will return value if the
              PAM_PRELIM_CHECK flag is set.

          chauthtok=value
              The pam_sm_chauthtok(3) function will return value if the
              PAM_PRELIM_CHECK flag is not set.

          open_session=value
              The pam_sm_open_session(3) function will return value.

          close_session=value
              The pam_sm_close_session(3) function will return value.

          Where value can be one of: success, open_err, symbol_err,
          service_err, system_err, buf_err, perm_denied, auth_err,
          cred_insufficient, authinfo_unavail, user_unknown, maxtries,
          new_authtok_reqd, acct_expired, session_err, cred_unavail,
          cred_expired, cred_err, no_module_data, conv_err, authtok_err,
          authtok_recover_err, authtok_lock_busy, authtok_disable_aging,
          try_again, ignore, abort, authtok_expired, module_unknown,
          bad_item, conv_again, incomplete.


-----------------------------------------------------------------------------------

::

          All module types (auth, account, password and session) are
          provided.


-------------------------------------------------------------------

::

          PAM_SUCCESS
              Default return code if no other value was specified, else
              specified return value.


---------------------------------------------------------

::

              auth    requisite       pam_permit.so
              auth    [success=2 default=ok]  pam_debug.so auth=perm_denied cred=success
              auth    [default=reset]         pam_debug.so auth=success cred=perm_denied
              auth    [success=done default=die] pam_debug.so
              auth    optional        pam_debug.so auth=perm_denied cred=perm_denied
              auth    sufficient      pam_debug.so auth=success cred=success


---------------------------------------------------------

::

          pam.conf(5), pam.d(5), pam(8)


-----------------------------------------------------

::

          pam_debug was written by Andrew G. Morgan <morgan@kernel.org>.

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

   Linux-PAM Manual               04/01/2016                   PAM_DEBUG(8)

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
