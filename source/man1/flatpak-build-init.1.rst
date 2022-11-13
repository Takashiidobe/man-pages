.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flatpak-build-init(1) — Linux manual page
=========================================

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

   FLATPAK BUILD-INIT(1)      flatpak build-init      FLATPAK BUILD-INIT(1)

NAME
-------------------------------------------------

::

          flatpak-build-init - Initialize a build directory


---------------------------------------------------------

::

          flatpak build-init [OPTION...] DIRECTORY APPNAME SDK RUNTIME
                             [BRANCH]


---------------------------------------------------------------

::

          Initializes a separate build directory.  DIRECTORY is the name of
          the directory.  APPNAME is the application id of the app that
          will be built.  SDK and RUNTIME specify the sdk and runtime that
          the application should be built against and run in.  BRANCH
          specify the version of sdk and runtime

          Initializes a directory as build directory which can be used as
          target directory of flatpak build. It creates a metadata inside
          the given directory. Additionally, empty files and var
          subdirectories are created.

          It is an error to run build-init on a directory that has already
          been initialized as a build directory.


-------------------------------------------------------

::

          The following options are understood:

          -h, --help
              Show help options and exit.

          --arch=ARCH
              The architecture to use. See flatpak --supported-arches for
              architectures supported by the host.

          -v, --var=RUNTIME
              Initialize var from the named runtime.

          -w, --writable-sdk
              Initialize /usr with a copy of the sdk, which is writable
              during flatpak build. This can be used if you need to install
              build tools in /usr during the build. This is stored in the
              usr subdirectory of the app dir, but will not be part of the
              final app.

          --tag=TAG
              Add a tag to the metadata file. This option can be used
              multiple times.

          --sdk-extension=EXTENSION
              When using --writable-sdk, in addition to the sdk, also
              install the specified extension. This option can be used
              multiple times.

          --extension=NAME=VARIABLE[=VALUE]
              Add extension point info.

          --sdk-dir
              Specify a custom subdirectory to use instead of usr for
              --writable-sdk.

          --update
              Re-initialize the sdk and var, don't fail if already
              initialized.

          --base=APP
              Initialize the application with files from another specified
              application.

          --base-version=VERSION
              Specify the version to use for --base. If not specified, will
              default to "master".

          --base-extension=EXTENSION
              When using --base, also install the specified extension from
              the app. This option can be used multiple times.

          --type=TYPE
              This can be used to build different types of things. The
              default is "app" which is a regular app, but "runtime"
              creates a runtime based on an existing runtime, and
              "extension" creates an extension for an app or runtime.

          --extension-tag=EXTENSION_TAG
              If building an extension, the tag to use when searching for
              the mount point of the extension.

          --verbose
              Print debug information during command processing.

          --ostree-verbose
              Print OSTree debug information during command processing.


---------------------------------------------------------

::

          $ flatpak build-init /build/my-app org.example.myapp
          org.gnome.Sdk org.gnome.Platform 3.36


---------------------------------------------------------

::

          flatpak(1), flatpak-build(1), flatpak-build-finish(1),
          flatpak-build-export(1)

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

   flatpak                                            FLATPAK BUILD-INIT(1)

--------------

Pages that refer to this page: `flatpak(1) <../man1/flatpak.1.html>`__, 
`flatpak-build(1) <../man1/flatpak-build.1.html>`__, 
`flatpak-build-bundle(1) <../man1/flatpak-build-bundle.1.html>`__, 
`flatpak-build-commit-from(1) <../man1/flatpak-build-commit-from.1.html>`__, 
`flatpak-build-export(1) <../man1/flatpak-build-export.1.html>`__, 
`flatpak-build-finish(1) <../man1/flatpak-build-finish.1.html>`__

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
