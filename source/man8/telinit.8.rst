.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

telinit(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TELINIT(8)                       telinit                      TELINIT(8)

NAME
-------------------------------------------------

::

          telinit - Change SysV runlevel


---------------------------------------------------------

::

          telinit [OPTIONS...] {COMMAND}


---------------------------------------------------------------

::

          telinit may be used to change the SysV system runlevel. Since the
          concept of SysV runlevels is obsolete the runlevel requests will
          be transparently translated into systemd unit activation
          requests.


-------------------------------------------------------

::

          The following options are understood:

          --help
              Print a short help text and exit.

          --no-wall
              Do not send wall message before reboot/halt/power-off.

          The following commands are understood:

          0
              Power-off the machine. This is translated into an activation
              request for poweroff.target and is equivalent to systemctl
              poweroff.

          6
              Reboot the machine. This is translated into an activation
              request for reboot.target and is equivalent to systemctl
              reboot.

          2, 3, 4, 5
              Change the SysV runlevel. This is translated into an
              activation request for runlevel2.target, runlevel3.target,
              ... and is equivalent to systemctl isolate runlevel2.target,
              systemctl isolate runlevel3.target, ...

          1, s, S
              Change into system rescue mode. This is translated into an
              activation request for rescue.target and is equivalent to
              systemctl rescue.

          q, Q
              Reload daemon configuration. This is equivalent to systemctl
              daemon-reload.

          u, U
              Serialize state, reexecute daemon and deserialize state
              again. This is equivalent to systemctl daemon-reexec.


---------------------------------------------------------------

::

          On success, 0 is returned, a non-zero failure code otherwise.


---------------------------------------------------

::

          This is a legacy command available for compatibility only. It
          should not be used anymore, as the concept of runlevels is
          obsolete.


---------------------------------------------------------

::

          systemd(1), systemctl(1), wall(1)

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

   systemd 249                                                   TELINIT(8)

--------------

Pages that refer to this page: `systemd(1) <../man1/systemd.1.html>`__

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
