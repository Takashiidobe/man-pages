.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sftp-server(8) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SFTP-SERVER(8)         BSD System Manager's Manual        SFTP-SERVER(8)

NAME
-------------------------------------------------

::

        sftp-server — OpenSSH SFTP server subsystem


---------------------------------------------------------

::

        sftp-server [-ehR] [-d start_directory] [-f log_facility]
                    [-l log_level] [-P denied_requests]
                    [-p allowed_requests] [-u umask]
        sftp-server -Q protocol_feature


---------------------------------------------------------------

::

        sftp-server is a program that speaks the server side of SFTP
        protocol to stdout and expects client requests from stdin.
        sftp-server is not intended to be called directly, but from sshd(8)
        using the Subsystem option.

        Command-line flags to sftp-server should be specified in the
        Subsystem declaration.  See sshd_config(5) for more information.

        Valid options are:

        -d start_directory
                Specifies an alternate starting directory for users.  The
                pathname may contain the following tokens that are expanded
                at runtime: %% is replaced by a literal '%', %d is replaced
                by the home directory of the user being authenticated, and
                %u is replaced by the username of that user.  The default
                is to use the user's home directory.  This option is useful
                in conjunction with the sshd_config(5) ChrootDirectory
                option.

        -e      Causes sftp-server to print logging information to stderr
                instead of syslog for debugging.

        -f log_facility
                Specifies the facility code that is used when logging
                messages from sftp-server.  The possible values are:
                DAEMON, USER, AUTH, LOCAL0, LOCAL1, LOCAL2, LOCAL3, LOCAL4,
                LOCAL5, LOCAL6, LOCAL7.  The default is AUTH.

        -h      Displays sftp-server usage information.

        -l log_level
                Specifies which messages will be logged by sftp-server.
                The possible values are: QUIET, FATAL, ERROR, INFO,
                VERBOSE, DEBUG, DEBUG1, DEBUG2, and DEBUG3.  INFO and
                VERBOSE log transactions that sftp-server performs on
                behalf of the client.  DEBUG and DEBUG1 are equivalent.
                DEBUG2 and DEBUG3 each specify higher levels of debugging
                output.  The default is ERROR.

        -P denied_requests
                Specifies a comma-separated list of SFTP protocol requests
                that are banned by the server.  sftp-server will reply to
                any denied request with a failure.  The -Q flag can be used
                to determine the supported request types.  If both denied
                and allowed lists are specified, then the denied list is
                applied before the allowed list.

        -p allowed_requests
                Specifies a comma-separated list of SFTP protocol requests
                that are permitted by the server.  All request types that
                are not on the allowed list will be logged and replied to
                with a failure message.

                Care must be taken when using this feature to ensure that
                requests made implicitly by SFTP clients are permitted.

        -Q protocol_feature
                Queries protocol features supported by sftp-server.  At
                present the only feature that may be queried is “requests”,
                which may be used to deny or allow specific requests (flags
                -P and -p respectively).

        -R      Places this instance of sftp-server into a read-only mode.
                Attempts to open files for writing, as well as other
                operations that change the state of the filesystem, will be
                denied.

        -u umask
                Sets an explicit umask(2) to be applied to newly-created
                files and directories, instead of the user's default mask.

        On some systems, sftp-server must be able to access /dev/log for
        logging to work, and use of sftp-server in a chroot configuration
        therefore requires that syslogd(8) establish a logging socket
        inside the chroot directory.


---------------------------------------------------------

::

        sftp(1), ssh(1), sshd_config(5), sshd(8)

        T. Ylonen and S. Lehtinen, SSH File Transfer Protocol, draft-ietf-
        secsh-filexfer-02.txt, October 2001, work in progress material.


-------------------------------------------------------

::

        sftp-server first appeared in OpenBSD 2.8.


-------------------------------------------------------

::

        Markus Friedl <markus@openbsd.org>

COLOPHON
---------------------------------------------------------

::

        This page is part of the openssh (Portable OpenSSH) project.
        Information about the project can be found at
        http://www.openssh.com/portable.html.  If you have a bug report for
        this manual page, see ⟨http://www.openssh.com/report.html⟩.  This
        page was obtained from the tarball openssh-8.7p1.tar.gz fetched
        from ⟨http://ftp.eu.openbsd.org/pub/OpenBSD/OpenSSH/portable/⟩ on
        2021-08-27.  If you discover any rendering problems in this HTML
        version of the page, or you believe there is a better or more up-
        to-date source for the page, or you have corrections or
        improvements to the information in this COLOPHON (which is not part
        of the original manual page), send a mail to man-pages@man7.org

   BSD                           July 27, 2021                          BSD

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
