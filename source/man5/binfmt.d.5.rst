.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

binfmt.d(5) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CONFIGURATION                    |                                   |
| FORMAT <#CONFIGURATION_FORMAT>`__ |                                   |
| \|                                |                                   |
| `CONFIGURATION DIRECTO            |                                   |
| RIES AND PRECEDENCE <#CONFIGURATI |                                   |
| ON_DIRECTORIES_AND_PRECEDENCE>`__ |                                   |
| \| `EXAMPLE <#EXAMPLE>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BINFMT.D(5)                     binfmt.d                     BINFMT.D(5)

NAME
-------------------------------------------------

::

          binfmt.d - Configure additional binary formats for executables at
          boot


---------------------------------------------------------

::

          /etc/binfmt.d/*.conf

          /run/binfmt.d/*.conf

          /usr/lib/binfmt.d/*.conf


---------------------------------------------------------------

::

          At boot, systemd-binfmt.service(8) reads configuration files from
          the above directories to register in the kernel additional binary
          formats for executables.


---------------------------------------------------------------------------------

::

          Each file contains a list of binfmt_misc kernel binary format
          rules. Consult the kernel's binfmt-misc.rst[1] documentation file
          for more information on registration of additional binary formats
          and how to write rules.

          Empty lines and lines beginning with ; and # are ignored. Note
          that this means you may not use ; and # as delimiter in binary
          format rules.


-------------------------------------------------------------------------------------------------------------------------

::

          Configuration files are read from directories in /etc/, /run/,
          /usr/local/lib/, and /usr/lib/, in order of precedence, as listed
          in the SYNOPSIS section above. Files must have the ".conf"
          extension. Files in /etc/ override files with the same name in
          /run/, /usr/local/lib/, and /usr/lib/. Files in /run/ override
          files with the same name under /usr/.

          All configuration files are sorted by their filename in
          lexicographic order, regardless of which of the directories they
          reside in. If multiple files specify the same option, the entry
          in the file with the lexicographically latest name will take
          precedence. Thus, the configuration in a certain file may either
          be replaced completely (by placing a file with the same name in a
          directory with higher priority), or individual settings might be
          changed (by specifying additional settings in a file with a
          different name that is ordered later).

          Packages should install their configuration files in /usr/lib/
          (distribution packages) or /usr/local/lib/ (local installs).
          Files in /etc/ are reserved for the local administrator, who may
          use this logic to override the configuration files installed by
          vendor packages. It is recommended to prefix all filenames with a
          two-digit number and a dash, to simplify the ordering of the
          files.

          If the administrator wants to disable a configuration file
          supplied by the vendor, the recommended way is to place a symlink
          to /dev/null in the configuration directory in /etc/, with the
          same filename as the vendor configuration file. If the vendor
          configuration file is included in the initrd image, the image has
          to be regenerated.


-------------------------------------------------------

::

          Example 1. /etc/binfmt.d/wine.conf example:

              # Start WINE on Windows executables
              :DOSWin:M::MZ::/usr/bin/wine:


---------------------------------------------------------

::

          systemd(1), systemd-binfmt.service(8), systemd-delta(1), wine(8)


---------------------------------------------------

::

           1. binfmt-misc.rst
              https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.html

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

   systemd 249                                                  BINFMT.D(5)

--------------

Pages that refer to this page:
`systemd-binfmt.service(8) <../man8/systemd-binfmt.service.8.html>`__

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
