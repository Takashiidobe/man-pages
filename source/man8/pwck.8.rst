.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pwck(8) — Linux manual page
===========================

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

   PWCK(8)                System Management Commands                PWCK(8)

NAME
-------------------------------------------------

::

          pwck - verify integrity of password files


---------------------------------------------------------

::

          pwck [options] [passwd [ shadow ]]


---------------------------------------------------------------

::

          The pwck command verifies the integrity of the users and
          authentication information. It checks that all entries in
          /etc/passwd and /etc/shadow have the proper format and contain
          valid data. The user is prompted to delete entries that are
          improperly formatted or which have other uncorrectable errors.

          Checks are made to verify that each entry has:

          •   the correct number of fields

          •   a unique and valid user name

          •   a valid user and group identifier

          •   a valid primary group

          •   a valid home directory

          •   a valid login shell

          shadow checks are enabled when a second file parameter is
          specified or when /etc/shadow exists on the system.

          These checks are the following:

          •   every passwd entry has a matching shadow entry, and every
              shadow entry has a matching passwd entry

          •   passwords are specified in the shadowed file

          •   shadow entries have the correct number of fields

          •   shadow entries are unique in shadow

          •   the last password changes are not in the future

          The checks for correct number of fields and unique user name are
          fatal. If the entry has the wrong number of fields, the user will
          be prompted to delete the entire line. If the user does not
          answer affirmatively, all further checks are bypassed. An entry
          with a duplicated user name is prompted for deletion, but the
          remaining checks will still be made. All other errors are warning
          and the user is encouraged to run the usermod command to correct
          the error.

          The commands which operate on the /etc/passwd file are not able
          to alter corrupted or duplicated entries.  pwck should be used in
          those circumstances to remove the offending entry.


-------------------------------------------------------

::

          The -r and -s options cannot be combined.

          The options which apply to the pwck command are:

          --badname
              Allow names that do not conform to standards.

          -h, --help
              Display help message and exit.

          -q, --quiet
              Report errors only. The warnings which do not require any
              action from the user won't be displayed.

          -r, --read-only
              Execute the pwck command in read-only mode.

          -R, --root CHROOT_DIR
              Apply changes in the CHROOT_DIR directory and use the
              configuration files from the CHROOT_DIR directory.

          -s, --sort
              Sort entries in /etc/passwd and /etc/shadow by UID.

          By default, pwck operates on the files /etc/passwd and
          /etc/shadow. The user may select alternate files with the passwd
          and shadow parameters.


-------------------------------------------------------------------

::

          The following configuration variables in /etc/login.defs change
          the behavior of this tool:

          NONEXISTENT (string)
              If a system account intentionally does not have a home
              directory that exists, this string can be provided in the
              /etc/passwd entry for the account to indicate this. The
              result is that pwck will not emit a spurious warning for this
              account.

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

          /etc/group
              Group account information.

          /etc/passwd
              User account information.

          /etc/shadow
              Secure user account information.


---------------------------------------------------------------

::

          The pwck command exits with the following values:

          0
              success

          1
              invalid command syntax

          2
              one or more bad password entries

          3
              can't open password files

          4
              can't lock password files

          5
              can't update password files

          6
              can't sort password files


---------------------------------------------------------

::

          group(5), grpck(8), passwd(5), shadow(5), usermod(8).

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

   shadow-utils 4.8.1             08/27/2021                        PWCK(8)

--------------

Pages that refer to this page:
`passwd(5@@shadow-utils) <../man5/passwd.5@@shadow-utils.html>`__, 
`shadow(5) <../man5/shadow.5.html>`__, 
`grpck(8) <../man8/grpck.8.html>`__, 
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
