.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pwconv(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PWCONV(8)              System Management Commands              PWCONV(8)

NAME
-------------------------------------------------

::

          pwconv, pwunconv, grpconv, grpunconv - convert to and from shadow
          passwords and groups


---------------------------------------------------------

::

          pwconv [options]

          pwunconv [options]

          grpconv [options]

          grpunconv [options]


---------------------------------------------------------------

::

          The pwconv command creates shadow from passwd and an optionally
          existing shadow.

          The pwunconv command creates passwd from passwd and shadow and
          then removes shadow.

          The grpconv command creates gshadow from group and an optionally
          existing gshadow.

          The grpunconv command creates group from group and gshadow and
          then removes gshadow.

          These four programs all operate on the normal and shadow password
          and group files: /etc/passwd, /etc/group, /etc/shadow, and
          /etc/gshadow.

          Each program acquires the necessary locks before conversion.
          pwconv and grpconv are similar. First, entries in the shadowed
          file which don't exist in the main file are removed. Then,
          shadowed entries which don't have `x' as the password in the main
          file are updated. Any missing shadowed entries are added.
          Finally, passwords in the main file are replaced with `x'. These
          programs can be used for initial conversion as well to update the
          shadowed file if the main file is edited by hand.

          pwconv will use the values of PASS_MIN_DAYS, PASS_MAX_DAYS, and
          PASS_WARN_AGE from /etc/login.defs when adding new entries to
          /etc/shadow.

          Likewise pwunconv and grpunconv are similar. Passwords in the
          main file are updated from the shadowed file. Entries which exist
          in the main file but not in the shadowed file are left alone.
          Finally, the shadowed file is removed. Some password aging
          information is lost by pwunconv. It will convert what it can.


-------------------------------------------------------

::

          The options which apply to the pwconv, pwunconv, grpconv, and
          grpunconv commands are:

          -h, --help
              Display help message and exit.

          -R, --root CHROOT_DIR
              Apply changes in the CHROOT_DIR directory and use the
              configuration files from the CHROOT_DIR directory.


-------------------------------------------------

::

          Errors in the password or group files (such as invalid or
          duplicate entries) may cause these programs to loop forever or
          fail in other strange ways. Please run pwck and grpck to correct
          any such errors before converting to or from shadow passwords or
          groups.


-------------------------------------------------------------------

::

          The following configuration variable in /etc/login.defs changes
          the behavior of grpconv and grpunconv:

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

          The following configuration variables in /etc/login.defs change
          the behavior of pwconv:

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


---------------------------------------------------

::

          /etc/login.defs
              Shadow password suite configuration.


---------------------------------------------------------

::

          grpck(8), login.defs(5), pwck(8).

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

   shadow-utils 4.8.1             08/27/2021                      PWCONV(8)

--------------

Pages that refer to this page: `gshadow(5) <../man5/gshadow.5.html>`__, 
`passwd(5) <../man5/passwd.5.html>`__, 
`passwd(5@@shadow-utils) <../man5/passwd.5@@shadow-utils.html>`__, 
`shadow(5) <../man5/shadow.5.html>`__

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
