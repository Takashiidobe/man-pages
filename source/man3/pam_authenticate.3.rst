.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_authenticate(3) — Linux manual page
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

   PAM_AUTHENTICATE(3)         Linux-PAM Manual         PAM_AUTHENTICATE(3)

NAME
-------------------------------------------------

::

          pam_authenticate - account authentication


---------------------------------------------------------

::

          #include <security/pam_appl.h>

          int pam_authenticate(pam_handle_t *pamh, int flags);


---------------------------------------------------------------

::

          The pam_authenticate function is used to authenticate the user.
          The user is required to provide an authentication token depending
          upon the authentication service, usually this is a password, but
          could also be a finger print.

          The PAM service module may request that the user enter their
          username via the conversation mechanism (see pam_start(3) and
          pam_conv(3)). The name of the authenticated user will be present
          in the PAM item PAM_USER. This item may be recovered with a call
          to pam_get_item(3).

          The pamh argument is an authentication handle obtained by a prior
          call to pam_start(). The flags argument is the binary or of zero
          or more of the following values:

          PAM_SILENT
              Do not emit any messages.

          PAM_DISALLOW_NULL_AUTHTOK
              The PAM module service should return PAM_AUTH_ERR if the user
              does not have a registered authentication token.


-------------------------------------------------------------------

::

          PAM_ABORT
              The application should exit immediately after calling
              pam_end(3) first.

          PAM_AUTH_ERR
              The user was not authenticated.

          PAM_CRED_INSUFFICIENT
              For some reason the application does not have sufficient
              credentials to authenticate the user.

          PAM_AUTHINFO_UNAVAIL
              The modules were not able to access the authentication
              information. This might be due to a network or hardware
              failure etc.

          PAM_MAXTRIES
              One or more of the authentication modules has reached its
              limit of tries authenticating the user. Do not try again.

          PAM_SUCCESS
              The user was successfully authenticated.

          PAM_USER_UNKNOWN
              User unknown to authentication service.


---------------------------------------------------------

::

          pam_start(3), pam_setcred(3), pam_chauthtok(3), pam_strerror(3),
          pam(8)

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

   Linux-PAM Manual               04/01/2016            PAM_AUTHENTICATE(3)

--------------

Pages that refer to this page: `pam(3) <../man3/pam.3.html>`__, 
`pam_acct_mgmt(3) <../man3/pam_acct_mgmt.3.html>`__, 
`pam_chauthtok(3) <../man3/pam_chauthtok.3.html>`__, 
`pam_fail_delay(3) <../man3/pam_fail_delay.3.html>`__, 
`pam_setcred(3) <../man3/pam_setcred.3.html>`__, 
`pam_set_data(3) <../man3/pam_set_data.3.html>`__, 
`pam_sm_authenticate(3) <../man3/pam_sm_authenticate.3.html>`__, 
`pam_sm_setcred(3) <../man3/pam_sm_setcred.3.html>`__, 
`PAM(8) <../man8/PAM.8.html>`__, 
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
