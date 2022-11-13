.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flatpak-remote-add(1) — Linux manual page
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

   FLATPAK REMOTE-ADD(1)      flatpak remote-add      FLATPAK REMOTE-ADD(1)

NAME
-------------------------------------------------

::

          flatpak-remote-add - Add a remote repository


---------------------------------------------------------

::

          flatpak remote-add [OPTION...] NAME LOCATION


---------------------------------------------------------------

::

          Adds a remote repository to the flatpak repository configuration.
          NAME is the name for the new remote, and LOCATION is a url or
          pathname. The LOCATION is either a flatpak repository, or a
          .flatpakrepo file which describes a repository. In the former
          case you may also have to specify extra options, such as the gpg
          key for the repo.

          Unless overridden with the --user or --installation options, this
          command changes the default system-wide installation.


-------------------------------------------------------

::

          The following options are understood:

          -h, --help
              Show help options and exit.

          --from
              Assume the URI is a .flatpakrepo file rather than the
              repository itself. This is enabled by default if the
              extension is .flatpakrepo, so generally you don't need this
              option.

          --user
              Modify the per-user configuration.

          --system
              Modify the default system-wide configuration.

          --installation=NAME
              Modify a system-wide installation specified by NAME among
              those defined in /etc/flatpak/installations.d/. Using
              --installation=default is equivalent to using --system.

          --no-gpg-verify
              Disable GPG verification for the added remote.

          --prio=PRIO
              Set the priority for the remote. Default is 1, higher is more
              prioritized. This is mainly used for graphical installation
              tools. It is also used when searching for a remote to provide
              an app's runtime. The app's origin is checked before other
              remotes with the same priority.

          --subset=SUBSET
              Limit the refs available from the remote to those that are
              part of the named subset.

          --no-enumerate
              Mark the remote as not enumerated. This means the remote will
              not be used to list applications, for instance in graphical
              installation tools.

          --no-use-for-deps
              Mark the remote as not to be used for automatic runtime
              dependency resolution.

          --if-not-exists
              Do nothing if the provided remote already exists.

          --disable
              Disable the added remote.

          --title=TITLE
              A title for the remote, e.g. for display in a UI.

          --comment=COMMENT
              A single-line comment for the remote, e.g. for display in a
              UI.

          --description=DESCRIPTION
              A full-paragraph description for the remote, e.g. for display
              in a UI.

          --homepage=URL
              URL for a website for the remote, e.g. for display in a UI.

          --icon=URL
              URL for an icon for the remote, e.g. for display in a UI.

          --default-branch=BRANCH
              A default branch for the remote, mainly for use in a UI.

          --filter=PATH
              Add a local filter to the remote. A filter file is a list of
              lines, each file starting with "allow" or "deny", and then a
              glob for the ref to allow or disallow. The globs specify a
              partial ref (i.e. you can leave out trailing parts which will
              then match everything), but otherwise only "*" is special,
              matching anything in that part of the ref.

              By default all refs are allowed, but if a ref matches a deny
              rule it is disallowed unless it specifically matches an allow
              rule. This means you can use this to implement both
              allowlisting and blocklisting.

              Here is an example filter file:

                  # This is an allowlist style filter as it denies all first
                  deny *
                  allow runtime/org.freedesktop.*
                  allow org.some.app/arm
                  allow org.signal.Signal/*/stable
                  allow org.signal.Signal.*/*/stable

          --gpg-import=FILE
              Import gpg keys from the specified keyring file as trusted
              for the new remote. If the file is - the keyring is read from
              standard input.

          --authenticator-name=NAME
              Specify the authenticator to use for the remote.

          --authenticator-option=KEY=VALUE
              Specify an authenticator option for the remote.

          --authenticator-install
              Enable auto-installation of authenticator.

          --no-authenticator-install
              Disable auto-installation of authenticator.

          --no-follow-redirect
              Do not follow xa.redirect-url defined in the summary file.

          -v, --verbose
              Print debug information during command processing.

          --ostree-verbose
              Print OSTree debug information during command processing.


---------------------------------------------------------

::

          $ flatpak remote-add gnome
          https://sdk.gnome.org/gnome.flatpakrepo 

          $ flatpak --user remote-add --no-gpg-verify test-repo
          https://people.gnome.org/~alexl/gnome-sdk/repo/ 


---------------------------------------------------------

::

          flatpak(1), flatpak-remote-modify(1), flatpak-remote-delete(1),
          flatpak-remotes(1), flatpak-flatpakrepo(5)

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

   flatpak                                            FLATPAK REMOTE-ADD(1)

--------------

Pages that refer to this page: `flatpak(1) <../man1/flatpak.1.html>`__, 
`flatpak-remote-delete(1) <../man1/flatpak-remote-delete.1.html>`__, 
`flatpak-remote-modify(1) <../man1/flatpak-remote-modify.1.html>`__, 
`flatpak-remotes(1) <../man1/flatpak-remotes.1.html>`__, 
`flatpak-flatpakrepo(5) <../man5/flatpak-flatpakrepo.5.html>`__

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
