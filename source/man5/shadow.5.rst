.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

shadow(5) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SHADOW(5)             File Formats and Conversions             SHADOW(5)

NAME
-------------------------------------------------

::

          shadow - shadowed password file


---------------------------------------------------------------

::

          shadow is a file which contains the password information for the
          system's accounts and optional aging information.

          This file must not be readable by regular users if password
          security is to be maintained.

          Each line of this file contains 9 fields, separated by colons
          (“:”), in the following order:

          login name
              It must be a valid account name, which exist on the system.

          encrypted password
              This field may be empty, in which case no passwords are
              required to authenticate as the specified login name.
              However, some applications which read the /etc/shadow file
              may decide not to permit any access at all if the password
              field is empty.

              A password field which starts with an exclamation mark means
              that the password is locked. The remaining characters on the
              line represent the password field before the password was
              locked.

              Refer to crypt(3) for details on how this string is
              interpreted.

              If the password field contains some string that is not a
              valid result of crypt(3), for instance ! or *, the user will
              not be able to use a unix password to log in (but the user
              may log in the system by other means).

          date of last password change
              The date of the last password change, expressed as the number
              of days since Jan 1, 1970 00:00 UTC.

              The value 0 has a special meaning, which is that the user
              should change her password the next time she will log in the
              system.

              An empty field means that password aging features are
              disabled.

          minimum password age
              The minimum password age is the number of days the user will
              have to wait before she will be allowed to change her
              password again.

              An empty field and value 0 mean that there is no minimum
              password age.

          maximum password age
              The maximum password age is the number of days after which
              the user will have to change her password.

              After this number of days is elapsed, the password may still
              be valid. The user should be asked to change her password the
              next time she will log in.

              An empty field means that there are no maximum password age,
              no password warning period, and no password inactivity period
              (see below).

              If the maximum password age is lower than the minimum
              password age, the user cannot change her password.

          password warning period
              The number of days before a password is going to expire (see
              the maximum password age above) during which the user should
              be warned.

              An empty field and value 0 mean that there are no password
              warning period.

          password inactivity period
              The number of days after a password has expired (see the
              maximum password age above) during which the password should
              still be accepted (and the user should update her password
              during the next login).

              After expiration of the password and this expiration period
              is elapsed, no login is possible for the user. The user
              should contact her administrator.

              An empty field means that there are no enforcement of an
              inactivity period.

          account expiration date
              The date of expiration of the account, expressed as the
              number of days since Jan 1, 1970 00:00 UTC.

              Note that an account expiration differs from a password
              expiration. In case of an account expiration, the user shall
              not be allowed to login. In case of a password expiration,
              the user is not allowed to login using her password.

              An empty field means that the account will never expire.

              The value 0 should not be used as it is interpreted as either
              an account with no expiration, or as an expiration on Jan 1,
              1970.

          reserved field
              This field is reserved for future use.


---------------------------------------------------

::

          /etc/passwd
              User account information.

          /etc/shadow
              Secure user account information.

          /etc/shadow-
              Backup file for /etc/shadow.

              Note that this file is used by the tools of the shadow
              toolsuite, but not by all user and password management tools.


---------------------------------------------------------

::

          chage(1), login(1), passwd(1), passwd(5), pwck(8), pwconv(8),
          pwunconv(8), su(1), sulogin(8).

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

   shadow-utils 4.8.1             08/27/2021                      SHADOW(5)

--------------

Pages that refer to this page: `chage(1) <../man1/chage.1.html>`__, 
`expiry(1) <../man1/expiry.1.html>`__, 
`lslogins(1) <../man1/lslogins.1.html>`__, 
`passwd(1) <../man1/passwd.1.html>`__, 
`systemd-firstboot(1) <../man1/systemd-firstboot.1.html>`__, 
`getspnam(3) <../man3/getspnam.3.html>`__, 
`getspnam(3@@shadow-utils) <../man3/getspnam.3@@shadow-utils.html>`__, 
`shadow(3) <../man3/shadow.3.html>`__, 
`login.defs(5) <../man5/login.defs.5.html>`__, 
`passwd(5) <../man5/passwd.5.html>`__, 
`passwd(5@@shadow-utils) <../man5/passwd.5@@shadow-utils.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`grpck(8) <../man8/grpck.8.html>`__, 
`pam_unix(8) <../man8/pam_unix.8.html>`__, 
`pwck(8) <../man8/pwck.8.html>`__,  `vipw(8) <../man8/vipw.8.html>`__

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
