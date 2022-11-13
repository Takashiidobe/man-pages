.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

halt(8) — Linux manual page
===========================

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

   HALT(8)                           halt                           HALT(8)

NAME
-------------------------------------------------

::

          halt, poweroff, reboot - Halt, power-off or reboot the machine


---------------------------------------------------------

::

          halt [OPTIONS...]

          poweroff [OPTIONS...]

          reboot [OPTIONS...]


---------------------------------------------------------------

::

          halt, poweroff, reboot may be used to halt, power-off, or reboot
          the machine. All three commands take the same options.


-------------------------------------------------------

::

          The following options are understood:

          --help
              Print a short help text and exit.

          --halt
              Halt the machine, regardless of which one of the three
              commands is invoked.

          -p, --poweroff
              Power-off the machine, regardless of which one of the three
              commands is invoked.

          --reboot
              Reboot the machine, regardless of which one of the three
              commands is invoked.

          -f, --force
              Force immediate halt, power-off, or reboot. When specified
              once, this results in an immediate but clean shutdown by the
              system manager. When specified twice, this results in an
              immediate shutdown without contacting the system manager. See
              the description of --force in systemctl(1) for more details.

          -w, --wtmp-only
              Only write wtmp shutdown entry, do not actually halt,
              power-off, reboot.

          -d, --no-wtmp
              Do not write wtmp shutdown entry.

          -n, --no-sync
              Don't sync hard disks/storage media before halt, power-off,
              reboot.

          --no-wall
              Do not send wall message before halt, power-off, reboot.


---------------------------------------------------------------

::

          On success, 0 is returned, a non-zero failure code otherwise.


---------------------------------------------------

::

          These commands are implemented in a way that preserves basic
          compatibility with the original SysV commands.  systemctl(1)
          verbs halt, poweroff, reboot provide the same functionality with
          some additional features.

          Note that on many SysV systems halt used to be synonymous to
          poweroff, i.e. both commands would equally result in powering the
          machine off. systemd is more accurate here, and halt results in
          halting the machine only (leaving power on), and poweroff is
          required to actually power it off.


---------------------------------------------------------

::

          systemd(1), systemctl(1), shutdown(8), wall(1)

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

   systemd 249                                                      HALT(8)

--------------

Pages that refer to this page: `reboot(2) <../man2/reboot.2.html>`__, 
`fsck.minix(8) <../man8/fsck.minix.8.html>`__, 
`mkfs.minix(8) <../man8/mkfs.minix.8.html>`__, 
`shutdown(8) <../man8/shutdown.8.html>`__

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
