.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

selinux_restorecon_set_sehandle(3) — Linux manual page
======================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   selinux_restorecon_set_sehandle(3)I documentationtorecon_set_sehandle(3)

NAME
-------------------------------------------------

::

          selinux_restorecon_set_sehandle - set a labeling handle for use
          by selinux_restorecon(3)


---------------------------------------------------------

::

          #include <selinux/restorecon.h>
          #include <selinux/label.h>

          void selinux_restorecon_set_sehandle(struct selabel_handle
          *handle);


---------------------------------------------------------------

::

          selinux_restorecon_set_sehandle() sets the handle to be use by
          selinux_restorecon(3) when relabeling files.

          selinux_restorecon_set_sehandle() is generally used when
          customised selabel_open(3) parameters are required to perform
          relabeling operations with selinux_restorecon(3).


---------------------------------------------------------

::

          selinux_restorecon(3),
          selinux_restorecon_set_exclude_list(3),
          selinux_restorecon_default_handle(3),
          selinux_restorecon_set_alt_rootpath(3),
          selinux_restorecon_xattr(3)

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

   Security Enhanced Linux        20 Oct 2s0e1l5inux_restorecon_set_sehandle(3)

--------------

Pages that refer to this page:
`selinux_restorecon(3) <../man3/selinux_restorecon.3.html>`__, 
`selinux_restorecon_default_handle(3) <../man3/selinux_restorecon_default_handle.3.html>`__, 
`selinux_restorecon_set_alt_rootpath(3) <../man3/selinux_restorecon_set_alt_rootpath.3.html>`__, 
`selinux_restorecon_set_exclude_list(3) <../man3/selinux_restorecon_set_exclude_list.3.html>`__, 
`selinux_restorecon_xattr(3) <../man3/selinux_restorecon_xattr.3.html>`__

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
