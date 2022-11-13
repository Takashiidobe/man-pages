.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-journal-remote.service(8) — Linux manual page
=====================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SOURCES <#SOURCES>`__ \|         |                                   |
| `SINKS <#SINKS>`__ \|             |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-JOURNAL-REMOTE.SERVICE(8)nal-remote.serviceNAL-REMOTE.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-journal-remote.service, systemd-journal-remote.socket,
          systemd-journal-remote - Receive journal messages over the
          network


---------------------------------------------------------

::

          systemd-journal-remote.service

          systemd-journal-remote.socket

          /usr/lib/systemd/systemd-journal-remote [OPTIONS...]
                                                  [-o/--output=DIR|FILE]
                                                  [SOURCES...]


---------------------------------------------------------------

::

          systemd-journal-remote is a command to receive serialized journal
          events and store them to journal files. Input streams are in the
          Journal Export Format[1], i.e. like the output from journalctl
          --output=export. For transport over the network, this serialized
          stream is usually carried over an HTTPS connection.

          systemd-journal-remote.service is a system service that uses
          systemd-journal-remote to listen for connections.
          systemd-journal-remote.socket configures the network address that
          systemd-journal-remote.service listens on. By default this is
          port 19532. What connections are accepted and how the received
          data is stored can be configured through the
          journal-remote.conf(5) configuration file.


-------------------------------------------------------

::

          Sources can be either "active" (systemd-journal-remote requests
          and pulls the data), or "passive" (systemd-journal-remote waits
          for a connection and then receives events pushed by the other
          side).

          systemd-journal-remote can read more than one event stream at a
          time. They will be interleaved in the output file. In case of
          "active" connections, each "source" is one stream, and in case of
          "passive" connections, each connection can result in a separate
          stream. Sockets can be configured in "accept" mode (i.e. only one
          connection), or "listen" mode (i.e. multiple connections, each
          resulting in a stream).

          When there are no more connections, and no more can be created
          (there are no listening sockets), then systemd-journal-remote
          will exit.

          Active sources can be specified in the following ways:

          [SOURCES...]
              When - is given as a positional argument, events will be read
              from standard input. Other positional arguments will be
              treated as filenames to open and read from.

          --url=ADDRESS
              With the --url=ADDRESS option, events will be retrieved using
              HTTP from ADDRESS. This URL should refer to the root of a
              remote systemd-journal-gatewayd(8) instance, e.g.
              http://some.host:19531/ or https://some.host:19531/.

          --getter='PROG [OPTIONS...]'
              Program to invoke to retrieve data. The journal event stream
              must be generated on standard output.

              Examples:

                  --getter='curl "-HAccept: application/vnd.fdo.journal" https://some.host:19531/'

                  --getter='wget --header="Accept: application/vnd.fdo.journal" -O- https://some.host:19531/'

          Passive sources can be specified in the following ways:

          --listen-raw=ADDRESS
              ADDRESS must be an address suitable for ListenStream= (cf.
              systemd.socket(5)).  systemd-journal-remote will listen on
              this socket for connections. Each connection is expected to
              be a stream of journal events.

          --listen-http=ADDRESS, --listen-https=ADDRESS
              ADDRESS must be either a negative integer, in which case it
              will be interpreted as the (negated) file descriptor number,
              or an address suitable for ListenStream= (c.f.
              systemd.socket(5)). In the first case, the server listens on
              port 19532 by default, and the matching file descriptor must
              be inherited through $LISTEN_FDS/$LISTEN_PID. In the second
              case, an HTTP or HTTPS server will be spawned on this port,
              respectively for --listen-http= and --listen-https=.
              Currently, only POST requests to /upload with "Content-Type:
              application/vnd.fdo.journal" are supported.

          $LISTEN_FDS
              systemd-journal-remote supports the $LISTEN_FDS/$LISTEN_PID
              protocol. Open sockets inherited through socket activation
              behave like those opened with --listen-raw= described above,
              unless they are specified as an argument in --listen-http=-n
              or --listen-https=-n above. In the latter case, an HTTP or
              HTTPS server will be spawned using this descriptor and
              connections must be made over the HTTP protocol.

          --key=
              Takes a path to a SSL secret key file in PEM format. Defaults
              to /etc/ssl/private/journal-remote.pem. This option can be
              used with --listen-https=. If the path refers to an AF_UNIX
              stream socket in the file system a connection is made to it
              and the key read from it.

          --cert=
              Takes a path to a SSL certificate file in PEM format.
              Defaults to /etc/ssl/certs/journal-remote.pem. This option
              can be used with --listen-https=. If the path refers to an
              AF_UNIX stream socket in the file system a connection is made
              to it and the certificate read from it.

          --trust=
              Takes a path to a SSL CA certificate file in PEM format, or
              all. If all is set, then certificate checking will be
              disabled. Defaults to /etc/ssl/ca/trusted.pem. This option
              can be used with --listen-https=. If the path refers to an
              AF_UNIX stream socket in the file system a connection is made
              to it and the certificate read from it.

          --gnutls-log=
              Takes a comma separated list of gnutls logging categories.
              This option can be used with --listen-http= or
              --listen-https=.


