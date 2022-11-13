.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

chage(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTE <#NOTE>`__ \|               |                                   |
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

   CHAGE(1)                      User Commands                     CHAGE(1)

NAME
-------------------------------------------------

::

          chage - change user password expiry information


---------------------------------------------------------

::

          chage [options] LOGIN


---------------------------------------------------------------

::

          The chage command changes the number of days between password
          changes and the date of the last password change. This
          information is used by the system to determine when a user must
          change their password.


-------------------------------------------------------

::

          The options which apply to the chage command are:

          -d, --lastday LAST_DAY
              Set the number of days since January 1st, 1970 when the
              password was last changed. The date may also be expressed in
              the format YYYY-MM-DD (or the format more commonly used in
              your area). If the LAST_DAY is set to 0 the user is forced to
              change his password on the next log on.

          -E, --expiredate EXPIRE_DATE
              Set the date or number of days since January 1, 1970 on which
              the user's account will no longer be accessible. The date may
              also be expressed in the format YYYY-MM-DD (or the format
              more commonly used in your area). A user whose account is
              locked must contact the system administrator before being
              able to use the system again.

              For example the following can be used to set an account to
              expire in 180 days:

                           chage -E $(date -d +180days +%Y-%m-%d)

              Passing the number -1 as the EXPIRE_DATE will remove an
              account expiration date.

          -h, --help
              Display help message and exit.

          -i, --iso8601
              When printing dates, use YYYY-MM-DD format.

          -I, --inactive INACTIVE
              Set the number of days of inactivity after a password has
              expired before the account is locked. The INACTIVE option is
              the number of days of inactivity. A user whose account is
              locked must contact the system administrator before being
              able to use the system again.

              Passing the number -1 as the INACTIVE will remove an
              account's inactivity.

          -l, --list
              Show account aging information.

          -m, --mindays MIN_DAYS
              Set the minimum number of days between password changes to
              MIN_DAYS. A value of zero for this field indicates that the
              user may change their password at any time.

          -M, --maxdays MAX_DAYS
              Set the maximum number of days during which a password is
              valid. When MAX_DAYS plus LAST_DAY is less than the current
              day, the user will be required to change their password
              before being able to use their account. This occurrence can
              be planned for in advance by use of the -W option, which
              provides the user with advance warning.

              Passing the number -1 as MAX_DAYS will remove checking a
              password's validity.

          -R, --root CHROOT_DIR
              Apply changes in the CHROOT_DIR directory and use the
              configuration files from the CHROOT_DIR directory.

          -W, --warndays WARN_DAYS
              Set the number of days of warning before a password change is
              required. The WARN_DAYS option is the number of days prior to
              the password expiring that a user will be warned their
              password is about to expire.

          If none of the options are selected, chage operates in an
          interactive fashion, prompting the user with the current values
          for all of the fields. Enter the new value to change the field,
          or leave the line blank to use the current value. The current
          value is displayed between a pair of [ ] marks.


-------------------------------------------------

::

          The chage program requires a shadow password file to be
          available.

          The chage program will report only the information from the
          shadow password file. This implies that configuration from other
          sources (e.g. LDAP or empty password hash field from the passwd
          file) that affect the user's login will not be shown in the chage
          output.

          The chage program will also not report any inconsistency between
          the shadow and passwd files (e.g. missing x in the passwd file).
          The pwck can be used to check for this kind of inconsistencies.

          The chage command is restricted to the root user, except for the
          -l option, which may be used by an unprivileged user to determine
          when their password or account is due to expire.


-------------------------------------------------------------------

::

          The following configuration variables in /etc/login.defs change
          the behavior of this tool:


---------------------------------------------------

::

          /etc/passwd
              User account information.

          /etc/shadow
              Secure user account information.


---------------------------------------------------------------

::

          The chage command exits with the following values:

          0
              success

          1
              permission denied

          2
              invalid command syntax

          15
              can't find the shadow password file


---------------------------------------------------------

::

          passwd(5), shadow(5).

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

   shadow-utils 4.8.1             08/27/2021                       CHAGE(1)

--------------

Pages that refer to this page: `shadow(5) <../man5/shadow.5.html>`__

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
