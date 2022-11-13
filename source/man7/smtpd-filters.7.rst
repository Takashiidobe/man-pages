.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

smtpd-filters(7) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DESIGN <#DESIGN>`__ \|           |                                   |
| `REPORT A                         |                                   |
| ND FILTER <#REPORT_AND_FILTER>`__ |                                   |
| \| `PROTOCOL <#PROTOCOL>`__ \|    |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| REPORT EVENTS <#REPORT_EVENTS>`__ |                                   |
| \|                                |                                   |
| `FILT                             |                                   |
| ER REQUESTS <#FILTER_REQUESTS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FILTERS(7)        BSD Miscellaneous Information Manual        FILTERS(7)

NAME
-------------------------------------------------

::

        filters — filtering API for the smtpd(8) daemon


---------------------------------------------------------------

::

        The smtpd(8) daemon provides a Simple Mail Transfer Protocol (SMTP)
        implementation that allows an ordinary machine to become Mail
        eXchangers (MX).  Many features that are commonly used by MX, such
        as delivery reporting or Spam filtering, are outside the scope of
        SMTP and too complex to fit in smtpd(8).

        Because an MX needs to provide these features, smtpd(8) provides an
        API to extend its behavior through pluggable filters.

        At runtime, smtpd(8) can report events to filters and query what it
        should answer to these events.  This allows the decision logic to
        rely on third-party programs.


-----------------------------------------------------

::

        The filters are programs that run as unique standalone processes,
        they do not share smtpd(8) memory space.  They are executed by
        smtpd(8) at startup and expected to run in an infinite loop,
        reading events and filtering requests from stdin(4), writing
        responses to stdout(4) and logging to stderr(4).  They are not
        allowed to terminate.

        Because filters are standalone programs that communicate with
        smtpd(8) through fd(4), they may run as different users than
        smtpd(8) and may be written in any language.  The filters must not
        use blocking I/O, they must support answering asynchronously to
        smtpd(8).


---------------------------------------------------------------------------

::

        The API relies on two streams, report and filter.

        The report stream is a one-way stream which allows smtpd(8) to
        inform filters in real-time about events that are occurring in the
        daemon.  The report events do not expect an answer from filters, it
        is just meant to provide them with informations.  A filter should
        be able to replicate the smtpd(8) state for a session by gathering
        informations coming from report events.  No decision is ever taken
        by the report stream.

        The filter stream is a two-way stream which allows smtpd(8) to
        query filters about what it should do with a session at a given
        phase.  The filter requests expects an answer from filters,
        smtpd(8) will not let the session move forward until then.  A
        decision must always be taken by the filter stream.

        It is sometimes possible to rely on filter requests to gather
        information, but because a reponse is expected by smtpd(8), this is
        more costly than using report events.  The correct pattern for
        writing filters is to use the report events to create a local state
        for a session, then use filter requests to take decisions based on
        this state.  The only case when using filter request instead of
        report events is correct, is when a decision is required for the
        filter request and there is no need for more information than that
        of the event.


---------------------------------------------------------

::

        The protocol is straightforward, it consists of a human-readable
        line exchanges between filters and smtpd(8) through fd(4).

        The protocol begins with a handshake.  First, smtpd(8) provides
        filters with general configuration information in the form of key-
        value lines:

              config|smtpd-version|6.6.1
              config|smtp-session-timeout|300
              config|subsystem|smtp-in
              config|ready

        Then, filters register the stream, subsystem and event they want to
        handle:

              register|report|smtp-in|link-connect
              register|ready

        Finally, smtpd(8) will emit report events and filter requests,
        expecting filters to react accordingly either by responding or not
        depending on the stream:

              report|0.5|1576146008.006099|smtp-in|link-connect|7641df9771b4ed00|mail.openbsd.org|pass|199.185.178.25:33174|45.77.67.80:25
              report|0.5|1576147242.200225|smtp-in|link-connect|7641dfb3798eb5bf|mail.openbsd.org|pass|199.185.178.25:31205|45.77.67.80:25
              report|0.5|1576148447.982572|smtp-in|link-connect|7641dfc063102cbd|mail.openbsd.org|pass|199.185.178.25:24786|45.77.67.80:25

        The char “|” may only appear in the last field of a payload, in
        which case it should be considered a regular char and not a
        separator.  Other fields have strict formatting excluding the
        possibility of having a “|”.

        The list of subsystems and events, as well as the format of
        requests and reponses, will be documented in the sections below.


-------------------------------------------------------------------

::

        During the initial handshake, smtpd(8) will emit a serie of
        configuration keys and values.  The list is meant to be ignored by
        filters that do not require it and consumed gracefully by filters
        that do.

        There are currently three keys:

              config|smtpd-version|6.6.1
              config|smtp-session-timeout|300
              config|subsystem|smtp-in

        When smtpd(8) has sent all configuration keys it emits the
        following line:

              config|ready


-------------------------------------------------------------------

::

        There is currently only one subsystem supported in the API: smtp-
        in.

        Each report event is generated by smtpd(8) as a single line similar
        to the one below:

              report|0.5|1576146008.006099|smtp-in|link-connect|7641df9771b4ed00|mail.openbsd.org|pass|199.185.178.25:33174|45.77.67.80:25

        The format consists of a protocol prefix containing the stream, the
        protocol version, the timestamp, the subsystem, the event and the
        unique session identifier separated by “|”:

              report|0.5|1576146008.006099|smtp-in|link-connect|7641df9771b4ed00

        It is followed by a suffix containing the event-specific
        parameters, also separated by “|”:

              mail.openbsd.org|pass|199.185.178.25:33174|45.77.67.80:25

        The list of events and event-specific parameters are provided here
        for smtp-in:

        link-connect: rdns fcrdns src dest
                This event is generated upon connection.

                rdns contains the reverse DNS hostname for the remote end
                or an empty string if none.

                fcrdns contains the string “pass” or “fail” depending on if
                the remote end validates FCrDNS.

                src holds either the IP address and port from source
                address, in the format “address:port” or the path to a UNIX
                socket in the format “unix:/path”.

                dest holds either the IP address and port from destination
                address, in the format “address:port” or the path to a UNIX
                socket in the format “unix:/path”.

        link-greeting: hostname
                This event is generated upon display of the server banner.

                hostname contains the hostname displayed in the banner.

        link-identify: method identity
                This event is generated upon “HELO” or “EHLO” command from
                the client.

                method contains the string “HELO” or “EHLO” indicating the
                method used by the client.

                identity contains the identity provided by the client.

        link-tls: tls-string
                This event is generated upon successful negotiation of TLS.

                tls-string contains a colon-separated list of TLS
                properties including the TLS version, the cipher suite used
                by the session and the cipher strenght in bits.

        link-disconnect
                This event is generated upon disconnection of the client.

        link-auth: username result
                This event is generated upon authentication attempt of the
                client.

                username contains the username used for the authentication
                attempt.

                result contains the string “pass”, “fail” or “error”
                depending on the result of the authentication attempt.

        tx-reset: [message-id]
                This event is generated when a transaction is reset.

                If reset happend while in a transaction, message-id
                contains the identifier of the transaction being reset.

        tx-begin: message-id
                This event is generated when a transaction is initiated.

                message-id contains the identifier for the transaction.

        tx-mail: message-id result address
                This event is generated when client emits “MAIL FROM”.

                message-id contains the identifier for the transaction.

                result contains “ok” if the sender was accepted, “permfail”
                if it was rejected or “tempfail” if it was rejected for a
                transient error.

                address contains the e-mail address of the sender.  The
                address is normalized and sanitized, the protocol “<” and
                “>” are removed and so are parameters to “MAIL FROM”.

        tx-rcpt: message-id result address
                This event is generated when client emits “RCPT TO”.

                message-id contains the identifier for the transaction.

                result contains “ok” if the recipient was accepted,
                “permfail” if it was rejected or “tempfail” if it was
                rejected for a transient error.

                address contains the e-mail address of the recipient.  The
                address is normalized and sanitized, the protocol “<” and
                “>” are removed and so are parameters to “RCPT TO”.

        tx-envelope: message-id envelope-id
                This event is generated when an envelope is accepted.

                envelope-id contains the unique identifier for the
                envelope.

        tx-data: message-id result
                This event is generated when client has emitted “DATA”.

                message-id contains the unique identifier for the
                transaction.

                result contains “ok” if server accepted to process the
                message, “permfail” if it has not accepted and “tempfail”
                if a transient error is preventing the processing of
                message.

        tx-commit: message-id message-size
                This event is generated when a transaction has been
                accepted by the server.

                message-id contains the unique identifier for the SMTP
                transaction.

                message-size contains the size of the message submitted in
                the “DATA” phase of the SMTP transaction.

        tx-rollback: message-id
                This event is generated when a transaction has been
                rejected by the server.

                message-id contains the unique identifier for the SMTP
                transaction.

        protocol-client: command
                This event is generated for every command submitted by the
                client.  It contains the raw command as received by the
                server.

                command contains the command emitted by the client to the
                server.

        protocol-server: response
                This event is generated for every response emitted by the
                server.  It contains the raw response as emitted by the
                server.

                response contains the response emitted by the server to the
                client.

        filter-report: filter-kind name message
                This event is generated when a filter emits a report.

                filter-kind may be either “builtin” or “proc” depending on
                if the filter is an smtpd(8) builtin filter or a proc
                filter implementing the API.

                name is the name of the filter that generated the report.

                message is a filter-specific message.

        filter-response: phase response [param]
                This event is generated when a filter responds to a
                filtering request.

                phase contains the phase name for the request.  The phases
                are documented in the next section.

                response contains the response of the filter to the
                request, it is either one of “proceed”, “report”, “reject”,
                “disconnect”, “junk or” “rewrite”.

                If specified, param is the parameter to the response.

        timeout
                This event is generated when a timeout happens for a
                session.


-----------------------------------------------------------------------

::

        There is currently only one subsystem supported in the API: smtp-
        in.

        The filter requests allow smtpd(8) to query filters about what to
        do with a session at a particular phase.  In addition, they allow
        filters to alter the content of a message by adding, modifying, or
        suppressing lines of input in a way that is similar to what program
        like sed(1) or grep(1) would do.

        Each filter request is generated by smtpd(8) as a single line
        similar to the one below:

              filter|0.5|1576146008.006099|smtp-in|connect|7641df9771b4ed00|1ef1c203cc576e5d|mail.openbsd.org|pass|199.185.178.25:33174|45.77.67.80:25

        The format consists of a protocol prefix containing the stream, the
        protocol version, the timestamp, the subsystem, the filtering
        phase, the unique session identifier and an opaque token separated
        by “|” that the filter should provide in its response:

              filter|0.5|1576146008.006099|smtp-in|connect|7641df9771b4ed00|1ef1c203cc576e5d

        It is followed by a suffix containing the phase-specific parameters
        to the filter request, also separated by “|”:

              mail.openbsd.org|pass|199.185.178.25:33174|45.77.67.80:25

        Unlike with report events, smtpd(8) expects answers from filter
        requests and will not allow a session to move forward before the
        filter has instructed smtpd(8) what to do with it.

        For all phases, excepted “data-line”, the responses must follow the
        same construct, a message type “filter-result”, followed by the
        unique session id, the opaque token, a decision and optional
        decision-specific parameters:

              filter-result|7641df9771b4ed00|1ef1c203cc576e5d|proceed
              filter-result|7641df9771b4ed00|1ef1c203cc576e5d|reject|550 nope

        The possible decisions to a “filter-result” message will be
        described below.

        For the “data-line” phase, filters are fed with a stream of lines
        corresponding to the message to filter, and terminated by a single
        dot:

              filter|0.5|1576146008.006099|smtp-in|data-line|7641df9771b4ed00|1ef1c203cc576e5d|line 1
              filter|0.5|1576146008.006103|smtp-in|data-line|7641df9771b4ed00|1ef1c203cc576e5d|line 2
              filter|0.5|1576146008.006105|smtp-in|data-line|7641df9771b4ed00|1ef1c203cc576e5d|.

        They are expected to produce an output stream similarly terminate
        by a single dot.  A filter may inject, suppress, modify or echo
        back the lines it receives.  Ultimately, smtpd(8) will assume that
        the message consists of the output from filters.

        Note that filters may be chained and the lines that are input into
        a filter are the lines that are output from previous filter.

        The response to “data-line” requests use their own construct.  A
        “filter-dataline” prefix, followed by the unique session
        identifier, the opaque token and the output line as follows:

              filter-dataline|7641df9771b4ed00|1ef1c203cc576e5d|line 1
              filter-dataline|7641df9771b4ed00|1ef1c203cc576e5d|line 2
              filter-dataline|7641df9771b4ed00|1ef1c203cc576e5d|.

        The list of events and event-specific parameters are provided here
        for smtp-in:

        connect: rdns fcrdns src dest
                This request is emitted after connection, before the banner
                is displayed.

        helo: identity
                This request is emitted after the client has emitted
                “HELO”.

        ehlo: identity
                This request is emitted after the client has emitted
                “EHLO”.

        starttls: tls-string
                This request is emitted after the client has requested
                “STARTTLS”.

        auth: auth
                This request is emitted after the client has requested
                “AUTH”.

        mail-from: address
                This request is emitted after the client has requested
                “MAIL FROM”.

        rcpt-to: address
                This request is emitted after the client has requested
                “RCPT TO”.

        data    This request is emitted after the client has requested
                “DATA”.

        data-line: line
                This request is emitted for each line of input in the
                “DATA” phase.  The lines are raw dot-escaped SMTP DATA
                input, terminated with a single dot.

        commit  This request is emitted after the final single dot is
                received.

        For every filtering phase, excepted “data-line”, the following
        decisions may be taken by a filter:

        proceed
                No action is taken, session or transaction may be passed to
                the next filter.

        junk    The session or transaction is marked as Spam.  smtpd(8)
                will prepend a “X-Spam” header to the message.

        reject error
                The command is rejected with the message error.  The
                message must be a valid SMTP message including status code,
                5xx or 4xx.

                Messages starting with a 5xx status result in a permanent
                failure, those starting with a 4xx status result in a
                temporary failure.

                Messages starting with a 421 status will result in a client
                disconnect.

        disconnect error
                The client is disconnected with the message error.  The
                message must be a valid SMTP message including status code,
                5xx or 4xx.

                Messages starting with a 5xx status result in a permanent
                failure, those starting with a 4xx status result in a
                temporary failure.

        rewrite parameter
                The command parameter is rewritten.

                This decision allows a filter to perform a rewrite of
                client-submitted commands before they are processed by the
                SMTP engine.  parameter is expected to be a valid SMTP
                parameter for the command.

        report parameter
                Generates a report with parameter for this filter.


---------------------------------------------------------

::

        smtpd(8)


-------------------------------------------------------

::

        filters first appeared in OpenBSD 6.6.

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

   BSD                          April 25, 2020                          BSD

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
