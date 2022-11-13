.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-halt.service(8) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-HALT.SERVICE(8)   systemd-halt.service   SYSTEMD-HALT.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-halt.service, systemd-poweroff.service, systemd-
          reboot.service, systemd-kexec.service, systemd-shutdown - System
          shutdown logic


---------------------------------------------------------

::

          systemd-halt.service

          systemd-poweroff.service

          systemd-reboot.service

          systemd-kexec.service

          /usr/lib/systemd/systemd-shutdown

          /usr/lib/systemd/system-shutdown/


---------------------------------------------------------------

::

          systemd-halt.service is a system service that is pulled in by
          halt.target and is responsible for the actual system halt.
          Similarly, systemd-poweroff.service is pulled in by
          poweroff.target, systemd-reboot.service by reboot.target and
          systemd-kexec.service by kexec.target to execute the respective
          actions.

          When these services are run, they ensure that PID 1 is replaced
          by the /usr/lib/systemd/systemd-shutdown tool which is then
          responsible for the actual shutdown. Before shutting down, this
          binary will try to unmount all remaining file systems, disable
          all remaining swap devices, detach all remaining storage devices
          and kill all remaining processes.

          It is necessary to have this code in a separate binary because
          otherwise rebooting after an upgrade might be broken — the
          running PID 1 could still depend on libraries which are not
          available any more, thus keeping the file system busy, which then
          cannot be re-mounted read-only.

          Immediately before executing the actual system
          halt/poweroff/reboot/kexec systemd-shutdown will run all
          executables in /usr/lib/systemd/system-shutdown/ and pass one
          arguments to them: either "halt", "poweroff", "reboot" or
          "kexec", depending on the chosen action. All executables in this
          directory are executed in parallel, and execution of the action
          is not continued before all executables finished.

          Note that systemd-halt.service (and the related units) should
          never be executed directly. Instead, trigger system shutdown with
          a command such as "systemctl halt" or suchlike.


---------------------------------------------------------

::

          systemd(1), systemctl(1), systemd.special(7), reboot(2),
          systemd-suspend.service(8), bootup(7)

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

   systemd 249                                      SYSTEMD-HALT.SERVICE(8)

--------------

Pages that refer to this page: `bootup(7) <../man7/bootup.7.html>`__, 
`systemd-suspend.service(8) <../man8/systemd-suspend.service.8.html>`__

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
