.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gshadow(5) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GSHADOW(5)            File Formats and Conversions            GSHADOW(5)

NAME
-------------------------------------------------

::

          gshadow - shadowed group file


---------------------------------------------------------------

::

          /etc/gshadow contains the shadowed information for group
          accounts.

          This file must not be readable by regular users if password
          security is to be maintained.

          Each line of this file contains the following colon-separated
          fields:

          group name
              It must be a valid group name, which exist on the system.

          encrypted password
              Refer to crypt(3) for details on how this string is
              interpreted.

              If the password field contains some string that is not a
              valid result of crypt(3), for instance ! or *, users will not
              be able to use a unix password to access the group (but group
              members do not need the password).

              The password is used when a user who is not a member of the
              group wants to gain the permissions of this group (see
              newgrp(1)).

              This field may be empty, in which case only the group members
              can gain the group permissions.

              A password field which starts with an exclamation mark means
              that the password is locked. The remaining characters on the
              line represent the password field before the password was
              locked.

              This password supersedes any password specified in
              /etc/group.

          administrators
              It must be a comma-separated list of user names.

              Administrators can change the password or the members of the
              group.

              Administrators also have the same permissions as the members
              (see below).

          members
              It must be a comma-separated list of user names.

              Members can access the group without being prompted for a
              password.

              You should use the same list of users as in /etc/group.


---------------------------------------------------

::

          /etc/group
              Group account information.

          /etc/gshadow
              Secure group account information.


---------------------------------------------------------

::

          gpasswd(5), group(5), grpck(8), grpconv(8), newgrp(1).

COLOPHON
---------------------------------------------------------

::

          This page is part of the shadow-utils (utilities for managing
          accounts and shadow password files) project.  Information about
          the project can be found at 
          ⟨https://github.com/shadow-maint/shadow⟩.  If you have a bug
          report for this manual page, send it to
          pkg-shadow-devel@alioth-lists.debian.net.  This page was obtained
          from the project's upstream Git repository
          ⟨https://github.com/shadow-maint/shadow⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-14.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   shadow-utils 4.8.1             08/27/2021                     GSHADOW(5)

--------------

Pages that refer to this page: `gpasswd(1) <../man1/gpasswd.1.html>`__, 
`newgrp(1) <../man1/newgrp.1.html>`__,  `sg(1) <../man1/sg.1.html>`__, 
`group(5) <../man5/group.5.html>`__, 
`grpck(8) <../man8/grpck.8.html>`__,  `vipw(8) <../man8/vipw.8.html>`__

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