---------------------------------------------------

::

          The location of the output journal can be specified with -o or
          --output=.

          --output=FILE
              Will write to this journal file. The filename must end with
              .journal. The file will be created if it does not exist. If
              necessary (journal file full, or corrupted), the file will be
              renamed following normal journald rules and a new journal
              file will be created in its stead.

          --output=DIR
              Will create journal files underneath directory DIR. The
              directory must exist. If necessary (journal files over size,
              or corrupted), journal files will be rotated following normal
              journald rules. Names of files underneath DIR will be
              generated using the rules described below.

          If --output= is not used, the output directory
          /var/log/journal/remote/ will be used. In case the output file is
          not specified, journal files will be created underneath the
          selected directory. Files will be called remote-hostname.journal,
          where the hostname part is the escaped hostname of the source
          endpoint of the connection, or the numerical address if the
          hostname cannot be determined.

          In the case that "active" sources are given by the positional
          arguments or --getter= option, the output file name must always
          be given explicitly.


-------------------------------------------------------

::

          The following options are understood:

          --split-mode
              One of none or host. For the first, only one output journal
              file is used. For the latter, a separate output file is used,
              based on the hostname of the other endpoint of a connection.

              In the case that "active" sources are given by the positional
              arguments or --getter= option, the output file name must
              always be given explicitly and only none is allowed.

          --compress [BOOL]
              If this is set to "yes" then compress the data in the journal
              using XZ. The default is "yes".

          --seal [BOOL]
              If this is set to "yes" then periodically sign the data in
              the journal using Forward Secure Sealing. The default is
              "no".

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.


---------------------------------------------------------

::

          Copy local journal events to a different journal directory:

              journalctl -o export | systemd-journal-remote -o /tmp/dir/foo.journal -

          Retrieve all available events from a remote
          systemd-journal-gatewayd(8) instance and store them in
          /var/log/journal/remote/remote-some.host.journal:

              systemd-journal-remote --url http://some.host:19531/

          Retrieve current boot events and wait for new events from a
          remote systemd-journal-gatewayd(8) instance, and store them in
          /var/log/journal/remote/remote-some.host.journal:

              systemd-journal-remote --url http://some.host:19531/entries?boot&follow


---------------------------------------------------------

::

          journal-remote.conf(5), journalctl(1),
          systemd-journal-gatewayd.service(8),
          systemd-journal-upload.service(8), systemd-journald.service(8)


---------------------------------------------------

::

           1. Journal Export Format
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

   systemd 249                            SYSTEMD-JOURNAL-REMOTE.SERVICE(8)

--------------

Pages that refer to this page:
`journalctl(1) <../man1/journalctl.1.html>`__, 
`journal-remote.conf(5) <../man5/journal-remote.conf.5.html>`__, 
`systemd-journal-gatewayd.service(8) <../man8/systemd-journal-gatewayd.service.8.html>`__, 
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
