.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

failsafe_context(5) — Linux manual page
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

   failsafe_context(5)       SELinux configuration      failsafe_context(5)

NAME
-------------------------------------------------

::

          failsafe_context - The SELinux fail safe context configuration
          file


---------------------------------------------------------------

::

          The failsafe_context file allows SELinux-aware applications such
          as PAM(8) to obtain a known valid login context for an
          administrator if no valid default entries can be found elsewhere.

          selinux_failsafe_context_path(3) will return the active policy
          path to this file. The default failsafe context file is:
                 /etc/selinux/{SELINUXTYPE}/contexts/failsafe_context

          Where {SELINUXTYPE} is the entry from the selinux configuration
          file config (see selinux_config(5)).

          The following functions read this file from the active policy
          path if they cannot obtain a default context:
                 get_default_context(3)
                 get_ordered_context_list(3)
                 get_ordered_context_list_with_level(3)
                 get_default_context_with_level(3)
                 get_default_context_with_role(3)
                 get_default_context_with_rolelevel(3)
                 query_user_context(3)
                 manual_user_enter_context(3)


---------------------------------------------------------------

::

          The file consists of a single line entry as follows:
                 role:type[:range]

          Where:
                 role type range
                        A role, type and optional range (for MCS/MLS),
                        separated by colons (:) to form a valid login
                        process context for an administrator to access the
                        system.


-------------------------------------------------------

::

          # ./contexts/failsafe_context
          unconfined_r:unconfined_t:s0


---------------------------------------------------------

::

          selinux(8), selinux_failsafe_context_path(3), PAM(8),
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

   Security Enhanced Linux        28-Nov-2011           failsafe_context(5)

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
