.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

useradd(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
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

   USERADD(8)             System Management Commands             USERADD(8)

NAME
-------------------------------------------------

::

          useradd - create a new user or update default new user
          information


---------------------------------------------------------

::

          useradd [options] LOGIN

          useradd -D

          useradd -D [options]


---------------------------------------------------------------

::

          When invoked without the -D option, the useradd command creates a
          new user account using the values specified on the command line
          plus the default values from the system. Depending on command
          line options, the useradd command will update system files and
          may also create the new user's home directory and copy initial
          files.

          By default, a group will also be created for the new user (see
          -g, -N, -U, and USERGROUPS_ENAB).


-------------------------------------------------------

::

          The options which apply to the useradd command are:

          --badname
              Allow names that do not conform to standards.

          -b, --base-dir BASE_DIR
              The default base directory for the system if -d HOME_DIR is
              not specified.  BASE_DIR is concatenated with the account
              name to define the home directory. If the -m option is not
              used, BASE_DIR must exist.

              If this option is not specified, useradd will use the base
              directory specified by the HOME variable in
              /etc/default/useradd, or /home by default.

          -c, --comment COMMENT
              Any text string. It is generally a short description of the
              login, and is currently used as the field for the user's full
              name.

          -d, --home-dir HOME_DIR
              The new user will be created using HOME_DIR as the value for
              the user's login directory. The default is to append the
              LOGIN name to BASE_DIR and use that as the login directory
              name. If the directory HOME_DIR does not exist, then it will
              be created unless the -M option is specified.

          -D, --defaults
              See below, the subsection "Changing the default values".

          -e, --expiredate EXPIRE_DATE
              The date on which the user account will be disabled. The date
              is specified in the format YYYY-MM-DD.

              If not specified, useradd will use the default expiry date
              specified by the EXPIRE variable in /etc/default/useradd, or
              an empty string (no expiry) by default.

          -f, --inactive INACTIVE
              The number of days after a password expires until the account
              is permanently disabled. A value of 0 disables the account as
              soon as the password has expired, and a value of -1 disables
              the feature.

              If not specified, useradd will use the default inactivity
              period specified by the INACTIVE variable in
              /etc/default/useradd, or -1 by default.

          -g, --gid GROUP
              The group name or number of the user's initial login group.
              The group name must exist. A group number must refer to an
              already existing group.

              If not specified, the behavior of useradd will depend on the
              USERGROUPS_ENAB variable in /etc/login.defs. If this variable
              is set to yes (or -U/--user-group is specified on the command
              line), a group will be created for the user, with the same
              name as her loginname. If the variable is set to no (or
              -N/--no-user-group is specified on the command line), useradd
              will set the primary group of the new user to the value
              specified by the GROUP variable in /etc/default/useradd, or
              100 by default.

          -G, --groups GROUP1[,GROUP2,...[,GROUPN]]]
              A list of supplementary groups which the user is also a
              member of. Each group is separated from the next by a comma,
              with no intervening whitespace. The groups are subject to the
              same restrictions as the group given with the -g option. The
              default is for the user to belong only to the initial group.

          -h, --help
              Display help message and exit.

          -k, --skel SKEL_DIR
              The skeleton directory, which contains files and directories
              to be copied in the user's home directory, when the home
              directory is created by useradd.

              This option is only valid if the -m (or --create-home) option
              is specified.

              If this option is not set, the skeleton directory is defined
              by the SKEL variable in /etc/default/useradd or, by default,
              /etc/skel.

              If possible, the ACLs and extended attributes are copied.

          -K, --key KEY=VALUE
              Overrides /etc/login.defs defaults (UID_MIN, UID_MAX, UMASK,
              PASS_MAX_DAYS and others).

              Example: -K PASS_MAX_DAYS=-1 can be used when creating system
              account to turn off password aging, even though system
              account has no password at all. Multiple -K options can be
              specified, e.g.: -K UID_MIN=100  -K UID_MAX=499

          -l, --no-log-init
              Do not add the user to the lastlog and faillog databases.

              By default, the user's entries in the lastlog and faillog
              databases are reset to avoid reusing the entry from a
              previously deleted user.

          -m, --create-home
              Create the user's home directory if it does not exist. The
              files and directories contained in the skeleton directory
              (which can be defined with the -k option) will be copied to
              the home directory.

              By default, if this option is not specified and CREATE_HOME
              is not enabled, no home directories are created.

              The directory where the user's home directory is created must
              exist and have proper SELinux context and permissions.
              Otherwise the user's home directory cannot be created or
              accessed.

          -M, --no-create-home
              Do no create the user's home directory, even if the system
              wide setting from /etc/login.defs (CREATE_HOME) is set to
              yes.

          -N, --no-user-group
              Do not create a group with the same name as the user, but add
              the user to the group specified by the -g option or by the
              GROUP variable in /etc/default/useradd.

              The default behavior (if the -g, -N, and -U options are not
              specified) is defined by the USERGROUPS_ENAB variable in
              /etc/login.defs.

          -o, --non-unique
              Allow the creation of a user account with a duplicate
              (non-unique) UID.

              This option is only valid in combination with the -u option.

          -p, --password PASSWORD
              The encrypted password, as returned by crypt(3). The default
              is to disable the password.

              Note: This option is not recommended because the password (or
              encrypted password) will be visible by users listing the
              processes.

              You should make sure the password respects the system's
              password policy.

          -r, --system
              Create a system account.

              System users will be created with no aging information in
              /etc/shadow, and their numeric identifiers are chosen in the
              SYS_UID_MIN-SYS_UID_MAX range, defined in /etc/login.defs,
              instead of UID_MIN-UID_MAX (and their GID counterparts for
              the creation of groups).

              Note that useradd will not create a home directory for such a
              user, regardless of the default setting in /etc/login.defs
              (CREATE_HOME). You have to specify the -m options if you want
              a home directory for a system account to be created.

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

          -s, --shell SHELL
              The name of the user's login shell. The default is to leave
              this field blank, which causes the system to select the
              default login shell specified by the SHELL variable in
              /etc/default/useradd, or an empty string by default.

          -u, --uid UID
              The numerical value of the user's ID. This value must be
              unique, unless the -o option is used. The value must be
              non-negative. The default is to use the smallest ID value
              greater than or equal to UID_MIN and greater than every other
              user.

              See also the -r option and the UID_MAX description.

          -U, --user-group
              Create a group with the same name as the user, and add the
              user to this group.

              The default behavior (if the -g, -N, and -U options are not
              specified) is defined by the USERGROUPS_ENAB variable in
              /etc/login.defs.

          -Z, --selinux-user SEUSER
              The SELinux user for the user's login. The default is to
              leave this field blank, which causes the system to select the
              default SELinux user.

      Changing the default values
          When invoked with only the -D option, useradd will display the
          current default values. When invoked with -D plus other options,
          useradd will update the default values for the specified options.
          Valid default-changing options are:

          -b, --base-dir BASE_DIR
              The path prefix for a new user's home directory. The user's
              name will be affixed to the end of BASE_DIR to form the new
              user's home directory name, if the -d option is not used when
              creating a new account.

              This option sets the HOME variable in /etc/default/useradd.

          -e, --expiredate EXPIRE_DATE
              The date on which the user account is disabled.

              This option sets the EXPIRE variable in /etc/default/useradd.

          -f, --inactive INACTIVE
              The number of days after a password has expired before the
              account will be disabled.

              This option sets the INACTIVE variable in
              /etc/default/useradd.

          -g, --gid GROUP
              The group name or ID for a new user's initial group (when the
              -N/--no-user-group is used or when the USERGROUPS_ENAB
              variable is set to no in /etc/login.defs). The named group
              must exist, and a numerical group ID must have an existing
              entry.

              This option sets the GROUP variable in /etc/default/useradd.

          -s, --shell SHELL
              The name of a new user's login shell.

              This option sets the SHELL variable in /etc/default/useradd.


