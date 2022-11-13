.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sudo_sendlog(8) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SUPPORT <#SUPPORT>`__ \|         |                                   |
| `DISCLAIMER <#DISCLAIMER>`__ \|   |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SUDO_SENDLOG(8)        BSD System Manager's Manual       SUDO_SENDLOG(8)

NAME
-------------------------------------------------

::

        sudo_sendlog — send sudo I/O log to log server


---------------------------------------------------------

::

        sudo_sendlog [-AnV] [-b ca_bundle] [-c cert_file] [-h host]
                     [-i iolog-id] [-k key_file] [-p port]
                     [-r restart-point] [-R reject-reason] [-s stop-point]
                     [-t number] path


---------------------------------------------------------------

::

        sudo_sendlog can be used to send the existing sudoers I/O log path
        to a remote log server such as sudo_logsrvd(8) for central storage.

        The options are as follows:

        -A, --accept-only
                    Only send the accept event, not the I/O associated with
                    the log.  This can be used to test the logging of
                    accept events without any associated I/O.

        -b, --ca-bundle
                    The path to a certificate authority bundle file, in PEM
                    format, to use instead of the system's default
                    certificate authority database when authenticating the
                    log server.  The default is to use the system's default
                    certificate authority database.

        -c, --cert  The path to the client's certificate file in PEM
                    format.  This setting is required when the connection
                    to the remote log server is secured with TLS.

        --help      Display a short help message to the standard output and
                    exit.

        -h, --host  Connect to the specified host instead of localhost.

        -i, --iolog-id
                    Use the specified iolog-id when restarting a log
                    transfer.  The iolog-id is reported by the server when
                    it creates the remote I/O log.  This option may only be
                    used in conjunction with the -r option.

        -k, --key   The path to the client's private key file in PEM
                    format.  This setting is required when the connection
                    to the remote log server is secured with TLS.

        -n, --no-verify
                    If specified, the server's certificate will not be
                    verified during the TLS handshake.  By default,
                    sudo_sendlog verifies that the server's certificate is
                    valid and that it contains either the server's host
                    name or its IP address.  This setting is only supported
                    when the connection to the remote log server is secured
                    with TLS.

        -p, --port  Use the specified network port when connecting to the
                    log server instead of the default, port 30344.

        -r, --restart
                    Restart an interrupted connection to the log server.
                    The specified restart-point is used to tell the server
                    the point in time at which to continue the log.  The
                    restart-point is specified in the form
                    “seconds,nanoseconds” and is usually the last commit
                    point received from the server.  The -i option must
                    also be specified when restarting a transfer.

        -R, --reject
                    Send a reject event for the command using the specified
                    reject-reason, even though it was actually accepted
                    locally.  This can be used to test the logging of
                    reject events; no I/O will be sent.

        -s, --stop-after
                    Stop sending log records and close the connection when
                    stop-point is reached.  This can be used for testing
                    purposes to send a partial I/O log to the server.
                    Partial logs can be restarted using the -r option.  The
                    stop-point is an elapsed time specified in the form
                    “seconds,nanoseconds”.

        -t, --test  Open number simultaneous connections to the log server
                    and send the specified I/O log file on each one.  This
                    option is useful for performance testing.

        -V, --version
                    Print the sudo_sendlog version and exit.

      Debugging sendlog
        sudo_sendlog supports a flexible debugging framework that is
        configured via Debug lines in the sudo.conf(5) file.

        For more information on configuring sudo.conf(5), please refer to
        its manual.


---------------------------------------------------

::

        /etc/sudo.conf            Sudo front end configuration


---------------------------------------------------------

::

        sudo.conf(5), sudo(8), sudo_logsrvd(8)


-------------------------------------------------------

::

        Many people have worked on sudo over the years; this version
        consists of code written primarily by:

              Todd C. Miller

        See the CONTRIBUTORS file in the sudo distribution
        (https://www.sudo.ws/contributors.html) for an exhaustive list of
        people who have contributed to sudo.


-------------------------------------------------

::

        If you feel you have found a bug in sudo_sendlog, please submit a
        bug report at https://bugzilla.sudo.ws/


-------------------------------------------------------

::

        Limited free support is available via the sudo-users mailing list,
        see https://www.sudo.ws/mailman/listinfo/sudo-users to subscribe or
        search the archives.


-------------------------------------------------------------

::

        sudo_sendlog is provided “AS IS” and any express or implied
        warranties, including, but not limited to, the implied warranties
        of merchantability and fitness for a particular purpose are
        disclaimed.  See the LICENSE file distributed with sudo or
        https://www.sudo.ws/license.html for complete details.

COLOPHON
---------------------------------------------------------

::

        This page is part of the sudo (execute a command as another user)
        project.  Information about the project can be found at
        https://www.sudo.ws/.  If you have a bug report for this manual
        page, see ⟨https://bugzilla.sudo.ws/⟩.  This page was obtained from
        the project's upstream Git repository
        ⟨https://github.com/sudo-project/sudo⟩ on 2021-08-27.  (At that
        time, the date of the most recent commit that was found in the
        repository was 2021-08-26.)  If you discover any rendering problems
        in this HTML version of the page, or you believe there is a better
        or more up-to-date source for the page, or you have corrections or
        improvements to the information in this COLOPHON (which is not part
        of the original manual page), send a mail to man-pages@man7.org

   Sudo 1.9.8                     May 4, 2021                    Sudo 1.9.8

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
