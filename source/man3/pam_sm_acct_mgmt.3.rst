.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_sm_acct_mgmt(3) — Linux manual page
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

   PAM_SM_ACCT_MGMT(3)         Linux-PAM Manual         PAM_SM_ACCT_MGMT(3)

NAME
-------------------------------------------------

::

          pam_sm_acct_mgmt - PAM service function for account management


---------------------------------------------------------

::

          #define PAM_SM_ACCOUNT

          #include <security/pam_modules.h>

          int pam_sm_acct_mgmt(pam_handle_t *pamh, int flags, int argc,
                               const char **argv);


---------------------------------------------------------------

::

          The pam_sm_acct_mgmt function is the service module's
          implementation of the pam_acct_mgmt(3) interface.

          This function performs the task of establishing whether the user
          is permitted to gain access at this time. It should be understood
          that the user has previously been validated by an authentication
          module. This function checks for other things. Such things might
          be: the time of day or the date, the terminal line, remote
          hostname, etc. This function may also determine things like the
          expiration on passwords, and respond that the user change it
          before continuing.

          Valid flags, which may be logically OR'd with PAM_SILENT, are:

          PAM_SILENT
              Do not emit any messages.

          PAM_DISALLOW_NULL_AUTHTOK
              Return PAM_AUTH_ERR if the database of authentication tokens
              for this authentication mechanism has a NULL entry for the
              user.


-------------------------------------------------------------------

::

          PAM_ACCT_EXPIRED
              User account has expired.

          PAM_AUTH_ERR
              Authentication failure.

          PAM_NEW_AUTHTOK_REQD
              The user's authentication token has expired. Before calling
              this function again the application will arrange for a new
              one to be given. This will likely result in a call to
              pam_sm_chauthtok().

          PAM_PERM_DENIED
              Permission denied.

          PAM_SUCCESS
              The authentication token was successfully updated.

          PAM_USER_UNKNOWN
              User unknown to password service.


---------------------------------------------------------

::

          pam(3), pam_acct_mgmt(3), pam_sm_chauthtok(3), pam_strerror(3),
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

   Linux-PAM Manual               04/01/2016            PAM_SM_ACCT_MGMT(3)

--------------

Pages that refer to this page:
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