---------------------------------------------------

::

          The system administrator is responsible for placing the default
          user files in the /etc/skel/ directory (or any other skeleton
          directory specified in /etc/default/useradd or on the command
          line).


-------------------------------------------------------

::

          You may not add a user to a NIS or LDAP group. This must be
          performed on the corresponding server.

          Similarly, if the username already exists in an external user
          database such as NIS or LDAP, useradd will deny the user account
          creation request.

          Usernames must start with a lower case letter or an underscore,
          followed by lower case letters, digits, underscores, or dashes.
          They can end with a dollar sign. In regular expression terms:
          [a-z_][a-z0-9_-]*[$]?

          Usernames may only be up to 32 characters long.


-------------------------------------------------------------------

::

          The following configuration variables in /etc/login.defs change
          the behavior of this tool:

          CREATE_HOME (boolean)
              Indicate if a home directory should be created by default for
              new users.

              This setting does not apply to system users, and can be
              overridden on the command line.

          GID_MAX (number), GID_MIN (number)
              Range of group IDs used for the creation of regular groups by
              useradd, groupadd, or newusers.

              The default value for GID_MIN (resp.  GID_MAX) is 1000 (resp.
              60000).

          HOME_MODE (number)
              The mode for new home directories. If not specified, the
              UMASK is used to create the mode.

              useradd and newusers use this to set the mode of the home
              directory they create.

          LASTLOG_UID_MAX (number)
              Highest user ID number for which the lastlog entries should
              be updated. As higher user IDs are usually tracked by remote
              user identity and authentication services there is no need to
              create a huge sparse lastlog file for them.

              No LASTLOG_UID_MAX option present in the configuration means
              that there is no user ID limit for writing lastlog entries.

          MAIL_DIR (string)
              The mail spool directory. This is needed to manipulate the
              mailbox when its corresponding user account is modified or
              deleted. If not specified, a compile-time default is used.

          MAIL_FILE (string)
              Defines the location of the users mail spool files relatively
              to their home directory.

          The MAIL_DIR and MAIL_FILE variables are used by useradd,
          usermod, and userdel to create, move, or delete the user's mail
          spool.

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

          PASS_MAX_DAYS (number)
              The maximum number of days a password may be used. If the
              password is older than this, a password change will be
              forced. If not specified, -1 will be assumed (which disables
              the restriction).

          PASS_MIN_DAYS (number)
              The minimum number of days allowed between password changes.
              Any password changes attempted sooner than this will be
              rejected. If not specified, 0 will be assumed (which disables
              the restriction).

          PASS_WARN_AGE (number)
              The number of days warning given before a password expires. A
              zero means warning is given only upon the day of expiration,
              a negative value means no warning is given. If not specified,
              no warning will be provided.

          SUB_GID_MIN (number), SUB_GID_MAX (number), SUB_GID_COUNT
          (number)
              If /etc/subuid exists, the commands useradd and newusers
              (unless the user already have subordinate group IDs) allocate
              SUB_GID_COUNT unused group IDs from the range SUB_GID_MIN to
              SUB_GID_MAX for each new user.

              The default values for SUB_GID_MIN, SUB_GID_MAX,
              SUB_GID_COUNT are respectively 100000, 600100000 and 65536.

          SUB_UID_MIN (number), SUB_UID_MAX (number), SUB_UID_COUNT
          (number)
              If /etc/subuid exists, the commands useradd and newusers
              (unless the user already have subordinate user IDs) allocate
              SUB_UID_COUNT unused user IDs from the range SUB_UID_MIN to
              SUB_UID_MAX for each new user.

              The default values for SUB_UID_MIN, SUB_UID_MAX,
              SUB_UID_COUNT are respectively 100000, 600100000 and 65536.

          SYS_GID_MAX (number), SYS_GID_MIN (number)
              Range of group IDs used for the creation of system groups by
              useradd, groupadd, or newusers.

              The default value for SYS_GID_MIN (resp.  SYS_GID_MAX) is 101
              (resp.  GID_MIN-1).

          SYS_UID_MAX (number), SYS_UID_MIN (number)
              Range of user IDs used for the creation of system users by
              useradd or newusers.

              The default value for SYS_UID_MIN (resp.  SYS_UID_MAX) is 101
              (resp.  UID_MIN-1).

          UID_MAX (number), UID_MIN (number)
              Range of user IDs used for the creation of regular users by
              useradd or newusers.

              The default value for UID_MIN (resp.  UID_MAX) is 1000 (resp.
              60000).

          UMASK (number)
              The file mode creation mask is initialized to this value. If
              not specified, the mask will be initialized to 022.

              useradd and newusers use this mask to set the mode of the
              home directory they create if HOME_MODE is not set.

              It is also used by pam_umask as the default umask value.

          USERGROUPS_ENAB (boolean)
              If set to yes, userdel will remove the user's group if it
              contains no more members, and useradd will create by default
              a group with the name of the user.


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

          /etc/default/useradd
              Default values for account creation.

          /etc/shadow-maint/useradd-pre.d/*,
          /etc/shadow-maint/useradd-post.d/*
              Run-part files to execute during user addition. The
              environment variable ACTION will be populated with useradd
              and SUBJECT with the username.  useradd-pre.d will be
              executed prior to any user addition.  useradd-post.d will
              execute after user addition. If a script exits non-zero then
              execution will terminate.

          /etc/skel/
              Directory containing default files.

          /etc/subgid
              Per user subordinate group IDs.

          /etc/subuid
              Per user subordinate user IDs.

          /etc/login.defs
              Shadow password suite configuration.


---------------------------------------------------------------

::

          The useradd command exits with the following values:

          0
              success

          1
              can't update password file

          2
              invalid command syntax

          3
              invalid argument to option

          4
              UID already in use (and no -o)

          6
              specified group doesn't exist

          9
              username already in use

          10
              can't update group file

          12
              can't create home directory

          14
              can't update SELinux user mapping


---------------------------------------------------------

::

          chfn(1), chsh(1), passwd(1), crypt(3), groupadd(8), groupdel(8),
          groupmod(8), login.defs(5), newusers(8), subgid(5), subuid(5),
          userdel(8), usermod(8).

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

   shadow-utils 4.8.1             08/27/2021                     USERADD(8)

--------------

Pages that refer to this page: `homectl(1) <../man1/homectl.1.html>`__, 
`newgidmap(1) <../man1/newgidmap.1.html>`__, 
`newuidmap(1) <../man1/newuidmap.1.html>`__, 
`subgid(5) <../man5/subgid.5.html>`__, 
`subuid(5) <../man5/subuid.5.html>`__, 
`chpasswd(8) <../man8/chpasswd.8.html>`__, 
`groupadd(8) <../man8/groupadd.8.html>`__, 
`groupdel(8) <../man8/groupdel.8.html>`__, 
`groupmems(8) <../man8/groupmems.8.html>`__, 
`groupmod(8) <../man8/groupmod.8.html>`__, 
`newusers(8) <../man8/newusers.8.html>`__, 
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
