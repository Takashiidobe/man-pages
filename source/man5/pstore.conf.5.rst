.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pstore.conf(5) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CONFIGURATION DIRECTO            |                                   |
| RIES AND PRECEDENCE <#CONFIGURATI |                                   |
| ON_DIRECTORIES_AND_PRECEDENCE>`__ |                                   |
| \| `OPTIONS <#OPTIONS>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PSTORE.CONF(5)                 pstore.conf                PSTORE.CONF(5)

NAME
-------------------------------------------------

::

          pstore.conf, pstore.conf.d - PStore configuration file


---------------------------------------------------------

::

          /etc/systemd/pstore.conf /etc/systemd/pstore.conf.d/*


---------------------------------------------------------------

::

          This file configures the behavior of systemd-pstore(8), a tool
          for archiving the contents of the persistent storage filesystem,
          pstore[1].


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

          All options are configured in the [PStore] section:

          Storage=
              Controls where to archive (i.e. copy) files from the pstore
              filesystem. One of "none", "external", and "journal". When
              "none", the tool exits without processing files in the pstore
              filesystem. When "external" (the default), files are archived
              into /var/lib/systemd/pstore/, and logged into the journal.
              When "journal", pstore file contents are logged only in the
              journal.

          Unlink=
              Controls whether or not files are removed from pstore after
              processing. Takes a boolean value. When true, a pstore file
              is removed from the pstore once it has been archived (either
              to disk or into the journal). When false, processing of
              pstore files occurs normally, but the files remain in the
              pstore. The default is true in order to maintain the pstore
              in a nearly empty state, so that the pstore has storage
              available for the next kernel error event.

          The defaults for all values are listed as comments in the
          template /etc/systemd/pstore.conf file that is installed by
          default.


---------------------------------------------------------

::

          systemd-journald.service(8)


---------------------------------------------------

::

           1. pstore
              https://www.kernel.org/doc/Documentation/ABI/testing/pstore

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

   systemd 249                                               PSTORE.CONF(5)

--------------

Pages that refer to this page:
`systemd-pstore.service(8) <../man8/systemd-pstore.service.8.html>`__

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
