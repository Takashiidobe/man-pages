.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_get_authtok(3) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| RETURN VALUES <#RETURN_VALUES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `STANDARDS <#STANDARDS>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_GET_AUTHTOK(3)          Linux-PAM Manual          PAM_GET_AUTHTOK(3)

NAME
-------------------------------------------------

::

          pam_get_authtok, pam_get_authtok_verify, pam_get_authtok_noverify
          - get authentication token


---------------------------------------------------------

::

          #include <security/pam_ext.h>

          int pam_get_authtok(pam_handle_t *pamh, int item,
                              const char **authtok, const char *prompt);

          int pam_get_authtok_noverify(pam_handle_t *pamh,
                                       const char **authtok,
                                       const char *prompt);

          int pam_get_authtok_verify(pam_handle_t *pamh,
                                     const char **authtok,
                                     const char *prompt);


---------------------------------------------------------------

::

          The pam_get_authtok function returns the cached authentication
          token, or prompts the user if no token is currently cached. It is
          intended for internal use by Linux-PAM and PAM service modules.
          Upon successful return, authtok contains a pointer to the value
          of the authentication token. Note, this is a pointer to the
          actual data and should not be free()'ed or over-written!

          The prompt argument specifies a prompt to use if no token is
          cached. If a NULL pointer is given, pam_get_authtok uses
          pre-defined prompts.

          The following values are supported for item:

          PAM_AUTHTOK
              Returns the current authentication token. Called from
              pam_sm_chauthtok(3)pam_get_authtok will ask the user to
              confirm the new token by retyping it. If a prompt was
              specified, "Retype" will be used as prefix.

          PAM_OLDAUTHTOK
              Returns the previous authentication token when changing
              authentication tokens.

          The pam_get_authtok_noverify function can only be used for
          changing the password (from pam_sm_chauthtok(3)). It returns the
          cached authentication token, or prompts the user if no token is
          currently cached. The difference to pam_get_authtok is, that this
          function does not ask a second time for the password to verify
          it. Upon successful return, authtok contains a pointer to the
          value of the authentication token. Note, this is a pointer to the
          actual data and should not be free()'ed or over-written!

          The pam_get_authtok_verify function can only be used to verify a
          password for mistypes gotten by pam_get_authtok_noverify(3). This
          function asks a second time for the password and verify it with
          the password provided by authtok argument. In case of an error,
          the value of authtok is undefined. Else this argument will point
          to the actual data and should not be free()'ed or over-written!


-------------------------------------------------------

::

          pam_get_authtok honours the following module options:

          try_first_pass
              Before prompting the user for their password, the module
              first tries the previous stacked module's password in case
              that satisfies this module as well.

          use_first_pass
              The argument use_first_pass forces the module to use a
              previous stacked modules password and will never prompt the
              user - if no password is available or the password is not
              appropriate, the user will be denied access.

          use_authtok
              When password changing enforce the module to set the new
              token to the one provided by a previously stacked password
              module. If no token is available token changing will fail.

          authtok_type=XXX
              The default action is for the module to use the following
              prompts when requesting passwords: "New UNIX password: " and
              "Retype UNIX password: ". The example word UNIX can be
              replaced with this option, by default it is empty.


-------------------------------------------------------------------

::

          PAM_AUTH_ERR
              Authentication token could not be retrieved.

          PAM_AUTHTOK_ERR
              New authentication could not be retrieved.

          PAM_SUCCESS
              Authentication token was successfully retrieved.

          PAM_SYSTEM_ERR
              No space for an authentication token was provided.

          PAM_TRY_AGAIN
              New authentication tokens mismatch.


---------------------------------------------------------

::

          pam(8)


-----------------------------------------------------------

::

          The pam_get_authtok function is a Linux-PAM extensions.

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

   Linux-PAM Manual               04/01/2016             PAM_GET_AUTHTOK(3)

--------------

Pages that refer to this page:
`pam_get_authtok(3) <../man3/pam_get_authtok.3.html>`__, 
`pam_get_item(3) <../man3/pam_get_item.3.html>`__, 
`pam_set_item(3) <../man3/pam_set_item.3.html>`__, 
`pam_pwhistory(8) <../man8/pam_pwhistory.8.html>`__

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
