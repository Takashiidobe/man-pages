.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

passwd(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `EXIT VALUES <#EXIT_VALUES>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PASSWD(1)                     User Commands                    PASSWD(1)

NAME
-------------------------------------------------

::

          passwd - change user password


---------------------------------------------------------

::

          passwd [options] [LOGIN]


---------------------------------------------------------------

::

          The passwd command changes passwords for user accounts. A normal
          user may only change the password for their own account, while
          the superuser may change the password for any account.  passwd
          also changes the account or associated password validity period.

      Password Changes
          The user is first prompted for their old password, if one is
          present. This password is then encrypted and compared against the
          stored password. The user has only one chance to enter the
          correct password. The superuser is permitted to bypass this step
          so that forgotten passwords may be changed.

          After the password has been entered, password aging information
          is checked to see if the user is permitted to change the password
          at this time. If not, passwd refuses to change the password and
          exits.

          The user is then prompted twice for a replacement password. The
          second entry is compared against the first and both are required
          to match in order for the password to be changed.

          Then, the password is tested for complexity. As a general
          guideline, passwords should consist of 6 to 8 characters
          including one or more characters from each of the following sets:

          •   lower case alphabetics

          •   digits 0 thru 9

          •   punctuation marks

          Care must be taken not to include the system default erase or
          kill characters.  passwd will reject any password which is not
          suitably complex.

      Hints for user passwords
          The security of a password depends upon the strength of the
          encryption algorithm and the size of the key space. The legacy
          UNIX System encryption method is based on the NBS DES algorithm.
          More recent methods are now recommended (see ENCRYPT_METHOD). The
          size of the key space depends upon the randomness of the password
          which is selected.

          Compromises in password security normally result from careless
          password selection or handling. For this reason, you should not
          select a password which appears in a dictionary or which must be
          written down. The password should also not be a proper name, your
          license number, birth date, or street address. Any of these may
          be used as guesses to violate system security.

          You can find advice on how to choose a strong password on
          http://en.wikipedia.org/wiki/Password_strength


-------------------------------------------------------

::

          The options which apply to the passwd command are:

          -a, --all
              This option can be used only with -S and causes show status
              for all users.

          -d, --delete
              Delete a user's password (make it empty). This is a quick way
              to disable a password for an account. It will set the named
              account passwordless.

          -e, --expire
              Immediately expire an account's password. This in effect can
              force a user to change their password at the user's next
              login.

          -h, --help
              Display help message and exit.

          -i, --inactive INACTIVE
              This option is used to disable an account after the password
              has been expired for a number of days. After a user account
              has had an expired password for INACTIVE days, the user may
              no longer sign on to the account.

          -k, --keep-tokens
              Indicate password change should be performed only for expired
              authentication tokens (passwords). The user wishes to keep
              their non-expired tokens as before.

          -l, --lock
              Lock the password of the named account. This option disables
              a password by changing it to a value which matches no
              possible encrypted value (it adds a ´!´ at the beginning of
              the password).

              Note that this does not disable the account. The user may
              still be able to login using another authentication token
              (e.g. an SSH key). To disable the account, administrators
              should use usermod --expiredate 1 (this set the account's
              expire date to Jan 2, 1970).

              Users with a locked password are not allowed to change their
              password.

          -n, --mindays MIN_DAYS
              Set the minimum number of days between password changes to
              MIN_DAYS. A value of zero for this field indicates that the
              user may change their password at any time.

          -q, --quiet
              Quiet mode.

          -r, --repository REPOSITORY
              change password in REPOSITORY repository

          -R, --root CHROOT_DIR
              Apply changes in the CHROOT_DIR directory and use the
              configuration files from the CHROOT_DIR directory.

          -S, --status
              Display account status information. The status information
              consists of 7 fields. The first field is the user's login
              name. The second field indicates if the user account has a
              locked password (L), has no password (NP), or has a usable
              password (P). The third field gives the date of the last
              password change. The next four fields are the minimum age,
              maximum age, warning period, and inactivity period for the
              password. These ages are expressed in days.

          -u, --unlock
              Unlock the password of the named account. This option
              re-enables a password by changing the password back to its
              previous value (to the value before using the -l option).

          -w, --warndays WARN_DAYS
              Set the number of days of warning before a password change is
              required. The WARN_DAYS option is the number of days prior to
              the password expiring that a user will be warned that their
              password is about to expire.

          -x, --maxdays MAX_DAYS
              Set the maximum number of days a password remains valid.
              After MAX_DAYS, the password is required to be changed.

              Passing the number -1 as MAX_DAYS will remove checking a
              password's validity.


-------------------------------------------------------

::

          Password complexity checking may vary from site to site. The user
          is urged to select a password as complex as he or she feels
          comfortable with.

          Users may not be able to change their password on a system if NIS
          is enabled and they are not logged into the NIS server.

          passwd uses PAM to authenticate users and to change their
          passwords.


---------------------------------------------------

::

          /etc/passwd
              User account information.

          /etc/shadow
              Secure user account information.

          /etc/pam.d/passwd
              PAM configuration for passwd.


---------------------------------------------------------------

::

          The passwd command exits with the following values:

          0
              success

          1
              permission denied

          2
              invalid combination of options

          3
              unexpected failure, nothing done

          4
              unexpected failure, passwd file missing

          5
              passwd file busy, try again

          6
              invalid argument to option


---------------------------------------------------------

::

          chpasswd(8), passwd(5), shadow(5), usermod(8).

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

   shadow-utils 4.8.1             08/27/2021                      PASSWD(1)

--------------

Pages that refer to this page:
`ldappasswd(1) <../man1/ldappasswd.1.html>`__, 
`login(1) <../man1/login.1.html>`__, 
`login(1@@shadow-utils) <../man1/login.1@@shadow-utils.html>`__, 
`crypt(3) <../man3/crypt.3.html>`__,  `pts(4) <../man4/pts.4.html>`__, 
`login.defs(5) <../man5/login.defs.5.html>`__, 
`passwd(5) <../man5/passwd.5.html>`__, 
`passwd(5@@shadow-utils) <../man5/passwd.5@@shadow-utils.html>`__, 
`shadow(5) <../man5/shadow.5.html>`__, 
`chpasswd(8) <../man8/chpasswd.8.html>`__, 
`groupadd(8) <../man8/groupadd.8.html>`__, 
`groupdel(8) <../man8/groupdel.8.html>`__, 
`groupmems(8) <../man8/groupmems.8.html>`__, 
`groupmod(8) <../man8/groupmod.8.html>`__, 
`newusers(8) <../man8/newusers.8.html>`__, 
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
