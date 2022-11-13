.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_ftp(8) — Linux manual page
==============================

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

   PAM_FTP(8)                  Linux-PAM Manual                  PAM_FTP(8)

NAME
-------------------------------------------------

::

          pam_ftp - PAM module for anonymous access module


---------------------------------------------------------

::

          pam_ftp.so [debug] [ignore] [users=XXX,YYY,...]


---------------------------------------------------------------

::

          pam_ftp is a PAM module which provides a pluggable anonymous ftp
          mode of access.

          This module intercepts the user's name and password. If the name
          is ftp or anonymous, the user's password is broken up at the @
          delimiter into a PAM_RUSER and a PAM_RHOST part; these pam-items
          being set accordingly. The username (PAM_USER) is set to ftp. In
          this case the module succeeds. Alternatively, the module sets the
          PAM_AUTHTOK item with the entered password and fails.

          This module is not safe and easily spoofable.


-------------------------------------------------------

::

          debug
              Print debug information.

          ignore
              Pay no attention to the email address of the user (if
              supplied).

          ftp=XXX,YYY,...
              Instead of ftp or anonymous, provide anonymous login to the
              comma separated list of users: XXX,YYY,.... Should the
              applicant enter one of these usernames the returned username
              is set to the first in the list: XXX.


-----------------------------------------------------------------------------------

::

          Only the auth module type is provided.


-------------------------------------------------------------------

::

          PAM_SUCCESS
              The authentication was successful.

          PAM_USER_UNKNOWN
              User not known.


---------------------------------------------------------

::

          Add the following line to /etc/pam.d/ftpd to handle ftp style
          anonymous login:

              #
              # ftpd; add ftp-specifics. These lines enable anonymous ftp over
              #       standard UN*X access (the listfile entry blocks access to
              #       users listed in /etc/ftpusers)
              #
              auth    sufficient  pam_ftp.so
              auth    required    pam_unix.so use_first_pass
              auth    required    pam_listfile.so \
                         onerr=succeed item=user sense=deny file=/etc/ftpusers


---------------------------------------------------------

::

          pam.conf(5), pam.d(5), pam(8)


-----------------------------------------------------

::

          pam_ftp was written by Andrew G. Morgan <morgan@kernel.org>.

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

   Linux-PAM Manual               04/01/2016                     PAM_FTP(8)

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
