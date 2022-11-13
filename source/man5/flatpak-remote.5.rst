.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flatpak-remote(5) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILE FORMAT <#FILE_FORMAT>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FLATPAK REMOTE(5)            flatpak remote            FLATPAK REMOTE(5)

NAME
-------------------------------------------------

::

          flatpak-remote - Configuration for a remote


---------------------------------------------------------------

::

          Flatpak stores information about configured remotes for an
          installation location in $installation/repo/config. For example,
          the remotes for the default system-wide installation are in
          $prefix/var/lib/flatpak/repo/config, and the remotes for the
          per-user installation are in
          $HOME/.local/share/flatpak/repo/config.

          Normally, it is not necessary to edit remote config files
          directly, the flatpak remote-modify command should be used to
          change properties of remotes.

          System-wide remotes can be statically preconfigured by dropping
          flatpakref files into /etc/flatpak/remotes.d/.


---------------------------------------------------------------

::

          The remote config file format is using the same .ini file format
          that is used for systemd unit files or application .desktop
          files.

      [remote ...]
          All the configuration for the the remote with name NAME is
          contained in the [remote "NAME"] group.

          The following keys are recognized by OSTree, among others:

          url (string)
              The url for the remote. An URL of the form oci+https:// or
              oci+http:// is a Flatpak extension that indicates that the
              remote is not an ostree repository, but is rather an URL to
              an index of OCI images that are stored within a container
              image registry.

          gpg-verify (boolean)
              Whether to use GPG verification for content from this remote.

          gpg-verify-summary (boolean)
              Whether to use GPG verification for the summary of this
              remote.

              This is ignored if collection-id is set, as refs are verified
              in commit metadata in that case. Enabling gpg-verify-summary
              would break peer to peer distribution of refs.

          collection-id (string)
              The globally unique identifier for the upstream collection
              repository, to allow mirrors to be grouped.

          All flatpak-specific keys have a xa. prefix:

          xa.disable (boolean)
              Whether the remote is disabled. Defaults to false.

          xa.prio (integer)
              The priority for the remote. This is used when listing
              remotes, and when searching them for the runtime needed by an
              app. The remote providing the app is searched for its runtime
              before others with equal priority. Defaults to 1.

          xa.noenumerate (boolean)
              Whether this remote should be used when presenting available
              apps/runtimes, or when searching for a runtime dependency.
              Defaults to true.

          xa.nodeps (boolean)
              Whether this remote should be used when searching for
              dependencies. Defaults to true.

          xa.title (string)
              An optional title to use when presenting this remote in a UI.

          xa.title-is-set (boolean)
              This key is set to true if xa.title has been explicitly set.

          xa.comment (string)
              An optional single-line comment to use when presenting this
              remote in a UI.

          xa.comment-is-set (boolean)
              This key is set to true if xa.comment has been explicitly
              set.

          xa.description (string)
              An optional full-paragraph of text to use when presenting
              this remote in a UI.

          xa.description-is-set (boolean)
              This key is set to true if xa.description has been explicitly
              set.

          xa.homepage (string)
              An optional URL that points to a website for this repository
              to use when presenting this remote in a UI.

          xa.homepage-is-set (boolean)
              This key is set to true if xa.homepage has been explicitly
              set.

          xa.icon (string)
              An optional URL that points to an icon for this repository to
              use when presenting this remote in a UI.

          xa.icon-is-set (boolean)
              This key is set to true if xa.icon has been explicitly set.

          xa.default-branch (string)
              The default branch to use when installing from this remote.

          xa.default-branch-is-set (boolean)
              This key is set to true if xa.default-branch has been
              explicitly set.

          xa.main-ref (string)
              The main reference served by this remote. This is used for
              origin remotes of applications installed via a flatpakref
              file.


---------------------------------------------------------

::

              [remote "gnome-nightly-apps"]
              gpg-verify=true
              gpg-verify-summary=true
              url=https://sdk.gnome.org/nightly/repo-apps/
              xa.title=GNOME Applications

              [remote "flathub"]
              gpg-verify=true
              gpg-verify-summary=false
              collection-id=org.flathub.Stable
              url=https://dl.flathub.org/repo/
              xa.title=Flathub


---------------------------------------------------------

::

          flatpak-remote-modify(1)

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

   flatpak                                                FLATPAK REMOTE(5)

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
