.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

newgrp(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NEWGRP(1)                     User Commands                    NEWGRP(1)

NAME
-------------------------------------------------

::

          newgrp - log in to a new group


---------------------------------------------------------

::

          newgrp [-] [group]


---------------------------------------------------------------

::

          The newgrp command is used to change the current group ID during
          a login session. If the optional - flag is given, the user's
          environment will be reinitialized as though the user had logged
          in, otherwise the current environment, including current working
          directory, remains unchanged.

          newgrp changes the current real group ID to the named group, or
          to the default group listed in /etc/passwd if no group name is
          given.  newgrp also tries to add the group to the user groupset.
          If not root, the user will be prompted for a password if she does
          not have a password (in /etc/shadow if this user has an entry in
          the shadowed password file, or in /etc/passwd otherwise) and the
          group does, or if the user is not listed as a member and the
          group has a password. The user will be denied access if the group
          password is empty and the user is not listed as a member.

          If there is an entry for this group in /etc/gshadow, then the
          list of members and the password of this group will be taken from
          this file, otherwise, the entry in /etc/group is considered.


-------------------------------------------------------------------

::

          The following configuration variables in /etc/login.defs change
          the behavior of this tool:

          SYSLOG_SG_ENAB (boolean)
              Enable "syslog" logging of sg activity.


---------------------------------------------------

::

          /etc/passwd
              User account information.

          /etc/shadow
              Secure user account information.

          /etc/group
              Group account information.

          /etc/gshadow
              Secure group account information.


---------------------------------------------------------

::

          id(1), login(1), su(1), sg(1), gpasswd(1), group(5), gshadow(5).

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

   shadow-utils 4.8.1             08/27/2021                      NEWGRP(1)

--------------

Pages that refer to this page: `flock(1) <../man1/flock.1.html>`__, 
`gpasswd(1) <../man1/gpasswd.1.html>`__, 
`groups(1@@shadow-utils) <../man1/groups.1@@shadow-utils.html>`__, 
`pmdammv(1) <../man1/pmdammv.1.html>`__, 
`sg(1) <../man1/sg.1.html>`__,  `group(5) <../man5/group.5.html>`__, 
`gshadow(5) <../man5/gshadow.5.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__

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
