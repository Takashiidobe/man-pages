.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

security_load_policy(3) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   security_load_policy(3) SELinux API documentationsecurity_load_policy(3)

NAME
-------------------------------------------------

::

          security_load_policy - load a new SELinux policy


---------------------------------------------------------

::

          #include <selinux/selinux.h>

          int security_load_policy(void *data, size_t len);

          int selinux_mkload_policy(int preservebools);

          int selinux_init_load_policy(int *enforce);


---------------------------------------------------------------

::

          security_load_policy() loads a new policy, returns 0 for success
          and -1 for error.

          selinux_mkload_policy() makes a policy image and loads it. This
          function provides a higher level interface for loading policy
          than security_load_policy(), internally determining the right
          policy version, locating and opening the policy file, mapping it
          into memory, manipulating it as needed for current boolean
          settings and/or local definitions, and then calling
          security_load_policy to load it.  preservebools is a boolean flag
          indicating whether current policy boolean values should be
          preserved into the new policy (if 1) or reset to the saved policy
          settings (if 0). The former case is the default for policy
          reloads, while the latter case is an option for policy reloads
          but is primarily used for the initial policy load.
          selinux_init_load_policy() performs the initial policy load. This
          function determines the desired enforcing mode, sets the enforce
          argument accordingly for the caller to use, sets the SELinux
          kernel enforcing status to match it, and loads the policy. It
          also internally handles the initial selinuxfs mount required to
          perform these actions.

          It should also be noted that after the initial policy load, the
          SELinux kernel code cannot anymore be disabled and the selinuxfs
          cannot be unmounted using a call to security_disable(3).
          Therefore, after the initial policy load, the only operational
          changes are those permitted by security_setenforce(3) (i.e.
          eventually setting the framework in permissive mode rather than
          in enforcing one).


-----------------------------------------------------------------

::

          Returns zero on success or -1 on error.


-----------------------------------------------------

::

          This manual page has been written by Guido Trentalancia
          <guido@trentalancia.com>


---------------------------------------------------------

::

          selinux(8), security_disable(3), setenforce(8)

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

   guido@trentalancia.com       3 November 2009     security_load_policy(3)

--------------

Pages that refer to this page:
`selinux_config(5) <../man5/selinux_config.5.html>`__

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
