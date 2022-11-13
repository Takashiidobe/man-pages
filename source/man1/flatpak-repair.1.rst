.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

flatpak-repair(1) — Linux manual page
=====================================

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

   FLATPAK REPAIR(1)            flatpak repair            FLATPAK REPAIR(1)

NAME
-------------------------------------------------

::

          flatpak-repair - Repair a flatpak installation


---------------------------------------------------------

::

          flatpak repair [OPTION...]


---------------------------------------------------------------

::

          Repair a flatpak installation by pruning and reinstalling invalid
          objects. The repair command does all of the following:

          •   Scan all locally available refs, removing any that don't
              correspond to a deployed ref.

          •   Verify each commit they point to, removing any invalid
              objects and noting any missing objects.

          •   Remove any refs that had an invalid object, and any
              non-partial refs that had missing objects.

          •   Prune all objects not referenced by a ref, which gets rid of
              any possibly invalid non-scanned objects.

          •   Enumerate all deployed refs and re-install any that are not
              in the repo (or are partial for a non-subdir deploy).

          Note that flatpak repair has to be run with root privileges to
          operate on the system installation.

          An alternative command for repairing OSTree repositories is
          ostree fsck.


-------------------------------------------------------

::

          The following options are understood:

          -h, --help
              Show help options and exit.

          --user
              Repair per-user installation.

          --system
              Repair system-wide installation.

          --installation=NAME
              Repair the system-wide installation specified by NAME among
              those defined in /etc/flatpak/installations.d/. Using
              --installation=default is equivalent to using --system.

          --dry-run
              Only report inconsistencies, don't make any changes

          --reinstall-all
              Reinstall all refs, regardless of whether they were removed
              from the repo or not

          -v, --verbose
              Print debug information during command processing.

          --ostree-verbose
              Print OSTree debug information during command processing.


---------------------------------------------------------

::

          $ sudo flatpak repair

          $ flatpak repair --user


---------------------------------------------------------

::

          flatpak(1), ostree-fsck(1)

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

   flatpak                                                FLATPAK REPAIR(1)

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
