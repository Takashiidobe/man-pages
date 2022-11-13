.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

Another version of this page is provided by the
`shadow-utils <chsh.1@@shadow-utils.html>`__ project

--------------

chsh(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `VALID SHELLS <#VALID_SHELLS>`__  |                                   |
| \| `EXIT STATUS <#EXIT_STATUS>`__ |                                   |
| \| `AUTHORS <#AUTHORS>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CHSH(1)                       User Commands                      CHSH(1)

NAME
-------------------------------------------------

::

          chsh - change your login shell


---------------------------------------------------------

::

          chsh [-s shell] [-l] [-h] [-v] [username]


---------------------------------------------------------------

::

          chsh is used to change your login shell. If a shell is not given
          on the command line, chsh prompts for one.

          chsh supports non-local entries (kerberos, LDAP, etc.) if linked
          with libuser, otherwise use ypchsh(1), lchsh(1) or any other
          implementation for non-local entries.


-------------------------------------------------------

::

          -s, --shell shell
              Specify your login shell.

          -l, --list-shells
              Print the list of shells listed in /etc/shells and exit.

          -h, --help
              Display help text and exit.

          -v, --version
              Display version information and exit.


-----------------------------------------------------------------

::

          chsh will accept the full pathname of any executable file on the
          system.

          The default behavior for non-root users is to accept only shells
          listed in the /etc/shells file, and issue a warning for root
          user. It can also be configured at compile-time to only issue a
          warning for all users.


---------------------------------------------------------------

::

          Returns 0 if operation was successful, 1 if operation failed or
          command syntax was not valid.


-------------------------------------------------------

::

          Salvatore Valente <svalente@mit.edu>


---------------------------------------------------------

::

          login(1), login.defs(5), passwd(5), shells(5)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The chsh command is part of the util-linux package which can be
          downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.85-637cc       2021-04-02                        CHSH(1)

--------------

Pages that refer to this page: `chfn(1) <../man1/chfn.1.html>`__, 
`chfn(1@@shadow-utils) <../man1/chfn.1@@shadow-utils.html>`__, 
`intro(1) <../man1/intro.1.html>`__, 
`passwd(5) <../man5/passwd.5.html>`__, 
`shells(5) <../man5/shells.5.html>`__, 
`groupadd(8) <../man8/groupadd.8.html>`__, 
`groupdel(8) <../man8/groupdel.8.html>`__, 
`groupmems(8) <../man8/groupmems.8.html>`__, 
`groupmod(8) <../man8/groupmod.8.html>`__, 
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
