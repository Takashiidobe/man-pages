.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_acct_mgmt(3) — Linux manual page
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

   PAM_ACCT_MGMT(3)            Linux-PAM Manual            PAM_ACCT_MGMT(3)

NAME
-------------------------------------------------

::

          pam_acct_mgmt - PAM account validation management


---------------------------------------------------------

::

          #include <security/pam_appl.h>

          int pam_acct_mgmt(pam_handle_t *pamh, int flags);


---------------------------------------------------------------

::

          The pam_acct_mgmt function is used to determine if the user's
          account is valid. It checks for authentication token and account
          expiration and verifies access restrictions. It is typically
          called after the user has been authenticated.

          The pamh argument is an authentication handle obtained by a prior
          call to pam_start(). The flags argument is the binary or of zero
          or more of the following values:

          PAM_SILENT
              Do not emit any messages.

          PAM_DISALLOW_NULL_AUTHTOK
              The PAM module service should return PAM_NEW_AUTHTOK_REQD if
              the user has a null authentication token.


-------------------------------------------------------------------

::

          PAM_ACCT_EXPIRED
              User account has expired.

          PAM_AUTH_ERR
              Authentication failure.

          PAM_NEW_AUTHTOK_REQD
              The user account is valid but their authentication token is
              expired. The correct response to this return-value is to
              require that the user satisfies the pam_chauthtok() function
              before obtaining service. It may not be possible for some
              applications to do this. In such cases, the user should be
              denied access until such time as they can update their
              password.

          PAM_PERM_DENIED
              Permission denied.

          PAM_SUCCESS
              The authentication token was successfully updated.

          PAM_USER_UNKNOWN
              User unknown to password service.


---------------------------------------------------------

::

          pam_start(3), pam_authenticate(3), pam_chauthtok(3),
          pam_strerror(3), pam(8)

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

   Linux-PAM Manual               04/01/2016               PAM_ACCT_MGMT(3)

--------------

Pages that refer to this page: `pam(3) <../man3/pam.3.html>`__, 
`pam_sm_acct_mgmt(3) <../man3/pam_sm_acct_mgmt.3.html>`__

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
