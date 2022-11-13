.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

jailcheck(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `OUTPUT <#OUTPUT>`__ \|           |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `LICENSE <#LICENSE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   JAILCHECK(1)               JAILCHECK man page               JAILCHECK(1)

NAME
-------------------------------------------------

::

          jailcheck - Simple utility program to test running sandboxes


---------------------------------------------------------

::

          sudo jailcheck [OPTIONS] [directory]


---------------------------------------------------------------

::

          jailcheck attaches itself to all sandboxes started by the user
          and performs some basic tests on the sandbox filesystem:

          1. Virtual directories
                 jailcheck extracts a list with the main virtual
                 directories installed by the sandbox.  These directories
                 are build by firejail at startup using --private* and
                 --whitelist commands.

          2. Noexec test
                 jailcheck inserts executable programs in /home/username,
                 /tmp, and /var/tmp directories and tries to run them from
                 inside the sandbox, thus testing if the directory is
                 executable or not.

          3. Read access test
                 jailcheck creates test files in the directories specified
                 by the user and tries to read them from inside the
                 sandbox.

          4. AppArmor test

          5. Seccomp test

          6. Networking test

          The program is started as root using sudo.


-------------------------------------------------------

::

          --debug
                 Print debug messages.

          -?, --help
                 Print options and exit.

          --version
                 Print program version and exit.

          [directory]
                 One or more directories in user home to test for read
                 access. ~/.ssh and ~/.gnupg are tested by default.


-----------------------------------------------------

::

          For each sandbox detected we print the following line:

               PID:USER:Sandbox Name:Command

          It is followed by relevant sandbox information, such as the
          virtual directories and various warnings.


-------------------------------------------------------

::

          $ sudo jailcheck
          2014:netblue::firejail /usr/bin/gimp
             Virtual dirs: /tmp, /var/tmp, /dev, /usr/share,
             Warning: I can run programs in /home/netblue
             Networking: disabled

          2055:netblue::firejail /usr/bin/ssh -X netblue@x.y.z.net
             Virtual dirs: /var/tmp, /dev, /usr/share, /run/user/1000,
             Warning: I can read ~/.ssh
             Networking: enabled

          2186:netblue:libreoffice:firejail --appimage /opt/LibreOffice-
          fresh.appimage
             Virtual dirs: /tmp, /var/tmp, /dev,
             Networking: enabled

          26090:netblue::/usr/bin/firejail /opt/firefox/firefox
             Virtual dirs: /home/netblue, /tmp, /var/tmp, /dev, /etc,
          /usr/share,
                           /run/user/1000,
             Networking: enabled

          26160:netblue:tor:firejail --private=~/tor-browser_en-US ./start-
          tor
             Warning: AppArmor not enabled
             Virtual dirs: /home/netblue, /tmp, /var/tmp, /dev, /etc, /bin,
                           /usr/share, /run/user/1000,
             Warning: I can run programs in /home/netblue
             Networking: enabled


-------------------------------------------------------

::

          This program is free software; you can redistribute it and/or
          modify it under the terms of the GNU General Public License as
          published by the Free Software Foundation; either version 2 of
          the License, or (at your option) any later version.

          Homepage: https://firejail.wordpress.com


---------------------------------------------------------

::

          firejail(1), firemon(1), firecfg(1), firejail-profile(5),
          firejail-login(5), firejail-users(5),

COLOPHON
---------------------------------------------------------

::

          This page is part of the Firejail (Firejail security sandbox)
          project.  Information about the project can be found at 
          ⟨https://firejail.wordpress.com⟩.  If you have a bug report for
          this manual page, see ⟨https://firejail.wordpress.com/support/⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/netblue30/firejail.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-16.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   0.9.67                          Aug 2021                    JAILCHECK(1)

--------------

Pages that refer to this page: `firecfg(1) <../man1/firecfg.1.html>`__, 
`firejail(1) <../man1/firejail.1.html>`__, 
`firemon(1) <../man1/firemon.1.html>`__, 
`firejail-login(5) <../man5/firejail-login.5.html>`__, 
`firejail-profile(5) <../man5/firejail-profile.5.html>`__, 
`firejail-users(5) <../man5/firejail-users.5.html>`__

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
