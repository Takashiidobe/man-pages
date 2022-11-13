.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

coredump.conf(5) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CONFIGURATION DIRECTO            |                                   |
| RIES AND PRECEDENCE <#CONFIGURATI |                                   |
| ON_DIRECTORIES_AND_PRECEDENCE>`__ |                                   |
| \| `OPTIONS <#OPTIONS>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   COREDUMP.CONF(5)              coredump.conf             COREDUMP.CONF(5)

NAME
-------------------------------------------------

::

          coredump.conf, coredump.conf.d - Core dump storage configuration
          files


---------------------------------------------------------

::

          /etc/systemd/coredump.conf

          /etc/systemd/coredump.conf.d/*.conf

          /run/systemd/coredump.conf.d/*.conf

          /usr/lib/systemd/coredump.conf.d/*.conf


---------------------------------------------------------------

::

          These files configure the behavior of systemd-coredump(8), a
          handler for core dumps invoked by the kernel. Whether
          systemd-coredump is used is determined by the kernel's
          kernel.core_pattern sysctl(8) setting. See systemd-coredump(8)
          and core(5) pages for the details.


-------------------------------------------------------------------------------------------------------------------------

::

          The default configuration is set during compilation, so
          configuration is only needed when it is necessary to deviate from
          those defaults. Initially, the main configuration file in
          /etc/systemd/ contains commented out entries showing the defaults
          as a guide to the administrator. Local overrides can be created
          by editing this file or by creating drop-ins, as described below.
          Using drop-ins for local configuration is recommended over
          modifications to the main configuration file.

          In addition to the "main" configuration file, drop-in
          configuration snippets are read from /usr/lib/systemd/*.conf.d/,
          /usr/local/lib/systemd/*.conf.d/, and /etc/systemd/*.conf.d/.
          Those drop-ins have higher precedence and override the main
          configuration file. Files in the *.conf.d/ configuration
          subdirectories are sorted by their filename in lexicographic
          order, regardless of in which of the subdirectories they reside.
          When multiple files specify the same option, for options which
          accept just a single value, the entry in the file sorted last
          takes precedence, and for options which accept a list of values,
          entries are collected as they occur in the sorted files.

          When packages need to customize the configuration, they can
          install drop-ins under /usr/. Files in /etc/ are reserved for the
          local administrator, who may use this logic to override the
          configuration files installed by vendor packages. Drop-ins have
          to be used to override package drop-ins, since the main
          configuration file has lower precedence. It is recommended to
          prefix all filenames in those subdirectories with a two-digit
          number and a dash, to simplify the ordering of the files.

          To disable a configuration file supplied by the vendor, the
          recommended way is to place a symlink to /dev/null in the
          configuration directory in /etc/, with the same filename as the
          vendor configuration file.


-------------------------------------------------------

::

          All options are configured in the [Coredump] section:

          Storage=
              Controls where to store cores. One of "none", "external", and
              "journal". When "none", the core dumps may be logged
              (including the backtrace if possible), but not stored
              permanently. When "external" (the default), cores will be
              stored in /var/lib/systemd/coredump/. When "journal", cores
              will be stored in the journal and rotated following normal
              journal rotation patterns.

              When cores are stored in the journal, they might be
              compressed following journal compression settings, see
              journald.conf(5). When cores are stored externally, they will
              be compressed by default, see below.

          Compress=
              Controls compression for external storage. Takes a boolean
              argument, which defaults to "yes".

          ProcessSizeMax=
              The maximum size in bytes of a core which will be processed.
              Core dumps exceeding this size may be stored, but the
              backtrace will not be generated. Like other sizes in this
              same config file, the usual suffixes to the base of 1024 are
              allowed (B, K, M, G, T, P, and E).

              Setting Storage=none and ProcessSizeMax=0 disables all
              coredump handling except for a log entry.

          ExternalSizeMax=, JournalSizeMax=
              The maximum (compressed or uncompressed) size in bytes of a
              core to be saved. Unit suffixes are allowed just as in
              ProcessSizeMax=.

          MaxUse=, KeepFree=
              Enforce limits on the disk space, specified in bytes, taken
              up by externally stored core dumps. Unit suffixes are allowed
              just as in ProcessSizeMax=.  MaxUse= makes sure that old core
              dumps are removed as soon as the total disk space taken up by
              core dumps grows beyond this limit (defaults to 10% of the
              total disk size).  KeepFree= controls how much disk space to
              keep free at least (defaults to 15% of the total disk size).
              Note that the disk space used by core dumps might temporarily
              exceed these limits while core dumps are processed. Note that
              old core dumps are also removed based on time via
              systemd-tmpfiles(8). Set either value to 0 to turn off
              size-based cleanup.

          The defaults for all values are listed as comments in the
          template /etc/systemd/coredump.conf file that is installed by
          default.


---------------------------------------------------------

::

          systemd-journald.service(8), coredumpctl(1), systemd-tmpfiles(8)

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

   systemd 249                                             COREDUMP.CONF(5)

--------------

Pages that refer to this page:
`coredumpctl(1) <../man1/coredumpctl.1.html>`__, 
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
