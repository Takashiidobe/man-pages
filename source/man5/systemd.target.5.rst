.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd.target(5) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `AUTOMATIC DEPENDEN               |                                   |
| CIES <#AUTOMATIC_DEPENDENCIES>`__ |                                   |
| \| `EXAMPLE <#EXAMPLE>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD.TARGET(5)            systemd.target            SYSTEMD.TARGET(5)

NAME
-------------------------------------------------

::

          systemd.target - Target unit configuration


---------------------------------------------------------

::

          target.target


---------------------------------------------------------------

::

          A unit configuration file whose name ends in ".target" encodes
          information about a target unit of systemd, which is used for
          grouping units and as well-known synchronization points during
          start-up.

          This unit type has no specific options. See systemd.unit(5) for
          the common options of all unit configuration files. The common
          configuration items are configured in the generic [Unit] and
          [Install] sections. A separate [Target] section does not exist,
          since no target-specific options may be configured.

          Target units do not offer any additional functionality on top of
          the generic functionality provided by units. They exist merely to
          group units via dependencies (useful as boot targets), and to
          establish standardized names for synchronization points used in
          dependencies between units. Among other things, target units are
          a more flexible replacement for SysV runlevels in the classic
          SysV init system. (And for compatibility reasons special target
          units such as runlevel3.target exist which are used by the SysV
          runlevel compatibility code in systemd. See systemd.special(7)
          for details).


-------------------------------------------------------------------------------------

::

      Implicit Dependencies
          There are no implicit dependencies for target units.

      Default Dependencies
          The following dependencies are added unless
          DefaultDependencies=no is set:

          •   Target units will automatically complement all configured
              dependencies of type Wants= or Requires= with dependencies of
              type After= unless DefaultDependencies=no is set in the
              specified units. Note that Wants= or Requires= must be
              defined in the target unit itself — if you for example define
              Wants=some.target in some.service, the automatic ordering
              will not be added.

          •   Target units automatically gain Conflicts= and Before=
              dependencies against shutdown.target.


-------------------------------------------------------

::

          Example 1. Simple standalone target

              # emergency-net.target

              [Unit]
              Description=Emergency Mode with Networking
              Requires=emergency.target systemd-networkd.service
              After=emergency.target systemd-networkd.service
              AllowIsolate=yes

          When adding dependencies to other units, it's important to check
          if they set DefaultDependencies=. Service units, unless they set
          DefaultDependencies=no, automatically get a dependency on
          sysinit.target. In this case, both emergency.target and
          systemd-networkd.service have DefaultDependencies=no, so they are
          suitable for use in this target, and do not pull in
          sysinit.target.

          You can now switch into this emergency mode by running systemctl
          isolate emergency-net.target or by passing the option
          systemd.unit=emergency-net.target on the kernel command line.

          Other units can have WantedBy=emergency-net.target in the
          [Install] section. After they are enabled using systemctl enable,
          they will be started before emergency-net.target is started. It
          is also possible to add arbitrary units as dependencies of
          emergency.target without modifying them by using systemctl
          add-wants.


---------------------------------------------------------

::

          systemd(1), systemctl(1), systemd.unit(5), systemd.special(7),
          systemd.directives(7)

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

   systemd 249                                            SYSTEMD.TARGET(5)

--------------

Pages that refer to this page:
`systemctl(1) <../man1/systemctl.1.html>`__, 
`systemd(1) <../man1/systemd.1.html>`__, 
`systemd.unit(5) <../man5/systemd.unit.5.html>`__, 
`bootup(7) <../man7/bootup.7.html>`__, 
`systemd.special(7) <../man7/systemd.special.7.html>`__, 
`systemd.syntax(7) <../man7/systemd.syntax.7.html>`__, 
`lvm2-activation-generator(8) <../man8/lvm2-activation-generator.8.html>`__, 
`runlevel(8) <../man8/runlevel.8.html>`__, 
`systemd-sysv-generator(8) <../man8/systemd-sysv-generator.8.html>`__, 
`systemd-xdg-autostart-generator(8) <../man8/systemd-xdg-autostart-generator.8.html>`__

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
