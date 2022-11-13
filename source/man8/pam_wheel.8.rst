.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_wheel(8) — Linux manual page
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
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_WHEEL(8)                Linux-PAM Manual                PAM_WHEEL(8)

NAME
-------------------------------------------------

::

          pam_wheel - Only permit root access to members of group wheel


---------------------------------------------------------

::

          pam_wheel.so [debug] [deny] [group=name] [root_only] [trust]
                       [use_uid]


---------------------------------------------------------------

::

          The pam_wheel PAM module is used to enforce the so-called wheel
          group. By default it permits root access to the system if the
          applicant user is a member of the wheel group. If no group with
          this name exist, the module is using the group with the group-ID
          0.


-------------------------------------------------------

::

          debug
              Print debug information.

          deny
              Reverse the sense of the auth operation: if the user is
              trying to get UID 0 access and is a member of the wheel group
              (or the group of the group option), deny access. Conversely,
              if the user is not in the group, return PAM_IGNORE (unless
              trust was also specified, in which case we return
              PAM_SUCCESS).

          group=name
              Instead of checking the wheel or GID 0 groups, use the name
              group to perform the authentication.

          root_only
              The check for wheel membership is done only when the target
              user UID is 0.

          trust
              The pam_wheel module will return PAM_SUCCESS instead of
              PAM_IGNORE if the user is a member of the wheel group (thus
              with a little play stacking the modules the wheel members may
              be able to su to root without being prompted for a passwd).

          use_uid
              The check for wheel membership will be done against the
              current uid instead of the original one (useful when jumping
              with su from one account to another for example).


-----------------------------------------------------------------------------------

::

          The auth and account module types are provided.


-------------------------------------------------------------------

::

          PAM_AUTH_ERR
              Authentication failure.

          PAM_BUF_ERR
              Memory buffer error.

          PAM_IGNORE
              The return value should be ignored by PAM dispatch.

          PAM_PERM_DENY
              Permission denied.

          PAM_SERVICE_ERR
              Cannot determine the user name.

          PAM_SUCCESS
              Success.

          PAM_USER_UNKNOWN
              User not known.


---------------------------------------------------------

::

          The root account gains access by default (rootok), only wheel
          members can become root (wheel) but Unix authenticate non-root
          applicants.

              su      auth     sufficient     pam_rootok.so
              su      auth     required       pam_wheel.so
              su      auth     required       pam_unix.so


---------------------------------------------------------

::

          pam.conf(5), pam.d(5), pam(8)


-----------------------------------------------------

::

          pam_wheel was written by Cristian Gafton <gafton@redhat.com>.

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

   Linux-PAM Manual               04/19/2016                   PAM_WHEEL(8)

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
