.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dh_installsystemd(1) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DH_INSTALLSYSTEMD(1)            Debhelper           DH_INSTALLSYSTEMD(1)

NAME
-------------------------------------------------

::

          dh_installsystemd - install systemd unit files


---------------------------------------------------------

::

          dh_installsystemd [debhelper options] [--restart-after-upgrade]
          [--no-stop-on-upgrade] [--no-enable] [--no-start] [--name=name]
          [unit file ...]


---------------------------------------------------------------

::

          dh_installsystemd is a debhelper program that is responsible for
          installing package maintainer supplied systemd unit files.

          It also finds the service files installed by a package and
          generates preinst, postinst, and prerm code blocks for enabling,
          disabling, starting, stopping, and restarting the corresponding
          systemd services, when the package is installed, updated, or
          removed. These snippets are added to the maintainer scripts by
          dh_installdeb(1).

          deb-systemd-helper(1) is used to enable and disable systemd
          units, thus it is not necessary that the machine actually runs
          systemd during package installation time, enabling happens on all
          machines in order to be able to switch from sysvinit to systemd
          and back.

          dh_installsystemd operates on all unit files installed by a
          package. For only generating blocks for specific unit files, pass
          them as arguments, "dh_installsystemd quota.service". Specific
          unit files can be excluded from processing using the -X common
          debhelper(1) option.


---------------------------------------------------

::

          debian/package.mount, debian/package.path, debian/package@.path,
          debian/package.service, debian/package@.service,
          debian/package.socket, debian/package@.socket,
          debian/package.target, debian/package@.target,
          debian/package.timer, debian/package@.timer
              If any of those files exists, they are installed into
              usr/lib/systemd/system/ in the package build directory.

          debian/package.tmpfile
              Only used in compat 12 or earlier.  In compat 13+, this file
              is handled by dh_installtmpfiles(1) instead.

              If this exists, it is installed into usr/lib/tmpfiles.d/ in
              the package build directory. Note that the "tmpfiles.d"
              mechanism is currently only used by systemd.


-------------------------------------------------------

::

          --no-enable
              Disable the service(s) on purge, but do not enable them on
              install.

              Note that this option does not affect whether the services
              are started.  Please remember to also use --no-start if the
              service should not be started.

          --name=name
              This option controls several things.

              It changes the name that dh_installsystemd uses when it looks
              for maintainer provided systemd unit files as listed in the
              "FILES" section.  As an example, dh_installsystemd --name foo
              will look for debian/package.foo.service instead of
              debian/package.service).  These unit files are installed as
              name.unit-extension (in the example, it would be installed as
              foo.service).

              Furthermore, if no unit files are passed explicitly as
              command line arguments, dh_installsystemd will only act on
              unit files called name (rather than all unit files found in
              the package).

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
              Do not stop service on upgrade. This has the side-effect of
              not restarting the service as a part of the upgrade.

              If you want to restart the service with minimal downtime,
              please use --restart-after-upgrade (default in compat 10 or
              later).  If you want the service to be restarted but be
              stopped during the upgrade, then please use
              --no-restart-after-upgrade (note the "after-upgrade").

              Note that the --no-restart-on-upgrade alias is deprecated and
              will be removed in compat 14.  This is to avoid confusion
              with the --no-restart-after-upgrade option.

          --no-start
              Do not start the unit file after upgrades and after initial
              installation (the latter is only relevant for services
              without a corresponding init script).

              Note that this option does not affect whether the services
              are enabled.  Please remember to also use --no-enable if the
              services should not be enabled.

          unit file ...
              Only process and generate maintscripts for the installed unit
              files with the (base)name unit file.

              Note: dh_installsystemd will still install unit files from
              debian/ but it will not generate any maintscripts for them
              unless they are explicitly listed in unit file ...


---------------------------------------------------

::

          This command is not idempotent. dh_prep(1) should be called
          between invocations of this command (with the same arguments).
          Otherwise, it may cause multiple instances of the same text to be
          added to maintainer scripts.


---------------------------------------------------------

::

          debhelper(7), dh_installinit(1), deb-systemd-helper(1)


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

   13.5                           2021-08-26           DH_INSTALLSYSTEMD(1)

--------------

Pages that refer to this page:
`dh_installinit(1) <../man1/dh_installinit.1.html>`__, 
`dh_installsystemduser(1) <../man1/dh_installsystemduser.1.html>`__, 
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
