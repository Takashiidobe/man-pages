.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_sepermit(8) — Linux manual page
===================================

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

   PAM_SEPERMIT(8)             Linux-PAM Manual             PAM_SEPERMIT(8)

NAME
-------------------------------------------------

::

          pam_sepermit - PAM module to allow/deny login depending on
          SELinux enforcement state


---------------------------------------------------------

::

          pam_sepermit.so [debug] [conf=/path/to/config/file]


---------------------------------------------------------------

::

          The pam_sepermit module allows or denies login depending on
          SELinux enforcement state.

          When the user which is logging in matches an entry in the config
          file he is allowed access only when the SELinux is in enforcing
          mode. Otherwise he is denied access. For users not matching any
          entry in the config file the pam_sepermit module returns
          PAM_IGNORE return value.

          The config file contains a list of user names one per line with
          optional arguments. If the name is prefixed with @ character it
          means that all users in the group name match. If it is prefixed
          with a % character the SELinux user is used to match against the
          name instead of the account name. Note that when SELinux is
          disabled the SELinux user assigned to the account cannot be
          determined. This means that such entries are never matched when
          SELinux is disabled and pam_sepermit will return PAM_IGNORE.

          See sepermit.conf(5) for details.


-------------------------------------------------------

::

          debug
              Turns on debugging via syslog(3).

          conf=/path/to/config/file
              Path to alternative config file overriding the default.


-----------------------------------------------------------------------------------

::

          The auth and account module types are provided.


-------------------------------------------------------------------

::

          PAM_AUTH_ERR
              SELinux is disabled or in the permissive mode and the user
              matches.

          PAM_SUCCESS
              SELinux is in the enforcing mode and the user matches.

          PAM_IGNORE
              The user does not match any entry in the config file.

          PAM_USER_UNKNOWN
              The module was unable to determine the user's name.

          PAM_SERVICE_ERR
              Error during reading or parsing the config file.


---------------------------------------------------

::

          /etc/security/sepermit.conf
              Default configuration file


---------------------------------------------------------

::

              auth     [success=done ignore=ignore default=bad] pam_sepermit.so
              auth     required  pam_unix.so
              account  required  pam_unix.so
              session  required  pam_permit.so


---------------------------------------------------------

::

          sepermit.conf(5), pam.conf(5), pam.d(5), pam(8)selinux(8)


-----------------------------------------------------

::

          pam_sepermit and this manual page were written by Tomas Mraz
          <tmraz@redhat.com>.

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

   Linux-PAM Manual               04/01/2016                PAM_SEPERMIT(8)

--------------

Pages that refer to this page:
`sepermit.conf(5) <../man5/sepermit.conf.5.html>`__

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
