.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

grpck(8) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
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

   GRPCK(8)               System Management Commands               GRPCK(8)

NAME
-------------------------------------------------

::

          grpck - verify integrity of group files


---------------------------------------------------------

::

          grpck [options] [group [ shadow ]]


---------------------------------------------------------------

::

          The grpck command verifies the integrity of the groups
          information. It checks that all entries in /etc/group and
          /etc/gshadow have the proper format and contain valid data. The
          user is prompted to delete entries that are improperly formatted
          or which have other uncorrectable errors.

          Checks are made to verify that each entry has:

          •   the correct number of fields

          •   a unique and valid group name

          •   a valid group identifier (/etc/group only)

          •   a valid list of members and administrators

          •   a corresponding entry in the /etc/gshadow file (respectively
              /etc/group for the gshadow checks)

          The checks for correct number of fields and unique group name are
          fatal. If an entry has the wrong number of fields, the user will
          be prompted to delete the entire line. If the user does not
          answer affirmatively, all further checks are bypassed. An entry
          with a duplicated group name is prompted for deletion, but the
          remaining checks will still be made. All other errors are
          warnings and the user is encouraged to run the groupmod command
          to correct the error.

          The commands which operate on the /etc/group and /etc/gshadow
          files are not able to alter corrupted or duplicated entries.
          grpck should be used in those circumstances to remove the
          offending entries.


-------------------------------------------------------

::

          The -r and -s options cannot be combined.

          The options which apply to the grpck command are:

          -h, --help
              Display help message and exit.

          -r, --read-only
              Execute the grpck command in read-only mode. This causes all
              questions regarding changes to be answered no without user
              intervention.

          -R, --root CHROOT_DIR
              Apply changes in the CHROOT_DIR directory and use the
              configuration files from the CHROOT_DIR directory.

          -s, --sort
              Sort entries in /etc/group and /etc/gshadow by GID.

          -S, --silence-warnings
              Suppress more controversial warnings, in particular warnings
              about inconsistency between group members listed in
              /etc/group and /etc/ghadow.

          By default, grpck operates on /etc/group and /etc/gshadow. The
          user may select alternate files with the group and shadow
          parameters.


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

          /etc/passwd
              User account information.


---------------------------------------------------------------

::

          The grpck command exits with the following values:

          0
              success

          1
              invalid command syntax

          2
              one or more bad group entries

          3
              can't open group files

          4
              can't lock group files

          5
              can't update group files


---------------------------------------------------------

::

          group(5), groupmod(8), gshadow(5), passwd(5), pwck(8), shadow(5).

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

   shadow-utils 4.8.1             08/27/2021                       GRPCK(8)

--------------

Pages that refer to this page: `gpasswd(1) <../man1/gpasswd.1.html>`__, 
`gshadow(5) <../man5/gshadow.5.html>`__, 
`pwck(8) <../man8/pwck.8.html>`__, 
`pwconv(8) <../man8/pwconv.8.html>`__

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
