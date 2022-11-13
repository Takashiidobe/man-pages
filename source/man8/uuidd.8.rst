.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

uuidd(8) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UUIDD(8)                  System Administration                 UUIDD(8)

NAME
-------------------------------------------------

::

          uuidd - UUID generation daemon


---------------------------------------------------------

::

          uuidd [options]


---------------------------------------------------------------

::

          The uuidd daemon is used by the UUID library to generate
          universally unique identifiers (UUIDs), especially time-based
          UUIDs, in a secure and guaranteed-unique fashion, even in the
          face of large numbers of threads running on different CPUs trying
          to grab UUIDs.


-------------------------------------------------------

::

          -d, --debug
              Run uuidd in debugging mode. This prevents uuidd from running
              as a daemon.

          -F, --no-fork
              Do not daemonize using a double-fork.

          -k, --kill
              If currently a uuidd daemon is running, kill it.

          -n, --uuids number
              When issuing a test request to a running uuidd, request a
              bulk response of number UUIDs.

          -P, --no-pid
              Do not create a pid file.

          -p, --pid path
              Specify the pathname where the pid file should be written. By
              default, the pid file is written to
              {runstatedir}/uuidd/uuidd.pid.

          -q, --quiet
              Suppress some failure messages.

          -r, --random
              Test uuidd by trying to connect to a running uuidd daemon and
              request it to return a random-based UUID.

          -S, --socket-activation
              Do not create a socket but instead expect it to be provided
              by the calling process. This implies --no-fork and --no-pid.
              This option is intended to be used only with systemd(1). It
              needs to be enabled with a configure option.

          -s, --socket path
              Make uuidd use this pathname for the unix-domain socket. By
              default, the pathname used is {runstatedir}/uuidd/request.
              This option is primarily for debugging purposes, since the
              pathname is hard-coded in the libuuid library.

          -T, --timeout number
              Make uuidd exit after number seconds of inactivity.

          -t, --time
              Test uuidd by trying to connect to a running uuidd daemon and
              request it to return a time-based UUID.

          -V, --version
              Output version information and exit.

          -h, --help
              Display help screen and exit.


-------------------------------------------------------

::

          Start up a daemon, print 42 random keys, and then stop the
          daemon:

              uuidd -p /tmp/uuidd.pid -s /tmp/uuidd.socket
              uuidd -d -r -n 42 -s /tmp/uuidd.socket
              uuidd -d -k -s /tmp/uuidd.socket


-----------------------------------------------------

::

          The uuidd daemon was written by Theodore Ts’o <tytso@mit.edu>.


---------------------------------------------------------

::

          uuid(3), uuidgen(1)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The uuidd command is part of the util-linux package which can be
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

   util-linux 2.37.85-637cc       2021-04-02                       UUIDD(8)

--------------

Pages that refer to this page:
`uuid_generate(3) <../man3/uuid_generate.3.html>`__

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
