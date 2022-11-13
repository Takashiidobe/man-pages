.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flatpak-remotes(1) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FIELDS <#FIELDS>`__ \|           |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FLATPAK REMOTES(1)           flatpak remotes          FLATPAK REMOTES(1)

NAME
-------------------------------------------------

::

          flatpak-remotes - List remote repositories


---------------------------------------------------------

::

          flatpak remotes [OPTION...]


---------------------------------------------------------------

::

          Lists the known remote repositories, in priority order.

          By default, both per-user and system-wide installations are
          shown. Use the --user, --system or --installation options to
          change this.


-------------------------------------------------------

::

          The following options are understood:

          -h, --help
              Show help options and exit.

          --user
              Show the per-user configuration.

          --system
              Show the default system-wide configuration.

          --installation=NAME
              Show a system-wide installation by NAME among those defined
              in /etc/flatpak/installations.d/. Using
              --installation=default is equivalent to using --system.

          -d, --show-details
              Show more information for each repository in addition to the
              name. Equivalent to --columns=all.

          --show-disabled
              Show disabled repos.

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

          name
              Show the name of the remote

          title
              Show the title of the remote

          url
              Show the URL of the remote

          filter
              Show the path to the client-side filter of the remote.

          collection
              Show the collection ID of the remote

          priority
              Show the priority of the remote

          options
              Show options

          comment
              Show comment

          description
              Show description

          homepage
              Show homepage

          icon
              Show icon

          all
              Show all columns

          help
              Show the list of available columns

          Note that field names can be abbreviated to a unique prefix.


---------------------------------------------------------

::

          $ flatpak remotes --user --show-details

              testrepo  Test Repository      http://209.132.179.91/repo/ no-gpg-verify


---------------------------------------------------------

::

          flatpak(1), flatpak-remote-add(1), flatpak-remote-delete(1)

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

   flatpak                                               FLATPAK REMOTES(1)

--------------

Pages that refer to this page: `flatpak(1) <../man1/flatpak.1.html>`__, 
`flatpak-remote-add(1) <../man1/flatpak-remote-add.1.html>`__, 
`flatpak-remote-delete(1) <../man1/flatpak-remote-delete.1.html>`__, 
`flatpak-remote-info(1) <../man1/flatpak-remote-info.1.html>`__, 
`flatpak-remote-ls(1) <../man1/flatpak-remote-ls.1.html>`__, 
`flatpak-remote-modify(1) <../man1/flatpak-remote-modify.1.html>`__

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
