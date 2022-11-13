.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

firejail-users(5) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ALTERNATIVE SO                   |                                   |
| LUTION <#ALTERNATIVE_SOLUTION>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `LICENSE <#LICENSE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FIREJAIL-USERS(5)        firejail.users man page       FIREJAIL-USERS(5)

NAME
-------------------------------------------------

::

          firejail.users - Firejail user access database


---------------------------------------------------------------

::

          /etc/firejail/firejail.users lists the users allowed to run
          firejail SUID executable.  root user is allowed by default, user
          nobody is never allowed.

          If the user is not allowed to start the sandbox, Firejail will
          attempt to run the program without sandboxing it.

          If the file is not present in the system, all users are allowed
          to use the sandbox.

          Example:

               $ cat /etc/firejail/firejail.users
               dustin
               lucas
               mike
               eleven

          Use a text editor to add or remove users from the list. You can
          also use firecfg --add-users command. Example:

               $ sudo firecfg --add-users dustin lucas mike eleven

          By default, running firecfg creates the file and adds the current
          user to the list. Example:

               $ sudo firecfg

          See man 1 firecfg for details.


---------------------------------------------------------------------------------

::

          An alternative way of restricting user access to firejail
          executable is to create a special firejail user group and allow
          only users in this group to run the sandbox:

               # addgroup --system firejail
               # chown root:firejail /usr/bin/firejail
               # chmod 4750 /usr/bin/firejail


---------------------------------------------------

::

          /etc/firejail/firejail.users


-------------------------------------------------------

::

          Firejail is free software; you can redistribute it and/or modify
          it under the terms of the GNU General Public License as published
          by the Free Software Foundation; either version 2 of the License,
          or (at your option) any later version.

          Homepage: https://firejail.wordpress.com


---------------------------------------------------------

::

          firejail(1), firemon(1), firecfg(1), firejail-profile(5),
          firejail-login(5), jailcheck(1)

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

   0.9.67                          Aug 2021               FIREJAIL-USERS(5)

--------------

Pages that refer to this page: `firecfg(1) <../man1/firecfg.1.html>`__, 
`firejail(1) <../man1/firejail.1.html>`__, 
`firemon(1) <../man1/firemon.1.html>`__, 
`jailcheck(1) <../man1/jailcheck.1.html>`__, 
`firejail-login(5) <../man5/firejail-login.5.html>`__, 
`firejail-profile(5) <../man5/firejail-profile.5.html>`__, 
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
