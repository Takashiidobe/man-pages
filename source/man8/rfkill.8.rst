.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rfkill(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RFKILL(8)                 System Administration                RFKILL(8)

NAME
-------------------------------------------------

::

          rfkill - tool for enabling and disabling wireless devices


---------------------------------------------------------

::

          rfkill [options] [command] [ID|type ...]


---------------------------------------------------------------

::

          rfkill lists, enabling and disabling wireless devices.

          The command "list" output format is deprecated and maintained for
          backward compatibility only. The new output format is the default
          when no command is specified or when the option --output is used.

          The default output is subject to change. So whenever possible,
          you should avoid using default outputs in your scripts. Always
          explicitly define expected columns by using the --output option
          together with a columns list in environments where a stable
          output is required.


-------------------------------------------------------

::

          -J, --json
              Use JSON output format.

          -n, --noheadings
              Do not print a header line.

          -o, --output
              Specify which output columns to print. Use --help to get a
              list of available columns.

          --output-all
              Output all available columns.

          -r, --raw
              Use the raw output format.

          --help
              Display help text and exit.

          --version
              Display version information and exit.


---------------------------------------------------------

::

          help
              Display help text and exit.

          event
              Listen for rfkill events and display them on stdout.

          list [id|type ...]
              List the current state of all available devices. The command
              output format is deprecated, see the section DESCRIPTION. It
              is a good idea to check with list command id or type scope is
              appropriate before setting block or unblock. Special all type
              string will match everything. Use of multiple ID or type
              arguments is supported.

          block id|type [...]
              Disable the corresponding device.

          unblock id|type [...]
              Enable the corresponding device. If the device is
              hard-blocked, for example via a hardware switch, it will
              remain unavailable though it is now soft-unblocked.

          toggle id|type [...]
              Enable or disable the corresponding device.


-------------------------------------------------------

::

                rfkill --output ID,TYPE
                rfkill block all
                rfkill unblock wlan
                rfkill block bluetooth uwb wimax wwan gps fm nfc


-------------------------------------------------------

::

          rfkill was originally written by Johannes Berg
          <johannes@sipsolutions.net> and Marcel Holtmann
          <marcel@holtmann.org>. The code has been later modified by Sami
          Kerola <kerolasa@iki.fi> and Karel Zak <kzak@redhat.com> for the
          util-linux project.

          This manual page was written by Darren Salt
          <linux@youmustbejoking.demon.co.uk> for the Debian project (and
          may be used by others).


---------------------------------------------------------

::

          powertop(8), systemd-rfkill(8), Linux kernel documentation
          <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/driver-api/rfkill.rst>


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The rfkill command is part of the util-linux package which can be
          downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.85-637cc       2021-04-02                      RFKILL(8)

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
