.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flatpak-build-bundle(1) — Linux manual page
===========================================

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

   FLATPAK BUILD-BUNDL(1)    flatpak build-bundle    FLATPAK BUILD-BUNDL(1)

NAME
-------------------------------------------------

::

          flatpak-build-bundle - Create a single-file bundle from a local
          repository


---------------------------------------------------------

::

          flatpak build-bundle [OPTION...] LOCATION FILENAME NAME [BRANCH]


---------------------------------------------------------------

::

          Creates a single-file named FILENAME for the application (or
          runtime) named NAME in the repository at LOCATION. If a BRANCH is
          specified, this branch of the application is used.

          The collection ID set on the repository at LOCATION (if set) will
          be used for the bundle.

          Unless --oci is used, the format of the bundle file is that of an
          ostree static delta (against an empty base) with some flatpak
          specific metadata for the application icons and appdata.


-------------------------------------------------------

::

          The following options are understood:

          -h, --help
              Show help options and exit.

          --runtime
              Export a runtime instead of an application.

          --arch=ARCH
              The arch to create a bundle for. See flatpak
              --supported-arches for architectures supported by the host.

          --repo-url=URL
              The URL for the repository from which the application can be
              updated. Installing the bundle will automatically configure a
              remote for this URL.

          --runtime-repo=URL
              The URL for a .flatpakrepo file that contains the information
              about the repository that supplies the runtimes required by
              the app.

          --gpg-keys=FILE
              Add the GPG key from FILE (use - for stdin).

          --gpg-homedir=PATH
              GPG Homedir to use when looking for keyrings.

          --from-commit=COMMIT
              The OSTree commit to create a delta bundle from.

          --oci
              Export to an OCI image instead of a Flatpak bundle.

          -v, --verbose
              Print debug information during command processing.

          --ostree-verbose
              Print OSTree debug information during command processing.


---------------------------------------------------------

::

          $ flatpak build-bundle /var/lib/flatpak/repo
          gnome-calculator.flatpak org.gnome.Calculator stable

          $ flatpak build-bundle ~/.local/share/flatpak/repo
          gnome-calculator.flatpak org.gnome.Calculator stable


---------------------------------------------------------

::

          ostree(1), flatpak(1), flatpak-build-init(1), flatpak-build(1),
          flatpak-build-finish(1), flatpak-build-import-bundle(1),
          flatpak-build-update-repo(1)

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

   flatpak                                           FLATPAK BUILD-BUNDL(1)

--------------

Pages that refer to this page: `flatpak(1) <../man1/flatpak.1.html>`__, 
`flatpak-build-import-bundle(1) <../man1/flatpak-build-import-bundle.1.html>`__, 
`flatpak-install(1) <../man1/flatpak-install.1.html>`__

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
