.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_securetty(8) — Linux manual page
====================================

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

   PAM_SECURETTY(8)            Linux-PAM Manual            PAM_SECURETTY(8)

NAME
-------------------------------------------------

::

          pam_securetty - Limit root login to special devices


---------------------------------------------------------

::

          pam_securetty.so [debug]


---------------------------------------------------------------

::

          pam_securetty is a PAM module that allows root logins only if the
          user is logging in on a "secure" tty, as defined by the listing
          in /etc/securetty. pam_securetty also checks to make sure that
          /etc/securetty is a plain file and not world writable. It will
          also allow root logins on the tty specified with console= switch
          on the kernel command line and on ttys from the
          /sys/class/tty/console/active.

          This module has no effect on non-root users and requires that the
          application fills in the PAM_TTY item correctly.

          For canonical usage, should be listed as a required
          authentication method before any sufficient authentication
          methods.


-------------------------------------------------------

::

          debug
              Print debug information.

          noconsole
              Do not automatically allow root logins on the kernel console
              device, as specified on the kernel command line or by the sys
              file, if it is not also specified in the /etc/securetty file.


-----------------------------------------------------------------------------------

::

          Only the auth module type is provided.


-------------------------------------------------------------------

::

          PAM_SUCCESS
              The user is allowed to continue authentication. Either the
              user is not root, or the root user is trying to log in on an
              acceptable device.

          PAM_AUTH_ERR
              Authentication is rejected. Either root is attempting to log
              in via an unacceptable device, or the /etc/securetty file is
              world writable or not a normal file.

          PAM_INCOMPLETE
              An application error occurred. pam_securetty was not able to
              get information it required from the application that called
              it.

          PAM_SERVICE_ERR
              An error occurred while the module was determining the user's
              name or tty, or the module could not open /etc/securetty.

          PAM_USER_UNKNOWN
              The module could not find the user name in the /etc/passwd
              file to verify whether the user had a UID of 0. Therefore,
              the results of running this module are ignored.


---------------------------------------------------------

::

              auth  required  pam_securetty.so
              auth  required  pam_unix.so


---------------------------------------------------------

::

          securetty(5), pam.conf(5), pam.d(5), pam(8)


-----------------------------------------------------

::

          pam_securetty was written by Elliot Lee <sopwith@cuc.edu>.

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

   Linux-PAM Manual               04/01/2016               PAM_SECURETTY(8)

--------------

Pages that refer to this page:
`securetty(5) <../man5/securetty.5.html>`__

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
