.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

groupadd(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `EXIT VALUES <#EXIT_VALUES>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GROUPADD(8)            System Management Commands            GROUPADD(8)

NAME
-------------------------------------------------

::

          groupadd - create a new group


---------------------------------------------------------

::

          groupadd [options] group


---------------------------------------------------------------

::

          The groupadd command creates a new group account using the values
          specified on the command line plus the default values from the
          system. The new group will be entered into the system files as
          needed.


-------------------------------------------------------

::

          The options which apply to the groupadd command are:

          -f, --force
              This option causes the command to simply exit with success
              status if the specified group already exists. When used with
              -g, and the specified GID already exists, another (unique)
              GID is chosen (i.e.  -g is turned off).

          -g, --gid GID
              The numerical value of the group's ID. This value must be
              unique, unless the -o option is used. The value must be
              non-negative. The default is to use the smallest ID value
              greater than or equal to GID_MIN and greater than every other
              group.

              See also the -r option and the GID_MAX description.

          -h, --help
              Display help message and exit.

          -K, --key KEY=VALUE
              Overrides /etc/login.defs defaults (GID_MIN, GID_MAX and
              others). Multiple -K options can be specified.

              Example: -K GID_MIN=100  -K GID_MAX=499

              Note: -K GID_MIN=10,GID_MAX=499 doesn't work yet.

          -o, --non-unique
              This option permits to add a group with a non-unique GID.

          -p, --password PASSWORD
              The encrypted password, as returned by crypt(3). The default
              is to disable the password.

              Note: This option is not recommended because the password (or
              encrypted password) will be visible by users listing the
              processes.

              You should make sure the password respects the system's
              password policy.

          -r, --system
              Create a system group.

              The numeric identifiers of new system groups are chosen in
              the SYS_GID_MIN-SYS_GID_MAX range, defined in login.defs,
              instead of GID_MIN-GID_MAX.

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

          -U, --users
              A list of usernames to add as members of the group.

              The default behavior (if the -g, -N, and -U options are not
              specified) is defined by the USERGROUPS_ENAB variable in
              /etc/login.defs.


-------------------------------------------------------------------

::

          The following configuration variables in /etc/login.defs change
          the behavior of this tool:

          GID_MAX (number), GID_MIN (number)
              Range of group IDs used for the creation of regular groups by
              useradd, groupadd, or newusers.

              The default value for GID_MIN (resp.  GID_MAX) is 1000 (resp.
              60000).

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

          SYS_GID_MAX (number), SYS_GID_MIN (number)
              Range of group IDs used for the creation of system groups by
              useradd, groupadd, or newusers.

              The default value for SYS_GID_MIN (resp.  SYS_GID_MAX) is 101
              (resp.  GID_MIN-1).


---------------------------------------------------

::

          /etc/group
              Group account information.

          /etc/gshadow
              Secure group account information.

          /etc/login.defs
              Shadow password suite configuration.


-------------------------------------------------------

::

          Groupnames must start with a lower case letter or an underscore,
          followed by lower case letters, digits, underscores, or dashes.
          They can end with a dollar sign. In regular expression terms:
          [a-z_][a-z0-9_-]*[$]?

          Groupnames may only be up to 16 characters long.

          You may not add a NIS or LDAP group. This must be performed on
          the corresponding server.

          If the groupname already exists in an external group database
          such as NIS or LDAP, groupadd will deny the group creation
          request.


---------------------------------------------------------------

::

          The groupadd command exits with the following values:

          0
              success

          2
              invalid command syntax

          3
              invalid argument to option

          4
              GID is already used (when called without -o)

          9
              group name is already used

          10
              can't update group file


---------------------------------------------------------

::

          chfn(1), chsh(1), passwd(1), gpasswd(8), groupdel(8),
          groupmod(8), login.defs(5), useradd(8), userdel(8), usermod(8).

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

   shadow-utils 4.8.1             08/27/2021                    GROUPADD(8)

--------------

Pages that refer to this page: `gpasswd(1) <../man1/gpasswd.1.html>`__, 
`homectl(1) <../man1/homectl.1.html>`__, 
`chgpasswd(8) <../man8/chgpasswd.8.html>`__, 
`groupdel(8) <../man8/groupdel.8.html>`__, 
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
