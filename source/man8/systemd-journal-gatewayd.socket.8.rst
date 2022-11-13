.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-journal-gatewayd.service(8) — Linux manual page
=======================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SU                               |                                   |
| PPORTED URLS <#SUPPORTED_URLS>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| ACCEPT HEADER <#ACCEPT_HEADER>`__ |                                   |
| \|                                |                                   |
| `RANGE HEADER <#RANGE_HEADER>`__  |                                   |
| \|                                |                                   |
| `URL GET PA                       |                                   |
| RAMETERS <#URL_GET_PARAMETERS>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-JOURNAL-GATEWAYD.SERVICE(8)-gatewayd.service-GATEWAYD.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-journal-gatewayd.service, systemd-journal-
          gatewayd.socket, systemd-journal-gatewayd - HTTP server for
          journal events


---------------------------------------------------------

::

          systemd-journal-gatewayd.service

          systemd-journal-gatewayd.socket

          /usr/lib/systemd/systemd-journal-gatewayd [OPTIONS...]


---------------------------------------------------------------

::

          systemd-journal-gatewayd serves journal events over the network.
          Clients must connect using HTTP. The server listens on port 19531
          by default. If --cert= is specified, the server expects HTTPS
          connections.

          The program is started by systemd(1) and expects to receive a
          single socket. Use systemctl start
          systemd-journal-gatewayd.socket to start the service, and
          systemctl enable systemd-journal-gatewayd.socket to have it
          started on boot.


-------------------------------------------------------

::

          The following options are understood:

          --cert=
              Specify the path to a file or AF_UNIX stream socket to read
              the server certificate from. The certificate must be in PEM
              format. This option switches systemd-journal-gatewayd into
              HTTPS mode and must be used together with --key=.

          --key=
              Specify the path to a file or AF_UNIX stream socket to read
              the secret server key corresponding to the certificate
              specified with --cert= from. The key must be in PEM format.

          --trust=
              Specify the path to a file or AF_UNIX stream socket to read a
              CA certificate from. The certificate must be in PEM format.

          --system, --user
              Limit served entries to entries from system services and the
              kernel, or to entries from services of current user. This has
              the same meaning as --system and --user options for
              journalctl(1). If neither is specified, all accessible
              entries are served.

          -m, --merge
              Serve entries interleaved from all available journals,
              including other machines. This has the same meaning as
              --merge option for journalctl(1).

          -D DIR, --directory=DIR
              Takes a directory path as argument. If specified,
              systemd-journal-gatewayd will serve the specified journal
              directory DIR instead of the default runtime and system
              journal paths.

          --file=GLOB
              Takes a file glob as an argument. Serve entries from the
              specified journal files matching GLOB instead of the default
              runtime and system journal paths. May be specified multiple
              times, in which case files will be suitably interleaved. This
              has the same meaning as --file= option for journalctl(1).

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.


---------------------------------------------------------------------

::

          The following URLs are recognized:

          /browse
              Interactive browsing.

          /entries[?option1&option2=value...]
              Retrieval of events in various formats.

              The Accept: part of the HTTP header determines the format.
              Supported values are described below.

              The Range: part of the HTTP header determines the range of
              events returned. Supported values are described below.

              GET parameters can be used to modify what events are
              returned. Supported parameters are described below.

          /machine
              Return a JSON structure describing the machine.

              Example:

                  { "machine_id" : "8cf7ed9d451ea194b77a9f118f3dc446",
                    "boot_id" : "3d3c9efaf556496a9b04259ee35df7f7",
                    "hostname" : "fedora",
                    "os_pretty_name" : "Fedora 19 (Rawhide)",
                    "virtualization" : "kvm",
                    ...}

          /fields/FIELD_NAME
              Return a list of values of this field present in the logs.


-------------------------------------------------------------------

::

          Accept: format

          Recognized formats:

          text/plain
              The default. Plaintext syslog-like output, one line per
              journal entry (like journalctl --output short).

          application/json
              Entries are formatted as JSON data structures, one per line
              (like journalctl --output json). See Journal JSON Format[1]
              for more information.

          text/event-stream
              Entries are formatted as JSON data structures, wrapped in a
              format suitable for Server-Sent Events[2] (like journalctl
              --output json-sse).

          application/vnd.fdo.journal
              Entries are serialized into a binary (but mostly text-based)
              stream suitable for backups and network transfer (like
              journalctl --output export). See Journal Export Format[3] for
              more information.


-----------------------------------------------------------------

::

          Range: entries=cursor[[:num_skip]:num_entries]

          where cursor is a cursor string, num_skip is an integer,
          num_entries is an unsigned integer.

          Range defaults to all available events.


-----------------------------------------------------------------------------

::

          Following parameters can be used as part of the URL:

          follow
              wait for new events (like journalctl --follow, except that
              the number of events returned is not limited).

          discrete
              Test that the specified cursor refers to an entry in the
              journal. Returns just this entry.

          boot
              Limit events to the current boot of the system (like
              journalctl -b).

          KEY=match
              Match journal fields. See systemd.journal-fields(7).


---------------------------------------------------------

::

          Retrieve events from this boot from local journal in Journal
          Export Format[3]:

              curl --silent -H'Accept: application/vnd.fdo.journal' \
                     'http://localhost:19531/entries?boot'

          Listen for core dumps:

              curl 'http://localhost:19531/entries?follow&MESSAGE_ID=fc2e22bc6ee647b6b90729ab34a250b1'


---------------------------------------------------------

::

          systemd(1), journalctl(1), systemd.journal-fields(7),
          systemd-journald.service(8), systemd-journal-remote.service(8),
          systemd-journal-upload.service(8)


---------------------------------------------------

::

           1. Journal JSON Format
              https://www.freedesktop.org/wiki/Software/systemd/json

           2. Server-Sent Events
              https://developer.mozilla.org/en-US/docs/Server-sent_events/Using_server-sent_events

           3. Journal Export Format
              https://www.freedesktop.org/wiki/Software/systemd/export

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

   systemd 249                          SYSTEMD-JOURNAL-GATEWAYD.SERVICE(8)

--------------

Pages that refer to this page:
`systemd-journal-remote.service(8) <../man8/systemd-journal-remote.service.8.html>`__, 
`systemd-journal-upload.service(8) <../man8/systemd-journal-upload.service.8.html>`__

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
