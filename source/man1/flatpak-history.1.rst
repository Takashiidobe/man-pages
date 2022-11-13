.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flatpak-history(1) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FIELDS <#FIELDS>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FLATPAK HISTORY(1)           flatpak history          FLATPAK HISTORY(1)

NAME
-------------------------------------------------

::

          flatpak-history - Show history


---------------------------------------------------------

::

          flatpak history [OPTION...]


---------------------------------------------------------------

::

          Shows changes to the flatpak installations on the system. This
          includes installs, updates and removals of applications and
          runtimes.

          By default, both per-user and system-wide installations are
          shown. Use the --user, --installation or --system options to
          change this.

          The information for the history command is taken from the systemd
          journal, and can also be accessed using e.g. the journalctl
          command.


-------------------------------------------------------

::

          The following options are understood:

          -h, --help
              Show help options and exit.

          --user
              Show changes to the user installation.

          --system
              Show changes to the default system-wide installation.

          --installation=NAME
              Show changes to the installation specified by NAME among
              those defined in /etc/flatpak/installations.d/. Using
              --installation=default is equivalent to using --system.

          --since=TIME
              Only show changes that are newer than the time specified by
              TIME.

              TIME can be either an absolute time in a format like
              YYYY-MM-DD HH:MM:SS, or a relative time like "2h", "7days",
              "4days 2hours".

          --until=TIME
              Only show changes that are older than the time specified by
              TIME.

          --reverse
              Show newest entries first.

          -v, --verbose
              Print debug information during command processing.

          --ostree-verbose
              Print OSTree debug information during command processing.

          --columns=FIELD,...
              Specify what information to show about each ref. You can list
              multiple fields, or use this option multiple times.

              Append :s[tart], :m[iddle], :e[nd] or :f[ull] to column names
              to change ellipsization.


-----------------------------------------------------

::

          The following fields are understood by the --columns option:

          time
              Show when the change happened

          change
              Show the kind of change

          ref
              Show the ref

          application
              Show the application/runtime ID

          arch
              Show the architecture

          branch
              Show the branch

          installation
              Show the affected installation.

              This will be either the ID of a Flatpak installation, or the
              path to a temporary OSTree repository.

          remote
              Show the remote that is used.

              This will be either the name of a configured remote, or the
              path to a temporary OSTree repository.

          old-commit
              Show the previous commit. For pulls, this is the previous
              HEAD of the branch. For deploys, it is the previously active
              commit

          commit
              Show the current commit. For pulls, this is the HEAD of the
              branch. For deploys, it is the active commit

          url
              Show the remote url

          user
              Show the user doing the change.

              If this is the system helper operating as root, also show
              which user triggered the change.

          tool
              Show the tool that was used.

              If this is the system helper, also show which tool was used
              to triggered the change.

          all
              Show all columns

          help
              Show the list of available columns

          Note that field names can be abbreviated to a unique prefix.


---------------------------------------------------------

::

          flatpak(1), journalctl(1)

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

   flatpak                                               FLATPAK HISTORY(1)

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
