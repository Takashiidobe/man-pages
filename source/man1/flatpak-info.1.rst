.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flatpak-info(1) — Linux manual page
===================================

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

   FLATPAK INFO(1)               flatpak info               FLATPAK INFO(1)

NAME
-------------------------------------------------

::

          flatpak-info - Show information about an installed application or
          runtime


---------------------------------------------------------

::

          flatpak info [OPTION...] NAME [BRANCH]


---------------------------------------------------------------

::

          Show info about an installed application or runtime.

          By default, the output is formatted in a friendly format. If you
          specify any of the --show-...  or --file-access options, the
          output is instead formatted in a machine-readable format.

          By default, both per-user and system-wide installations are
          queried. Use the --user, --system or --installation options to
          change this.


-------------------------------------------------------

::

          The following options are understood:

          -h, --help
              Show help options and exit.

          --user
              Query per-user installations.

          --system
              Query the default system-wide installation.

          --installation=NAME
              Query a system-wide installation by NAME among those defined
              in /etc/flatpak/installations.d/. Using
              --installation=default is equivalent to using --system.

          --arch=ARCH
              Query for this architecture. See flatpak --supported-arches
              for architectures supported by the host.

          -r, --show-ref
              Show the installed ref.

          -o, --show-origin
              Show the remote the ref is installed from.

          -c, --show-commit
              Show the installed commit id.

          -s, --show-size
              Show the installed size.

          -m, --show-metadata
              Show the metadata.

          --show-runtime
              Show the runtime.

          --show-sdk
              Show the SDK.

          -M, --show-permissions
              Show the permissions.

          --file-access=PATH
              Show the level of access to the given path.

          -e, --show-extensions
              Show the matching extensions.

          -l, --show-location
              Show the on-disk location of the app or runtime. See the
              examples below.

          -v, --verbose
              Print debug information during command processing.

          --ostree-verbose
              Print OSTree debug information during command processing.


---------------------------------------------------------

::

          $ flatpak info org.gnome.Builder//master

          $ tree `flatpak info -l org.gnome.Builder//master`/files


---------------------------------------------------------

::

          flatpak(1), flatpak-install(1), flatpak-update(1)

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

   flatpak                                                  FLATPAK INFO(1)

--------------

Pages that refer to this page: `flatpak(1) <../man1/flatpak.1.html>`__, 
`flatpak-repo(1) <../man1/flatpak-repo.1.html>`__

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
