.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flatpak-remote-info(1) — Linux manual page
==========================================

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

   FLATPAK REMOTE-INFO(1)     flatpak remote-info    FLATPAK REMOTE-INFO(1)

NAME
-------------------------------------------------

::

          flatpak-remote-info - Show information about an application or
          runtime in a remote


---------------------------------------------------------

::

          flatpak remote-info [OPTION...] REMOTE REF


---------------------------------------------------------------

::

          Shows information about the runtime or application REF from the
          remote repository with the name REMOTE. You can find all
          configured remote repositories with flatpak remotes.

          By default, the output is formatted in a friendly format. If you
          specify one of the --show-...  options, the output is instead
          formatted in a machine-readable format.

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
              returning stale information. Also, some information is not
              cached so will not be available.

          --runtime
              Assume that REF is a runtime if not explicitly specified.

          --app
              Assume that REF is an app if not explicitly specified.

          --arch=ARCH
              The default architecture to look for, if not given explicitly
              in the REF. See flatpak --supported-arches for architectures
              supported by the host.

          --commit=COMMIT
              Show information about the specific commit, rather than the
              latest version.

          --log
              Display a log of previous versions.

          -r, --show-ref
              Show the matched ref.

          -c, --show-commit
              Show the commit id.

          -p, --show-parent
              Show the parent commit id.

          -m, --show-metadata
              Show the metadata.

          -v, --verbose
              Print debug information during command processing.

          --ostree-verbose
              Print OSTree debug information during command processing.


---------------------------------------------------------

::

          $ flatpak --user remote-info flathub org.gnome.gedit

              Ref: app/org.gnome.gedit/x86_64/stable
              ID: org.gnome.gedit
              Arch: x86_64
              Branch: stable
              Date: 2017-07-31 16:05:22 +0000
              Subject: Build org.gnome.gedit at 3ec291fc1ce4d78220527fa79576f4cc1481ebe5
              Commit: 3de7e9dde3bb8382aad9dfbbff20eccd9bf2100bc1887a3619ec0372e8066bf7
              Parent: -
              Download size: 3,4 MB
              Installed size: 11,1 MB
              Runtime: org.gnome.Platform/x86_64/3.24


---------------------------------------------------------

::

          flatpak(1), flatpak-remotes(1) flatpak-remote-ls(1)

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

   flatpak                                           FLATPAK REMOTE-INFO(1)

--------------

Pages that refer to this page: `flatpak(1) <../man1/flatpak.1.html>`__

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
