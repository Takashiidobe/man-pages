.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_set_item(3) — Linux manual page
===================================

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

   PAM_SET_ITEM(3)             Linux-PAM Manual             PAM_SET_ITEM(3)

NAME
-------------------------------------------------

::

          pam_set_item - set and update PAM informations


---------------------------------------------------------

::

          #include <security/pam_modules.h>

          int pam_set_item(pam_handle_t *pamh, int item_type,
                           const void *item);


---------------------------------------------------------------

::

          The pam_set_item function allows applications and PAM service
          modules to access and to update PAM informations of item_type.
          For this a copy of the object pointed to by the item argument is
          created. The following item_types are supported:

          PAM_SERVICE
              The service name (which identifies that PAM stack that the
              PAM functions will use to authenticate the program).

          PAM_USER
              The username of the entity under whose identity service will
              be given. That is, following authentication, PAM_USER
              identifies the local entity that gets to use the service.
              Note, this value can be mapped from something (eg.,
              "anonymous") to something else (eg. "guest119") by any module
              in the PAM stack. As such an application should consult the
              value of PAM_USER after each call to a PAM function.

          PAM_USER_PROMPT
              The string used when prompting for a user's name. The default
              value for this string is a localized version of "login: ".

          PAM_TTY
              The terminal name: prefixed by /dev/ if it is a device file;
              for graphical, X-based, applications the value for this item
              should be the $DISPLAY variable.

          PAM_RUSER
              The requesting user name: local name for a locally requesting
              user or a remote user name for a remote requesting user.

              Generally an application or module will attempt to supply the
              value that is most strongly authenticated (a local account
              before a remote one. The level of trust in this value is
              embodied in the actual authentication stack associated with
              the application, so it is ultimately at the discretion of the
              system administrator.

              PAM_RUSER@PAM_RHOST should always identify the requesting
              user. In some cases, PAM_RUSER may be NULL. In such
              situations, it is unclear who the requesting entity is.

          PAM_RHOST
              The requesting hostname (the hostname of the machine from
              which the PAM_RUSER entity is requesting service). That is
              PAM_RUSER@PAM_RHOST does identify the requesting user. In
              some applications, PAM_RHOST may be NULL. In such situations,
              it is unclear where the authentication request is originating
              from.

          PAM_AUTHTOK
              The authentication token (often a password). This token
              should be ignored by all module functions besides
              pam_sm_authenticate(3) and pam_sm_chauthtok(3). In the former
              function it is used to pass the most recent authentication
              token from one stacked module to another. In the latter
              function the token is used for another purpose. It contains
              the currently active authentication token.

          PAM_OLDAUTHTOK
              The old authentication token. This token should be ignored by
              all module functions except pam_sm_chauthtok(3).

          PAM_CONV
              The pam_conv structure. See pam_conv(3).

          The following additional items are specific to Linux-PAM and
          should not be used in portable applications:

          PAM_FAIL_DELAY
              A function pointer to redirect centrally managed failure
              delays. See pam_fail_delay(3).

          PAM_XDISPLAY
              The name of the X display. For graphical, X-based
              applications the value for this item should be the $DISPLAY
              variable. This value may be used independently of PAM_TTY for
              passing the name of the display.

          PAM_XAUTHDATA
              A pointer to a structure containing the X authentication data
              required to make a connection to the display specified by
              PAM_XDISPLAY, if such information is necessary. See
              pam_xauth_data(3).

          PAM_AUTHTOK_TYPE
              The default action is for the module to use the following
              prompts when requesting passwords: "New UNIX password: " and
              "Retype UNIX password: ". The example word UNIX can be
              replaced with this item, by default it is empty. This item is
              used by pam_get_authtok(3).

          For all item_types, other than PAM_CONV and PAM_FAIL_DELAY, item
          is a pointer to a <NUL> terminated character string. In the case
          of PAM_CONV, item points to an initialized pam_conv structure. In
          the case of PAM_FAIL_DELAY, item is a function pointer: void
          (*delay_fn)(int retval, unsigned usec_delay, void *appdata_ptr)

          Both, PAM_AUTHTOK and PAM_OLDAUTHTOK, will be reseted before
          returning to the application. Which means an application is not
          able to access the authentication tokens.


-------------------------------------------------------------------

::

          PAM_BAD_ITEM
              The application attempted to set an undefined or inaccessible
              item.

          PAM_BUF_ERR
              Memory buffer error.

          PAM_SUCCESS
              Data was successful updated.

          PAM_SYSTEM_ERR
              The pam_handle_t passed as first argument was invalid.


---------------------------------------------------------

::

          pam_get_item(3), pam_strerror(3)

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

   Linux-PAM Manual               04/01/2016                PAM_SET_ITEM(3)

--------------

Pages that refer to this page: `pam(3) <../man3/pam.3.html>`__, 
`pam_conv(3) <../man3/pam_conv.3.html>`__, 
`pam_end(3) <../man3/pam_end.3.html>`__, 
`pam_fail_delay(3) <../man3/pam_fail_delay.3.html>`__, 
`pam_get_item(3) <../man3/pam_get_item.3.html>`__, 
`pam_get_user(3) <../man3/pam_get_user.3.html>`__, 
`pam_start(3) <../man3/pam_start.3.html>`__

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
