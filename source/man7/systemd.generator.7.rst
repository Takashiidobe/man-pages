.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd.generator(7) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OUTPUT DIR                       |                                   |
| ECTORIES <#OUTPUT_DIRECTORIES>`__ |                                   |
| \|                                |                                   |
| `N                                |                                   |
| OTES ABOUT WRITING GENERATORS <#N |                                   |
| OTES_ABOUT_WRITING_GENERATORS>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD.GENERATOR(7)        systemd.generator       SYSTEMD.GENERATOR(7)

NAME
-------------------------------------------------

::

          systemd.generator - systemd unit generators


---------------------------------------------------------

::

          /path/to/generator normal-dir early-dir late-dir

          /run/systemd/system-generators/*
          /etc/systemd/system-generators/*
          /usr/local/lib/systemd/system-generators/*
          /usr/lib/systemd/system-generators/*

          /run/systemd/user-generators/*
          /etc/systemd/user-generators/*
          /usr/local/lib/systemd/user-generators/*
          /usr/lib/systemd/user-generators/*


---------------------------------------------------------------

::

          Generators are small executables placed in
          /usr/lib/systemd/system-generators/ and other directories listed
          above.  systemd(1) will execute these binaries very early at
          bootup and at configuration reload time — before unit files are
          loaded. Their main purpose is to convert configuration that is
          not native to the service manager into dynamically generated unit
          files, symlinks or unit file drop-ins, so that they can extend
          the unit file hierarchy the service manager subsequently loads
          and operates on.

          Each generator is called with three directory paths that are to
          be used for generator output. In these three directories,
          generators may dynamically generate unit files (regular ones,
          instances, as well as templates), unit file .d/ drop-ins, and
          create symbolic links to unit files to add additional
          dependencies, create aliases, or instantiate existing templates.
          Those directories are included in the unit load path of
          systemd(1), allowing generated configuration to extend or
          override existing definitions.

          Directory paths for generator output differ by priority:
          .../generator.early has priority higher than the admin
          configuration in /etc/, while .../generator has lower priority
          than /etc/ but higher than vendor configuration in /usr/, and
          .../generator.late has priority lower than all other
          configuration. See the next section and the discussion of unit
          load paths and unit overriding in systemd.unit(5).

          Generators are loaded from a set of paths determined during
          compilation, as listed above. System and user generators are
          loaded from directories with names ending in system-generators/
          and user-generators/, respectively. Generators found in
          directories listed earlier override the ones with the same name
          in directories lower in the list. A symlink to /dev/null or an
          empty file can be used to mask a generator, thereby preventing it
          from running. Please note that the order of the two directories
          with the highest priority is reversed with respect to the unit
          load path, and generators in /run/ overwrite those in /etc/.

          After installing new generators or updating the configuration,
          systemctl daemon-reload may be executed. This will delete the
          previous configuration created by generators, re-run all
          generators, and cause systemd to reload units from disk. See
          systemctl(1) for more information.


-----------------------------------------------------------------------------

::

          Generators are invoked with three arguments: paths to directories
          where generators can place their generated unit files or
          symlinks. By default those paths are runtime directories that are
          included in the search path of systemd, but a generator may be
          called with different paths for debugging purposes.

           1. normal-dir

              In normal use this is /run/systemd/generator in case of the
              system generators and $XDG_RUNTIME_DIR/generator in case of
              the user generators. Unit files placed in this directory take
              precedence over vendor unit configuration but not over native
              user/administrator unit configuration.

           2. early-dir

              In normal use this is /run/systemd/generator.early in case of
              the system generators and $XDG_RUNTIME_DIR/generator.early in
              case of the user generators. Unit files placed in this
              directory override unit files in /usr/, /run/ and /etc/. This
              means that unit files placed in this directory take
              precedence over all normal configuration, both vendor and
              user/administrator.

           3. late-dir

              In normal use this is /run/systemd/generator.late in case of
              the system generators and $XDG_RUNTIME_DIR/generator.late in
              case of the user generators. This directory may be used to
              extend the unit file tree without overriding any other unit
              files. Any native configuration files supplied by the vendor
              or user/administrator take precedence.


-----------------------------------------------------------------------------------------------------

::

          •   All generators are executed in parallel. That means all
              executables are started at the very same time and need to be
              able to cope with this parallelism.

          •   Generators are run very early at boot and cannot rely on any
              external services. They may not talk to any other process.
              That includes simple things such as logging to syslog(3), or
              systemd itself (this means: no systemctl(1))! Non-essential
              file systems like /var/ and /home/ are mounted after
              generators have run. Generators can however rely on the most
              basic kernel functionality to be available, as well as
              mounted /sys/, /proc/, /dev/, /usr/ and /run/ file systems.

          •   Units written by generators are removed when the
              configuration is reloaded. That means the lifetime of the
              generated units is closely bound to the reload cycles of
              systemd itself.

          •   Generators should only be used to generate unit files,
              .d/*.conf drop-ins for them and symlinks to them, not any
              other kind of non-unit related configuration. Due to the
              lifecycle logic mentioned above, generators are not a good
              fit to generate dynamic configuration for other services. If
              you need to generate dynamic configuration for other
              services, do so in normal services you order before the
              service in question.

              Note that using the StandardInputData=/StandardInputText=
              settings of service unit files (see systemd.exec(5)), it is
              possible to make arbitrary input data (including
              daemon-specific configuration) part of the unit definitions,
              which often might be sufficient to embed data or
              configuration for other programs into unit files in a native
              fashion.

          •   Since syslog(3) is not available (see above), log messages
              have to be written to /dev/kmsg instead.

          •   The generator should always include its own name in a comment
              at the top of the generated file, so that the user can easily
              figure out which component created or amended a particular
              unit.

              The SourcePath= directive should be used in generated files
              to specify the source configuration file they are generated
              from. This makes things more easily understood by the user
              and also has the benefit that systemd can warn the user about
              configuration files that changed on disk but have not been
              read yet by systemd. The SourcePath= value does not have to
              be a file in a physical filesystem. For example, in the
              common case of the generator looking at the kernel command
              line, SourcePath=/proc/cmdline should be used.

          •   Generators may write out dynamic unit files or just hook unit
              files into other units with the usual .wants/ or .requires/
              symlinks. Often, it is nicer to simply instantiate a template
              unit file from /usr/ with a generator instead of writing out
              entirely dynamic unit files. Of course, this works only if a
              single parameter is to be used.

          •   If you are careful, you can implement generators in shell
              scripts. We do recommend C code however, since generators are
              executed synchronously and hence delay the entire boot if
              they are slow.

          •   Regarding overriding semantics: there are two rules we try to
              follow when thinking about the overriding semantics:

               1. User configuration should override vendor configuration.
                  This (mostly) means that stuff from /etc/ should override
                  stuff from /usr/.

               2. Native configuration should override non-native
                  configuration. This (mostly) means that stuff you
                  generate should never override native unit files for the
                  same purpose.

              Of these two rules the first rule is probably the more
              important one and breaks the second one sometimes. Hence,
              when deciding whether to use argv[1], argv[2], or argv[3],
              your default choice should probably be argv[1].

          •   Instead of heading off now and writing all kind of generators
              for legacy configuration file formats, please think twice! It
              is often a better idea to just deprecate old stuff instead of
              keeping it artificially alive.


---------------------------------------------------------

::

          Example 1. systemd-fstab-generator

          systemd-fstab-generator(8) converts /etc/fstab into native mount
          units. It uses argv[1] as location to place the generated unit
          files in order to allow the user to override /etc/fstab with
          their own native unit files, but also to ensure that /etc/fstab
          overrides any vendor default from /usr/.

          After editing /etc/fstab, the user should invoke systemctl
          daemon-reload. This will re-run all generators and cause systemd
          to reload units from disk. To actually mount new directories
          added to fstab, systemctl start /path/to/mountpoint or systemctl
          start local-fs.target may be used.

          Example 2. systemd-system-update-generator

          systemd-system-update-generator(8) temporarily redirects
          default.target to system-update.target, if a system update is
          scheduled. Since this needs to override the default user
          configuration for default.target, it uses argv[2]. For details
          about this logic, see systemd.offline-updates(7).

          Example 3. Debugging a generator

              dir=$(mktemp -d)
              SYSTEMD_LOG_LEVEL=debug /usr/lib/systemd/system-generators/systemd-fstab-generator \
                      "$dir" "$dir" "$dir"
              find $dir


---------------------------------------------------------

::

          systemd(1), systemd-cryptsetup-generator(8),
          systemd-debug-generator(8), systemd-fstab-generator(8), fstab(5),
          systemd-getty-generator(8), systemd-gpt-auto-generator(8),
          systemd-hibernate-resume-generator(8),
          systemd-rc-local-generator(8),
          systemd-system-update-generator(8), systemd-sysv-generator(8),
          systemd-xdg-autostart-generator(8), systemd.unit(5),
          systemctl(1), systemd.environment-generator(7)

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

   systemd 249                                         SYSTEMD.GENERATOR(7)

--------------

Pages that refer to this page:
`systemctl(1) <../man1/systemctl.1.html>`__, 
`systemd(1) <../man1/systemd.1.html>`__, 
`systemd-analyze(1) <../man1/systemd-analyze.1.html>`__, 
`systemd.unit(5) <../man5/systemd.unit.5.html>`__, 
`systemd.environment-generator(7) <../man7/systemd.environment-generator.7.html>`__, 
`systemd.offline-updates(7) <../man7/systemd.offline-updates.7.html>`__, 
`systemd-bless-boot-generator(8) <../man8/systemd-bless-boot-generator.8.html>`__, 
`systemd-cryptsetup-generator(8) <../man8/systemd-cryptsetup-generator.8.html>`__, 
`systemd-debug-generator(8) <../man8/systemd-debug-generator.8.html>`__, 
`systemd-environment-d-generator(8) <../man8/systemd-environment-d-generator.8.html>`__, 
`systemd-fstab-generator(8) <../man8/systemd-fstab-generator.8.html>`__, 
`systemd-getty-generator(8) <../man8/systemd-getty-generator.8.html>`__, 
`systemd-gpt-auto-generator(8) <../man8/systemd-gpt-auto-generator.8.html>`__, 
`systemd-rc-local-generator(8) <../man8/systemd-rc-local-generator.8.html>`__, 
`systemd-run-generator(8) <../man8/systemd-run-generator.8.html>`__, 
`systemd-system-update-generator(8) <../man8/systemd-system-update-generator.8.html>`__, 
`systemd-sysv-generator(8) <../man8/systemd-sysv-generator.8.html>`__, 
`systemd-veritysetup-generator(8) <../man8/systemd-veritysetup-generator.8.html>`__, 
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
