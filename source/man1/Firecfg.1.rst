.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

firecfg(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DEFA                             |                                   |
| ULT ACTIONS <#DEFAULT_ACTIONS>`__ |                                   |
| \| `OPTIONS <#OPTIONS>`__ \|      |                                   |
| `LICENSE <#LICENSE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FIRECFG(1)                  firecfg man page                  FIRECFG(1)

NAME
-------------------------------------------------

::

          Firecfg - Desktop integration utility for Firejail software.


---------------------------------------------------------

::

          firecfg [OPTIONS]


---------------------------------------------------------------

::

          Firecfg is the desktop integration utility for Firejail sandbox.
          It allows the user to sandbox applications automatically by
          clicking on desktop manager icons and menus.

          The integration covers:

                 - programs started in a terminal - typing "firefox" would
                 be enough to start a sandboxed Firefox browser

                 - programs started by clicking on desktop manager menus -
                 all major desktop managers are supported

                 - programs started by clicking on file icons in file
                 manager - only Cinnamon, KDE, LXDE/LXQT, MATE and XFCE
                 desktop managers are supported in this moment

          To set it up, run "sudo firecfg" after installing Firejail
          software.  The same command should also be run after installing
          new programs. If the program is supported by Firejail, the
          symbolic link in /usr/local/bin will be created. For a full list
          of programs supported by default run "cat
          /usr/lib/firejail/firecfg.config".

          For user-driven manual integration, see DESKTOP INTEGRATION
          section in man 1 firejail.


-----------------------------------------------------------------------

::

          The following actions are implemented by default by running sudo
          firecfg:

                 - set or update the symbolic links for desktop
                 integration;

                 - add the current user to Firejail user access database
                 (firecfg --add-users);

                 - fix desktop files in $HOME/.local/share/applications/
                 (firecfg --fix).


-------------------------------------------------------

::

          --add-users user [user]
                 Add the list of users to Firejail user access database.

                 Example:
                 $ sudo firecfg --add-users dustin lucas mike eleven

          --bindir=directory
                 Create and search symbolic links in directory instead of
                 the default location /usr/local/bin.  Directory should
                 precede /usr/bin and /bin in the PATH environment
                 variable.

          --clean
                 Remove all firejail symbolic links.

          --fix  Fix .desktop files. Some .desktop files use full path to
                 executable. Firecfg will check .desktop files in
                 /usr/share/applications/, replace full path by name if it
                 is in PATH, and write result to
                 $HOME/.local/share/applications/.  This action is done by
                 default when running "sudo firecfg". We have it as a
                 separate option for regular users.

          --fix-sound
                 Create a proper ~/.config/pulse/client.conf file without
                 shm support. On some PulseAudio versions, shared memory
                 support (shm) breaks the process ID namespace. PulseAudio
                 software was designed a long time ago, and the
                 introduction of PID namespace in Linux kernel breaks their
                 design. This was reportedly fixed in PulseAudio version 9.
                 If you have sound problems on your system, run "firecfg
                 --fix-sound" command in a terminal, followed by
                 logout/login in order to apply the changes.

          --debug
                 Print debug messages.

          -?, --help
                 Print options end exit.

          --list List all firejail symbolic links

          --version
                 Print program version and exit.

          Example:

          $ sudo firecfg
          /usr/local/bin/firefox created
          /usr/local/bin/vlc created
          [...]
          $ firecfg --list
          /usr/local/bin/firefox
          /usr/local/bin/vlc
          [...]
          $ sudo firecfg --clean
          /usr/local/bin/firefox removed
          /usr/local/bin/vlc removed
          [...]


-------------------------------------------------------

::

          This program is free software; you can redistribute it and/or
          modify it under the terms of the GNU General Public License as
          published by the Free Software Foundation; either version 2 of
          the License, or (at your option) any later version.

          Homepage: https://firejail.wordpress.com


---------------------------------------------------------

::

          firejail(1), firemon(1), firejail-profile(5), firejail-login(5),
          firejail-users(5), jailcheck(1)

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

   0.9.67                          Aug 2021                      FIRECFG(1)

--------------

Pages that refer to this page:
`firejail(1) <../man1/firejail.1.html>`__, 
`firemon(1) <../man1/firemon.1.html>`__, 
`jailcheck(1) <../man1/jailcheck.1.html>`__, 
`firejail-login(5) <../man5/firejail-login.5.html>`__, 
`firejail-profile(5) <../man5/firejail-profile.5.html>`__, 
`firejail-users(5) <../man5/firejail-users.5.html>`__, 
`jailtest(5) <../man5/jailtest.5.html>`__

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
