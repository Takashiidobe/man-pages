.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

`Go to the version of this page provided by the man-pages
project <passwd.5.html>`__

--------------

passwd(5) — Linux manual page
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

   PASSWD(5)             File Formats and Conversions             PASSWD(5)

NAME
-------------------------------------------------

::

          passwd - the password file


---------------------------------------------------------------

::

          /etc/passwd contains one line for each user account, with seven
          fields delimited by colons (“:”). These fields are:

          •   login name

          •   optional encrypted password

          •   numerical user ID

          •   numerical group ID

          •   user name or comment field

          •   user home directory

          •   optional user command interpreter

          If the password field is a lower-case “x”, then the encrypted
          password is actually stored in the shadow(5) file instead; there
          must be a corresponding line in the /etc/shadow file, or else the
          user account is invalid.

          The encrypted password field may be empty, in which case no
          password is required to authenticate as the specified login name.
          However, some applications which read the /etc/passwd file may
          decide not to permit any access at all if the password field is
          blank.

          A password field which starts with an exclamation mark means that
          the password is locked. The remaining characters on the line
          represent the password field before the password was locked.

          Refer to crypt(3) for details on how this string is interpreted.

          If the password field contains some string that is not a valid
          result of crypt(3), for instance ! or *, the user will not be
          able to use a unix password to log in (but the user may log in
          the system by other means).

          The comment field, also known as the gecos field, is used by
          various system utilities, such as finger(1). The use of an
          ampersand here will be replaced by the capitalised login name
          when the field is used or displayed by such system utilities.

          The home directory field provides the name of the initial working
          directory. The login program uses this information to set the
          value of the $HOME environmental variable.

          The command interpreter field provides the name of the user's
          command language interpreter, or the name of the initial program
          to execute. The login program uses this information to set the
          value of the $SHELL environmental variable. If this field is
          empty, it defaults to the value /bin/sh.


---------------------------------------------------

::

          /etc/passwd
              User account information.

          /etc/shadow
              optional encrypted password file

          /etc/passwd-
              Backup file for /etc/passwd.

              Note that this file is used by the tools of the shadow
              toolsuite, but not by all user and password management tools.


---------------------------------------------------------

::

          crypt(3), getent(1), getpwnam(3), login(1), passwd(1), pwck(8),
          pwconv(8), pwunconv(8), shadow(5), su(1), sulogin(8).

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

   shadow-utils 4.8.1             08/27/2021                      PASSWD(5)

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
