.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flatpak-install(1) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FLATPAK INSTALL(1)           flatpak install          FLATPAK INSTALL(1)

NAME
-------------------------------------------------

::

          flatpak-install - Install an application or runtime


---------------------------------------------------------

::

          flatpak install [OPTION...] [REMOTE] REF...

          flatpak install [OPTION...] [--from|--bundle] LOCATION


---------------------------------------------------------------

::

          Installs an application or runtime. The primary way to install is
          to specify a REMOTE name as the source and one ore more REFs to
          specify the application or runtime to install. If REMOTE is
          omitted, the configured remotes are searched for the first REF
          and the user is asked to confirm the resulting choice.

          Each REF argument is a full or partial identifier in the flatpak
          ref format, which looks like "(app|runtime)/ID/ARCH/BRANCH". All
          elements except ID are optional and can be left out, including
          the slashes, so most of the time you need only specify ID. Any
          part left out will be matched against what is in the remote, and
          if there are multiple matches you will be prompted to choose one
          of them. You will also be prompted with choices if REF doesn't
          match anything in the remote exactly but is similar to one or
          more refs in the remote (e.g. "devhelp" is similar to
          "org.gnome.Devhelp").

          By default this looks for both apps and runtimes with the given
          REF in the specified REMOTE, but you can limit this by using the
          --app or --runtime option, or by supplying the initial element in
          the REF.

          If REMOTE is a uri or a path (absolute or relative starting with
          ./) to a local repository, then that repository will be used as
          the source, and a temporary remote will be created for the
          lifetime of the REF.

          If the specified REMOTE has a collection ID configured on it,
          flatpak will search mounted filesystems such as USB drives as
          well as Avahi services advertised on the local network for the
          needed refs, in order to support offline updates. See
          ostree-find-remotes(1) for more information.

          The alternative form of the command (with --from or --bundle)
          allows to install directly from a source such as a .flatpak
          single-file bundle or a .flatpakref application description. The
          options are optional if the first argument has the expected
          filename extension.

          Note that flatpak allows to have multiple branches of an
          application and runtimes installed and used at the same time.
          However, only one version of an application can be current,
          meaning its exported files (for instance desktop files and icons)
          are visible to the host. The last installed version is made
          current by default, but this can manually changed with flatpak
          make-current.

          Unless overridden with the --user or the --installation option,
          this command installs the application or runtime in the default
          system-wide installation.


-------------------------------------------------------

::

          The following options are understood:

          -h, --help
              Show help options and exit.

          --bundle
              Treat LOCATION as a single-bundle file. This is assumed if
              the argument ends with .flatpak.

          --from
              Treat LOCATION as an application description file. This is
              assumed if the argument ends with .flatpakref.

          --reinstall
              Uninstall first if already installed.

          --user
              Install the application or runtime in a per-user
              installation.

          --system
              Install the application or runtime in the default system-wide
              installation.

          --installation=NAME
              Install the application or runtime in a system-wide
              installation specified by NAME among those defined in
              /etc/flatpak/installations.d/. Using --installation=default
              is equivalent to using --system.

          --arch=ARCH
              The default architecture to install for, if not given
              explicitly in the REF. See flatpak --supported-arches for
              architectures supported by the host.

          --subpath=PATH
              Install only a subpath of REF. This is mainly used to install
              a subset of locales. This can be added multiple times to
              install multiple subpaths.

          --gpg-file=FILE
              Check bundle signatures with GPG key from FILE (- for stdin).

          --no-deploy
              Download the latest version, but don't deploy it.

          --no-pull
              Don't download the latest version, deploy whatever is locally
              available.

          --no-related
              Don't download related extensions, such as the locale data.

          --no-deps
              Don't verify runtime dependencies when installing.

          --or-update
              Normally install just ignores things that are already
              installed (printing a warning), but if --or-update is
              specified it silently turns it into an update operation
              instead.

          --app
              Assume that all REFs are apps if not explicitly specified.

          --runtime
              Assume that all REFs are runtimes if not explicitly
              specified.

          --sideload-repo=PATH
              Adds an extra local ostree repo as source for installation.
              This is equivalent to using the sideload-repos directories
              (see flatpak(1)), but can be done on a per-command basis. Any
              path added here is used in addition to ones in those
              directories.

          -y, --assumeyes
              Automatically answer yes to all questions (or pick the most
              prioritized answer). This is useful for automation.

          --noninteractive
              Produce minimal output and avoid most questions. This is
              suitable for use in non-interactive situations, e.g. in a
              build script.

          -v, --verbose
              Print debug information during command processing.

          --ostree-verbose
              Print OSTree debug information during command processing.


---------------------------------------------------------

::

          $ flatpak install gedit

          $ flatpak install flathub org.gnome.gedit

          $ flatpak --installation=default install flathub org.gnome.gedit

          $ flatpak --user install flathub org.gnome.gedit//3.30

          $ flatpak --user install
          https://flathub.org/repo/appstream/org.gnome.gedit.flatpakref 

          $ flatpak --system install org.gnome.gedit.flatpakref


---------------------------------------------------------

::

          flatpak(1), flatpak-update(1), flatpak-list(1),
          flatpak-build-bundle(1), flatpak-flatpakref(1),
          flatpak-make-current(1), ostree-find-remotes(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the flatpak (a tool for building and
          distributing desktop applications on Linux) project.  Information
          about the project can be found at ⟨http://flatpak.org/⟩.  It is
          not known how to report bugs for this man page; if you know,
          please send a mail to man-pages@man7.org.  This page was obtained
          from the project's upstream Git repository
          ⟨https://github.com/flatpak/flatpak⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   flatpak                                               FLATPAK INSTALL(1)

--------------

Pages that refer to this page: `flatpak(1) <../man1/flatpak.1.html>`__, 
`flatpak-create-usb(1) <../man1/flatpak-create-usb.1.html>`__, 
`flatpak-info(1) <../man1/flatpak-info.1.html>`__, 
`flatpak-list(1) <../man1/flatpak-list.1.html>`__, 
`flatpak-make-current(1) <../man1/flatpak-make-current.1.html>`__, 
`flatpak-update(1) <../man1/flatpak-update.1.html>`__, 
`flatpak-flatpakref(5) <../man5/flatpak-flatpakref.5.html>`__

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
