.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dh_systemd_start(1) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DH_SYSTEMD_START(1)             Debhelper            DH_SYSTEMD_START(1)

NAME
-------------------------------------------------

::

          dh_systemd_start - start/stop/restart systemd unit files


---------------------------------------------------------

::

          dh_systemd_start [debhelper options] [--restart-after-upgrade]
          [--no-stop-on-upgrade] [unit file ...]


---------------------------------------------------------------

::

          dh_systemd_start is a debhelper program that is responsible for
          starting/stopping or restarting systemd unit files in case no
          corresponding sysv init script is available.

          As with dh_installinit, the unit file is stopped before upgrades
          and started afterwards (unless --restart-after-upgrade is
          specified, in which case it will only be restarted after the
          upgrade).  This logic is not used when there is a corresponding
          SysV init script because invoke-rc.d performs the
          stop/start/restart in that case.


-------------------------------------------------------

::

          --restart-after-upgrade
              Do not stop the unit file until after the package upgrade has
              been completed.  This is the default behaviour in compat 10.

              In earlier compat levels the default was to stop the unit
              file in the prerm, and start it again in the postinst.

              This can be useful for daemons that should not have a
              possibly long downtime during upgrade. But you should make
              sure that the daemon will not get confused by the package
              being upgraded while it's running before using this option.

          --no-restart-after-upgrade
              Undo a previous --restart-after-upgrade (or the default of
              compat 10).  If no other options are given, this will cause
              the service to be stopped in the prerm script and started
              again in the postinst script.

          -r, --no-stop-on-upgrade, --no-restart-on-upgrade
              Do not stop service on upgrade.

          --no-start
              Do not start the unit file after upgrades and after initial
              installation (the latter is only relevant for services
              without a corresponding init script).


---------------------------------------------------

::

          Note that this command is not idempotent. dh_prep(1) should be
          called between invocations of this command (with the same
          arguments). Otherwise, it may cause multiple instances of the
          same text to be added to maintainer scripts.

          Note that dh_systemd_start should be run after dh_installinit so
          that it can detect corresponding SysV init scripts. The default
          sequence in dh does the right thing, this note is only relevant
          when you are calling dh_systemd_start manually.


---------------------------------------------------------

::

          debhelper(7)


-------------------------------------------------------

::

          pkg-systemd-maintainers@lists.alioth.debian.org

COLOPHON
---------------------------------------------------------

::

          This page is part of the debhelper (helper programs for
          debian/rules) project.  Information about the project can be
          found at [unknown -- if you know, please contact man-
          pages@man7.org] If you have a bug report for this manual page,
          send it to submit@bugs.debian.org.  This page was obtained from
          the project's upstream Git repository
          ⟨https://salsa.debian.org/debian/debhelper.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   13.4+nmu1                      2021-08-19            DH_SYSTEMD_START(1)

--------------

Pages that refer to this page: `dh(1) <../man1/dh.1.html>`__, 
`dh_systemd_enable(1) <../man1/dh_systemd_enable.1.html>`__, 
`debhelper(7) <../man7/debhelper.7.html>`__

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
