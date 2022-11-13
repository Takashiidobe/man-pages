.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

groupdel(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `EXIT VALUES <#EXIT_VALUES>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GROUPDEL(8)            System Management Commands            GROUPDEL(8)

NAME
-------------------------------------------------

::

          groupdel - delete a group


---------------------------------------------------------

::

          groupdel [options] GROUP


---------------------------------------------------------------

::

          The groupdel command modifies the system account files, deleting
          all entries that refer to GROUP. The named group must exist.


-------------------------------------------------------

::

          The options which apply to the groupdel command are:

          -f, --force
              This option forces the removal of the group, even if there's
              some user having the group as the primary one.

          -h, --help
              Display help message and exit.

          -R, --root CHROOT_DIR
              Apply changes in the CHROOT_DIR directory and use the
              configuration files from the CHROOT_DIR directory.

          -P, --prefix PREFIX_DIR
              Apply changes in the PREFIX_DIR directory and use the
              configuration files from the PREFIX_DIR directory. This
              option does not chroot and is intended for preparing a
              cross-compilation target. Some limitations: NIS and LDAP
              users/groups are not verified. PAM authentication is using
              the host files. No SELINUX support.


-------------------------------------------------------

::

          You may not remove the primary group of any existing user. You
          must remove the user before you remove the group.

          You should manually check all file systems to ensure that no
          files remain owned by this group.


-------------------------------------------------------------------

::

          The following configuration variables in /etc/login.defs change
          the behavior of this tool:

          MAX_MEMBERS_PER_GROUP (number)
              Maximum members per group entry. When the maximum is reached,
              a new group entry (line) is started in /etc/group (with the
              same name, same password, and same GID).

              The default value is 0, meaning that there are no limits in
              the number of members in a group.

              This feature (split group) permits to limit the length of
              lines in the group file. This is useful to make sure that
              lines for NIS groups are not larger than 1024 characters.

              If you need to enforce such limit, you can use 25.

              Note: split groups may not be supported by all tools (even in
              the Shadow toolsuite). You should not use this variable
              unless you really need it.


---------------------------------------------------

::

          /etc/group
              Group account information.

          /etc/gshadow
              Secure group account information.


---------------------------------------------------------------

::

          The groupdel command exits with the following values:

          0
              success

          2
              invalid command syntax

          6
              specified group doesn't exist

          8
              can't remove user's primary group

          10
              can't update group file


---------------------------------------------------------

::

          chfn(1), chsh(1), passwd(1), gpasswd(8), groupadd(8),
          groupmod(8), useradd(8), userdel(8), usermod(8).

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

   shadow-utils 4.8.1             08/27/2021                    GROUPDEL(8)

--------------

Pages that refer to this page: `gpasswd(1) <../man1/gpasswd.1.html>`__, 
`groupadd(8) <../man8/groupadd.8.html>`__, 
`groupmems(8) <../man8/groupmems.8.html>`__, 
`groupmod(8) <../man8/groupmod.8.html>`__, 
`useradd(8) <../man8/useradd.8.html>`__, 
`userdel(8) <../man8/userdel.8.html>`__, 
`usermod(8) <../man8/usermod.8.html>`__

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
