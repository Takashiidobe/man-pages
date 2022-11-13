.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_strerror(3) — Linux manual page
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

   PAM_STRERROR(3)             Linux-PAM Manual             PAM_STRERROR(3)

NAME
-------------------------------------------------

::

          pam_strerror - return string describing PAM error code


---------------------------------------------------------

::

          #include <security/pam_appl.h>

          const char *pam_strerror(pam_handle_t *pamh, int errnum);


---------------------------------------------------------------

::

          The pam_strerror function returns a pointer to a string
          describing the error code passed in the argument errnum, possibly
          using the LC_MESSAGES part of the current locale to select the
          appropriate language. This string must not be modified by the
          application. No library function will modify this string.


-------------------------------------------------------------------

::

          This function returns always a pointer to a string.


---------------------------------------------------------

::

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

   Linux-PAM Manual               04/01/2016                PAM_STRERROR(3)

--------------

Pages that refer to this page: `pam(3) <../man3/pam.3.html>`__, 
`pam_acct_mgmt(3) <../man3/pam_acct_mgmt.3.html>`__, 
`pam_authenticate(3) <../man3/pam_authenticate.3.html>`__, 
`pam_chauthtok(3) <../man3/pam_chauthtok.3.html>`__, 
`pam_close_session(3) <../man3/pam_close_session.3.html>`__, 
`pam_conv(3) <../man3/pam_conv.3.html>`__, 
`pam_end(3) <../man3/pam_end.3.html>`__, 
`pam_fail_delay(3) <../man3/pam_fail_delay.3.html>`__, 
`pam_get_data(3) <../man3/pam_get_data.3.html>`__, 
`pam_get_item(3) <../man3/pam_get_item.3.html>`__, 
`pam_get_user(3) <../man3/pam_get_user.3.html>`__, 
`pam_open_session(3) <../man3/pam_open_session.3.html>`__, 
`pam_putenv(3) <../man3/pam_putenv.3.html>`__, 
`pam_setcred(3) <../man3/pam_setcred.3.html>`__, 
`pam_set_data(3) <../man3/pam_set_data.3.html>`__, 
`pam_set_item(3) <../man3/pam_set_item.3.html>`__, 
`pam_sm_acct_mgmt(3) <../man3/pam_sm_acct_mgmt.3.html>`__, 
`pam_sm_authenticate(3) <../man3/pam_sm_authenticate.3.html>`__, 
`pam_sm_chauthtok(3) <../man3/pam_sm_chauthtok.3.html>`__, 
`pam_sm_close_session(3) <../man3/pam_sm_close_session.3.html>`__, 
`pam_sm_open_session(3) <../man3/pam_sm_open_session.3.html>`__, 
`pam_sm_setcred(3) <../man3/pam_sm_setcred.3.html>`__, 
`pam_start(3) <../man3/pam_start.3.html>`__, 
`PAM(8) <../man8/PAM.8.html>`__

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
