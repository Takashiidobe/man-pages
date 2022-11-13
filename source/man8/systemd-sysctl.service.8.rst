.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-sysctl.service(8) — Linux manual page
=============================================

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

   SYSTEMD-SYSCTL.SERVICE(8)systemd-sysctl.serviceSYSTEMD-SYSCTL.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-sysctl.service, systemd-sysctl - Configure kernel
          parameters at boot


---------------------------------------------------------

::

          /usr/lib/systemd/systemd-sysctl [OPTIONS...] [CONFIGFILE...]

          systemd-sysctl.service


---------------------------------------------------------------

::

          systemd-sysctl.service is an early boot service that configures
          sysctl(8) kernel parameters by invoking
          /usr/lib/systemd/systemd-sysctl.

          When invoked with no arguments, /usr/lib/systemd/systemd-sysctl
          applies all directives from configuration files listed in
          sysctl.d(5). If one or more filenames are passed on the command
          line, only the directives in these files are applied.

          In addition, --prefix= option may be used to limit which sysctl
          settings are applied.

          See sysctl.d(5) for information about the configuration of sysctl
          settings. After sysctl configuration is changed on disk, it must
          be written to the files in /proc/sys/ before it takes effect. It
          is possible to update specific settings, or simply to reload all
          configuration, see Examples below.


-------------------------------------------------------

::

          --prefix=
              Only apply rules with the specified prefix.

          --cat-config
              Copy the contents of config files to standard output. Before
              each file, the filename is printed as a comment.

          --no-pager
              Do not pipe output into a pager.

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.


---------------------------------------------------------

::

          Example 1. Reset all sysctl settings

              systemctl restart systemd-sysctl

          Example 2. View coredump handler configuration

              # sysctl kernel.core_pattern
              kernel.core_pattern = |/usr/libexec/abrt-hook-ccpp %s %c %p %u %g %t %P %I

          Example 3. Update coredump handler configuration

              # /usr/lib/systemd/systemd-sysctl --prefix kernel.core_pattern

          This searches all the directories listed in sysctl.d(5) for
          configuration files and writes /proc/sys/kernel/core_pattern.

          Example 4. Update coredump handler configuration according to a
          specific file

              # /usr/lib/systemd/systemd-sysctl 50-coredump.conf

          This applies all the settings found in 50-coredump.conf. Either
          /etc/sysctl.d/50-coredump.conf, or
          /run/sysctl.d/50-coredump.conf, or
          /usr/lib/sysctl.d/50-coredump.conf will be used, in the order of
          preference.

          See sysctl(8) for various ways to directly apply sysctl settings.


---------------------------------------------------------

::

          systemd(1), sysctl.d(5), sysctl(8),

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

   systemd 249                                    SYSTEMD-SYSCTL.SERVICE(8)

--------------

Pages that refer to this page:
`sysctl.d(5) <../man5/sysctl.d.5.html>`__, 
`systemd-coredump(8) <../man8/systemd-coredump.8.html>`__

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
