.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

smtpd(8) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `STANDARDS <#STANDARDS>`__ \|     |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SMTPD(8)               BSD System Manager's Manual              SMTPD(8)

NAME
-------------------------------------------------

::

        smtpd — Simple Mail Transfer Protocol daemon


---------------------------------------------------------

::

        smtpd [-dFhnv] [-D macro=value] [-f file] [-P system] [-T trace]


---------------------------------------------------------------

::

        smtpd is a Simple Mail Transfer Protocol (SMTP) daemon which can be
        used as a machine's primary mail system.  smtpd can listen on a
        network interface and handle SMTP transactions; it can also be fed
        messages through the standard sendmail(8) interface.  It can relay
        messages through remote mail transfer agents or store them locally
        using either the mbox or maildir format.  This implementation
        supports SMTP as defined by RFC 5321 as well as several extensions.
        A running smtpd can be controlled through smtpctl(8).

        The options are as follows:

        -D macro=value
                Define macro to be set to value on the command line.
                Overrides the definition of macro in the configuration
                file.

        -d      Do not daemonize.  If this option is specified, smtpd will
                run in the foreground and log to stderr.

        -F      Do not daemonize.  If this option is specified, smtpd will
                run in the foreground and log to syslogd(8).

        -f file
                Specify an alternative configuration file.

        -h      Display version and usage.

        -n      Configtest mode.  Only check the configuration file for
                validity.

        -P system
                Pause a specific subsystem at startup.  Normal operation
                can be resumed using smtpctl(8).  This option can be used
                multiple times.  The accepted values are:

                mda      Do not schedule local deliveries.
                mta      Do not schedule remote transfers.
                smtp     Do not listen on SMTP sockets.

        -T trace
                Enables real-time tracing at startup.  Normal operation can
                be resumed using smtpctl(8).  This option can be used
                multiple times.  The accepted values are:

                •   imsg
                •   io
                •   smtp (incoming sessions)
                •   filters
                •   transfer (outgoing sessions)
                •   bounce
                •   scheduler
                •   expand (aliases/virtual/forward expansion)
                •   lookup (user/credentials lookups)
                •   stat
                •   rules (matched by incoming sessions)
                •   mproc
                •   all

        -v      Produce more verbose output.


---------------------------------------------------

::

        /etc/mail/mailname       Alternate server name to use.
        /etc/mail/smtpd.conf     Default smtpd configuration file.
        /var/run/smtpd.sock      UNIX-domain socket used for communication
                                 with smtpctl(8).
        /var/spool/smtpd/        Spool directories for mail during
                                 processing.
        ~/.forward               User email forwarding information.


---------------------------------------------------------

::

        forward(5), smtpd.conf(5), mailwrapper(8), smtpctl(8)


-----------------------------------------------------------

::

        J. Klensin, Simple Mail Transfer Protocol, RFC 5321, October 2008.


-------------------------------------------------------

::

        The smtpd program first appeared in OpenBSD 4.6.

COLOPHON
---------------------------------------------------------

::

        This page is part of the OpenSMTPD (a FREE implementation of the
        server-side SMTP protocol) project.  Information about the project
        can be found at https://www.opensmtpd.org/.  If you have a bug
        report for this manual page, see
        ⟨https://github.com/OpenSMTPD/OpenSMTPD/issues⟩.  This page was
        obtained from the project's upstream Git repository
        ⟨https://github.com/OpenSMTPD/OpenSMTPD.git⟩ on 2021-08-27.  (At
        that time, the date of the most recent commit that was found in the
        repository was 2021-04-28.)  If you discover any rendering problems
        in this HTML version of the page, or you believe there is a better
        or more up-to-date source for the page, or you have corrections or
        improvements to the information in this COLOPHON (which is not part
        of the original manual page), send a mail to man-pages@man7.org

   BSD                          January 3, 2017                         BSD

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
