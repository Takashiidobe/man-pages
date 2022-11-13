.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

shutdown(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SHUTDOWN(8)                     shutdown                     SHUTDOWN(8)

NAME
-------------------------------------------------

::

          shutdown - Halt, power-off or reboot the machine


---------------------------------------------------------

::

          shutdown [OPTIONS...] [TIME] [WALL...]


---------------------------------------------------------------

::

          shutdown may be used to halt, power-off or reboot the machine.

          The first argument may be a time string (which is usually "now").
          Optionally, this may be followed by a wall message to be sent to
          all logged-in users before going down.

          The time string may either be in the format "hh:mm" for
          hour/minutes specifying the time to execute the shutdown at,
          specified in 24h clock format. Alternatively it may be in the
          syntax "+m" referring to the specified number of minutes m from
          now.  "now" is an alias for "+0", i.e. for triggering an
          immediate shutdown. If no time argument is specified, "+1" is
          implied.

          Note that to specify a wall message you must specify a time
          argument, too.

          If the time argument is used, 5 minutes before the system goes
          down the /run/nologin file is created to ensure that further
          logins shall not be allowed.


-------------------------------------------------------

::

          The following options are understood:

          --help
              Print a short help text and exit.

          -H, --halt
              Halt the machine.

          -P, --poweroff
              Power-off the machine (the default).

          -r, --reboot
              Reboot the machine.

          -h
              Equivalent to --poweroff, unless --halt is specified.

          -k
              Do not halt, power-off, reboot, just write wall message.

          --no-wall
              Do not send wall message before halt, power-off, reboot.

          -c
              Cancel a pending shutdown. This may be used to cancel the
              effect of an invocation of shutdown with a time argument that
              is not "+0" or "now".


---------------------------------------------------------------

::

          On success, 0 is returned, a non-zero failure code otherwise.


---------------------------------------------------------

::

          systemd(1), systemctl(1), halt(8), wall(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                                  SHUTDOWN(8)

--------------

Pages that refer to this page:
`last(1@@util-linux) <../man1/last.1@@util-linux.html>`__, 
`login(1) <../man1/login.1.html>`__, 
`wall(1) <../man1/wall.1.html>`__, 
`reboot(2) <../man2/reboot.2.html>`__, 
`nologin(5) <../man5/nologin.5.html>`__, 
`boot(7) <../man7/boot.7.html>`__,  `halt(8) <../man8/halt.8.html>`__, 
`kexec(8) <../man8/kexec.8.html>`__

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
