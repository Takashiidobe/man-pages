.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-delta(1) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-DELTA(1)              systemd-delta             SYSTEMD-DELTA(1)

NAME
-------------------------------------------------

::

          systemd-delta - Find overridden configuration files


---------------------------------------------------------

::

          systemd-delta [OPTIONS...] [PREFIX[/SUFFIX]|SUFFIX...]


---------------------------------------------------------------

::

          systemd-delta may be used to identify and compare configuration
          files that override other configuration files. Files in /etc/
          have highest priority, files in /run/ have the second highest
          priority, ..., files in /usr/lib/ have lowest priority. Files in
          a directory with higher priority override files with the same
          name in directories of lower priority. In addition, certain
          configuration files can have ".d" directories which contain
          "drop-in" files with configuration snippets which augment the
          main configuration file. "Drop-in" files can be overridden in the
          same way by placing files with the same name in a directory of
          higher priority (except that, in case of "drop-in" files, both
          the "drop-in" file name and the name of the containing directory,
          which corresponds to the name of the main configuration file,
          must match). For a fuller explanation, see systemd.unit(5).

          The command line argument will be split into a prefix and a
          suffix. Either is optional. The prefix must be one of the
          directories containing configuration files (/etc/, /run/,
          /usr/lib/, ...). If it is given, only overriding files contained
          in this directory will be shown. Otherwise, all overriding files
          will be shown. The suffix must be a name of a subdirectory
          containing configuration files like tmpfiles.d, sysctl.d or
          systemd/system. If it is given, only configuration files in this
          subdirectory (across all configuration paths) will be analyzed.
          Otherwise, all configuration files will be analyzed. If the
          command line argument is not given at all, all configuration
          files will be analyzed. See below for some examples.


-------------------------------------------------------

::

          The following options are understood:

          -t, --type=
              When listing the differences, only list those that are asked
              for. The list itself is a comma-separated list of desired
              difference types.

              Recognized types are:

              masked
                  Show masked files

              equivalent
                  Show overridden files that while overridden, do not
                  differ in content.

              redirected
                  Show files that are redirected to another.

              overridden
                  Show overridden, and changed files.

              extended
                  Show *.conf files in drop-in directories for units.

              unchanged
                  Show unmodified files too.

          --diff=
              When showing modified files, when a file is overridden show a
              diff as well. This option takes a boolean argument. If
              omitted, it defaults to true.

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.

          --no-pager
              Do not pipe output into a pager.


---------------------------------------------------------

::

          To see all local configuration:

              systemd-delta

          To see all runtime configuration:

              systemd-delta /run

          To see all system unit configuration changes:

              systemd-delta systemd/system

          To see all runtime "drop-in" changes for system units:

              systemd-delta --type=extended /run/systemd/system


---------------------------------------------------------------

::

          On success, 0 is returned, a non-zero failure code otherwise.


---------------------------------------------------------

::

          systemd(1), systemd.unit(5)

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

   systemd 249                                             SYSTEMD-DELTA(1)

--------------

Pages that refer to this page:
`binfmt.d(5) <../man5/binfmt.d.5.html>`__, 
`modules-load.d(5) <../man5/modules-load.d.5.html>`__, 
`sysctl.d(5) <../man5/sysctl.d.5.html>`__, 
`systemd.preset(5) <../man5/systemd.preset.5.html>`__, 
`tmpfiles.d(5) <../man5/tmpfiles.d.5.html>`__

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
