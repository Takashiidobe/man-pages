.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gpasswd(1) — Linux manual page
==============================

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

   GPASSWD(1)                    User Commands                   GPASSWD(1)

NAME
-------------------------------------------------

::

          gpasswd - administer /etc/group and /etc/gshadow


---------------------------------------------------------

::

          gpasswd [option] group


---------------------------------------------------------------

::

          The gpasswd command is used to administer /etc/group, and
          /etc/gshadow. Every group can have administrators, members and a
          password.

          System administrators can use the -A option to define group
          administrator(s) and the -M option to define members. They have
          all rights of group administrators and members.

          gpasswd called by a group administrator with a group name only
          prompts for the new password of the group.

          If a password is set the members can still use newgrp(1) without
          a password, and non-members must supply the password.

      Notes about group passwords
          Group passwords are an inherent security problem since more than
          one person is permitted to know the password. However, groups are
          a useful tool for permitting co-operation between different
          users.


-------------------------------------------------------

::

          Except for the -A and -M options, the options cannot be combined.

          The options which apply to the gpasswd command are:

          -a, --add user
              Add the user to the named group.

          -d, --delete user
              Remove the user from the named group.

          -h, --help
              Display help message and exit.

          -Q, --root CHROOT_DIR
              Apply changes in the CHROOT_DIR directory and use the
              configuration files from the CHROOT_DIR directory.

          -r, --remove-password
              Remove the password from the named group. The group password
              will be empty. Only group members will be allowed to use
              newgrp to join the named group.

          -R, --restrict
              Restrict the access to the named group. The group password is
              set to "!". Only group members with a password will be
              allowed to use newgrp to join the named group.

          -A, --administrators user,...
              Set the list of administrative users.

          -M, --members user,...
              Set the list of group members.


-------------------------------------------------------

::

          This tool only operates on the /etc/group and /etc/gshadow files.
          Thus you cannot change any NIS or LDAP group. This must be
          performed on the corresponding server.


-------------------------------------------------------------------

::

          The following configuration variables in /etc/login.defs change
          the behavior of this tool:

          ENCRYPT_METHOD (string)
              This defines the system default encryption algorithm for
              encrypting passwords (if no algorithm are specified on the
              command line).

              It can take one of these values: DES (default), MD5, SHA256,
              SHA512. MD5 and DES should not be used for new hashes, see
              crypt(5) for recommendations.

              Note: this parameter overrides the MD5_CRYPT_ENAB variable.

              Note: This only affect the generation of group passwords. The
              generation of user passwords is done by PAM and subject to
              the PAM configuration. It is recommended to set this variable
              consistently with the PAM configuration.

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

          MD5_CRYPT_ENAB (boolean)
              Indicate if passwords must be encrypted using the MD5-based
              algorithm. If set to yes, new passwords will be encrypted
              using the MD5-based algorithm compatible with the one used by
              recent releases of FreeBSD. It supports passwords of
              unlimited length and longer salt strings. Set to no if you
              need to copy encrypted passwords to other systems which don't
              understand the new algorithm. Default is no.

              This variable is superseded by the ENCRYPT_METHOD variable or
              by any command line option used to configure the encryption
              algorithm.

              This variable is deprecated. You should use ENCRYPT_METHOD.

              Note: This only affect the generation of group passwords. The
              generation of user passwords is done by PAM and subject to
              the PAM configuration. It is recommended to set this variable
              consistently with the PAM configuration.

          SHA_CRYPT_MIN_ROUNDS (number), SHA_CRYPT_MAX_ROUNDS (number)
              When ENCRYPT_METHOD is set to SHA256 or SHA512, this defines
              the number of SHA rounds used by the encryption algorithm by
              default (when the number of rounds is not specified on the
              command line).

              With a lot of rounds, it is more difficult to brute forcing
              the password. But note also that more CPU resources will be
              needed to authenticate users.

              If not specified, the libc will choose the default number of
              rounds (5000), which is orders of magnitude too low for
              modern hardware.

              The values must be inside the 1000-999,999,999 range.

              If only one of the SHA_CRYPT_MIN_ROUNDS or
              SHA_CRYPT_MAX_ROUNDS values is set, then this value will be
              used.

              If SHA_CRYPT_MIN_ROUNDS > SHA_CRYPT_MAX_ROUNDS, the highest
              value will be used.

              Note: This only affect the generation of group passwords. The
              generation of user passwords is done by PAM and subject to
              the PAM configuration. It is recommended to set this variable
              consistently with the PAM configuration.


---------------------------------------------------

::

          /etc/group
              Group account information.

          /etc/gshadow
              Secure group account information.


---------------------------------------------------------

::

          newgrp(1), groupadd(8), groupdel(8), groupmod(8), grpck(8),
          group(5), gshadow(5).

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

   shadow-utils 4.8.1             08/27/2021                     GPASSWD(1)

--------------

Pages that refer to this page: `newgrp(1) <../man1/newgrp.1.html>`__, 
`sg(1) <../man1/sg.1.html>`__,  `group(5) <../man5/group.5.html>`__, 
`chgpasswd(8) <../man8/chgpasswd.8.html>`__

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
