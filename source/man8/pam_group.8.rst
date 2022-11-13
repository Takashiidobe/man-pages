.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_group(8) — Linux manual page
================================

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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_GROUP(8)                Linux-PAM Manual                PAM_GROUP(8)

NAME
-------------------------------------------------

::

          pam_group - PAM module for group access


---------------------------------------------------------

::

          pam_group.so


---------------------------------------------------------------

::

          The pam_group PAM module does not authenticate the user, but
          instead it grants group memberships (in the credential setting
          phase of the authentication module) to the user. Such memberships
          are based on the service they are applying for.

          By default rules for group memberships are taken from config file
          /etc/security/group.conf.

          This module's usefulness relies on the file-systems accessible to
          the user. The point being that once granted the membership of a
          group, the user may attempt to create a setgid binary with a
          restricted group ownership. Later, when the user is not given
          membership to this group, they can recover group membership with
          the precompiled binary. The reason that the file-systems that the
          user has access to are so significant, is the fact that when a
          system is mounted nosuid the user is unable to create or execute
          such a binary file. For this module to provide any level of
          security, all file-systems that the user has write access to
          should be mounted nosuid.

          The pam_group module functions in parallel with the /etc/group
          file. If the user is granted any groups based on the behavior of
          this module, they are granted in addition to those entries
          /etc/group (or equivalent).


-------------------------------------------------------

::

          This module does not recognise any options.


-----------------------------------------------------------------------------------

::

          Only the auth module type is provided.


-------------------------------------------------------------------

::

          PAM_SUCCESS
              group membership was granted.

          PAM_ABORT
              Not all relevant data could be gotten.

          PAM_BUF_ERR
              Memory buffer error.

          PAM_CRED_ERR
              Group membership was not granted.

          PAM_IGNORE
              pam_sm_authenticate was called which does nothing.

          PAM_USER_UNKNOWN
              The user is not known to the system.


---------------------------------------------------

::

          /etc/security/group.conf
              Default configuration file


---------------------------------------------------------

::

          group.conf(5), pam.d(5), pam(8).


-------------------------------------------------------

::

          pam_group was written by Andrew G. Morgan <morgan@kernel.org>.

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

   Linux-PAM Manual               04/01/2016                   PAM_GROUP(8)

--------------

Pages that refer to this page:
`group.conf(5) <../man5/group.conf.5.html>`__

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
