.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-socket-proxyd(8) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-SOCKET-PROXYD(8)  systemd-socket-proxyd SYSTEMD-SOCKET-PROXYD(8)

NAME
-------------------------------------------------

::

          systemd-socket-proxyd - Bidirectionally proxy local sockets to
          another (possibly remote) socket


---------------------------------------------------------

::

          systemd-socket-proxyd [OPTIONS...] HOST:PORT

          systemd-socket-proxyd [OPTIONS...] UNIX-DOMAIN-SOCKET-PATH


---------------------------------------------------------------

::

          systemd-socket-proxyd is a generic socket-activated network
          socket forwarder proxy daemon for IPv4, IPv6 and UNIX stream
          sockets. It may be used to bi-directionally forward traffic from
          a local listening socket to a local or remote destination socket.

          One use of this tool is to provide socket activation support for
          services that do not natively support socket activation. On
          behalf of the service to activate, the proxy inherits the socket
          from systemd, accepts each client connection, opens a connection
          to a configured server for each client, and then bidirectionally
          forwards data between the two.

          This utility's behavior is similar to socat(1). The main
          differences for systemd-socket-proxyd are support for socket
          activation with "Accept=no" and an event-driven design that
          scales better with the number of connections.


-------------------------------------------------------

::

          The following options are understood:

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.

          --connections-max=, -c
              Sets the maximum number of simultaneous connections, defaults
              to 256. If the limit of concurrent connections is reached
              further connections will be refused.

          --exit-idle-time=
              Sets the time before exiting when there are no connections,
              defaults to infinity. Takes a unit-less value in seconds, or
              a time span value such as "5min 20s".


---------------------------------------------------------------

::

          On success, 0 is returned, a non-zero failure code otherwise.


---------------------------------------------------------

::

      Simple Example
          Use two services with a dependency and no namespace isolation.

          Example 1. proxy-to-nginx.socket

              [Socket]
              ListenStream=80

              [Install]
              WantedBy=sockets.target

          Example 2. proxy-to-nginx.service

              [Unit]
              Requires=nginx.service
              After=nginx.service
              Requires=proxy-to-nginx.socket
              After=proxy-to-nginx.socket

              [Service]
              ExecStart=/usr/lib/systemd/systemd-socket-proxyd /run/nginx/socket
              PrivateTmp=yes
              PrivateNetwork=yes

          Example 3. nginx.conf

              [...]
              server {
                  listen       unix:/run/nginx/socket;
                  [...]

          Example 4. Enabling the proxy

              # systemctl enable --now proxy-to-nginx.socket
              $ curl http://localhost:80/

          If nginx.service has StopWhenUnneeded= set, then passing
          --exit-idle-time= to systemd-socket-proxyd allows both services
          to stop during idle periods.

      Namespace Example
          Similar as above, but runs the socket proxy and the main service
          in the same private namespace, assuming that nginx.service has
          PrivateTmp= and PrivateNetwork= set, too.

          Example 5. proxy-to-nginx.socket

              [Socket]
              ListenStream=80

              [Install]
              WantedBy=sockets.target

          Example 6. proxy-to-nginx.service

              [Unit]
              Requires=nginx.service
              After=nginx.service
              Requires=proxy-to-nginx.socket
              After=proxy-to-nginx.socket
              JoinsNamespaceOf=nginx.service

              [Service]
              ExecStart=/usr/lib/systemd/systemd-socket-proxyd 127.0.0.1:8080
              PrivateTmp=yes
              PrivateNetwork=yes

          Example 7. nginx.conf

              [...]
              server {
                  listen       8080;
                  [...]

          Example 8. Enabling the proxy

              # systemctl enable --now proxy-to-nginx.socket
              $ curl http://localhost:80/


---------------------------------------------------------

::

          systemd(1), systemd.socket(5), systemd.service(5), systemctl(1),
          socat(1), nginx(1), curl(1)

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

   systemd 249                                     SYSTEMD-SOCKET-PROXYD(8)

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
