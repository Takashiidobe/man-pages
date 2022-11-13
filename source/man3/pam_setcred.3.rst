.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_setcred(3) — Linux manual page
==================================

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

   PAM_SETCRED(3)              Linux-PAM Manual              PAM_SETCRED(3)

NAME
-------------------------------------------------

::

          pam_setcred - establish / delete user credentials


---------------------------------------------------------

::

          #include <security/pam_appl.h>

          int pam_setcred(pam_handle_t *pamh, int flags);


---------------------------------------------------------------

::

          The pam_setcred function is used to establish, maintain and
          delete the credentials of a user. It should be called to set the
          credentials after a user has been authenticated and before a
          session is opened for the user (with pam_open_session(3)). The
          credentials should be deleted after the session has been closed
          (with pam_close_session(3)).

          A credential is something that the user possesses. It is some
          property, such as a Kerberos ticket, or a supplementary group
          membership that make up the uniqueness of a given user. On a
          Linux system the user's UID and GID's are credentials too.
          However, it has been decided that these properties (along with
          the default supplementary groups of which the user is a member)
          are credentials that should be set directly by the application
          and not by PAM. Such credentials should be established, by the
          application, prior to a call to this function. For example,
          initgroups(2) (or equivalent) should have been performed.

          Valid flags, any one of which, may be logically OR'd with
          PAM_SILENT, are:

          PAM_ESTABLISH_CRED
              Initialize the credentials for the user.

          PAM_DELETE_CRED
              Delete the user's credentials.

          PAM_REINITIALIZE_CRED
              Fully reinitialize the user's credentials.

          PAM_REFRESH_CRED
              Extend the lifetime of the existing credentials.


-------------------------------------------------------------------

::

          PAM_BUF_ERR
              Memory buffer error.

          PAM_CRED_ERR
              Failed to set user credentials.

          PAM_CRED_EXPIRED
              User credentials are expired.

          PAM_CRED_UNAVAIL
              Failed to retrieve user credentials.

          PAM_SUCCESS
              Data was successful stored.

          PAM_SYSTEM_ERR
              A NULL pointer was submitted as PAM handle, the function was
              called by a module or another system error occured.

          PAM_USER_UNKNOWN
              User is not known to an authentication module.


---------------------------------------------------------

::

          pam_authenticate(3), pam_open_session(3), pam_close_session(3),
          pam_strerror(3)

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

   Linux-PAM Manual               04/01/2016                 PAM_SETCRED(3)

--------------

Pages that refer to this page: `pam(3) <../man3/pam.3.html>`__, 
`pam_authenticate(3) <../man3/pam_authenticate.3.html>`__, 
`pam_chauthtok(3) <../man3/pam_chauthtok.3.html>`__, 
`pam_sm_setcred(3) <../man3/pam_sm_setcred.3.html>`__, 
`pam_filter(8) <../man8/pam_filter.8.html>`__, 
`pam_tally2(8) <../man8/pam_tally2.8.html>`__, 
`pam_tally(8) <../man8/pam_tally.8.html>`__

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
