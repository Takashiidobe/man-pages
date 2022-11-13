.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flatpak-build-export(1) — Linux manual page
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

   FLATPAK BUILD-EXPOR(1)    flatpak build-export    FLATPAK BUILD-EXPOR(1)

NAME
-------------------------------------------------

::

          flatpak-build-export - Create a repository from a build directory


---------------------------------------------------------

::

          flatpak build-export [OPTION...] LOCATION DIRECTORY [BRANCH]


---------------------------------------------------------------

::

          Creates or updates a repository with an application build.
          LOCATION is the location of the repository.  DIRECTORY must be a
          finalized build directory. If BRANCH is not specified, it is
          assumed to be "master".

          If LOCATION exists, it is assumed to be an OSTree repository,
          otherwise a new OSTree repository is created at this location.
          The repository can be inspected with the ostree tool.

          The contents of DIRECTORY are committed on the branch with name
          app/APPNAME/ARCH/BRANCH, where ARCH is the architecture of the
          runtime that the application is using. A commit filter is used to
          enforce that only the contents of the files/ and export/
          subdirectories and the metadata file are included in the commit,
          anything else is ignored.

          When exporting a flatpak to be published to the internet,
          --collection-id=COLLECTION-ID should be specified as a globally
          unique reverse DNS value to identify the collection of flatpaks
          this will be added to. Setting a globally unique collection ID
          allows the apps in the repository to be shared over peer to peer
          systems without needing further configuration.

          The build-update-repo command should be used to update repository
          metadata whenever application builds are added to a repository.


-------------------------------------------------------

::

          The following options are understood:

          -h, --help
              Show help options and exit.

          -s, --subject=SUBJECT
              One line subject for the commit message.

          -b, --body=BODY
              Full description for the commit message.

          --collection-id=COLLECTION-ID
              Set as the collection ID of the repository. Setting a
              globally unique collection ID allows the apps in the
              repository to be shared over peer to peer systems without
              needing further configuration. If exporting to an existing
              repository, the collection ID must match the existing
              configured collection ID for that repository.

          --subset=SUBSET
              Mark the commit to be included in the named subset. This will
              cause the commit to be put in the named subset summary (in
              addition to the main one), allowing users to see only this
              subset instead of the whole repo.

          --arch=ARCH
              Specify the architecture component of the branch to export.
              Only host compatible architectures can be specified; see
              flatpak --supported-arches for valid values.

          --exclude=PATTERN
              Exclude files matching PATTERN from the commit. This option
              can be used multiple times.

          --include=PATTERN
              Don't exclude files matching PATTERN from the commit, even if
              they match the --exclude patterns. This option can be used
              multiple times.

          --metadata=FILENAME
              Use the specified filename as metadata in the exported app
              instead of the default file (called metadata). This is useful
              if you want to commit multiple things from a single build
              tree, typically used in combination with --files and
              --exclude.

          --files=SUBDIR
              Use the files in the specified subdirectory as the file
              contents, rather than the regular files directory.

          --timestamp=DATE
              Use the specified ISO 8601 formatted date or NOW, for the
              current time, in the commit metadata and, if
              --update-appstream is used, the appstream data.

          --end-of-life=REASON
              Mark the build as end-of-life. REASON is a message that may
              be shown to users installing this build.

          --end-of-life-rebase=ID
              Mark the build as end-of-life. Unlike --end-of-life, this one
              takes an ID that supersedes the current one. By the user's
              request, the application data may be preserved for the new
              application.

          --disable-fsync
              Don't fsync when writing to the repository. This can result
              in data loss in exceptional situations, but can improve
              performance when working with temporary or test repositories.

          --update-appstream
              Update the appstream branch after the build.

          --no-update-summary
              Don't update the summary file after the new commit is added.
              This means the repository will not be useful for serving over
              http until build-update-repo has been run. This is useful is
              you want to do multiple repo operations before finally
              updating the summary.

          --gpg-sign=KEYID
              Sign the commit with this GPG key. This option can be used
              multiple times.

          --gpg-homedir=PATH
              GPG Homedir to use when looking for keyrings

          -r, --runtime
              Export a runtime instead of an app (this uses the usr subdir
              as files).

          -v, --verbose
              Print debug information during command processing.

          --ostree-verbose
              Print OSTree debug information during command processing.


---------------------------------------------------------

::

          $ flatpak build-export ~/repos/gnome-calculator/
          ~/build/gnome-calculator/ org.gnome.Calculator

              Commit: 9d0044ea480297114d03aec85c3d7ae3779438f9d2cb69d717fb54237acacb8c
              Metadata Total: 605
              Metadata Written: 5
              Content Total: 1174
              Content Written: 1
              Content Bytes Written: 305


---------------------------------------------------------

::

          ostree(1), flatpak(1), flatpak-build-init(1), flatpak-build(1),
          flatpak-build-finish(1), flatpak-build-sign(1),
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

   flatpak                                           FLATPAK BUILD-EXPOR(1)

--------------

Pages that refer to this page: `flatpak(1) <../man1/flatpak.1.html>`__, 
`flatpak-build(1) <../man1/flatpak-build.1.html>`__, 
`flatpak-build-finish(1) <../man1/flatpak-build-finish.1.html>`__, 
`flatpak-build-init(1) <../man1/flatpak-build-init.1.html>`__, 
`flatpak-build-sign(1) <../man1/flatpak-build-sign.1.html>`__, 
`flatpak-build-update-repo(1) <../man1/flatpak-build-update-repo.1.html>`__

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
