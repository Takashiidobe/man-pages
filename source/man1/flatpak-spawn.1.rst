.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flatpak-spawn(1) — Linux manual page
====================================

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

   FLATPAK SPAWN(1)              flatpak spawn             FLATPAK SPAWN(1)

NAME
-------------------------------------------------

::

          flatpak-spawn - Run commands in a sandbox


---------------------------------------------------------

::

          flatpak-spawn [OPTION...] COMMAND [ARGUMENT...]


---------------------------------------------------------------

::

          Unlike other flatpak commands, flatpak-spawn is available to
          applications inside the sandbox. It runs COMMAND outside the
          sandbox, either in another sandbox, or on the host.

          flatpak-spawn uses the Flatpak portal to create a copy the
          sandbox it was called from, optionally using tighter permissions
          and the latest version of the app and runtime.


-------------------------------------------------------

::

          The following options are understood:

          -h, --help
              Show help options and exit.

          -v, --verbose
              Print debug information

          --forward-fd=FD
              Forward a file descriptor

          --clear-env
              Run with a clean environment

          --watch-bus
              Make the spawned command exit if we do

          --env=VAR=VALUE
              Set an environment variable

          --latest-version
              Use the latest version of the refs that are used to set up
              the sandbox

          --no-network
              Run without network access

          --sandbox
              Run fully sandboxed.

              See the --sandbox-expose and --sandbox-expose-ro options for
              selective file access.

          --sandbox-expose=NAME
              Expose read-write access to a file in the sandbox.

              Note that absolute paths or subdirectories are not allowed.
              The files must be in the sandbox subdirectory of the instance
              directory (i.e.  ~/.var/app/$APP_ID/sandbox).

              This option is useful in combination with --sandbox
              (otherwise the instance directory is accessible anyway).

          --sandbox-expose-ro=NAME
              Expose readonly access to a file in the sandbox.

              Note that absolute paths or subdirectories are not allowed.
              The files must be in the sandbox subdirectory of the instance
              directory (i.e.  ~/.var/app/$APP_ID/sandbox).

              This option is useful in combination with --sandbox
              (otherwise the instance directory is accessible anyway).

          --host
              Run the command unsandboxed on the host. This requires access
              to the org.freedesktop.Flatpak D-Bus interface

          --directory=DIR
              The working directory in which to run the command.

              Note that the given directory must exist in the sandbox or,
              when used in conjunction with --host, on the host.


---------------------------------------------------------

::

          $ flatpak-spawn ls /var/run


---------------------------------------------------------

::

          flatpak(1)

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

   flatpak                                                 FLATPAK SPAWN(1)

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
