.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

default_contexts(5) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILE FORMAT <#FILE_FORMAT>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   default_contexts(5)       SELinux configuration      default_contexts(5)

NAME
-------------------------------------------------

::

          default_contexts - The SELinux default contexts configuration
          file


---------------------------------------------------------------

::

          The default contexts configuration file default_contexts contains
          entries that allow SELinux-aware login applications such as
          PAM(8)

          SELinux-aware login applications generally use one or more of the
          following libselinux functions that read these files from the
          active policy path:
                 get_default_context(3)
                 get_ordered_context_list(3)
                 get_ordered_context_list_with_level(3)
                 get_default_context_with_level(3)
                 get_default_context_with_role(3)
                 get_default_context_with_rolelevel(3)
                 query_user_context(3)
                 manual_user_enter_context(3)

          The default context configuration file path for the active policy
          is returned by selinux_default_contexts_path(3). The default,
          default contexts file is:
                 /etc/selinux/{SELINUXTYPE}/contexts/default_contexts

          Where {SELINUXTYPE} is the entry from the selinux configuration
          file config (see selinux_config(5)).


---------------------------------------------------------------

::

          Each line in the default configuration file consists of the
          following:
                 login_process user_login_process [user_login_process] ...

          Where:
                 login_process
                        This consists of a role:type[:range] entry that
                        represents the login process context that are
                        defined in the policy.
                 user_login_process
                        This consists of one or more role:type[:range]
                        entries that represent the user login process
                        context defined in the policy.


-------------------------------------------------------

::

          # ./contexts/default_contexts
          system_r:crond_t:s0            system_r:system_crond_t:s0
          system_r:local_login_t:s0      user_r:user_t:s0
          staff_r:staff_t:s0
          system_r:remote_login_t:s0     user_r:user_t:s0
          system_r:sshd_t:s0             user_r:user_t:s0
          system_r:sulogin_t:s0          sysadm_r:sysadm_t:s0
          system_r:xdm_t:s0              user_r:user_t:s0


---------------------------------------------------------

::

          selinux(8), selinux_default_contexts_path(3), PAM(8),
          selinux_default_type_path(3), get_default_context(3),
          get_ordered_context_list(3),
          get_ordered_context_list_with_level(3),
          get_default_context_with_level(3),
          get_default_context_with_role(3),
          get_default_context_with_rolelevel(3), query_user_context(3),
          manual_user_enter_context(3), selinux_config(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of the selinux (Security-Enhanced Linux user-
          space libraries and tools) project.  Information about the
          project can be found at 
          ⟨https://github.com/SELinuxProject/selinux/wiki⟩.  If you have a
          bug report for this manual page, see
          ⟨https://github.com/SELinuxProject/selinux/wiki/Contributing⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/SELinuxProject/selinux⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-23.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Security Enhanced Linux        28-Nov-2011           default_contexts(5)

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
