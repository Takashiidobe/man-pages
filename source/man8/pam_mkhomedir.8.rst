.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_mkhomedir(8) — Linux manual page
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
| \| `FILES <#FILES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_MKHOMEDIR(8)            Linux-PAM Manual            PAM_MKHOMEDIR(8)

NAME
-------------------------------------------------

::

          pam_mkhomedir - PAM module to create users home directory


---------------------------------------------------------

::

          pam_mkhomedir.so [silent] [umask=mode] [skel=skeldir]


---------------------------------------------------------------

::

          The pam_mkhomedir PAM module will create a users home directory
          if it does not exist when the session begins. This allows users
          to be present in central database (such as NIS, kerberos or LDAP)
          without using a distributed file system or pre-creating a large
          number of directories. The skeleton directory (usually
          /etc/skel/) is used to copy default files and also sets a umask
          for the creation.

          The new users home directory will not be removed after logout of
          the user.


-------------------------------------------------------

::

          silent
              Don't print informative messages.

          umask=mask
              The user file-creation mask is set to mask. The default value
              of mask is 0022.

          skel=/path/to/skel/directory
              Indicate an alternative skel directory to override the
              default /etc/skel.


-----------------------------------------------------------------------------------

::

          Only the session module type is provided.


-------------------------------------------------------------------

::

          PAM_BUF_ERR
              Memory buffer error.

          PAM_CRED_INSUFFICIENT
              Insufficient credentials to access authentication data.

          PAM_PERM_DENIED
              Not enough permissions to create the new directory or read
              the skel directory.

          PAM_USER_UNKNOWN
              User not known to the underlying authentication module.

          PAM_SUCCESS
              Environment variables were set.


---------------------------------------------------

::

          /etc/skel
              Default skel directory


---------------------------------------------------------

::

          A sample /etc/pam.d/login file:

                auth       requisite   pam_securetty.so
                auth       sufficient  pam_ldap.so
                auth       required    pam_unix.so
                auth       required    pam_nologin.so
                account    sufficient  pam_ldap.so
                account    required    pam_unix.so
                password   required    pam_unix.so
                session    required    pam_mkhomedir.so skel=/etc/skel/ umask=0022
                session    required    pam_unix.so
                session    optional    pam_lastlog.so
                session    optional    pam_mail.so standard


---------------------------------------------------------

::

          pam.d(5), pam(8).


-----------------------------------------------------

::

          pam_mkhomedir was written by Jason Gunthorpe <jgg@debian.org>.

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

   Linux-PAM Manual               04/01/2016               PAM_MKHOMEDIR(8)

--------------

Pages that refer to this page:
`mkhomedir_helper(8) <../man8/mkhomedir_helper.8.html>`__

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
