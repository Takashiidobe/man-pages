.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

smtpctl(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SMTPCTL(8)             BSD System Manager's Manual            SMTPCTL(8)

NAME
-------------------------------------------------

::

        smtpctl, mailq — control the Simple Mail Transfer Protocol daemon


---------------------------------------------------------

::

        smtpctl command [argument ...]
        mailq


---------------------------------------------------------------

::

        The smtpctl program controls smtpd(8).  Commands may be abbreviated
        to the minimum unambiguous prefix; for example, sh ro for show
        routes.

        The mailq command is provided for compatibility with other MTAs and
        is simply a shortcut for show queue.

        The following commands are available:

        discover envelope-id | message-id
                Schedule a single envelope, or all envelopes with the same
                message ID that were manually moved to the queue.

        encrypt [string]
                Encrypt the password string to a representation suitable
                for user credentials and print it to the standard output.
                If string is not provided, cleartext passwords are read
                from standard input.

                It is advised to avoid providing the password as a
                parameter as it will be visible from top(1) and ps(1)
                output.

        log brief
                Disable verbose debug logging.

        log verbose
                Enable verbose debug logging.

        monitor
                Display updates of some smtpd(8) internal counters in one
                second intervals.  Each line reports the increment of all
                counters since the last update, except for some counters
                which are always absolute values.  The first line reports
                the current value of each counter.  The fields are:

                •   Current number of active SMTP clients (absolute value).
                •   New SMTP clients.
                •   Disconnected clients.
                •   Current number of envelopes in the queue (absolute
                    value).
                •   Newly enqueued envelopes.
                •   Dequeued envelopes.
                •   Successful deliveries.
                •   Temporary failures.
                •   Permanent failures.
                •   Message loops.
                •   Expired envelopes.
                •   Envelopes removed by the administrator.
                •   Generated bounces.

        pause envelope envelope-id | message-id | all
                Temporarily suspend scheduling for the envelope with the
                given ID, envelopes with the given message ID, or all
                envelopes.

        pause mda
                Temporarily stop deliveries to local users.

        pause mta
                Temporarily stop relaying and deliveries to remote users.

        pause smtp
                Temporarily stop accepting incoming sessions.

        profile subsystem
                Enables real-time profiling of subsystem.  Supported
                subsystems are:

                •   queue, to profile cost of queue IO
                •   imsg, to profile cost of event handlers

        remove envelope-id | message-id | all
                Remove a single envelope, envelopes with the given message
                ID, or all envelopes.

        resume envelope envelope-id | message-id | all
                Resume scheduling for the envelope with the given ID,
                envelopes with the given message ID, or all envelopes.

        resume mda
                Resume deliveries to local users.

        resume mta
                Resume relaying and deliveries to remote users.

        resume route route-id
                Resume routing on disabled route route-id.

        resume smtp
                Resume accepting incoming sessions.

        schedule envelope-id | message-id | all
                Mark as ready for immediate delivery a single envelope,
                envelopes with the given message ID, or all envelopes.

        show envelope envelope-id
                Display envelope content for the given ID.

        show hosts
                Display the list of known remote MX hosts.  For each of
                them, it shows the IP address, the canonical hostname, a
                reference count, the number of active connections to this
                host, and the elapsed time since the last connection.

        show hoststats
                Display status of last delivery for domains that have been
                active in the last 4 hours.  It consists of the following
                fields, separated by a "|":

                •   Domain.
                •   UNIX timestamp of last delivery.
                •   Status of last delivery.

        show message envelope-id
                Display message content for the given ID.

        show queue
                Display information concerning envelopes that are currently
                in the queue.  Each line of output describes a single
                envelope.  It consists of the following fields, separated
                by a "|":

                •   Envelope ID.
                •   Address family of the client which enqueued the mail.
                •   Type of delivery: one of "mta", "mda" or "bounce".
                •   Various flags on the envelope.
                •   Sender address (return path).
                •   The original recipient address.
                •   The destination address.
                •   Time of creation.
                •   Time of expiration.
                •   Time of last delivery or relaying attempt.
                •   Number of delivery or relaying attempts.
                •   Current runstate: either "pending" or "inflight" if
                    smtpd(8) is running, or "offline" otherwise.
                •   Delay in seconds before the next attempt if pending, or
                    time elapsed if currently running.  This field is blank
                    if smtpd(8) is not running.
                •   Error string for the last failed delivery or relay
                    attempt.

        show relays
                Display the list of currently active relays and associated
                connectors.  For each relay, it shows a number of counters
                and information on its internal state on a single line.
                Then comes the list of connectors (source addresses to
                connect from for this relay).

        show routes
                Display status of routes currently known by smtpd(8).  Each
                line consists of a route number, a source address, a
                destination address, a set of flags, the number of
                connections on this route, the current penalty level which
                determines the amount of time the route is disabled if an
                error occurs, and the delay before it gets reactivated.
                The following flags are defined:

                D   The route is currently disabled.
                N   The route is new.  No SMTP session has been established
                    yet.
                Q   The route has a timeout registered to lower its penalty
                    level and possibly reactivate or discard it.

        show stats
                Displays runtime statistics concerning smtpd(8).

        show status
                Shows if MTA, MDA and SMTP systems are currently running or
                paused.

        spf walk
                Recursively look up SPF records for the domains read from
                stdin.  For example:

                      $ smtpctl spf walk < domains.txt

                SPF records may contain macros which cannot be included in
                a static list and must be resolved dynamically at
                connection time.  spf walk cannot provide full results in
                these cases.

        trace subsystem
                Enables real-time tracing of subsystem.  Supported
                subsystems are:

                •   imsg
                •   io
                •   smtp (incoming sessions)
                •   filters
                •   mta (outgoing sessions)
                •   bounce
                •   scheduler
                •   expand (aliases/virtual/forward expansion)
                •   lookup (user/credentials lookups)
                •   stat
                •   rules (matched by incoming sessions)
                •   mproc
                •   all

        unprofile subsystem
                Disables real-time profiling of subsystem.

        untrace subsystem
                Disables real-time tracing of subsystem.

        update table name
                Updates the contents of table name, for tables using the
                “file” backend.

        When smtpd receives a message, it generates a message-id for the
        message, and one envelope-id per recipient.  The message-id is a
        32-bit random identifier that is guaranteed to be unique on the
        host system.  The envelope-id is a 64-bit unique identifier that
        encodes the message-id in the 32 upper bits and a random envelope
        identifier in the 32 lower bits.

        A command which specifies a message-id applies to all recipients of
        a message; a command which specifies an envelope-id applies to a
        specific recipient of a message.


---------------------------------------------------

::

        /var/run/smtpd.sock     UNIX-domain socket used for communication
                                with smtpd(8).


---------------------------------------------------------

::

        smtpd(8)


-------------------------------------------------------

::

        The smtpctl program first appeared in OpenBSD 4.6.

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

   BSD                        September 14, 2020                        BSD

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
