.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

chpasswd(8) — Linux manual page
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

   CHPASSWD(8)            System Management Commands            CHPASSWD(8)

NAME
-------------------------------------------------

::

          chpasswd - update passwords in batch mode


---------------------------------------------------------

::

          chpasswd [options]


---------------------------------------------------------------

::

          The chpasswd command reads a list of user name and password pairs
          from standard input and uses this information to update a group
          of existing users. Each line is of the format:

          user_name:password

          By default the passwords must be supplied in clear-text, and are
          encrypted by chpasswd. Also the password age will be updated, if
          present.

          By default, passwords are encrypted by PAM, but (even if not
          recommended) you can select a different encryption method with
          the -e, -m, or -c options.

          Except when PAM is used to encrypt the passwords, chpasswd first
          updates all the passwords in memory, and then commits all the
          changes to disk if no errors occurred for any user.

          When PAM is used to encrypt the passwords (and update the
          passwords in the system database) then if a password cannot be
          updated chpasswd continues updating the passwords of the next
          users, and will return an error code on exit.

          This command is intended to be used in a large system environment
          where many accounts are created at a single time.


-------------------------------------------------------

::

          The options which apply to the chpasswd command are:

          -c, --crypt-method METHOD
              Use the specified method to encrypt the passwords.

              The available methods are DES, MD5, NONE, and SHA256 or
              SHA512 if your libc support these methods.

              By default, PAM is used to encrypt the passwords.

          -e, --encrypted
              Supplied passwords are in encrypted form.

          -h, --help
              Display help message and exit.

          -m, --md5
              Use MD5 encryption instead of DES when the supplied passwords
              are not encrypted.

          -R, --root CHROOT_DIR
              Apply changes in the CHROOT_DIR directory and use the
              configuration files from the CHROOT_DIR directory.

          -s, --sha-rounds ROUNDS
              Use the specified number of rounds to encrypt the passwords.

              The value 0 means that the system will choose the default
              number of rounds for the crypt method (5000).

              A minimal value of 1000 and a maximal value of 999,999,999
              will be enforced.

              You can only use this option with the SHA256 or SHA512 crypt
              method.

              By default, the number of rounds is defined by the
              SHA_CRYPT_MIN_ROUNDS and SHA_CRYPT_MAX_ROUNDS variables in
              /etc/login.defs.


-------------------------------------------------------

::

          Remember to set permissions or umask to prevent readability of
          unencrypted files by other users.


-------------------------------------------------------------------

::

          The following configuration variables in /etc/login.defs change
          the behavior of this tool:

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

          /etc/passwd
              User account information.

          /etc/shadow
              Secure user account information.

          /etc/login.defs
              Shadow password suite configuration.

          /etc/pam.d/chpasswd
              PAM configuration for chpasswd.


---------------------------------------------------------

::

          passwd(1), newusers(8), login.defs(5), useradd(8).

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

   shadow-utils 4.8.1             08/27/2021                    CHPASSWD(8)

--------------

Pages that refer to this page: `passwd(1) <../man1/passwd.1.html>`__

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
