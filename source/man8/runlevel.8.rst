.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

runlevel(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `OVERVIEW <#OVERVIEW>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RUNLEVEL(8)                     runlevel                     RUNLEVEL(8)

NAME
-------------------------------------------------

::

          runlevel - Print previous and current SysV runlevel


---------------------------------------------------------

::

          runlevel [options...]


---------------------------------------------------------

::

          "Runlevels" are an obsolete way to start and stop groups of
          services used in SysV init. systemd provides a compatibility
          layer that maps runlevels to targets, and associated binaries
          like runlevel. Nevertheless, only one runlevel can be "active" at
          a given time, while systemd can activate multiple targets
          concurrently, so the mapping to runlevels is confusing and only
          approximate. Runlevels should not be used in new code, and are
          mostly useful as a shorthand way to refer the matching systemd
          targets in kernel boot parameters.

          Table 1. Mapping between runlevels and systemd targets
          ┌─────────┬───────────────────┐
          │Runlevel │ Target            │
          ├─────────┼───────────────────┤
          │0        │ poweroff.target   │
          ├─────────┼───────────────────┤
          │1        │ rescue.target     │
          ├─────────┼───────────────────┤
          │2, 3, 4  │ multi-user.target │
          ├─────────┼───────────────────┤
          │5        │ graphical.target  │
          ├─────────┼───────────────────┤
          │6        │ reboot.target     │
          └─────────┴───────────────────┘


---------------------------------------------------------------

::

          runlevel prints the previous and current SysV runlevel if they
          are known.

          The two runlevel characters are separated by a single space
          character. If a runlevel cannot be determined, N is printed
          instead. If neither can be determined, the word "unknown" is
          printed.

          Unless overridden in the environment, this will check the utmp
          database for recent runlevel changes.


-------------------------------------------------------

::

          The following option is understood:

          --help
              Print a short help text and exit.


---------------------------------------------------------------

::

          If one or both runlevels could be determined, 0 is returned, a
          non-zero failure code otherwise.


---------------------------------------------------------------

::

          $RUNLEVEL
              If $RUNLEVEL is set, runlevel will print this value as
              current runlevel and ignore utmp.

          $PREVLEVEL
              If $PREVLEVEL is set, runlevel will print this value as
              previous runlevel and ignore utmp.


---------------------------------------------------

::

          /run/utmp
              The utmp database runlevel reads the previous and current
              runlevel from.


---------------------------------------------------------

::

          systemd(1), systemd.target(5), systemctl(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                                  RUNLEVEL(8)

--------------

Pages that refer to this page: `boot(7) <../man7/boot.7.html>`__

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
