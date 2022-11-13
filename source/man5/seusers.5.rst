.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

seusers(5) — Linux manual page
==============================

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

   seusers(5)                SELinux configuration               seusers(5)

NAME
-------------------------------------------------

::

          seusers - The SELinux GNU/Linux user to SELinux user mapping
          configuration file


---------------------------------------------------------------

::

          The seusers file contains a list GNU/Linux user to SELinux user
          mapping for use by SELinux-aware login applications such as
          PAM(8).

          selinux_usersconf_path(3) will return the active policy path to
          this file. The default SELinux users mapping file is located at:
                 /etc/selinux/{SELINUXTYPE}/seusers

          Where {SELINUXTYPE} is the entry from the selinux configuration
          file config (see selinux_config(5)).

          getseuserbyname(3) reads this file to map a GNU/Linux user or
          group to an SELinux user.


---------------------------------------------------------------

::

          Each line of the seusers configuration file consists of the
          following:

                 [%group_id]|[user_id]:seuser_id[:range]

          Where:
                 group_id|user_id
                        The  GNU/Linux user id, or if preceded by the
                        percentage (%) symbol, then a GNU/Linux group id.
                        An optional entry set to __default__ can be
                        provided as a fall back if required.
                 seuser_id
                        The SELinux  user identity.
                 range
                        The optional level or range for an MLS/MCS policy.


-------------------------------------------------------

::

          # ./seusers
          system_u:system_u:s0-s15:c0.c255
          root:root:s0-s15:c0.c255
          fred:user_u:s0
          __default__:user_u:s0
          %user_group:user_u:s0


---------------------------------------------------------

::

          selinux(8), PAM(8), selinux_usersconf_path(3),
          getseuserbyname(3), selinux_config(5)

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

   Security Enhanced Linux        28-Nov-2011                    seusers(5)

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
