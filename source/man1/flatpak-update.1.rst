.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flatpak-update(1) — Linux manual page
=====================================

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

   FLATPAK UPDATE(1)            flatpak update            FLATPAK UPDATE(1)

NAME
-------------------------------------------------

::

          flatpak-update - Update an application or runtime


---------------------------------------------------------

::

          flatpak update [OPTION...] [REF...]

          flatpak update [OPTION...] --appstream [REMOTE]


---------------------------------------------------------------

::

          Updates applications and runtimes.  REF is a reference to the
          application or runtime to update. If no REF is given, everything
          is updated, as well as appstream info for all remotes.

          Each REF argument is a full or partial identifier in the flatpak
          ref format, which looks like "(app|runtime)/ID/ARCH/BRANCH". All
          elements except ID are optional and can be left out, including
          the slashes, so most of the time you need only specify ID. Any
          part left out will be matched against what is installed, and if
          there are multiple matches an error message will list the
          alternatives.

          By default this looks for both apps and runtimes with the given
          REF, but you can limit this by using the --app or --runtime
          option, or by supplying the initial element in the REF.

          Normally, this command updates the application to the tip of its
          branch. But it is possible to check out another commit, with the
          --commit option.

          If the configured remote for a ref being updated has a collection
          ID configured on it, flatpak will search mounted filesystems such
          as USB drives as well as Avahi services advertised on the local
          network for the needed refs, in order to support offline updates.
          See ostree-find-remotes(1) for more information.

          Note that updating a runtime is different from installing a
          different branch, and runtime updates are expected to keep strict
          compatibility. If an application update does cause a problem, it
          is possible to go back to the previous version, with the --commit
          option.

          Unless overridden with the --user, --system or --installation
          option, this command updates any matching refs in the standard
          system-wide installation and the per-user one.


-------------------------------------------------------

::

          The following options are understood:

          -h, --help
              Show help options and exit.

          --user
              Update a per-user installation.

          --system
              Update the default system-wide installation.

          --installation=NAME
              Updates a system-wide installation specified by NAME among
              those defined in /etc/flatpak/installations.d/. Using
              --installation=default is equivalent to using --system.

          --arch=ARCH
              The architecture to update for. See flatpak
              --supported-arches for architectures supported by the host.

          --subpath=PATH
              Install only a subpath of the ref. This is mainly used to
              install a subset of locales. This can be added multiple times
              to install multiple subpaths. If this is not specified the
              subpaths specified at install time are reused.

          --commit=COMMIT
              Update to this commit, instead of the tip of the branch. You
              can find commits using flatpak remote-info --log REMOTE REF.

          --no-deploy
              Download the latest version, but don't deploy it.

          --no-pull
              Don't download the latest version, deploy whatever is locally
              available.

          --no-related
              Don't download related extensions, such as the locale data.

          --no-deps
              Don't update or install runtime dependencies when installing.

          --app
              Only look for an app with the given name.

          --appstream
              Update appstream for REMOTE, or all remotes if no remote is
              specified.

          --runtime
              Only look for a runtime with the given name.

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

          --force-remove
              Remove old files even if they're in use by a running
              application.

          -v, --verbose
              Print debug information during command processing.

          --ostree-verbose
              Print OSTree debug information during command processing.


---------------------------------------------------------

::

          $ flatpak --user update org.gnome.gedit


---------------------------------------------------------

::

          flatpak(1), flatpak-install(1), flatpak-list(1),
          ostree-find-remotes(1)

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

   flatpak                                                FLATPAK UPDATE(1)

--------------

Pages that refer to this page: `flatpak(1) <../man1/flatpak.1.html>`__, 
`flatpak-info(1) <../man1/flatpak-info.1.html>`__, 
`flatpak-install(1) <../man1/flatpak-install.1.html>`__, 
`flatpak-list(1) <../man1/flatpak-list.1.html>`__, 
`flatpak-mask(1) <../man1/flatpak-mask.1.html>`__

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
