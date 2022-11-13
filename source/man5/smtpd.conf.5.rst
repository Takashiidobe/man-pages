.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

smtpd.conf(5) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SMTPD.CONF(5)            BSD File Formats Manual           SMTPD.CONF(5)

NAME
-------------------------------------------------

::

        smtpd.conf — Simple Mail Transfer Protocol daemon configuration
        file


---------------------------------------------------------------

::

        smtpd.conf is the configuration file for the mail daemon smtpd(8).

        When mail arrives, each “RCPT TO:” command generates a mail
        envelope.  If an envelope matches any of a pre-designated set of
        criteria (using the match directive), the message is accepted for
        delivery.  A copy of the message, as well as its associated
        envelopes, is saved in the mail queue and later dispatched
        according to an associated set of actions (using the action
        directive).  If an envelope does not match any options, it is
        rejected.  The match rules are evaluated sequentially, with the
        first match winning.

        The format of the configuration file is fairly flexible.  The
        current line can be extended over multiple lines using a backslash
        (‘\’).  Comments can be put anywhere in the file using a hash mark
        (‘#’), and extend to the end of the current line.  Care should be
        taken when commenting out multi-line text: the comment is effective
        until the end of the entire block.  Argument names not beginning
        with a letter, digit, or underscore, as well as reserved words
        (such as listen, match, and port), must be quoted.  Arguments
        containing whitespace should be surrounded by double quotes (").

        Macros can be defined that are later expanded in context.  Macro
        names must start with a letter, digit, or underscore, and may
        contain any of those characters, but may not be reserved words.
        Macros are not expanded inside quotes.  For example:

              lan_addr = "192.168.0.1"
              listen on $lan_addr
              listen on $lan_addr tls auth

        The syntax of smtpd.conf is described below.

        action name method [options]
                When the queue runner processes an envelope from the mail
                queue, it carries out the action name, selected by the
                match ... action directive when the message was received.
                The action directive provides configuration data for
                delivery attempts.  Required lookups are performed at the
                time of each delivery attempt.  Consequently, changing an
                action directive or the files it references and restarting
                the smtpd(8) daemon causes the changes to take effect for
                subsequent delivery attempts for the respective dispatcher
                name, even for messages that were already stuck in the
                queue prior to the configuration changes.

                The delivery method parameter may be one of the following:

                expand-only
                        Only accept the message if a delivery method was
                        specified in an aliases or .forward file.

                forward-only
                        Only accept the message if the recipient results in
                        a remote address after the processing of aliases or
                        forward file.

                lmtp destination [rcpt-to]
                        Deliver the message to an LMTP server at
                        destination.  The location may be expressed as
                        host:port or as a UNIX socket.

                        Optionally, rcpt-to might be specified to use the
                        recipient email address (after expansion) instead
                        of the local user in the LMTP session as RCPT TO.

                maildir [pathname [junk]]
                        Deliver the message to the maildir in pathname if
                        specified, or by default to ~/Maildir.

                        The pathname may contain format specifiers that are
                        expanded before use (see FORMAT SPECIFIERS).

                        If the junk argument is provided, the message will
                        be moved to the ‘Junk’ folder if it contains a
                        positive ‘X-Spam’ header.  This folder will be
                        created under pathname if it does not yet exist.

                mbox    Deliver the message to the user's mbox with
                        mail.local(8).

                mda command
                        Delegate the delivery to a command that receives
                        the message on its standard input.

                        The command may contain format specifiers that are
                        expanded before use (see FORMAT SPECIFIERS).

                relay   Relay the message to another SMTP server.

                The local delivery methods support additional options:

                alias <table>
                        Use the mapping table for aliases(5) expansion.

                ttl n{s|m|h|d}
                        Specify how long a message may remain in the queue.

                user username
                        Specify the username for performing the delivery,
                        to be looked up with getpwnam(3).

                        This is used for virtual hosting where a single
                        username is in charge of handling delivery for all
                        virtual users.

                        This option is not usable with the mbox delivery
                        method.

                userbase <table>
                        Use the mapping table for user lookups instead of
                        the getpwnam(3) function.

                        The userbase does not apply to the user option.

                virtual <table>
                        Use the mapping table for virtual expansion.  The
                        aliasing table format is described in table(5).

                wrapper name
                        Use the wrapper specified in mda wrapper.

                The relay delivery methods also support additional options:

                backup  Operate as a backup mail exchanger delivering
                        messages to any mail exchanger with higher
                        priority.

                backup mx name
                        Operate as a backup mail exchanger delivering
                        messages to any mail exchanger with higher priority
                        than mail exchanger identified as name.

                helo heloname
                        Advertise heloname as the hostname to other mail
                        exchangers during the HELO phase.

                helo-src <table>
                        Use the mapping table to look up a hostname
                        matching the source address, to advertise during
                        the HELO phase.

                domain <domains>
                        Do not perform MX lookups but look up destination
                        domain in domains and use matching relay url as
                        relay host.

                host relay-url
                        Do not perform MX lookups but relay messages to the
                        relay host described by relay-url.  The format for
                        relay-url is [proto://[label@]]host[:port].  The
                        following protocols are available:

                        smtp        Normal SMTP session with opportunistic
                                    STARTTLS (the default).
                        smtp+tls    Normal SMTP session with mandatory
                                    STARTTLS.
                        smtp+notls  Plain text SMTP session without TLS.
                        lmtp        LMTP session.  port is required.
                        smtps       SMTP session with forced TLS on
                                    connection, default port is 465.
                        Unless noted, port defaults to 25.

                        The label corresponds to an entry in a credentials
                        table, as documented in table(5).  It is used with
                        the “smtp+tls” and “smtps” protocols for
                        authentication.  Server certificates for those
                        protocols are verified by default.

                pki pkiname
                        For secure connections, use the certificate
                        associated with pkiname (declared in a pki
                        directive) to prove the client's identity to the
                        remote mail server.

                srs     When relaying a mail resulting from a forward, use
                        the Sender Rewriting Scheme to rewrite sender
                        address.

                tls [no-verify]
                        Require TLS to be used when relaying, using
                        mandatory STARTTLS by default.  When used with a
                        smarthost, the protocol must not be
                        “smtp+notls://”.  If no-verify is specified, do not
                        require a valid certificate.

                protocols protostr
                        Define the protocol versions to be used for TLS
                        sessions.  Refer to the
                        tls_config_parse_protocols(3) manpage for the
                        format of protostr.

                ciphers cipherstr
                        Define the list of ciphers that may be used for TLS
                        sessions.  Refer to the tls_config_set_ciphers(3)
                        manpage for the format of cipherstr.

                auth <table>
                        Use the mapping table for connecting to relay-url
                        using credentials.  This option is usable only with
                        host option.  The credential table format is
                        described in table(5).

                mail-from mailaddr
                        Use mailaddr as the MAIL FROM address within the
                        SMTP transaction.

                src sourceaddr | <sourceaddr>
                        Use the string or list table sourceaddr for the
                        source IP address, which is useful on machines with
                        multiple interfaces.  If the list contains more
                        than one address, all of them are used in such a
                        way that traffic is routed as efficiently as
                        possible.

        admd authservid
                The Administrative Management Domain this mail server
                belongs to.  The authservid will be forwarded to filters
                using it to identify or mark authentication-results
                headers.  If omitted it defaults to the server name.

        bounce warn-interval delay [, delay ...]
                Send warning messages to the envelope sender when temporary
                delivery failures cause a message to remain in the queue
                for longer than delay.  Each delay parameter consists of a
                positive decimal integer and a unit s, m, h, or d.  At most
                four delay parameters can be specified.  The default is
                "bounce warn-interval 4h", sending a single warning after
                four hours.

        ca caname cert cafile
                Associate the Certificate Authority (CA) certificate file
                cafile with ca entry caname.  The ca entry can be
                referenced in listener rules and relay actions.

        filter chain-name chain {filter-name [, ...]}
                Register a chain of filters chain-name, consisting of the
                filters listed in filter-name.  Filters in a filter chain
                are executed in order of declaration for each phase that
                they are registered for.  A filter chain may be used in
                place of a filter for any directive except filter chains
                themselves.

        filter filter-name phase phase-name match conditions decision
                Register a filter filter-name.  A decision about what to do
                with the mail is taken at phase phase-name when matching
                conditions.  Phases, matching conditions, and decisions are
                described in MAIL FILTERING, below.

        filter filter-name proc proc-name
                Register "proc" filter filter-name backed by the proc-name
                process.

        filter filter-name proc-exec command
                Register and execute "proc" filter filter-name from
                command.  If command starts with a slash it is executed
                with an absolute path, otherwise it will be run from
                “/usr/local/libexec/smtpd/”.

        include "pathname"
                Replace this directive with the content of the additional
                configuration file at the absolute pathname.

        listen on interface [family] [options]
                Listen on the interface for incoming connections, using the
                same syntax as ifconfig(8).  The interface parameter may
                also be an interface group, an IP address, or a domain
                name.  Listening can optionally be restricted to a specific
                address family, which can be either inet4 or inet6.

                The options are as follows:

                auth [<authtable>]
                        Support SMTPAUTH: clients may only start SMTP
                        transactions after successful authentication.
                        Users are authenticated against either their own
                        normal login credentials or a credentials table
                        authtable, the format of which is described in
                        table(5).

                auth-optional [<authtable>]
                        Support SMTPAUTH optionally: clients need not
                        authenticate, but may do so.  This allows a listen
                        on directive to both accept incoming mail from
                        untrusted senders and permit outgoing mail from
                        authenticated users (using match auth).  It can be
                        used in situations where it is not possible to
                        listen on a separate port (usually the submission
                        port, 587) for users to authenticate.

                ca caname
                        For secure connections, use the CA certificate
                        associated with caname (declared in a ca directive)
                        as the CA certificate when verifying client
                        certificates.

                filter name
                        Apply filter name on connections handled by this
                        listener.

                hostname hostname
                        Use hostname in the greeting banner instead of the
                        default server name.

                hostnames <names>
                        Override the server name for specific addresses.
                        The names table contains a mapping of IP addresses
                        to hostnames.  If the address on which the
                        connection arrives appears in the mapping, the
                        associated hostname is used.

                mask-src
                        Omit the from part when prepending “Received”
                        headers.

                no-dsn  Disable the DSN (Delivery Status Notification)
                        extension.

                pki pkiname
                        For secure connections, use the certificate
                        associated with pkiname (declared in a pki
                        directive) to prove a mail server's identity.  This
                        option can be used multiple times to provide
                        alternate certificates for SNI.

                port [port]
                        Listen on the given port instead of the default
                        port 25.

                proxy-v2
                        Support the PROXYv2 protocol, appropriately
                        rewriting the source address received from proxy.

                received-auth
                        In “Received” headers, report whether the session
                        was authenticated and by which local user.

                senders <users> [masquerade]
                        Look up the authenticated user in the users mapping
                        table to find the email addresses that user is
                        allowed to submit mail as.  In addition, if the
                        masquerade option is provided, the From header is
                        rewritten to match the sender provided in the SMTP
                        session.

                smtps   Support SMTPS, by default on port 465.  Mutually
                        exclusive with tls.

                tag tag
                        Clients connecting to the listener are tagged with
                        the given tag.

                tls     Support STARTTLS, by default on port 25.  Mutually
                        exclusive with smtps.

                tls-require [verify]
                        Like tls, but force clients to establish a secure
                        connection before being allowed to start an SMTP
                        transaction.  With the verify option, clients must
                        also provide a valid certificate to establish an
                        SMTP session.

                protocols protostr
                        Define the protocol versions to be used for TLS
                        sessions.  Refer to the
                        tls_config_parse_protocols(3) manpage for the
                        format of protostr.

                ciphers cipherstr
                        Define the list of ciphers that may be used for TLS
                        sessions.  Refer to the tls_config_set_ciphers(3)
                        manpage for the format of cipherstr.

        listen on socket [options]
                Listen for incoming SMTP connections on the Unix domain
                socket /var/run/smtpd.sock.  This is done by default, even
                if the directive is absent.

                The options are as follows:

                filter name
                        Apply filter name on connections handled by this
                        listener.

                mask-src
                        Omit the from part when prepending “Received”
                        headers.

                tag tag
                        Clients connecting to the listener are tagged with
                        the given tag.

        match options action name
                If at least one mail envelope matches the options of one
                match action directive, receive the incoming message, put a
                copy into each matching envelope, and atomically save the
                envelopes to the mail spool for later processing by the
                respective dispatcher name.

                The following matching options are supported and can all be
                negated:

                [!] for any
                        Specify that session may address any destination.

                [!] for local
                        Specify that session may address any local domain.
                        This is the default, and may be omitted.

                [!] for domain domain | <domain>
                        Specify that session may address the string or list
                        table domain.

                [!] for domain regex domain | <domain>
                        Specify that session may address the regex or regex
                        table domain.

                [!] for rcpt-to recipient | <recipient>
                        Specify that session may address the string or list
                        table recipient.

                [!] for rcpt-to regex recipient | <recipient>
                        Specify that session may address the regex or regex
                        table recipient.

                [!] from any
                        Specify that session may originate from any source.

                [!] from auth
                        Specify that session may originate from any
                        authenticated user, no matter the source IP
                        address.

                [!] from auth user | <user>
                        Specify that session may originate from
                        authenticated user or user list user, no matter the
                        source IP address.

                [!] from auth regex user | <user>
                        Specify that session may originate from
                        authenticated regex or regex list user, no matter
                        the source IP address.

                [!] from local
                        Specify that session may only originate from a
                        local IP address, or from the local enqueuer.  This
                        is the default, and may be omitted.

                [!] from mail-from sender | <sender>
                        Specify that session may originate from sender or
                        sender list sender, no matter the source IP
                        address.

                [!] from mail-from regex sender | <sender>
                        Specify that session may originate from regex or
                        regex list sender, no matter the source IP address.

                [!] from rdns
                        Specify that session may only originate from an IP
                        address that resolves to a reverse DNS.

                [!] from rdns hostname | <hostname>
                        Specify that session may only originate from an IP
                        address that resolves to a reverse DNS matching
                        string or list string hostname.

                [!] from rdns regex hostname | <hostname>
                        Specify that session may only originate from an IP
                        address that resolves to a reverse DNS matching
                        regex or list regex hostname.

                [!] from socket
                        Specify that session may only originate from the
                        local enqueuer.

                [!] from src address | <address>
                        Specify that session may only originate from string
                        or list table address which can be a specific
                        address or a subnet expressed in CIDR-notation.

                [!] from src regex address | <address>
                        Specify that session may only originate from regex
                        or regex table address which can be a specific
                        address or a subnet expressed in CIDR-notation.

                In addition, the following transaction options may be
                matched:

                [!] auth
                        Matches transactions which have been authenticated.

                [!] auth username | <username>
                        Matches transactions which have been authenticated
                        for user or user list username.

                [!] auth regex username | <username>
                        Matches transactions which have been authenticated
                        for regex or regex list username.

                [!] helo helo-name | <helo-name>
                        Specify that session's HELO / EHLO should match the
                        string or list table helo-name.

                [!] helo regex helo-name | <helo-name>
                        Specify that session's HELO / EHLO should match the
                        regex or regex table helo-name.

                [!] mail-from sender | <sender>
                        Specify that transaction's MAIL FROM should match
                        the string or list table sender.

                [!] mail-from regex sender | <sender>
                        Specify that transaction's MAIL FROM should match
                        the regex or regex table sender.

                [!] rcpt-to recipient | <recipient>
                        Specify that transaction's RCPT TO should match the
                        string or list table recipient.

                [!] rcpt-to regex recipient | <recipient>
                        Specify that transaction's RCPT TO should match the
                        regex or regex table recipient.

                [!] tag tag
                        Matches transactions tagged with the given tag.

                [!] tag regex tag
                        Matches transactions tagged with the given tag
                        regex.

                [!] tls
                        Specify that transaction should take place in a TLS
                        channel.

        match options reject
                Reject the incoming message during the SMTP dialogue.  The
                same options are supported as for the match action
                directive.

        mda wrapper name command
                Associate command with the mail delivery agent wrapper
                named name.  When a local delivery specifies a wrapper, the
                command associated with the wrapper will be executed
                instead.  The command may contain format specifiers (see
                FORMAT SPECIFIERS).

        mta max-deferred number
                When delivery to a given host is suspended due to temporary
                failures, cache at most number envelopes for that host such
                that they can be delivered as soon as another delivery
                succeeds to that host.  The default is 100.

        pki pkiname cert certfile
                Associate certificate file certfile with pki entry pkiname.
                The pki entry defines a keypair configuration that can be
                referenced in listener rules and relay actions.

                A certificate chain may be created by appending one or many
                certificates, including a Certificate Authority
                certificate, to certfile.  The creation of certificates is
                documented in starttls(8).

        pki pkiname key keyfile
                Associate the key located in keyfile with pki entry
                pkiname.

        pki pkiname dhe params
                Specify the DHE parameters to use for DHE cipher suites
                with pki entry pkiname.  Valid parameter values are none,
                legacy, and auto.  For legacy, a fixed key length of 1024
                bits is used, whereas for auto, the key length is
                determined automatically.  The default is none, which
                disables DHE cipher suites.

        proc proc-name command
                Register an external process named proc-name from command.
                Such processes may be used to share the same instance
                between multiple filters.  If command starts with a slash
                it is executed with an absolute path, otherwise it will be
                run from “/usr/local/libexec/smtpd/”.

        queue compression
                Store queue files in a compressed format.  This may be
                useful to save disk space.

        queue encryption [key]
                Encrypt queue files with EVP_aes_256_gcm(3).  If no key is
                specified, it is read with getpass(3).  If the string stdin
                or a single dash (‘-’) is given instead of a key, the key
                is read from the standard input.

        queue ttl delay
                Set the default expiration time for temporarily
                undeliverable messages, given as a positive decimal integer
                followed by a unit s, m, h, or d.  The default is four days
                (4d).

        smtp ciphers control
                Set the control string for SSL_CTX_set_cipher_list(3).  The
                default is "HIGH:!aNULL:!MD5".

        smtp limit max-mails count
                Limit the number of messages to count for each session.
                The default is 100.

        smtp limit max-rcpt count
                Limit the number of recipients to count for each
                transaction.  The default is 1000.

        smtp max-message-size size
                Reject messages larger than size, given as a positive
                number of bytes or as a string to be parsed with
                scan_scaled(3).  The default is "35M".

        smtp sub-addr-delim character
                When resolving the local part of a local email address,
                ignore the ASCII character and all characters following it.
                The default is ‘+’.

        srs key secret
                Set the secret key to use for SRS, the Sender Rewriting
                Scheme.

        srs key backup secret
                Set a backup secret key to use as a fallback for SRS.  This
                can be used to implement SRS key rotation.

        srs ttl delay
                Set the time-to-live delay for SRS envelopes.  After this
                delay, a bounce reply to the SRS address will be discarded
                to limit risks of forged addresses.  The default is four
                days (4d).

        table name [type:]pathname
                Tables provide additional configuration information for
                smtpd(8) in the form of lists or key-value mappings.  The
                format of the entries depends on what the table is used
                for.  Refer to table(5) for the exhaustive documentation.

                Each table is identified by an arbitrary, unique name.

                If the type is db, information is stored in a file created
                with makemap(8); if it is file or omitted, information is
                stored in a plain text file using the format described in
                table(5).  The pathname to the file must be absolute.

        table name {value [, ...]}
                Instead of using a separate file, declare a list table
                containing the given static values.  The table must contain
                at least one value and may declare multiple values as a
                comma-separated (whitespace optional) list.

        table name {key=value [, ...]}
                Instead of using a separate file, declare a mapping table
                containing the given static key-value pairs.  The table
                must contain at least one key-value pair and may declare
                multiple pairs as a comma-separated (whitespace optional)
                list.

      MAIL FILTERING
        In a regular workflow, smtpd(8) may accept or reject a message
        based only on the content of envelopes.  Its decisions are about
        the handling of the message, not about the handling of an active
        session.

        Filtering extends the decision making process by allowing smtpd(8)
        to stop at each phase of an SMTP session, check that conditions are
        met, then decide if a session is allowed to move forward.

        With filtering, a session may be interrupted at any phase before an
        envelope is complete.  A message may also be rejected after being
        submitted, regardless of whether the envelope was accepted or not.

        The following phases are currently supported:

              connect      upon connection, before a banner is displayed
              helo         after HELO command is submitted
              ehlo         after EHLO command is submitted
              mail-from    after MAIL FROM command is submitted
              rcpt-to      after RCPT TO command is submitted
              data         after DATA command is submitted
              commit       after message is fully is submitted

        At each phase, various conditions may be matched.  The fcrdns,
        rdns, and src data are available in all phases, but other data must
        have been already submitted before they are available.

              fcrdns                   forward-confirmed reverse DNS is
                                       valid
              rdns                     session has a reverse DNS
              rdns <table>             session has a reverse DNS in table
              src <table>              source address is in table
              helo <table>             helo name is in table
              auth                     session is authenticated
              auth <table>             session username is in table
              mail-from <table>        sender address is in table
              rcpt-to <table>          recipient address is in table

        These conditions may all be negated by prefixing them with an
        exclamation mark:

              !fcrdns                  forward-confirmed reverse DNS is
                                       invalid

        Any conditions using a table may indicate that the table contains
        regular expressions by prefixing the table name with the keyword
        regex.

              helo regex <table>       helo name matches a regex in table

        Finally, a number of decisions may be taken:

              bypass                   the session or transaction bypasses
                                       filters
              disconnect message       the session is disconnected with
                                       message
              junk                     the session or transaction is
                                       junked, i.e., an ‘X-Spam: yes’
                                       header is added to any messages
              reject message           the command is rejected with message
              rewrite value            the command parameter is rewritten
                                       with value

        Decisions that involve a message require that the message be RFC
        valid, meaning that they should either start with a 4xx or 5xx
        status code.  Decisions can be taken at any phase, though junking
        can only happen before a message is committed.

      FORMAT SPECIFIERS
        Some configuration directives support expansion of their parameters
        at runtime.  Such directives (for example action maildir, action
        mda) may use format specifiers which are expanded before delivery
        or relaying.  The following formats are currently supported:

              %{sender}            sender email address, may be empty
                                   string
              %{sender.user}       user part of the sender email address,
                                   may be empty
              %{sender.domain}     domain part of the sender email address,
                                   may be empty
              %{rcpt}              recipient email address
              %{rcpt.user}         user part of the recipient email address
              %{rcpt.domain}       domain part of the recipient email
                                   address
              %{dest}              recipient email address after expansion
              %{dest.user}         user part after expansion
              %{dest.domain}       domain part after expansion
              %{user.username}     local user
              %{user.directory}    home directory of the local user
              %{mbox.from}         name used in mbox From separator lines
              %{mda}               mda command, only available for mda
                                   wrappers

        Expansion formats also support partial expansion using the optional
        bracket notations with substring offset.  For example, with
        recipient domain “example.org”:

              %{rcpt.domain[0]}       expands to “e”
              %{rcpt.domain[1]}       expands to “x”
              %{rcpt.domain[8:]}      expands to “org”
              %{rcpt.domain[-3:]}     expands to “org”
              %{rcpt.domain[0:6]}     expands to “example”
              %{rcpt.domain[0:-4]}    expands to “example”

        In addition, modifiers may be applied to the token.  For example,
        with recipient “User+Tag@Example.org”:

              %{rcpt:lowercase}          expands to “user+tag@example.org”
              %{rcpt:uppercase}          expands to “USER+TAG@EXAMPLE.ORG”
              %{rcpt:strip}              expands to “User@Example.org”
              %{rcpt:lowercase|strip}    expands to “user@example.org”

        For security concerns, expanded values are sanitized and
        potentially dangerous characters are replaced with ‘:’.  In
        situations where they are desirable, the “raw” modifier may be
        applied.  For example, with recipient “user+t?g@example.org”:

              %{rcpt}        expands to “user+t:g@example.org”
              %{rcpt:raw}    expands to “user+t?g@example.org”


---------------------------------------------------

::

        /etc/mail/smtpd.conf     Default smtpd(8) configuration file.
        /etc/mail/mailname       If this file exists, the first line is
                                 used as the server name.  Otherwise, the
                                 server name is derived from the local
                                 hostname returned by gethostname(3),
                                 either directly if it is a fully qualified
                                 domain name, or by retrieving the
                                 associated canonical name through
                                 getaddrinfo(3).
        /var/run/smtpd.sock      Unix domain socket for incoming SMTP
                                 connections.
        /var/spool/smtpd/        Spool directories for mail during
                                 processing.


---------------------------------------------------------

::

        The default smtpd.conf file which ships with OpenBSD listens on the
        loopback network interface (lo0) and allows for mail from users and
        daemons on the local machine, as well as permitting email to remote
        servers.  Some more complex configurations are given below.

        This first example is similar to the default configuration, but all
        outgoing mail is forwarded to a remote SMTP server.  A secrets file
        is needed to specify a username and password:

              # touch /etc/mail/secrets
              # chmod 640 /etc/mail/secrets
              # chown root:_smtpd /etc/mail/secrets
              # echo "bob username:password" > /etc/mail/secrets

        smtpd.conf would look like this:

              table aliases file:/etc/mail/aliases
              table secrets file:/etc/mail/secrets

              listen on lo0

              action "local_mail" mbox alias <aliases>
              action "outbound" relay host smtp+tls://bob@smtp.example.com \
                      auth <secrets>

              match from local for local action "local_mail"
              match from local for any action "outbound"

        In this second example, the aim is to permit mail delivery and
        relaying only for users that can authenticate (using their normal
        login credentials).  An RSA certificate must be provided to prove
        the server's identity.  The mail server listens on all interfaces
        the default routes point to.  Mail with a local destination is sent
        to an external MDA.  First, the RSA certificate is created:

              # openssl genrsa -out /etc/ssl/private/mail.example.com.key 4096
              # openssl req -new -x509 -key /etc/ssl/private/mail.example.com.key \
                      -out /etc/ssl/mail.example.com.crt -days 365
              # chmod 600 /etc/ssl/mail.example.com.crt
              # chmod 600 /etc/ssl/private/mail.example.com.key

        In the example above, a certificate valid for one year was created.
        The configuration file would look like this:

              pki mail.example.com cert "/etc/ssl/mail.example.com.crt"
              pki mail.example.com key "/etc/ssl/private/mail.example.com.key"

              table aliases file:/etc/mail/aliases

              listen on lo0
              listen on egress tls pki mail.example.com auth

              action mda_with_aliases mda "/path/to/mda -f -" alias <aliases>
              action mda_without_aliases mda "/path/to/mda -f -"
              action "outbound" relay

              match for local action mda_with_aliases
              match from any for domain example.com action mda_without_aliases
              match for any action "outbound"
              match auth from any for any action "outbound"

        For sites that wish to sign messages using DKIM, the following
        example uses opensmtpd-filter-dkimsign for DKIM signing:

              table aliases file:/etc/mail/aliases

              filter "dkimsign" proc-exec "filter-dkimsign -d <domain> -s <selector> \
                      -k /etc/mail/dkim/private.key" user _dkimsign group _dkimsign

              listen on socket filter "dkimsign"
              listen on lo0 filter "dkimsign"

              action "local_mail" mbox alias <aliases>
              action "outbound" relay

              match for local action "local_mail"
              match for any action "outbound"

        Alternatively, the opensmtpd-filter-rspamd package may be used to
        provide integration with rspamd, a third-party daemon which
        provides multiple antispam features as well as DKIM signing.  As
        well as configuring rspamd itself, it requires use of the proc-exec
        keyword:

              filter "rspamd" proc-exec "filter-rspamd"

        Sites that accept non-local messages may be able to cut down on the
        volume of spam received by rejecting forged messages that claim to
        be from the local domain.  The following example uses a list table
        other-relays to specify the IP addresses of relays that may
        legitimately originate mail with the owner's domain as the sender.

              table aliases file:/etc/mail/aliases
              table other-relays file:/etc/mail/other-relays

              listen on lo0
              listen on egress

              action "local_mail" mbox alias <aliases>
              action "outbound" relay

              match for local action "local_mail"
              match for any action "outbound"
              match !from src <other-relays> mail-from "@example.com" for any \
                    reject
              match from any for domain example.com action "local_mail"


---------------------------------------------------------

::

        mailer.conf(5), table(5), makemap(8), smtpd(8)


-------------------------------------------------------

::

        smtpd(8) first appeared in OpenBSD 4.6.

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

   BSD                           April 9, 2021                          BSD

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
