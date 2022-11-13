.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_sm_setcred(3) — Linux manual page
=====================================

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

   PAM_SM_SETCRED(3)           Linux-PAM Manual           PAM_SM_SETCRED(3)

NAME
-------------------------------------------------

::

          pam_sm_setcred - PAM service function to alter credentials


---------------------------------------------------------

::

          #define PAM_SM_AUTH

          #include <security/pam_modules.h>

          int pam_sm_setcred(pam_handle_t *pamh, int flags, int argc,
                             const char **argv);


---------------------------------------------------------------

::

          The pam_sm_setcred function is the service module's
          implementation of the pam_setcred(3) interface.

          This function performs the task of altering the credentials of
          the user with respect to the corresponding authorization scheme.
          Generally, an authentication module may have access to more
          information about a user than their authentication token. This
          function is used to make such information available to the
          application. It should only be called after the user has been
          authenticated but before a session has been established.

          Valid flags, which may be logically OR'd with PAM_SILENT, are:

          PAM_SILENT
              Do not emit any messages.

          PAM_ESTABLISH_CRED
              Initialize the credentials for the user.

          PAM_DELETE_CRED
              Delete the credentials associated with the authentication
              service.

          PAM_REINITIALIZE_CRED
              Reinitialize the user credentials.

          PAM_REFRESH_CRED
              Extend the lifetime of the user credentials.

          The way the auth stack is navigated in order to evaluate the
          pam_setcred() function call, independent of the pam_sm_setcred()
          return codes, is exactly the same way that it was navigated when
          evaluating the pam_authenticate() library call. Typically, if a
          stack entry was ignored in evaluating pam_authenticate(), it will
          be ignored when libpam evaluates the pam_setcred() function call.
          Otherwise, the return codes from each module specific
          pam_sm_setcred() call are treated as required.


-------------------------------------------------------------------

::

          PAM_CRED_UNAVAIL
              This module cannot retrieve the user's credentials.

          PAM_CRED_EXPIRED
              The user's credentials have expired.

          PAM_CRED_ERR
              This module was unable to set the credentials of the user.

          PAM_SUCCESS
              The user credential was successfully set.

          PAM_USER_UNKNOWN
              The user is not known to this authentication module.

          These, non-PAM_SUCCESS, return values will typically lead to the
          credential stack failing. The first such error will dominate in
          the return value of pam_setcred().


---------------------------------------------------------

::

          pam(3), pam_authenticate(3), pam_setcred(3),
          pam_sm_authenticate(3), pam_strerror(3), PAM(8)

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

   Linux-PAM Manual               04/01/2016              PAM_SM_SETCRED(3)

--------------

Pages that refer to this page:
`pam_sm_authenticate(3) <../man3/pam_sm_authenticate.3.html>`__, 
`PAM(8) <../man8/PAM.8.html>`__, 
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
