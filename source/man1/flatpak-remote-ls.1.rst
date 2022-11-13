.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flatpak-remote-ls(1) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FIELDS <#FIELDS>`__ \|           |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FLATPAK REMOTE-LS(1)        flatpak remote-ls       FLATPAK REMOTE-LS(1)

NAME
-------------------------------------------------

::

          flatpak-remote-ls - Show available runtimes and applications


---------------------------------------------------------

::

          flatpak remote-ls [OPTION...] [REMOTE]


---------------------------------------------------------------

::

          Shows runtimes and applications that are available in the remote
          repository with the name REMOTE, or all remotes if one isn't
          specified. You can find all configured remote repositories with
          flatpak remotes.

          REMOTE can be a file:// URI pointing to a local repository
          instead of a remote name.

          Unless overridden with the --system, --user, or --installation
          options, this command uses either the default system-wide
          installation or the per-user one, depending on which has the
          specified REMOTE.


-------------------------------------------------------

::

          The following options are understood:

          -h, --help
              Show help options and exit.

          --user
              Use the per-user configuration.

          --system
              Use the default system-wide configuration.

          --installation=NAME
              Use a system-wide installation specified by NAME among those
              defined in /etc/flatpak/installations.d/. Using
              --installation=default is equivalent to using --system.

          --cached
              Prefer to use locally cached information if possible, even
              though it may be out of date. This is faster, but risks
              returning stale information.

          -d, --show-details
              Show arches, branches and commit ids, in addition to the
              names. Equivalent to --columns=all.

          --runtime
              Show only runtimes, omit applications.

          --app
              Show only applications, omit runtimes.

          --all, -a
              Show everything. By default locale and debug extensions as
              well as secondary arches when the primary arch is available
              are hidden.

          --updates
              Show only those which have updates available.

          --arch=ARCH
              Show only those matching the specified architecture. By
              default, only supported architectures are shown. Use --arch=*
              to show all architectures. See flatpak --supported-arches for
              architectures supported by the host.

          -v, --verbose
              Print debug information during command processing.

          --ostree-verbose
              Print OSTree debug information during command processing.

          --app-runtime=RUNTIME
              List applications that use the given runtime

          --columns=FIELD,...
              Specify what information to show about each ref. You can list
              multiple fields, or use this option multiple times.

              Append :s[tart], :m[iddle], :e[nd] or :f[ull] to column names
              to change ellipsization.


-----------------------------------------------------

::

          The following fields are understood by the --columns option:

          name
              Show the name

          description
              Show the application description

          application
              Show the application or runtime ID

          arch
              Show the arch

          branch
              Show the branch

          version
              Show the version

          ref
              Show the ref

          origin
              Show the origin remote

          commit
              Show the active commit

          runtime
              Show the used runtime

          installed-size
              Show the installed size

          download-size
              Show the download size

          options
              Show options

          all
              Show all columns

          help
              Show the list of available columns

          Note that field names can be abbreviated to a unique prefix.


---------------------------------------------------------

::

          $ flatpak --user remote-ls --app testrepo

              Ref
              org.gnome.Builder
              org.freedesktop.glxgears

          $ flatpak remote-ls
          file:///run/media/mwleeds/d4d37026-cde2-4e5e-8bcc-d23ebbf231f9/.ostree/repo

              Ref
              org.kde.Khangman


---------------------------------------------------------

::

          flatpak(1), flatpak-remotes(1)

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

   flatpak                                             FLATPAK REMOTE-LS(1)

--------------

Pages that refer to this page: `flatpak(1) <../man1/flatpak.1.html>`__, 
`flatpak-build-update-repo(1) <../man1/flatpak-build-update-repo.1.html>`__, 
`flatpak-remote-info(1) <../man1/flatpak-remote-info.1.html>`__

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
