.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flatpak-run(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FLATPAK RUN(1)                 flatpak run                FLATPAK RUN(1)

NAME
-------------------------------------------------

::

          flatpak-run - Run an application or open a shell in a runtime


---------------------------------------------------------

::

          flatpak run [OPTION...] REF [ARG...]


---------------------------------------------------------------

::

          If REF names an installed application, flatpak runs the
          application in a sandboxed environment. Extra arguments are
          passed on to the application.

          If REF names a runtime, a shell is opened in the runtime. This is
          useful for development and testing.

          By default, flatpak will look for the application or runtime in
          all per-user and system installations. This can be overridden
          with the --user, --system and --installation options.

          flatpak creates a sandboxed environment for the application to
          run in by mounting the right runtime at /usr and a writable
          directory at /var, whose content is preserved between application
          runs. The application itself is mounted at /app.

          The details of the sandboxed environment are controlled by the
          application metadata and various options like --share and
          --socket that are passed to the run command: Access is allowed if
          it was requested either in the application metadata file or with
          an option and the user hasn't overridden it.

          The remaining arguments are passed to the command that gets run
          in the sandboxed environment. See the --file-forwarding option
          for handling of file arguments.

          Environment variables are generally passed on to the sandboxed
          application, with certain exceptions. The application metadata
          can override environment variables, as well as the --env option.
          Apart from that, Flatpak always unsets or overrides the following
          variables, since their session values are likely to interfere
          with the functioning of the sandbox:
              PATH
              LD_LIBRARY_PATH
              XDG_CONFIG_DIRS
              XDG_DATA_DIRS
              SHELL
              TMPDIR
              PYTHONPATH
              PERLLIB
              PERL5LIB
              XCURSOR_PATH

          Flatpak also overrides the XDG environment variables to point
          sandboxed applications at their writable filesystem locations
          below ~/.var/app/$APPID/:
              XDG_DATA_HOME
              XDG_CONFIG_HOME
              XDG_CACHE_HOME

          The host values of these variables are made available inside the
          sandbox via these HOST_-prefixed variables:
              HOST_XDG_DATA_HOME
              HOST_XDG_CONFIG_HOME
              HOST_XDG_CACHE_HOME

          Flatpak sets the environment variable FLATPAK_ID to the
          application ID of the running app.

          Flatpak also bind-mounts as read-only the host's /etc/os-release
          (if available, or /usr/lib/os-release as a fallback) to
          /run/host/os-release in accordance with the os-release
          specification[1].

          If parental controls support is enabled, flatpak will check the
          current user’s parental controls settings, and will refuse to run
          an app if it is blocklisted for the current user.


-------------------------------------------------------

::

          The following options are understood:

          -h, --help
              Show help options and exit.

          --user
              Look for the application and runtime in per-user
              installations.

          --system
              Look for the application and runtime in the default
              system-wide installations.

          --installation=NAME
              Look for the application and runtime in the system-wide
              installation specified by NAME among those defined in
              /etc/flatpak/installations.d/. Using --installation=default
              is equivalent to using --system.

          -v, --verbose
              Print debug information during command processing.

          --ostree-verbose
              Print OSTree debug information during command processing.

          --arch=ARCH
              The architecture to run. See flatpak --supported-arches for
              architectures supported by the host.

          --command=COMMAND
              The command to run instead of the one listed in the
              application metadata.

          --cwd=DIR
              The directory to run the command in. Note that this must be a
              directory inside the sandbox.

          --branch=BRANCH
              The branch to use.

          -d, --devel
              Use the devel runtime that is specified in the application
              metadata instead of the regular runtime, and use a seccomp
              profile that is less likely to break development tools.

          --runtime=RUNTIME
              Use this runtime instead of the one that is specified in the
              application metadata. This is a full tuple, like for example
              org.freedesktop.Sdk/x86_64/1.2, but partial tuples are
              allowed. Any empty or missing parts are filled in with the
              corresponding values specified by the app.

          --runtime-version=VERSION
              Use this version of the runtime instead of the one that is
              specified in the application metadata. This overrides any
              version specified with the --runtime option.

          --share=SUBSYSTEM
              Share a subsystem with the host session. This overrides the
              Context section from the application metadata.  SUBSYSTEM
              must be one of: network, ipc. This option can be used
              multiple times.

          --unshare=SUBSYSTEM
              Don't share a subsystem with the host session. This overrides
              the Context section from the application metadata.  SUBSYSTEM
              must be one of: network, ipc. This option can be used
              multiple times.

          --socket=SOCKET
              Expose a well known socket to the application. This overrides
              to the Context section from the application metadata.  SOCKET
              must be one of: x11, wayland, fallback-x11, pulseaudio,
              system-bus, session-bus, ssh-auth, pcsc, cups. This option
              can be used multiple times.

          --nosocket=SOCKET
              Don't expose a well known socket to the application. This
              overrides to the Context section from the application
              metadata.  SOCKET must be one of: x11, wayland, fallback-x11,
              pulseaudio, system-bus, session-bus, ssh-auth, pcsc, cups.
              This option can be used multiple times.

          --device=DEVICE
              Expose a device to the application. This overrides to the
              Context section from the application metadata.  DEVICE must
              be one of: dri, kvm, shm, all. This option can be used
              multiple times.

          --nodevice=DEVICE
              Don't expose a device to the application. This overrides to
              the Context section from the application metadata.  DEVICE
              must be one of: dri, kvm, shm, all. This option can be used
              multiple times.

          --allow=FEATURE
              Allow access to a specific feature. This overrides to the
              Context section from the application metadata.  FEATURE must
              be one of: devel, multiarch, bluetooth. This option can be
              used multiple times.

              See flatpak-build-finish(1) for the meaning of the various
              features.

          --disallow=FEATURE
              Disallow access to a specific feature. This overrides to the
              Context section from the application metadata.  FEATURE must
              be one of: devel, multiarch, bluetooth. This option can be
              used multiple times.

          --filesystem=FILESYSTEM
              Allow the application access to a subset of the filesystem.
              This overrides to the Context section from the application
              metadata.  FILESYSTEM can be one of: home, host, host-os,
              host-etc, xdg-desktop, xdg-documents, xdg-download,
              xdg-music, xdg-pictures, xdg-public-share, xdg-templates,
              xdg-videos, xdg-run, xdg-config, xdg-cache, xdg-data, an
              absolute path, or a homedir-relative path like ~/dir or paths
              relative to the xdg dirs, like xdg-download/subdir. The
              optional :ro suffix indicates that the location will be
              read-only. The optional :create suffix indicates that the
              location will be read-write and created if it doesn't exist.
              This option can be used multiple times. See the "[Context]
              filesystems" list in flatpak-metadata(5) for details of the
              meanings of these filesystems.

          --nofilesystem=FILESYSTEM
              Remove access to the specified subset of the filesystem from
              the application. This overrides to the Context section from
              the application metadata.  FILESYSTEM can be one of: home,
              host, host-os, host-etc, xdg-desktop, xdg-documents,
              xdg-download, xdg-music, xdg-pictures, xdg-public-share,
              xdg-templates, xdg-videos, an absolute path, or a
              homedir-relative path like ~/dir. This option can be used
              multiple times.

          --add-policy=SUBSYSTEM.KEY=VALUE
              Add generic policy option. For example,
              "--add-policy=subsystem.key=v1 --add-policy=subsystem.key=v2"
              would map to this metadata:

                  [Policy subsystem]
                  key=v1;v2;

              This option can be used multiple times.

          --remove-policy=SUBSYSTEM.KEY=VALUE
              Remove generic policy option. This option can be used
              multiple times.

          --env=VAR=VALUE
              Set an environment variable in the application. This
              overrides to the Context section from the application
              metadata. This option can be used multiple times.

          --unset-env=VAR
              Unset an environment variable in the application. This
              overrides the unset-environment entry in the [Context] group
              of the metadata, and the [Environment] group. This option can
              be used multiple times.

          --env-fd=FD
              Read environment variables from the file descriptor FD, and
              set them as if via --env. This can be used to avoid
              environment variables and their values becoming visible to
              other users.

              Each environment variable is in the form VAR=VALUE followed
              by a zero byte. This is the same format used by env -0 and
              /proc/*/environ.

          --own-name=NAME
              Allow the application to own the well known name NAME on the
              session bus. If NAME ends with .*, it allows the application
              to own all matching names. This overrides to the Context
              section from the application metadata. This option can be
              used multiple times.

          --talk-name=NAME
              Allow the application to talk to the well known name NAME on
              the session bus. If NAME ends with .*, it allows the
              application to talk to all matching names. This overrides to
              the Context section from the application metadata. This
              option can be used multiple times.

          --no-talk-name=NAME
              Don't allow the application to talk to the well known name
              NAME on the session bus. If NAME ends with .*, it allows the
              application to talk to all matching names. This overrides to
              the Context section from the application metadata. This
              option can be used multiple times.

          --system-own-name=NAME
              Allow the application to own the well known name NAME on the
              system bus. If NAME ends with .*, it allows the application
              to own all matching names. This overrides to the Context
              section from the application metadata. This option can be
              used multiple times.

          --system-talk-name=NAME
              Allow the application to talk to the well known name NAME on
              the system bus. If NAME ends with .*, it allows the
              application to talk to all matching names. This overrides to
              the Context section from the application metadata. This
              option can be used multiple times.

          --system-no-talk-name=NAME
              Don't allow the application to talk to the well known name
              NAME on the system bus. If NAME ends with .*, it allows the
              application to talk to all matching names. This overrides to
              the Context section from the application metadata. This
              option can be used multiple times.

          --persist=FILENAME
              If the application doesn't have access to the real homedir,
              make the (homedir-relative) path FILENAME a bind mount to the
              corresponding path in the per-application directory, allowing
              that location to be used for persistent data. This overrides
              to the Context section from the application metadata. This
              option can be used multiple times.

          --no-session-bus
              Run this instance without the filtered access to the session
              dbus connection. Note, this is the default when run with
              --sandbox.

          --session-bus
              Allow filtered access to the session dbus connection. This is
              the default, except when run with --sandbox.

              Isandbox mode, even if you allow access to the session bus
              the sandbox cannot talk to or own the application ids
              (org.the.App.*) on the bus (unless explicitly added), only
              names in the .Sandbox subset (org.the.App.Sandbox.*).

          --no-a11y-bus
              Run this instance without the access to the accessibility
              bus. Note, this is the default when run with --sandbox.

          --a11y-bus
              Allow access to the accessibility bus. This is the default,
              except when run with --sandbox.

          --sandbox
              Run the application in sandboxed mode, which means dropping
              all the extra permissions it would otherwise have, as well as
              access to the session/system/a11y busses and document portal.

          --log-session-bus
              Log session bus traffic. This can be useful to see what
              access you need to allow in your D-Bus policy.

          --log-system-bus
              Log system bus traffic. This can be useful to see what access
              you need to allow in your D-Bus policy.

          -p, --die-with-parent
              Kill the entire sandbox when the launching process dies.

          --parent-pid=PID
              Specifies the pid of the "parent" flatpak, used by
              --parent-expose-pids and --parent-share-pids.

          --parent-expose-pids
              Make the processes of the new sandbox visible in the sandbox
              of the parent flatpak, as defined by --parent-pid.

          --parent-share-pids
              Use the same process ID namespace for the processes of the
              new sandbox and the sandbox of the parent flatpak, as defined
              by --parent-pid. Implies --parent-expose-pids.

          --instance-id-fd
              Write the instance ID string to the given file descriptor.

          --file-forwarding
              If this option is specified, the remaining arguments are
              scanned, and all arguments that are enclosed between a pair
              of '@@' arguments are interpreted as file paths, exported in
              the document store, and passed to the command in the form of
              the resulting document path. Arguments between '@@u' and '@@'
              are considered uris, and any file: uris are exported. The
              exports are non-persistent and with read and write
              permissions for the application.

          --app-path=PATH
              Instead of mounting the app's content on /app in the sandbox,
              mount PATH on /app, and the app's content on /run/parent/app.
              If the app has extensions, they will also be redirected into
              /run/parent/app, and will not be included in the
              LD_LIBRARY_PATH inside the sandbox.

          --app-path=
              As a special case, --app-path= (with an empty PATH) results
              in an empty directory being mounted on /app.

          --usr-path=PATH
              Instead of mounting the runtime's files on /usr in the
              sandbox, mount PATH on /usr, and the runtime's normal files
              on /run/parent/usr. If the runtime has extensions, they will
              also be redirected into /run/parent/usr, and will not be
              included in the LD_LIBRARY_PATH inside the sandbox.  This
              option will usually only be useful if it is combined with
              --app-path= and --env=LD_LIBRARY_PATH=....


---------------------------------------------------------

::

          $ flatpak run org.gnome.gedit

          $ flatpak run --devel --command=bash org.gnome.Builder

          $ flatpak run --command=bash org.gnome.Sdk


---------------------------------------------------------

::

          flatpak(1), flatpak-override(1), flatpak-enter(1)


---------------------------------------------------

::

           1. os-release specification
              https://www.freedesktop.org/software/systemd/man/os-release.html

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

   flatpak                                                   FLATPAK RUN(1)

--------------

Pages that refer to this page: `flatpak(1) <../man1/flatpak.1.html>`__, 
`flatpak-enter(1) <../man1/flatpak-enter.1.html>`__, 
`flatpak-kill(1) <../man1/flatpak-kill.1.html>`__, 
`flatpak-override(1) <../man1/flatpak-override.1.html>`__, 
`flatpak-ps(1) <../man1/flatpak-ps.1.html>`__, 
`flatpak-metadata(5) <../man5/flatpak-metadata.5.html>`__

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
