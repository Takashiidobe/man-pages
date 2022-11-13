.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_selinux(8) — Linux manual page
==================================

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

   PAM_SELINUX(8)              Linux-PAM Manual              PAM_SELINUX(8)

NAME
-------------------------------------------------

::

          pam_selinux - PAM module to set the default security context


---------------------------------------------------------

::

          pam_selinux.so [open] [close] [restore] [nottys] [debug]
                         [verbose] [select_context] [env_params]
                         [use_current_range]


---------------------------------------------------------------

::

          pam_selinux is a PAM module that sets up the default SELinux
          security context for the next executed process.

          When a new session is started, the open_session part of the
          module computes and sets up the execution security context used
          for the next execve(2) call, the file security context for the
          controlling terminal, and the security context used for creating
          a new kernel keyring.

          When the session is ended, the close_session part of the module
          restores old security contexts that were in effect before the
          change made by the open_session part of the module.

          Adding pam_selinux into the PAM stack might disrupt behavior of
          other PAM modules which execute applications. To avoid that,
          pam_selinux.so open should be placed after such modules in the
          PAM stack, and pam_selinux.so close should be placed before them.
          When such a placement is not feasible, pam_selinux.so restore
          could be used to temporary restore original security contexts.


-------------------------------------------------------

::

          open
              Only execute the open_session part of the module.

          close
              Only execute the close_session part of the module.

          restore
              In open_session part of the module, temporarily restore the
              security contexts as they were before the previous call of
              the module. Another call of this module without the restore
              option will set up the new security contexts again.

          nottys
              Do not setup security context of the controlling terminal.

          debug
              Turn on debug messages via syslog(3).

          verbose
              Attempt to inform the user when security context is set.

          select_context
              Attempt to ask the user for a custom security context role.
              If MLS is on, ask also for sensitivity level.

          env_params
              Attempt to obtain a custom security context role from PAM
              environment. If MLS is on, obtain also sensitivity level.
              This option and the select_context option are mutually
              exclusive. The respective PAM environment variables are
              SELINUX_ROLE_REQUESTED, SELINUX_LEVEL_REQUESTED, and
              SELINUX_USE_CURRENT_RANGE. The first two variables are self
              describing and the last one if set to 1 makes the PAM module
              behave as if the use_current_range was specified on the
              command line of the module.

          use_current_range
              Use the sensitivity level of the current process for the user
              context instead of the default level. Also suppresses asking
              of the sensitivity level from the user or obtaining it from
              PAM environment.


-----------------------------------------------------------------------------------

::

          Only the session module type is provided.


-------------------------------------------------------------------

::

          PAM_SUCCESS
              The security context was set successfully.

          PAM_SESSION_ERR
              Unable to get or set a valid context.

          PAM_USER_UNKNOWN
              The user is not known to the system.

          PAM_BUF_ERR
              Memory allocation error.


---------------------------------------------------------

::

              auth     required  pam_unix.so
              session  required  pam_permit.so
              session  optional  pam_selinux.so


---------------------------------------------------------

::

          execve(2), tty(4), pam.d(5), pam(8), selinux(8)


-----------------------------------------------------

::

          pam_selinux was written by Dan Walsh <dwalsh@redhat.com>.

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

   Linux-PAM Manual               04/01/2016                 PAM_SELINUX(8)

--------------

Pages that refer to this page:
`pam_selinux_check(8) <../man8/pam_selinux_check.8.html>`__

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
