.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd.automount(5) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `AUTOMATIC DEPENDEN               |                                   |
| CIES <#AUTOMATIC_DEPENDENCIES>`__ |                                   |
| \| `FSTAB <#FSTAB>`__ \|          |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD.AUTOMOUNT(5)        systemd.automount       SYSTEMD.AUTOMOUNT(5)

NAME
-------------------------------------------------

::

          systemd.automount - Automount unit configuration


---------------------------------------------------------

::

          automount.automount


---------------------------------------------------------------

::

          A unit configuration file whose name ends in ".automount" encodes
          information about a file system automount point controlled and
          supervised by systemd.

          This man page lists the configuration options specific to this
          unit type. See systemd.unit(5) for the common options of all unit
          configuration files. The common configuration items are
          configured in the generic [Unit] and [Install] sections. The
          automount specific configuration options are configured in the
          [Automount] section.

          Automount units must be named after the automount directories
          they control. Example: the automount point /home/lennart must be
          configured in a unit file home-lennart.automount. For details
          about the escaping logic used to convert a file system path to a
          unit name see systemd.unit(5). Note that automount units cannot
          be templated, nor is it possible to add multiple names to an
          automount unit by creating additional symlinks to its unit file.

          For each automount unit file a matching mount unit file (see
          systemd.mount(5) for details) must exist which is activated when
          the automount path is accessed. Example: if an automount unit
          home-lennart.automount is active and the user accesses
          /home/lennart the mount unit home-lennart.mount will be
          activated.

          Automount units may be used to implement on-demand mounting as
          well as parallelized mounting of file systems.

          Note that automount units are separate from the mount itself, so
          you should not set After= or Requires= for mount dependencies
          here. For example, you should not set After=network-online.target
          or similar on network filesystems. Doing so may result in an
          ordering cycle.

          Note that automount support on Linux is privileged, automount
          units are hence only available in the system service manager (and
          root's user service manager), but not in unprivileged user's
          service manager.


-------------------------------------------------------------------------------------

::

      Implicit Dependencies
          The following dependencies are implicitly added:

          •   If an automount unit is beneath another mount unit in the
              file system hierarchy, both a requirement and an ordering
              dependency between both units are created automatically.

          •   An implicit Before= dependency is created between an
              automount unit and the mount unit it activates.

      Default Dependencies
          The following dependencies are added unless
          DefaultDependencies=no is set:

          •   Automount units acquire automatic Before= and Conflicts= on
              umount.target in order to be stopped during shutdown.

          •   Automount units automatically gain an After= dependency on
              local-fs-pre.target, and a Before= dependency on
              local-fs.target.


---------------------------------------------------

::

          Automount units may either be configured via unit files, or via
          /etc/fstab (see fstab(5) for details).

          For details how systemd parses /etc/fstab see systemd.mount(5).

          If an automount point is configured in both /etc/fstab and a unit
          file, the configuration in the latter takes precedence.


-------------------------------------------------------

::

          Automount files must include an [Automount] section, which
          carries information about the file system automount points it
          supervises. The options specific to the [Automount] section of
          automount units are the following:

          Where=
              Takes an absolute path of a directory of the automount point.
              If the automount point does not exist at time that the
              automount point is installed, it is created. This string must
              be reflected in the unit filename. (See above.) This option
              is mandatory.

          DirectoryMode=
              Directories of automount points (and any parent directories)
              are automatically created if needed. This option specifies
              the file system access mode used when creating these
              directories. Takes an access mode in octal notation. Defaults
              to 0755.

          TimeoutIdleSec=
              Configures an idle timeout. Once the mount has been idle for
              the specified time, systemd will attempt to unmount. Takes a
              unit-less value in seconds, or a time span value such as
              "5min 20s". Pass 0 to disable the timeout logic. The timeout
              is disabled by default.


---------------------------------------------------------

::

          systemd(1), systemctl(1), systemd.unit(5), systemd.mount(5),
          mount(8), automount(8), systemd.directives(7)

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

   systemd 249                                         SYSTEMD.AUTOMOUNT(5)

--------------

Pages that refer to this page: `systemd(1) <../man1/systemd.1.html>`__, 
`systemd-mount(1) <../man1/systemd-mount.1.html>`__, 
`systemd.mount(5) <../man5/systemd.mount.5.html>`__, 
`systemd.unit(5) <../man5/systemd.unit.5.html>`__, 
`systemd.syntax(7) <../man7/systemd.syntax.7.html>`__

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
