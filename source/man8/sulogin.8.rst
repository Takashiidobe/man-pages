.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sulogin(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SULOGIN(8)                System Administration               SULOGIN(8)

NAME
-------------------------------------------------

::

          sulogin - single-user login


---------------------------------------------------------

::

          sulogin [options] [tty]


---------------------------------------------------------------

::

          sulogin is invoked by init when the system goes into single-user
          mode.

          The user is prompted:

          Give root password for system maintenance (or type Control-D for
          normal startup):

          If the root account is locked and --force is specified, no
          password is required.

          sulogin will be connected to the current terminal, or to the
          optional tty device that can be specified on the command line
          (typically /dev/console).

          When the user exits from the single-user shell, or presses
          control-D at the prompt, the system will continue to boot.


-------------------------------------------------------

::

          -e, --force
              If the default method of obtaining the root password from the
              system via getpwnam(3) fails, then examine /etc/passwd and
              /etc/shadow to get the password. If these files are damaged
              or nonexistent, or when root account is locked by '!' or '*'
              at the begin of the password then sulogin will start a root
              shell without asking for a password.

              Only use the -e option if you are sure the console is
              physically protected against unauthorized access.

          -p, --login-shell
              Specifying this option causes sulogin to start the shell
              process as a login shell.

          -t, --timeout seconds
              Specify the maximum amount of time to wait for user input. By
              default, sulogin will wait forever.

          -h, --help
              Display help text and exit.

          -V, --version
              Display version information and exit.


---------------------------------------------------------------

::

          sulogin looks for the environment variable SUSHELL or sushell to
          determine what shell to start. If the environment variable is not
          set, it will try to execute root’s shell from /etc/passwd. If
          that fails, it will fall back to /bin/sh.


-------------------------------------------------------

::

          sulogin was written by Miquel van Smoorenburg for sysvinit and
          later ported to util-linux by Dave Reisner and Karel Zak.


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The sulogin command is part of the util-linux package which can
          be downloaded from Linux Kernel Archive
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

   util-linux 2.37.85-637cc       2021-04-02                     SULOGIN(8)

--------------

Pages that refer to this page:
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
