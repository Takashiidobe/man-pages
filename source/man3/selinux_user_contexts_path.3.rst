.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

selinux_binary_policy_path(3) — Linux manual page
=================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   selinux_binary_policy_path(3)ux API Documentationx_binary_policy_path(3)

NAME
-------------------------------------------------

::

          selinux_path, selinux_policy_root, selinux_binary_policy_path,
          selinux_current_policy_path, selinux_failsafe_context_path,
          selinux_removable_context_path, selinux_default_context_path,
          selinux_user_contexts_path, selinux_file_context_path,
          selinux_media_context_path, selinux_contexts_path - These
          functions return the paths to the active SELinux policy
          configuration directories and files


---------------------------------------------------------

::

          #include <selinux/selinux.h>

          const char *selinux_path(void);

          const char *selinux_policy_root(void);

          const char *selinux_binary_policy_path(void);

          const char *selinux_current_policy_path(void);

          const char *selinux_failsafe_context_path(void);

          const char *selinux_removable_context_path(void);

          const char *selinux_default_context_path(void);

          const char *selinux_user_contexts_path(void);

          const char *selinux_usersconf_path(void);

          const char *selinux_x_context_path(void);

          const char *selinux_sepgsql_context_path(void);

          const char *selinux_file_context_path(void);

          const char *selinux_media_context_path(void);

          const char *selinux_securetty_types_path(void);

          const char *selinux_contexts_path(void);


---------------------------------------------------------------

::

          These functions return the paths to the active policy
          configuration directories and files based on the settings in
          /etc/selinux/config.

          selinux_path() returns the top-level SELinux configuration
          directory.

          selinux_policy_root() returns the top-level policy directory.

          selinux_binary_policy_path() returns the binary policy file
          loaded into kernel.

          selinux_current_policy_path() returns the currently loaded policy
          file from the kernel.

          selinux_default_type_path() returns the context file mapping
          roles to default types.

          selinux_failsafe_context_path() returns the failsafe context for
          emergency logins.

          selinux_removable_context_path() returns the filesystem context
          for removable media.

          selinux_default_context_path() returns the system-wide default
          contexts for user sessions.

          selinux_user_contexts_path() returns the directory containing
          per-user default contexts.

          selinux_usersconf_path() returns the file containing mapping
          between Linux Users and SELinux users.

          selinux_x_context_path() returns the file containing
          configuration for XSELinux extension.

          selinux_sepgsql_context_path() returns the file containing
          configuration for SE-PostgreSQL.

          selinux_netfilter_context_path() returns the default netfilter
          context.

          selinux_file_context_path() returns the default system file
          contexts configuration.

          selinux_file_context_local_path() returns the local customization
          file contexts configuration.

          selinux_file_context_homedir_path() returns the home directory
          file contexts configuration.

          selinux_media_context_path() returns the file contexts for media
          device nodes.

          selinux_contexts_path() returns the directory containing all of
          the context configuration files.

          selinux_securetty_types_path() returns the defines tty types for
          newrole securettys.


-----------------------------------------------------

::

          This manual page was written by Dan Walsh <dwalsh@redhat.com>.


---------------------------------------------------------

::

          selinux(8)

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

   dwalsh@redhat.com           15 November 2004selinux_binary_policy_path(3)

--------------

Pages that refer to this page:
`matchpathcon(3) <../man3/matchpathcon.3.html>`__, 
`default_contexts(5) <../man5/default_contexts.5.html>`__, 
`default_type(5) <../man5/default_type.5.html>`__, 
`failsafe_context(5) <../man5/failsafe_context.5.html>`__, 
`removable_context(5) <../man5/removable_context.5.html>`__, 
`securetty_types(5) <../man5/securetty_types.5.html>`__, 
`selabel_file(5) <../man5/selabel_file.5.html>`__, 
`selabel_media(5) <../man5/selabel_media.5.html>`__, 
`selabel_x(5) <../man5/selabel_x.5.html>`__, 
`selinux_config(5) <../man5/selinux_config.5.html>`__, 
`seusers(5) <../man5/seusers.5.html>`__, 
`user_contexts(5) <../man5/user_contexts.5.html>`__

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
