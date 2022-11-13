.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

newusers(8) — Linux manual page
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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NEWUSERS(8)            System Management Commands            NEWUSERS(8)

NAME
-------------------------------------------------

::

          newusers - update and create new users in batch


---------------------------------------------------------

::

          newusers [options] [file]


---------------------------------------------------------------

::

          The newusers command reads a file (or the standard input by
          default) and uses this information to update a set of existing
          users or to create new users. Each line is in the same format as
          the standard password file (see passwd(5)) with the exceptions
          explained below:

          pw_name:pw_passwd:pw_uid:pw_gid:pw_gecos:pw_dir:pw_shell

          pw_name
              This is the name of the user.

              It can be the name of a new user or the name of an existing
              user (or a user created before by newusers). In case of an
              existing user, the user's information will be changed,
              otherwise a new user will be created.

          pw_passwd
              This field will be encrypted and used as the new value of the
              encrypted password.

          pw_uid
              This field is used to define the UID of the user.

              If the field is empty, a new (unused) UID will be defined
              automatically by newusers.

              If this field contains a number, this number will be used as
              the UID.

              If this field contains the name of an existing user (or the
              name of a user created before by newusers), the UID of the
              specified user will be used.

              If the UID of an existing user is changed, the files
              ownership of the user's file should be fixed manually.

          pw_gid
              This field is used to define the primary group ID for the
              user.

              If this field contains the name of an existing group (or a
              group created before by newusers), the GID of this group will
              be used as the primary group ID for the user.

              If this field is a number, this number will be used as the
              primary group ID of the user. If no groups exist with this
              GID, a new group will be created with this GID, and the name
              of the user.

              If this field is empty, a new group will be created with the
              name of the user and a GID will be automatically defined by
              newusers to be used as the primary group ID for the user and
              as the GID for the new group.

              If this field contains the name of a group which does not
              exist (and was not created before by newusers), a new group
              will be created with the specified name and a GID will be
              automatically defined by newusers to be used as the primary
              group ID for the user and GID for the new group.

          pw_gecos
              This field is copied in the GECOS field of the user.

          pw_dir
              This field is used to define the home directory of the user.

              If this field does not specify an existing directory, the
              specified directory is created, with ownership set to the
              user being created or updated and its primary group. Note
              that newusers does not create parent directories of the new
              user's home directory. The newusers command will fail to
              create the home directory if the parent directories do not
              exist, and will send a message to stderr informing the user
              of the failure. The newusers command will not halt or return
              a failure to the calling shell if it fails to create the home
              directory, it will continue to process the batch of new users
              specified.

              If the home directory of an existing user is changed,
              newusers does not move or copy the content of the old
              directory to the new location. This should be done manually.

          pw_shell
              This field defines the shell of the user. No checks are
              performed on this field.

          newusers first tries to create or change all the specified users,
          and then write these changes to the user or group databases. If
          an error occurs (except in the final writes to the databases), no
          changes are committed to the databases.

          During this first pass, users are created with a locked password
          (and passwords are not changed for the users which are not
          created). A second pass is used to update the passwords using
          PAM. Failures to update a password are reported, but will not
          stop the other password updates.

          This command is intended to be used in a large system environment
          where many accounts are updated at a single time.


-------------------------------------------------------

::

          The options which apply to the newusers command are:

          --badname
              Allow names that do not conform to standards.

          -h, --help
              Display help message and exit.

          -r, --system
              Create a system account.

              System users will be created with no aging information in
              /etc/shadow, and their numeric identifiers are chosen in the
              SYS_UID_MIN-SYS_UID_MAX range, defined in login.defs, instead
              of UID_MIN-UID_MAX (and their GID counterparts for the
              creation of groups).

          -R, --root CHROOT_DIR
              Apply changes in the CHROOT_DIR directory and use the
              configuration files from the CHROOT_DIR directory.


-------------------------------------------------------

::

          The input file must be protected since it contains unencrypted
          passwords.


-------------------------------------------------------------------

::

          The following configuration variables in /etc/login.defs change
          the behavior of this tool:

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

          /etc/login.defs
              Shadow password suite configuration.

          /etc/pam.d/newusers
              PAM configuration for newusers.

          /etc/subgid
              Per user subordinate group IDs.

          /etc/subuid
              Per user subordinate user IDs.


---------------------------------------------------------

::

          login.defs(5), passwd(1), subgid(5), subuid(5), useradd(8).

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

   shadow-utils 4.8.1             08/27/2021                    NEWUSERS(8)

--------------

Pages that refer to this page:
`newgidmap(1) <../man1/newgidmap.1.html>`__, 
`newuidmap(1) <../man1/newuidmap.1.html>`__, 
`subgid(5) <../man5/subgid.5.html>`__, 
`chpasswd(8) <../man8/chpasswd.8.html>`__, 
`useradd(8) <../man8/useradd.8.html>`__

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
