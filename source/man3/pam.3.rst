.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam(3) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| RETURN VALUES <#RETURN_VALUES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM(3)                      Linux-PAM Manual                      PAM(3)

NAME
-------------------------------------------------

::

          pam - Pluggable Authentication Modules Library


---------------------------------------------------------

::

          #include <security/pam_appl.h>

          #include <security/pam_modules.h>

          #include <security/pam_ext.h>


---------------------------------------------------------------

::

          PAM is a system of libraries that handle the authentication tasks
          of applications (services) on the system. The library provides a
          stable general interface (Application Programming Interface -
          API) that privilege granting programs (such as login(1) and
          su(1)) defer to to perform standard authentication tasks.

      Initialization and Cleanup
          The pam_start(3) function creates the PAM context and initiates
          the PAM transaction. It is the first of the PAM functions that
          needs to be called by an application. The transaction state is
          contained entirely within the structure identified by this
          handle, so it is possible to have multiple transactions in
          parallel. But it is not possible to use the same handle for
          different transactions, a new one is needed for every new
          context.

          The pam_end(3) function terminates the PAM transaction and is the
          last function an application should call in the PAM context. Upon
          return the handle pamh is no longer valid and all memory
          associated with it will be invalid. It can be called at any time
          to terminate a PAM transaction.

      Authentication
          The pam_authenticate(3) function is used to authenticate the
          user. The user is required to provide an authentication token
          depending upon the authentication service, usually this is a
          password, but could also be a finger print.

          The pam_setcred(3) function manages the user's credentials.

      Account Management
          The pam_acct_mgmt(3) function is used to determine if the user's
          account is valid. It checks for authentication token and account
          expiration and verifies access restrictions. It is typically
          called after the user has been authenticated.

      Password Management
          The pam_chauthtok(3) function is used to change the
          authentication token for a given user on request or because the
          token has expired.

      Session Management
          The pam_open_session(3) function sets up a user session for a
          previously successful authenticated user. The session should
          later be terminated with a call to pam_close_session(3).

      Conversation
          The PAM library uses an application-defined callback to allow a
          direct communication between a loaded module and the application.
          This callback is specified by the struct pam_conv passed to
          pam_start(3) at the start of the transaction. See pam_conv(3) for
          details.

      Data Objects
          The pam_set_item(3) and pam_get_item(3) functions allows
          applications and PAM service modules to set and retrieve PAM
          informations.

          The pam_get_user(3) function is the preferred method to obtain
          the username.

          The pam_set_data(3) and pam_get_data(3) functions allows PAM
          service modules to set and retrieve free-form data from one
          invocation to another.

      Environment and Error Management
          The pam_putenv(3), pam_getenv(3) and pam_getenvlist(3) functions
          are for maintaining a set of private environment variables.

          The pam_strerror(3) function returns a pointer to a string
          describing the given PAM error code.


-------------------------------------------------------------------

::

          The following return codes are known by PAM:

          PAM_ABORT
              Critical error, immediate abort.

          PAM_ACCT_EXPIRED
              User account has expired.

          PAM_AUTHINFO_UNAVAIL
              Authentication service cannot retrieve authentication info.

          PAM_AUTHTOK_DISABLE_AGING
              Authentication token aging disabled.

          PAM_AUTHTOK_ERR
              Authentication token manipulation error.

          PAM_AUTHTOK_EXPIRED
              Authentication token expired.

          PAM_AUTHTOK_LOCK_BUSY
              Authentication token lock busy.

          PAM_AUTHTOK_RECOVERY_ERR
              Authentication information cannot be recovered.

          PAM_AUTH_ERR
              Authentication failure.

          PAM_BUF_ERR
              Memory buffer error.

          PAM_CONV_ERR
              Conversation failure.

          PAM_CRED_ERR
              Failure setting user credentials.

          PAM_CRED_EXPIRED
              User credentials expired.

          PAM_CRED_INSUFFICIENT
              Insufficient credentials to access authentication data.

          PAM_CRED_UNAVAIL
              Authentication service cannot retrieve user credentials.

          PAM_IGNORE
              The return value should be ignored by PAM dispatch.

          PAM_MAXTRIES
              Have exhausted maximum number of retries for service.

          PAM_MODULE_UNKNOWN
              Module is unknown.

          PAM_NEW_AUTHTOK_REQD
              Authentication token is no longer valid; new one required.

          PAM_NO_MODULE_DATA
              No module specific data is present.

          PAM_OPEN_ERR
              Failed to load module.

          PAM_PERM_DENIED
              Permission denied.

          PAM_SERVICE_ERR
              Error in service module.

          PAM_SESSION_ERR
              Cannot make/remove an entry for the specified session.

          PAM_SUCCESS
              Success.

          PAM_SYMBOL_ERR
              Symbol not found.

          PAM_SYSTEM_ERR
              System error.

          PAM_TRY_AGAIN
              Failed preliminary check by password service.

          PAM_USER_UNKNOWN
              User not known to the underlying authentication module.


---------------------------------------------------------

::

          pam_acct_mgmt(3), pam_authenticate(3), pam_chauthtok(3),
          pam_close_session(3), pam_conv(3), pam_end(3), pam_get_data(3),
          pam_getenv(3), pam_getenvlist(3), pam_get_item(3),
          pam_get_user(3), pam_open_session(3), pam_putenv(3),
          pam_set_data(3), pam_set_item(3), pam_setcred(3), pam_start(3),
          pam_strerror(3)


---------------------------------------------------

::

          The libpam interfaces are only thread-safe if each thread within
          the multithreaded application uses its own PAM handle.

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

   Linux-PAM Manual               04/01/2016                         PAM(3)

--------------

Pages that refer to this page:
`pam_sm_acct_mgmt(3) <../man3/pam_sm_acct_mgmt.3.html>`__, 
`pam_sm_authenticate(3) <../man3/pam_sm_authenticate.3.html>`__, 
`pam_sm_chauthtok(3) <../man3/pam_sm_chauthtok.3.html>`__, 
`pam_sm_close_session(3) <../man3/pam_sm_close_session.3.html>`__, 
`pam_sm_open_session(3) <../man3/pam_sm_open_session.3.html>`__, 
`pam_sm_setcred(3) <../man3/pam_sm_setcred.3.html>`__, 
`pam.conf(5) <../man5/pam.conf.5.html>`__, 
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
