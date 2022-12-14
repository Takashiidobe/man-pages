.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapd.conf(5) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `GLOBAL CONFIGURATION OPTIONS <   |                                   |
| #GLOBAL_CONFIGURATION_OPTIONS>`__ |                                   |
| \| `TLS OPTIONS <#TLS_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `GENERAL BACKEND OPTI             |                                   |
| ONS <#GENERAL_BACKEND_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `GENERAL DATABASE OPTIO           |                                   |
| NS <#GENERAL_DATABASE_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `DATABASE-SPECIFIC OPTION         |                                   |
| S <#DATABASE-SPECIFIC_OPTIONS>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLAPD.CONF(5)              File Formats Manual             SLAPD.CONF(5)

NAME
-------------------------------------------------

::

          slapd.conf - configuration file for slapd, the stand-alone LDAP
          daemon


---------------------------------------------------------

::

          ETCDIR/slapd.conf


---------------------------------------------------------------

::

          The file ETCDIR/slapd.conf contains configuration information for
          the slapd(8) daemon.  This configuration file is also used by the
          SLAPD tools slapacl(8), slapadd(8), slapauth(8), slapcat(8),
          slapdn(8), slapindex(8), slapmodify(8), and slaptest(8).

          The slapd.conf file consists of a series of global configuration
          options that apply to slapd as a whole (including all backends),
          followed by zero or more database backend definitions that
          contain information specific to a backend instance.  The
          configuration options are case-insensitive; their value, on a
          case by case basis, may be case-sensitive.

          The general format of slapd.conf is as follows:

              # comment - these options apply to every database
              <global configuration options>
              # first database definition & configuration options
              database <backend 1 type>
              <configuration options specific to backend 1>
              # subsequent database definitions & configuration options
              ...

          As many backend-specific sections as desired may be included.
          Global options can be overridden in a backend (for options that
          appear more than once, the last appearance in the slapd.conf file
          is used).

          If a line begins with white space, it is considered a
          continuation of the previous line.  No physical line should be
          over 2000 bytes long.

          Blank lines and comment lines beginning with a `#' character are
          ignored.  Note: continuation lines are unwrapped before comment
          processing is applied.

          Arguments on configuration lines are separated by white space. If
          an argument contains white space, the argument should be enclosed
          in double quotes.  If an argument contains a double quote (`"')
          or a backslash character (`\'), the character should be preceded
          by a backslash character.

          The specific configuration options available are discussed below
          in the Global Configuration Options, General Backend Options, and
          General Database Options.  Backend-specific options are discussed
          in the slapd-<backend>(5) manual pages.  Refer to the "OpenLDAP
          Administrator's Guide" for more details on the slapd
          configuration file.


-------------------------------------------------------------------------------------------------

::

          Options described in this section apply to all backends, unless
          specifically overridden in a backend definition. Arguments that
          should be replaced by actual text are shown in brackets <>.

          access to <what> [ by <who> <access> <control> ]+
                 Grant access (specified by <access>) to a set of entries
                 and/or attributes (specified by <what>) by one or more
                 requestors (specified by <who>).  If no access controls
                 are present, the default policy allows anyone and everyone
                 to read anything but restricts updates to rootdn.  (e.g.,
                 "access to * by * read").  The rootdn can always read and
                 write EVERYTHING!  See slapd.access(5) and the "OpenLDAP's
                 Administrator's Guide" for details.

          allow <features>
                 Specify a set of features (separated by white space) to
                 allow (default none).  bind_v2 allows acceptance of LDAPv2
                 bind requests.  Note that slapd(8) does not truly
                 implement LDAPv2 (RFC 1777), now Historic (RFC 3494).
                 bind_anon_cred allows anonymous bind when credentials are
                 not empty (e.g.  when DN is empty).  bind_anon_dn allows
                 unauthenticated (anonymous) bind when DN is not empty.
                 update_anon allows unauthenticated (anonymous) update
                 operations to be processed (subject to access controls and
                 other administrative limits).  proxy_authz_anon allows
                 unauthenticated (anonymous) proxy authorization control to
                 be processed (subject to access controls, authorization
                 and other administrative limits).

          argsfile <filename>
                 The (absolute) name of a file that will hold the slapd
                 server's command line (program name and options).

          attributeoptions [option-name]...
                 Define tagging attribute options or option tag/range
                 prefixes.  Options must not end with `-', prefixes must
                 end with `-'.  The `lang-' prefix is predefined.  If you
                 use the attributeoptions directive, `lang-' will no longer
                 be defined and you must specify it explicitly if you want
                 it defined.

                 An attribute description with a tagging option is a
                 subtype of that attribute description without the option.
                 Except for that, options defined this way have no special
                 semantics.  Prefixes defined this way work like the
                 `lang-' options: They define a prefix for tagging options
                 starting with the prefix.  That is, if you define the
                 prefix `x-foo-', you can use the option `x-foo-bar'.
                 Furthermore, in a search or compare, a prefix or range
                 name (with a trailing `-') matches all options starting
                 with that name, as well as the option with the range name
                 sans the trailing `-'.  That is, `x-foo-bar-' matches
                 `x-foo-bar' and `x-foo-bar-baz'.

                 RFC 4520 reserves options beginning with `x-' for private
                 experiments.  Other options should be registered with
                 IANA, see RFC 4520 section 3.5.  OpenLDAP also has the
                 `binary' option built in, but this is a transfer option,
                 not a tagging option.

          attributetype ( <oid> [NAME <name>] [DESC <description>]
                 [OBSOLETE] [SUP <oid>] [EQUALITY <oid>] [ORDERING <oid>]
                 [SUBSTR <oid>] [SYNTAX <oidlen>] [SINGLE-VALUE]
                 [COLLECTIVE] [NO-USER-MODIFICATION]
                 [USAGE <attributeUsage>] )
                 Specify an attribute type using the LDAPv3 syntax defined
                 in RFC 4512.  The slapd parser extends the RFC 4512
                 definition by allowing string forms as well as numeric
                 OIDs to be used for the attribute OID and attribute syntax
                 OID.  (See the objectidentifier description.)

          authid-rewrite<cmd> <args>
                 Used by the authentication framework to convert simple
                 user names to an LDAP DN used for authorization purposes.
                 Its purpose is analogous to that of authz-regexp (see
                 below).  The prefix authid- is followed by a set of rules
                 analogous to those described in slapo-rwm(5) for data
                 rewriting (replace the rwm- prefix with authid-).
                 authid-rewrite<cmd> and authz-regexp rules should not be
                 intermixed.

          authz-policy <policy>
                 Used to specify which rules to use for Proxy
                 Authorization.  Proxy authorization allows a client to
                 authenticate to the server using one user's credentials,
                 but specify a different identity to use for authorization
                 and access control purposes. It essentially allows user A
                 to login as user B, using user A's password.  The none
                 flag disables proxy authorization. This is the default
                 setting.  The from flag will use rules in the authzFrom
                 attribute of the authorization DN.  The to flag will use
                 rules in the authzTo attribute of the authentication DN.
                 The any flag, an alias for the deprecated value of both,
                 will allow any of the above, whatever succeeds first
                 (checked in to, from sequence.  The all flag requires both
                 authorizations to succeed.

                 The rules are mechanisms to specify which identities are
                 allowed to perform proxy authorization.  The authzFrom
                 attribute in an entry specifies which other users are
                 allowed to proxy login to this entry. The authzTo
                 attribute in an entry specifies which other users this
                 user can authorize as.  Use of authzTo rules can be easily
                 abused if users are allowed to write arbitrary values to
                 this attribute.  In general the authzTo attribute must be
                 protected with ACLs such that only privileged users can
                 modify it.  The value of authzFrom and authzTo describes
                 an identity or a set of identities; it can take five
                 forms:

                        ldap:///<base>??[<scope>]?<filter>
                        dn[.<dnstyle>]:<pattern>
                        u[.<mech>[/<realm>]]:<pattern>
                        group[/objectClass[/attributeType]]:<pattern>
                        <pattern>

                        <dnstyle>:={exact|onelevel|children|subtree|regex}

                 The first form is a valid LDAP URI where the
                 <host>:<port>, the <attrs> and the <extensions> portions
                 must be absent, so that the search occurs locally on
                 either authzFrom or authzTo.

                 The second form is a DN.  The optional dnstyle modifiers
                 exact, onelevel, children, and subtree provide exact,
                 onelevel, children and subtree matches, which cause
                 <pattern> to be normalized according to the DN
                 normalization rules.  The special dnstyle modifier regex
                 causes the <pattern> to be treated as a POSIX
                 (''extended'') regular expression, as discussed in
                 regex(7) and/or re_format(7).  A pattern of * means any
                 non-anonymous DN.

                 The third form is a SASL id.  The optional fields <mech>
                 and <realm> allow specification of a SASL mechanism, and
                 eventually a SASL realm, for those mechanisms that support
                 one.  The need to allow the specification of a mechanism
                 is still debated, and users are strongly discouraged to
                 rely on this possibility.

                 The fourth form is a group specification.  It consists of
                 the keyword group, optionally followed by the
                 specification of the group objectClass and attributeType.
                 The objectClass defaults to groupOfNames.  The
                 attributeType defaults to member.  The group with DN
                 <pattern> is searched with base scope, filtered on the
                 specified objectClass.  The values of the resulting
                 attributeType are searched for the asserted DN.

                 The fifth form is provided for backwards compatibility.
                 If no identity type is provided, i.e. only <pattern> is
                 present, an exact DN is assumed; as a consequence,
                 <pattern> is subjected to DN normalization.

                 Since the interpretation of authzFrom and authzTo can
                 impact security, users are strongly encouraged to
                 explicitly set the type of identity specification that is
                 being used.  A subset of these rules can be used as third
                 arg in the authz-regexp statement (see below);
                 significantly, the URI, provided it results in exactly one
                 entry, and the dn.exact:<dn> forms.

          authz-regexp <match> <replace>
                 Used by the authentication framework to convert simple
                 user names, such as provided by SASL subsystem, or
                 extracted from certificates in case of cert-based SASL
                 EXTERNAL, or provided within the RFC 4370 "proxied
                 authorization" control, to an LDAP DN used for
                 authorization purposes.  Note that the resulting DN need
                 not refer to an existing entry to be considered valid.
                 When an authorization request is received from the SASL
                 subsystem, the SASL USERNAME, REALM, and MECHANISM are
                 taken, when available, and combined into a name of the
                 form

                        UID=<username>[[,CN=<realm>],CN=<mechanism>],CN=auth

                 This name is then compared against the match POSIX
                 (''extended'') regular expression, and if the match is
                 successful, the name is replaced with the replace string.
                 If there are wildcard strings in the match regular
                 expression that are enclosed in parenthesis, e.g.

                        UID=([^,]*),CN=.*

                 then the portion of the name that matched the wildcard
                 will be stored in the numbered placeholder variable $1. If
                 there are other wildcard strings in parenthesis, the
                 matching strings will be in $2, $3, etc. up to $9. The
                 placeholders can then be used in the replace string, e.g.

                        UID=$1,OU=Accounts,DC=example,DC=com

                 The replaced name can be either a DN, i.e. a string
                 prefixed by "dn:", or an LDAP URI.  If the latter, the
                 server will use the URI to search its own database(s) and,
                 if the search returns exactly one entry, the name is
                 replaced by the DN of that entry.   The LDAP URI must have
                 no hostport, attrs, or extensions components, but the
                 filter is mandatory, e.g.

                        ldap:///OU=Accounts,DC=example,DC=com??one?(UID=$1)

                 The protocol portion of the URI must be strictly ldap.
                 Note that this search is subject to access controls.
                 Specifically, the authentication identity must have "auth"
                 access in the subject.

                 Multiple authz-regexp options can be given in the
                 configuration file to allow for multiple matching and
                 replacement patterns. The matching patterns are checked in
                 the order they appear in the file, stopping at the first
                 successful match.

          concurrency <integer>
                 Specify a desired level of concurrency.  Provided to the
                 underlying thread system as a hint.  The default is not to
                 provide any hint. This setting is only meaningful on some
                 platforms where there is not a one to one correspondence
                 between user threads and kernel threads.

          conn_max_pending <integer>
                 Specify the maximum number of pending requests for an
                 anonymous session.  If requests are submitted faster than
                 the server can process them, they will be queued up to
                 this limit. If the limit is exceeded, the session is
                 closed. The default is 100.

          conn_max_pending_auth <integer>
                 Specify the maximum number of pending requests for an
                 authenticated session.  The default is 1000.

          defaultsearchbase <dn>
                 Specify a default search base to use when client submits a
                 non-base search request with an empty base DN.  Base
                 scoped search requests with an empty base DN are not
                 affected.

          disallow <features>
                 Specify a set of features (separated by white space) to
                 disallow (default none).  bind_anon disables acceptance of
                 anonymous bind requests.  Note that this setting does not
                 prohibit anonymous directory access (See "require authc").
                 bind_simple disables simple (bind) authentication.
                 tls_2_anon disables forcing session to anonymous status
                 (see also tls_authc) upon StartTLS operation receipt.
                 tls_authc disallows the StartTLS operation if
                 authenticated (see also tls_2_anon).
                 proxy_authz_non_critical disables acceptance of the
                 proxied authorization control (RFC4370) with criticality
                 set to FALSE.  dontusecopy_non_critical disables
                 acceptance of the dontUseCopy control (a work in progress)
                 with criticality set to FALSE.

          ditcontentrule ( <oid> [NAME <name>] [DESC <description>]
                 [OBSOLETE] [AUX <oids>] [MUST <oids>] [MAY <oids>]
                 [NOT <oids>] )
                 Specify an DIT Content Rule using the LDAPv3 syntax
                 defined in RFC 4512.  The slapd parser extends the RFC
                 4512 definition by allowing string forms as well as
                 numeric OIDs to be used for the attribute OID and
                 attribute syntax OID.  (See the objectidentifier
                 description.)

          gentlehup { on | off }
                 A SIGHUP signal will only cause a 'gentle' shutdown-
                 attempt: Slapd will stop listening for new connections,
                 but will not close the connections to the current clients.
                 Future write operations return unwilling-to-perform,
                 though.  Slapd terminates when all clients have closed
                 their connections (if they ever do), or - as before - if
                 it receives a SIGTERM signal.  This can be useful if you
                 wish to terminate the server and start a new slapd server
                 with another database, without disrupting the currently
                 active clients.  The default is off.  You may wish to use
                 idletimeout along with this option.

          idletimeout <integer>
                 Specify the number of seconds to wait before forcibly
                 closing an idle client connection.  A setting of 0
                 disables this feature.  The default is 0. You may also
                 want to set the writetimeout option.

          include <filename>
                 Read additional configuration information from the given
                 file before continuing with the next line of the current
                 file.

          index_hash64 { on | off }
                 Use a 64 bit hash for indexing. The default is to use 32
                 bit hashes.  These hashes are used for equality and
                 substring indexing. The 64 bit version may be needed to
                 avoid index collisions when the number of indexed values
                 exceeds ~64 million. (Note that substring indexing
                 generates multiple index values per actual attribute
                 value.)  Indices generated with 32 bit hashes are
                 incompatible with the 64 bit version, and vice versa. Any
                 existing databases must be fully reloaded when changing
                 this setting. This directive is only supported on 64 bit
                 CPUs.

          index_intlen <integer>
                 Specify the key length for ordered integer indices. The
                 most significant bytes of the binary integer will be used
                 for index keys. The default value is 4, which provides
                 exact indexing for 31 bit values.  A floating point
                 representation is used to index too large values.

          index_substr_if_maxlen <integer>
                 Specify the maximum length for subinitial and subfinal
                 indices. Only this many characters of an attribute value
                 will be processed by the indexing functions; any excess
                 characters are ignored. The default is 4.

          index_substr_if_minlen <integer>
                 Specify the minimum length for subinitial and subfinal
                 indices. An attribute value must have at least this many
                 characters in order to be processed by the indexing
                 functions. The default is 2.

          index_substr_any_len <integer>
                 Specify the length used for subany indices. An attribute
                 value must have at least this many characters in order to
                 be processed. Attribute values longer than this length
                 will be processed in segments of this length. The default
                 is 4. The subany index will also be used in subinitial and
                 subfinal index lookups when the filter string is longer
                 than the index_substr_if_maxlen value.

          index_substr_any_step <integer>
                 Specify the steps used in subany index lookups. This value
                 sets the offset for the segments of a filter string that
                 are processed for a subany index lookup. The default is 2.
                 For example, with the default values, a search using this
                 filter "cn=*abcdefgh*" would generate index lookups for
                 "abcd", "cdef", and "efgh".

          Note: Indexing support depends on the particular backend in use.
          Also, changing these settings will generally require deleting any
          indices that depend on these parameters and recreating them with
          slapindex(8).

          ldapsyntax ( <oid> [DESC <description>] [X-SUBST <substitute-
                 syntax>] )
                 Specify an LDAP syntax using the LDAPv3 syntax defined in
                 RFC 4512.  The slapd parser extends the RFC 4512
                 definition by allowing string forms as well as numeric
                 OIDs to be used for the syntax OID.  (See the
                 objectidentifier description.)  The slapd parser also
                 honors the X-SUBST extension (an OpenLDAP-specific
                 extension), which allows one to use the ldapsyntax
                 statement to define a non-implemented syntax along with
                 another syntax, the extension value substitute-syntax, as
                 its temporary replacement.  The substitute-syntax must be
                 defined.  This allows one to define attribute types that
                 make use of non-implemented syntaxes using the correct
                 syntax OID.  Unless X-SUBST is used, this configuration
                 statement would result in an error, since no handlers
                 would be associated to the resulting syntax structure.

          listener-threads <integer>
                 Specify the number of threads to use for the connection
                 manager.  The default is 1 and this is typically adequate
                 for up to 16 CPU cores.  The value should be set to a
                 power of 2.

          localSSF <SSF>
                 Specifies the Security Strength Factor (SSF) to be given
                 local LDAP sessions, such as those to the ldapi://
                 listener.  For a description of SSF values, see sasl-
                 secprops's minssf option description.  The default is 71.

          logfile <filename>
                 Specify a file for recording slapd debug messages. By
                 default these messages only go to stderr, are not recorded
                 anywhere else, and are unrelated to messages exposed by
                 the loglevel configuration parameter. Specifying a logfile
                 copies messages to both stderr and the logfile.

          logfile-only on | off
                 Specify that debug messages should only go to the
                 configured logfile, and not to stderr.

          logfile-rotate <max> <Mbytes> <hours>
                 Specify automatic rotation for the configured logfile as
                 the maximum number of old logfiles to retain, a maximum
                 size in megabytes to allow a logfile to grow before
                 rotation, and a maximum age in hours for a logfile to be
                 used before rotation. The maximum number must be in the
                 range 1-99.  Setting Mbytes or hours to zero disables the
                 size or age check, respectively.  At least one of Mbytes
                 or hours must be non-zero. By default no automatic
                 rotation will be performed.

          loglevel <integer> [...]
                 Specify the level at which debugging statements and
                 operation statistics should be syslogged (currently logged
                 to the syslogd(8) LOG_LOCAL4 facility).  They must be
                 considered subsystems rather than increasingly verbose log
                 levels.  Some messages with higher priority are logged
                 regardless of the configured loglevel as soon as any
                 logging is configured.  Log levels are additive, and
                 available levels are:
                        1      (0x1 trace) trace function calls
                        2      (0x2 packets) debug packet handling
                        4      (0x4 args) heavy trace debugging (function
                               args)
                        8      (0x8 conns) connection management
                        16     (0x10 BER) print out packets sent and
                               received
                        32     (0x20 filter) search filter processing
                        64     (0x40 config) configuration file processing
                        128    (0x80 ACL) access control list processing
                        256    (0x100 stats) connections, LDAP operations,
                               results (recommended)
                        512    (0x200 stats2) stats2 log entries sent
                        1024   (0x400 shell) print communication with shell
                               backends
                        2048   (0x800 parse) entry parsing

                        16384  (0x4000 sync) LDAPSync replication
                        32768  (0x8000 none) only messages that get logged
                               whatever log level is set
                 The desired log level can be input as a single integer
                 that combines the (ORed) desired levels, both in decimal
                 or in hexadecimal notation, as a list of integers (that
                 are ORed internally), or as a list of the names that are
                 shown between parentheses, such that

                     loglevel 129
                     loglevel 0x81
                     loglevel 128 1
                     loglevel 0x80 0x1
                     loglevel acl trace

                 are equivalent.  The keyword any can be used as a shortcut
                 to enable logging at all levels (equivalent to -1).  The
                 keyword none, or the equivalent integer representation,
                 causes those messages that are logged regardless of the
                 configured loglevel to be logged.  In fact, if loglevel is
                 set to 0, no logging occurs, so at least the none level is
                 required to have high priority messages logged.

                 Note that the packets, BER, and parse levels are only
                 available as debug output on stderr, and are not sent to
                 syslog.

                 The loglevel defaults to stats.  This level should usually
                 also be included when using other loglevels, to help
                 analyze the logs.

          maxfilterdepth <integer>
                 Specify the maximum depth of nested filters in search
                 requests.  The default is 1000.

          moduleload <filename> [<arguments>...]
                 Specify the name of a dynamically loadable module to load
                 and any additional arguments if supported by the module.
                 The filename may be an absolute path name or a simple
                 filename. Non-absolute names are searched for in the
                 directories specified by the modulepath option. This
                 option and the modulepath option are only usable if slapd
                 was compiled with --enable-modules.

          modulepath <pathspec>
                 Specify a list of directories to search for loadable
                 modules. Typically the path is colon-separated but this
                 depends on the operating system.  The default is
                 MODULEDIR, which is where the standard OpenLDAP install
                 will place its modules.

          objectclass ( <oid> [NAME <name>] [DESC <description>] [OBSOLETE]
                 [SUP <oids>] [{ ABSTRACT | STRUCTURAL | AUXILIARY }]
                 [MUST <oids>] [MAY <oids>] )
                 Specify an objectclass using the LDAPv3 syntax defined in
                 RFC 4512.  The slapd parser extends the RFC 4512
                 definition by allowing string forms as well as numeric
                 OIDs to be used for the object class OID.  (See the
                 objectidentifier description.)  Object classes are
                 "STRUCTURAL" by default.

          objectidentifier <name> { <oid> | <name>[:<suffix>] }
                 Define a string name that equates to the given OID. The
                 string can be used in place of the numeric OID in
                 objectclass and attribute definitions. The name can also
                 be used with a suffix of the form ":xx" in which case the
                 value "oid.xx" will be used.

          password-hash <hash> [<hash>...]
                 This option configures one or more hashes to be used in
                 generation of user passwords stored in the userPassword
                 attribute during processing of LDAP Password Modify
                 Extended Operations (RFC 3062).  The <hash> must be one of
                 {SSHA}, {SHA}, {SMD5}, {MD5}, {CRYPT}, and {CLEARTEXT}.
                 The default is {SSHA}.

                 {SHA} and {SSHA} use the SHA-1 algorithm (FIPS 160-1), the
                 latter with a seed.

                 {MD5} and {SMD5} use the MD5 algorithm (RFC 1321), the
                 latter with a seed.

                 {CRYPT} uses the crypt(3).

                 {CLEARTEXT} indicates that the new password should be
                 added to userPassword as clear text.

                 Note that this option does not alter the normal user
                 applications handling of userPassword during LDAP Add,
                 Modify, or other LDAP operations.

          password-crypt-salt-format <format>
                 Specify the format of the salt passed to crypt(3) when
                 generating {CRYPT} passwords (see password-hash) during
                 processing of LDAP Password Modify Extended Operations
                 (RFC 3062).

                 This string needs to be in sprintf(3) format and may
                 include one (and only one) %s conversion.  This conversion
                 will be substituted with a string of random characters
                 from [A-Za-z0-9./].  For example, "%.2s" provides a two
                 character salt and "$1$%.8s" tells some versions of
                 crypt(3) to use an MD5 algorithm and provides 8 random
                 characters of salt.  The default is "%s", which provides
                 31 characters of salt.

          pidfile <filename>
                 The (absolute) name of a file that will hold the slapd
                 server's process ID (see getpid(2)).

          pluginlog: <filename>
                 The ( absolute ) name of a file that will contain log
                 messages from SLAPI plugins. See slapd.plugin(5) for
                 details.

          referral <url>
                 Specify the referral to pass back when slapd(8) cannot
                 find a local database to handle a request.  If specified
                 multiple times, each url is provided.

          require <conditions>
                 Specify a set of conditions (separated by white space) to
                 require (default none).  The directive may be specified
                 globally and/or per-database; databases inherit global
                 conditions, so per-database specifications are additive.
                 bind requires bind operation prior to directory
                 operations.  LDAPv3 requires session to be using LDAP
                 version 3.  authc requires authentication prior to
                 directory operations.  SASL requires SASL authentication
                 prior to directory operations.  strong requires strong
                 authentication prior to directory operations.  The strong
                 keyword allows protected "simple" authentication as well
                 as SASL authentication.  none may be used to require no
                 conditions (useful to clear out globally set conditions
                 within a particular database); it must occur first in the
                 list of conditions.

          reverse-lookup on | off
                 Enable/disable client name unverified reverse lookup
                 (default is off if compiled with --enable-rlookups).

          rootDSE <file>
                 Specify the name of an LDIF(5) file containing user
                 defined attributes for the root DSE.  These attributes are
                 returned in addition to the attributes normally produced
                 by slapd.

                 The root DSE is an entry with information about the server
                 and its capabilities, in operational attributes.  It has
                 the empty DN, and can be read with e.g.:
                     ldapsearch -x -b "" -s base "+"
                 See RFC 4512 section 5.1 for details.

          sasl-auxprops <plugin> [...]
                 Specify which auxprop plugins to use for authentication
                 lookups. The default is empty, which just uses slapd's
                 internal support. Usually no other auxprop plugins are
                 needed.

          sasl-auxprops-dontusecopy <attr> [...]
                 Specify which attribute(s) should be subject to the don't
                 use copy control. This is necessary for some SASL
                 mechanisms such as OTP to work in a replicated
                 environment. The attribute "cmusaslsecretOTP" is the
                 default value.

          sasl-auxprops-dontusecopy-ignore on | off
                 Used to disable replication of the attribute(s) defined by
                 sasl-auxprops-dontusecopy and instead use a local value
                 for the attribute. This allows the SASL mechanism to
                 continue to work if the provider is offline. This can
                 cause replication inconsistency. Defaults to off.

          sasl-host <fqdn>
                 Used to specify the fully qualified domain name used for
                 SASL processing.

          sasl-realm <realm>
                 Specify SASL realm.  Default is empty.

          sasl-cbinding none | tls-unique | tls-endpoint
                 Specify the channel-binding type, see also
                 LDAP_OPT_X_SASL_CBINDING.  Default is none.

          sasl-secprops <properties>
                 Used to specify Cyrus SASL security properties.  The none
                 flag (without any other properties) causes the flag
                 properties default, "noanonymous,noplain", to be cleared.
                 The noplain flag disables mechanisms susceptible to simple
                 passive attacks.  The noactive flag disables mechanisms
                 susceptible to active attacks.  The nodict flag disables
                 mechanisms susceptible to passive dictionary attacks.  The
                 noanonymous flag disables mechanisms which support
                 anonymous login.  The forwardsec flag require forward
                 secrecy between sessions.  The passcred require mechanisms
                 which pass client credentials (and allow mechanisms which
                 can pass credentials to do so).  The minssf=<factor>
                 property specifies the minimum acceptable security
                 strength factor as an integer approximate to effective key
                 length used for encryption.  0 (zero) implies no
                 protection, 1 implies integrity protection only, 128
                 allows RC4, Blowfish and other similar ciphers, 256 will
                 require modern ciphers.  The default is 0.  The
                 maxssf=<factor> property specifies the maximum acceptable
                 security strength factor as an integer (see minssf
                 description).  The default is INT_MAX.  The
                 maxbufsize=<size> property specifies the maximum security
                 layer receive buffer size allowed.  0 disables security
                 layers.  The default is 65536.

          schemadn <dn>
                 Specify the distinguished name for the subschema subentry
                 that controls the entries on this server.  The default is
                 "cn=Subschema".

          security <factors>
                 Specify a set of security strength factors (separated by
                 white space) to require (see sasl-secprops's minssf option
                 for a description of security strength factors).  The
                 directive may be specified globally and/or per-database.
                 ssf=<n> specifies the overall security strength factor.
                 transport=<n> specifies the transport security strength
                 factor.  tls=<n> specifies the TLS security strength
                 factor.  sasl=<n> specifies the SASL security strength
                 factor.  update_ssf=<n> specifies the overall security
                 strength factor to require for directory updates.
                 update_transport=<n> specifies the transport security
                 strength factor to require for directory updates.
                 update_tls=<n> specifies the TLS security strength factor
                 to require for directory updates.  update_sasl=<n>
                 specifies the SASL security strength factor to require for
                 directory updates.  simple_bind=<n> specifies the security
                 strength factor required for simple username/password
                 authentication.  Note that the transport factor is measure
                 of security provided by the underlying transport, e.g.
                 ldapi:// (and eventually IPSEC).  It is not normally used.

          serverID <integer> [<URL>]
                 Specify an integer ID from 0 to 4095 for this server. The
                 ID may also be specified as a hexadecimal ID by prefixing
                 the value with "0x".  Non-zero IDs are required when using
                 multi-provider replication and each provider must have a
                 unique non-zero ID. Note that this requirement also
                 applies to separate providers contributing to a glued set
                 of databases.  If the URL is provided, this directive may
                 be specified multiple times, providing a complete list of
                 participating servers and their IDs. The fully qualified
                 hostname of each server should be used in the supplied
                 URLs. The IDs are used in the "replica id" field of all
                 CSNs generated by the specified server. The default value
                 is zero, which is only valid for single provider
                 replication.  Example:

               serverID 1 ldap://ldap1.example.com
               serverID 2 ldap://ldap2.example.com

          sizelimit {<integer>|unlimited}

          sizelimit size[.{soft|hard}]=<integer> [...]
                 Specify the maximum number of entries to return from a
                 search operation.  The default size limit is 500.  Use
                 unlimited to specify no limits.  The second format allows
                 a fine grain setting of the size limits.  If no special
                 qualifiers are specified, both soft and hard limits are
                 set.  Extra args can be added on the same line.
                 Additional qualifiers are available; see limits for an
                 explanation of all of the different flags.

          sockbuf_max_incoming <integer>
                 Specify the maximum incoming LDAP PDU size for anonymous
                 sessions.  The default is 262143.

          sockbuf_max_incoming_auth <integer>
                 Specify the maximum incoming LDAP PDU size for
                 authenticated sessions.  The default is 4194303.

          sortvals <attr> [...]
                 Specify a list of multi-valued attributes whose values
                 will always be maintained in sorted order. Using this
                 option will allow Modify, Compare, and filter evaluations
                 on these attributes to be performed more efficiently. The
                 resulting sort order depends on the attributes' syntax and
                 matching rules and may not correspond to lexical order or
                 any other recognizable order.

          tcp-buffer [listener=<URL>] [{read|write}=]<size>
                 Specify the size of the TCP buffer.  A global value for
                 both read and write TCP buffers related to any listener is
                 defined, unless the listener is explicitly specified, or
                 either the read or write qualifiers are used.  See tcp(7)
                 for details.  Note that some OS-es implement automatic TCP
                 buffer tuning.

          threads <integer>
                 Specify the maximum size of the primary thread pool.  The
                 default is 16; the minimum value is 2.

          threadqueues <integer>
                 Specify the number of work queues to use for the primary
                 thread pool.  The default is 1 and this is typically
                 adequate for up to 8 CPU cores.  The value should not
                 exceed the number of CPUs in the system.

          timelimit {<integer>|unlimited}

          timelimit time[.{soft|hard}]=<integer> [...]
                 Specify the maximum number of seconds (in real time) slapd
                 will spend answering a search request.  The default time
                 limit is 3600.  Use unlimited to specify no limits.  The
                 second format allows a fine grain setting of the time
                 limits.  Extra args can be added on the same line.  See
                 limits for an explanation of the different flags.

          tool-threads <integer>
                 Specify the maximum number of threads to use in tool mode.
                 This should not be greater than the number of CPUs in the
                 system.  The default is 1.

          writetimeout <integer>
                 Specify the number of seconds to wait before forcibly
                 closing a connection with an outstanding write. This
                 allows recovery from various network hang conditions.  A
                 writetimeout of 0 disables this feature.  The default is
                 0.


---------------------------------------------------------------

::

          If slapd is built with support for Transport Layer Security,
          there are more options you can specify.

          TLSCipherSuite <cipher-suite-spec>
                 Permits configuring what ciphers will be accepted and the
                 preference order.  <cipher-suite-spec> should be a cipher
                 specification for the TLS library in use (OpenSSL or
                 GnuTLS).  Example:

                        OpenSSL:
                               TLSCipherSuite HIGH:MEDIUM:+SSLv2

                        GnuTLS:
                               TLSCiphersuite SECURE256:!AES-128-CBC

                 To check what ciphers a given spec selects in OpenSSL,
                 use:

                      openssl ciphers -v <cipher-suite-spec>

                 With GnuTLS the available specs can be found in the manual
                 page of gnutls-cli(1) (see the description of the option
                 --priority).

                 In older versions of GnuTLS, where gnutls-cli does not
                 support the option --priority, you can obtain the — more
                 limited — list of ciphers by calling:

                      gnutls-cli -l

          TLSCACertificateFile <filename>
                 Specifies the file that contains certificates for all of
                 the Certificate Authorities that slapd will recognize.
                 The certificate for the CA that signed the server
                 certificate must(GnuTLS)/may(OpenSSL) be included among
                 these certificates. If the signing CA was not a top-level
                 (root) CA, certificates for the entire sequence of CA's
                 from the signing CA to the top-level CA should be present.
                 Multiple certificates are simply appended to the file; the
                 order is not significant.

          TLSCACertificatePath <path>
                 Specifies the path of directories that contain Certificate
                 Authority certificates in separate individual files.
                 Usually only one of this or the TLSCACertificateFile is
                 used. If both are specified, both locations will be used.
                 Multiple directories may be specified, separated by a
                 semi-colon.

          TLSCertificateFile <filename>
                 Specifies the file that contains the slapd server
                 certificate.

                 When using OpenSSL that file may also contain any number
                 of intermediate certificates after the server certificate.

          TLSCertificateKeyFile <filename>
                 Specifies the file that contains the slapd server private
                 key that matches the certificate stored in the
                 TLSCertificateFile file.  Currently, the private key must
                 not be protected with a password, so it is of critical
                 importance that it is protected carefully.

          TLSDHParamFile <filename>
                 This directive specifies the file that contains parameters
                 for Diffie-Hellman ephemeral key exchange.  This is
                 required in order to use a DSA certificate on the server,
                 or an RSA certificate missing the "key encipherment" key
                 usage.  Note that setting this option may also enable
                 Anonymous Diffie-Hellman key exchanges in certain non-
                 default cipher suites.  Anonymous key exchanges should
                 generally be avoided since they provide no actual client
                 or server authentication and provide no protection against
                 man-in-the-middle attacks.  You should append "!ADH" to
                 your cipher suites to ensure that these suites are not
                 used.

          TLSECName <name>
                 Specify the name of the curve(s) to use for Elliptic curve
                 Diffie-Hellman ephemeral key exchange.  This option is
                 only used for OpenSSL.  This option is not used with
                 GnuTLS; the curves may be chosen in the GnuTLS ciphersuite
                 specification.

          TLSProtocolMin <major>[.<minor>]
                 Specifies minimum SSL/TLS protocol version that will be
                 negotiated.  If the server doesn't support at least that
                 version, the SSL handshake will fail.  To require TLS 1.x
                 or higher, set this option to 3.(x+1), e.g.,

                      TLSProtocolMin 3.2

                 would require TLS 1.1.  Specifying a minimum that is
                 higher than that supported by the OpenLDAP implementation
                 will result in it requiring the highest level that it does
                 support.  This directive is ignored with GnuTLS.

          TLSRandFile <filename>
                 Specifies the file to obtain random bits from when
                 /dev/[u]random is not available.  Generally set to the
                 name of the EGD/PRNGD socket.  The environment variable
                 RANDFILE can also be used to specify the filename.  This
                 directive is ignored with GnuTLS.

          TLSVerifyClient <level>
                 Specifies what checks to perform on client certificates in
                 an incoming TLS session, if any.  The <level> can be
                 specified as one of the following keywords:

                 never  This is the default.  slapd will not ask the client
                        for a certificate.

                 allow  The client certificate is requested.  If no
                        certificate is provided, the session proceeds
                        normally.  If a bad certificate is provided, it
                        will be ignored and the session proceeds normally.

                 try    The client certificate is requested.  If no
                        certificate is provided, the session proceeds
                        normally.  If a bad certificate is provided, the
                        session is immediately terminated.

                 demand | hard | true
                        These keywords are all equivalent, for
                        compatibility reasons.  The client certificate is
                        requested.  If no certificate is provided, or a bad
                        certificate is provided, the session is immediately
                        terminated.

                        Note that a valid client certificate is required in
                        order to use the SASL EXTERNAL authentication
                        mechanism with a TLS session.  As such, a non-
                        default TLSVerifyClient setting must be chosen to
                        enable SASL EXTERNAL authentication.

          TLSCRLCheck <level>
                 Specifies if the Certificate Revocation List (CRL) of the
                 CA should be used to verify if the client certificates
                 have not been revoked. This requires TLSCACertificatePath
                 parameter to be set. This directive is ignored with
                 GnuTLS.  <level> can be specified as one of the following
                 keywords:

                 none   No CRL checks are performed

                 peer   Check the CRL of the peer certificate

                 all    Check the CRL for a whole certificate chain

          TLSCRLFile <filename>
                 Specifies a file containing a Certificate Revocation List
                 to be used for verifying that certificates have not been
                 revoked. This directive is only valid when using GnuTLS.


---------------------------------------------------------------------------------------

::

          Options in this section only apply to the configuration file
          section of all instances of the specified backend.  All backends
          may support this class of options, but currently only back-mdb
          does.

          backend <databasetype>
                 Mark the beginning of a backend definition. <databasetype>
                 should be one of asyncmeta, config, dnssrv, ldap, ldif,
                 mdb, meta, monitor, null, passwd, perl, relay, sock, sql,
                 or wt.  At present, only back-mdb implements any options
                 of this type, so this setting is not needed for any other
                 backends.


-----------------------------------------------------------------------------------------

::

          Options in this section only apply to the configuration file
          section for the database in which they are defined.  They are
          supported by every type of backend.  Note that the database and
          at least one suffix option are mandatory for each database.

          database <databasetype>
                 Mark the beginning of a new database instance definition.
                 <databasetype> should be one of asyncmeta, config, dnssrv,
                 ldap, ldif, mdb, meta, monitor, null, passwd, perl, relay,
                 sock, sql, or wt, depending on which backend will serve
                 the database.

                 LDAP operations, even subtree searches, normally access
                 only one database.  That can be changed by gluing
                 databases together with the subordinate keyword.  Access
                 controls and some overlays can also involve multiple
                 databases.

          add_content_acl on | off
                 Controls whether Add operations will perform ACL checks on
                 the content of the entry being added. This check is off by
                 default. See the slapd.access(5) manual page for more
                 details on ACL requirements for Add operations.

          extra_attrs <attrlist>
                 Lists what attributes need to be added to search requests.
                 Local storage backends return the entire entry to the
                 frontend.  The frontend takes care of only returning the
                 requested attributes that are allowed by ACLs.  However,
                 features like access checking and so may need specific
                 attributes that are not automatically returned by remote
                 storage backends, like proxy backends and so on.
                 <attrlist> is a list of attributes that are needed for
                 internal purposes and thus always need to be collected,
                 even when not explicitly requested by clients.

          hidden on | off
                 Controls whether the database will be used to answer
                 queries. A database that is hidden will never be selected
                 to answer any queries, and any suffix configured on the
                 database will be ignored in checks for conflicts with
                 other databases. By default, hidden is off.

          lastmod on | off
                 Controls whether slapd will automatically maintain the
                 modifiersName, modifyTimestamp, creatorsName, and
                 createTimestamp attributes for entries. It also controls
                 the entryCSN and entryUUID attributes, which are needed by
                 the syncrepl provider. By default, lastmod is on.

          lastbind on | off
                 Controls whether slapd will automatically maintain the
                 pwdLastSuccess attribute for entries. By default, lastbind
                 is off.

          lastbind-precision <number>
                 If lastbind is enabled, a new value is written only if the
                 current one is more than number seconds in the past.

          limits <selector> <limit> [<limit> [...]]
                 Specify time and size limits based on the operation's
                 initiator or base DN.  The argument <selector> can be any
                 of

                        anonymous | users | [<dnspec>=]<pattern> |
                        group[/oc[/at]]=<pattern>

                 with

                        <dnspec> ::= dn[.<type>][.<style>]

                        <type>  ::= self | this

                        <style> ::= exact | base | onelevel | subtree |
                        children | regex | anonymous

                 DN type self is the default and means the bound user,
                 while this means the base DN of the operation.  The term
                 anonymous matches all unauthenticated clients.  The term
                 users matches all authenticated clients; otherwise an
                 exact dn pattern is assumed unless otherwise specified by
                 qualifying the (optional) key string dn with exact or base
                 (which are synonyms), to require an exact match; with
                 onelevel, to require exactly one level of depth match;
                 with subtree, to allow any level of depth match, including
                 the exact match; with children, to allow any level of
                 depth match, not including the exact match; regex
                 explicitly requires the (default) match based on POSIX
                 (''extended'') regular expression pattern.  Finally,
                 anonymous matches unbound operations; the pattern field is
                 ignored.  The same behavior is obtained by using the
                 anonymous form of the <selector> clause.  The term group,
                 with the optional objectClass oc and attributeType at
                 fields, followed by pattern, sets the limits for any DN
                 listed in the values of the at attribute (default member)
                 of the oc group objectClass (default groupOfNames) whose
                 DN exactly matches pattern.

                 The currently supported limits are size and time.

                 The syntax for time limits is
                 time[.{soft|hard}]=<integer>, where integer is the number
                 of seconds slapd will spend answering a search request.
                 If no time limit is explicitly requested by the client,
                 the soft limit is used; if the requested time limit
                 exceeds the hard limit, the value of the limit is used
                 instead.  If the hard limit is set to the keyword soft,
                 the soft limit is used in either case; if it is set to the
                 keyword unlimited, no hard limit is enforced.  Explicit
                 requests for time limits smaller or equal to the hard
                 limit are honored.  If no limit specifier is set, the
                 value is assigned to the soft limit, and the hard limit is
                 set to soft, to preserve the original behavior.

                 The syntax for size limits is
                 size[.{soft|hard|unchecked}]=<integer>, where integer is
                 the maximum number of entries slapd will return answering
                 a search request.  If no size limit is explicitly
                 requested by the client, the soft limit is used; if the
                 requested size limit exceeds the hard limit, the value of
                 the limit is used instead.  If the hard limit is set to
                 the keyword soft, the soft limit is used in either case;
                 if it is set to the keyword unlimited, no hard limit is
                 enforced.  Explicit requests for size limits smaller or
                 equal to the hard limit are honored.  The unchecked
                 specifier sets a limit on the number of candidates a
                 search request is allowed to examine.  The rationale
                 behind it is that searches for non-properly indexed
                 attributes may result in large sets of candidates, which
                 must be examined by slapd(8) to determine whether they
                 match the search filter or not.  The unchecked limit
                 provides a means to drop such operations before they are
                 even started.  If the selected candidates exceed the
                 unchecked limit, the search will abort with Unwilling to
                 perform.  If it is set to the keyword unlimited, no limit
                 is applied (the default).  If it is set to disabled, the
                 search is not even performed; this can be used to disallow
                 searches for a specific set of users.  If no limit
                 specifier is set, the value is assigned to the soft limit,
                 and the hard limit is set to soft, to preserve the
                 original behavior.

                 In case of no match, the global limits are used.  The
                 default values are the same as for sizelimit and
                 timelimit; no limit is set on unchecked.

                 If pagedResults control is requested, the hard size limit
                 is used by default, because the request of a specific page
                 size is considered an explicit request for a limitation on
                 the number of entries to be returned.  However, the size
                 limit applies to the total count of entries returned
                 within the search, and not to a single page.  Additional
                 size limits may be enforced; the syntax is
                 size.pr={<integer>|noEstimate|unlimited}, where integer is
                 the max page size if no explicit limit is set; the keyword
                 noEstimate inhibits the server from returning an estimate
                 of the total number of entries that might be returned
                 (note: the current implementation does not return any
                 estimate).  The keyword unlimited indicates that no limit
                 is applied to the pagedResults control page size.  The
                 syntax size.prtotal={<integer>|hard|unlimited|disabled}
                 allows one to set a limit on the total number of entries
                 that the pagedResults control will return.  By default it
                 is set to the hard limit which will use the size.hard
                 value.  When set, integer is the max number of entries
                 that the whole search with pagedResults control can
                 return.  Use unlimited to allow unlimited number of
                 entries to be returned, e.g. to allow the use of the
                 pagedResults control as a means to circumvent size
                 limitations on regular searches; the keyword disabled
                 disables the control, i.e. no paged results can be
                 returned.  Note that the total number of entries returned
                 when the pagedResults control is requested cannot exceed
                 the hard size limit of regular searches unless extended by
                 the prtotal switch.

                 The limits statement is typically used to let an unlimited
                 number of entries be returned by searches performed with
                 the identity used by the consumer for synchronization
                 purposes by means of the RFC 4533 LDAP Content
                 Synchronization protocol (see syncrepl for details).

                 When using subordinate databases, it is necessary for any
                 limits that are to be applied across the parent and its
                 subordinates to be defined in both the parent and its
                 subordinates. Otherwise the settings on the subordinate
                 databases are not honored.

          maxderefdepth <depth>
                 Specifies the maximum number of aliases to dereference
                 when trying to resolve an entry, used to avoid infinite
                 alias loops. The default is 15.

          multiprovider on | off
                 This option puts a consumer database into Multi-Provider
                 mode.  Update operations will be accepted from any user,
                 not just the updatedn.  The database must already be
                 configured as a syncrepl consumer before this keyword may
                 be set. This mode also requires a serverID (see above) to
                 be configured.  By default, multiprovider is off.

          monitoring on | off
                 This option enables database-specific monitoring in the
                 entry related to the current database in the
                 "cn=Databases,cn=Monitor" subtree of the monitor database,
                 if the monitor database is enabled.  Currently, only the
                 MDB database provides database-specific monitoring.  The
                 default depends on the backend type.

          overlay <overlay-name>
                 Add the specified overlay to this database. An overlay is
                 a piece of code that intercepts database operations in
                 order to extend or change them. Overlays are pushed onto a
                 stack over the database, and so they will execute in the
                 reverse of the order in which they were configured and the
                 database itself will receive control last of all. See the
                 slapd.overlays(5) manual page for an overview of the
                 available overlays.  Note that all of the database's
                 regular settings should be configured before any overlay
                 settings.

          readonly on | off
                 This option puts the database into "read-only" mode.  Any
                 attempts to modify the database will return an "unwilling
                 to perform" error.  By default, readonly is off.

          restrict <oplist>
                 Specify a whitespace separated list of operations that are
                 restricted.  If defined inside a database specification,
                 restrictions apply only to that database, otherwise they
                 are global.  Operations can be any of add, bind, compare,
                 delete, extended[=<OID>], modify, rename, search, or the
                 special pseudo-operations read and write, which
                 respectively summarize read and write operations.  The use
                 of restrict write is equivalent to readonly on (see
                 above).  The extended keyword allows one to indicate the
                 OID of the specific operation to be restricted.

          rootdn <dn>
                 Specify the distinguished name that is not subject to
                 access control or administrative limit restrictions for
                 operations on this database.  This DN may or may not be
                 associated with an entry.  An empty root DN (the default)
                 specifies no root access is to be granted.  It is
                 recommended that the rootdn only be specified when needed
                 (such as when initially populating a database).  If the
                 rootdn is within a namingContext (suffix) of the database,
                 a simple bind password may also be provided using the
                 rootpw directive. Many optional features, including
                 syncrepl, require the rootdn to be defined for the
                 database.

          rootpw <password>
                 Specify a password (or hash of the password) for the
                 rootdn.  The password can only be set if the rootdn is
                 within the namingContext (suffix) of the database.  This
                 option accepts all RFC 2307 userPassword formats known to
                 the server (see password-hash description) as well as
                 cleartext.  slappasswd(8) may be used to generate a hash
                 of a password.  Cleartext and {CRYPT} passwords are not
                 recommended.  If empty (the default), authentication of
                 the root DN is by other means (e.g. SASL).  Use of SASL is
                 encouraged.

          suffix <dn suffix>
                 Specify the DN suffix of queries that will be passed to
                 this backend database.  Multiple suffix lines can be given
                 and at least one is required for each database definition.

                 If the suffix of one database is "inside" that of another,
                 the database with the inner suffix must come first in the
                 configuration file.  You may also want to glue such
                 databases together with the subordinate keyword.

          subordinate [advertise]
                 Specify that the current backend database is a subordinate
                 of another backend database. A subordinate  database may
                 have only one suffix. This option may be used to glue
                 multiple databases into a single namingContext.  If the
                 suffix of the current database is within the namingContext
                 of a superior database, searches against the superior
                 database will be propagated to the subordinate as well.
                 All of the databases associated with a single
                 namingContext should have identical rootdns.  Behavior of
                 other LDAP operations is unaffected by this setting. In
                 particular, it is not possible to use moddn to move an
                 entry from one subordinate to another subordinate within
                 the namingContext.

                 If the optional advertise flag is supplied, the naming
                 context of this database is advertised in the root DSE.
                 The default is to hide this database context, so that only
                 the superior context is visible.

                 If the slap tools slapcat(8), slapadd(8), slapmodify(8),
                 or slapindex(8) are used on the superior database, any
                 glued subordinates that support these tools are opened as
                 well.

                 Databases that are glued together should usually be
                 configured with the same indices (assuming they support
                 indexing), even for attributes that only exist in some of
                 these databases. In general, all of the glued databases
                 should be configured as similarly as possible, since the
                 intent is to provide the appearance of a single directory.

                 Note that the subordinate functionality is implemented
                 internally by the glue overlay and as such its behavior
                 will interact with other overlays in use. By default, the
                 glue overlay is automatically configured as the last
                 overlay on the superior backend. Its position on the
                 backend can be explicitly configured by setting an overlay
                 glue directive at the desired position. This explicit
                 configuration is necessary e.g.  when using the syncprov
                 overlay, which needs to follow glue in order to work over
                 all of the glued databases. E.g.
                      database mdb
                      suffix dc=example,dc=com
                      ...
                      overlay glue
                      overlay syncprov

          sync_use_subentry
                 Store the syncrepl contextCSN in a subentry instead of the
                 context entry of the database. The subentry's RDN will be
                 "cn=ldapsync". By default the contextCSN is stored in the
                 context entry.

          syncrepl rid=<replica ID> provider=ldap[s]://<hostname>[:port]
                 searchbase=<base DN> [type=refreshOnly|refreshAndPersist]
                 [interval=dd:hh:mm:ss] [retry=[<retry interval> <# of
                 retries>]+] [filter=<filter str>]
                 [scope=sub|one|base|subord] [attrs=<attr list>]
                 [exattrs=<attr list>] [attrsonly] [sizelimit=<limit>]
                 [timelimit=<limit>] [schemachecking=on|off]
                 [network-timeout=<seconds>] [timeout=<seconds>]
                 [tcp-user-timeout=<milliseconds>] [bindmethod=simple|sasl]
                 [binddn=<dn>] [saslmech=<mech>] [authcid=<identity>]
                 [authzid=<identity>] [credentials=<passwd>]
                 [realm=<realm>] [secprops=<properties>]
                 [keepalive=<idle>:<probes>:<interval>]
                 [starttls=yes|critical] [tls_cert=<file>] [tls_key=<file>]
                 [tls_cacert=<file>] [tls_cacertdir=<path>]
                 [tls_reqcert=never|allow|try|demand]
                 [tls_reqsan=never|allow|try|demand]
                 [tls_cipher_suite=<ciphers>] [tls_ecname=<names>]
                 [tls_crlcheck=none|peer|all]
                 [tls_protocol_min=<major>[.<minor>]] [suffixmassage=<real
                 DN>] [logbase=<base DN>] [logfilter=<filter str>]
                 [syncdata=default|accesslog|changelog] [lazycommit]
                 Specify the current database as a consumer which is kept
                 up-to-date with the provider content by establishing the
                 current slapd(8) as a replication consumer site running a
                 syncrepl replication engine.  The consumer content is kept
                 synchronized to the provider content using the LDAP
                 Content Synchronization protocol. Refer to the "OpenLDAP
                 Administrator's Guide" for detailed information on setting
                 up a replicated slapd directory service using the syncrepl
                 replication engine.

                 rid identifies the current syncrepl directive within the
                 replication consumer site.  It is a non-negative integer
                 not greater than 999 (limited to three decimal digits).

                 provider specifies the replication provider site
                 containing the provider content as an LDAP URI. If <port>
                 is not given, the standard LDAP port number (389 or 636)
                 is used.

                 The content of the syncrepl consumer is defined using a
                 search specification as its result set. The consumer slapd
                 will send search requests to the provider slapd according
                 to the search specification. The search specification
                 includes searchbase, scope, filter, attrs, attrsonly,
                 sizelimit, and timelimit parameters as in the normal
                 search specification. The exattrs option may also be used
                 to specify attributes that should be omitted from incoming
                 entries.  The scope defaults to sub, the filter defaults
                 to (objectclass=*), and there is no default searchbase.
                 The attrs list defaults to "*,+" to return all user and
                 operational attributes, and attrsonly and exattrs are
                 unset by default.  The sizelimit and timelimit only accept
                 "unlimited" and positive integers, and both default to
                 "unlimited".  The sizelimit and timelimit parameters
                 define a consumer requested limitation on the number of
                 entries that can be returned by the LDAP Content
                 Synchronization operation; as such, it is intended to
                 implement partial replication based on the size of the
                 replicated database and on the time required by the
                 synchronization.  Note, however, that any provider-side
                 limits for the replication identity will be enforced by
                 the provider regardless of the limits requested by the
                 LDAP Content Synchronization operation, much like for any
                 other search operation.

                 The LDAP Content Synchronization protocol has two
                 operation types.  In the refreshOnly operation, the next
                 synchronization search operation is periodically
                 rescheduled at an interval time (specified by interval
                 parameter; 1 day by default) after each synchronization
                 operation finishes.  In the refreshAndPersist operation, a
                 synchronization search remains persistent in the provider
                 slapd.  Further updates to the provider will generate
                 searchResultEntry to the consumer slapd as the search
                 responses to the persistent synchronization search. If the
                 initial search fails due to an error, the next
                 synchronization search operation is periodically
                 rescheduled at an interval time (specified by interval
                 parameter; 1 day by default)

                 If an error occurs during replication, the consumer will
                 attempt to reconnect according to the retry parameter
                 which is a list of the <retry interval> and <# of retries>
                 pairs.  For example, retry="60 10 300 3" lets the consumer
                 retry every 60 seconds for the first 10 times and then
                 retry every 300 seconds for the next 3 times before stop
                 retrying. The `+' in <# of retries> means indefinite
                 number of retries until success.  If no retry is
                 specified, by default syncrepl retries every hour forever.

                 The schema checking can be enforced at the LDAP Sync
                 consumer site by turning on the schemachecking parameter.
                 The default is off.  Schema checking on means that
                 replicated entries must have a structural objectClass,
                 must obey to objectClass requirements in terms of
                 required/allowed attributes, and that naming attributes
                 and distinguished values must be present.  As a
                 consequence, schema checking should be off when partial
                 replication is used.

                 The network-timeout parameter sets how long the consumer
                 will wait to establish a network connection to the
                 provider. Once a connection is established, the timeout
                 parameter determines how long the consumer will wait for
                 the initial Bind request to complete. The defaults for
                 these parameters come from ldap.conf(5).  The
                 tcp-user-timeout parameter, if non-zero, corresponds to
                 the TCP_USER_TIMEOUT set on the target connections,
                 overriding the operating system setting.  Only some
                 systems support the customization of this parameter, it is
                 ignored otherwise and system-wide settings are used.

                 A bindmethod of simple requires the options binddn and
                 credentials and should only be used when adequate security
                 services (e.g. TLS or IPSEC) are in place.  REMEMBER:
                 simple bind credentials must be in cleartext!  A
                 bindmethod of sasl requires the option saslmech.
                 Depending on the mechanism, an authentication identity
                 and/or credentials can be specified using authcid and
                 credentials.  The authzid parameter may be used to specify
                 an authorization identity.  Specific security properties
                 (as with the sasl-secprops keyword above) for a SASL bind
                 can be set with the secprops option. A non default SASL
                 realm can be set with the realm option.  The identity used
                 for synchronization by the consumer should be allowed to
                 receive an unlimited number of entries in response to a
                 search request.  The provider, other than allowing
                 authentication of the syncrepl identity, should grant that
                 identity appropriate access privileges to the data that is
                 being replicated (access directive), and appropriate time
                 and size limits.  This can be accomplished by either
                 allowing unlimited sizelimit and timelimit, or by setting
                 an appropriate limits statement in the consumer's
                 configuration (see sizelimit and limits for details).

                 The keepalive parameter sets the values of idle, probes,
                 and interval used to check whether a socket is alive; idle
                 is the number of seconds a connection needs to remain idle
                 before TCP starts sending keepalive probes; probes is the
                 maximum number of keepalive probes TCP should send before
                 dropping the connection; interval is interval in seconds
                 between individual keepalive probes.  Only some systems
                 support the customization of these values; the keepalive
                 parameter is ignored otherwise, and system-wide settings
                 are used.

                 The starttls parameter specifies use of the StartTLS
                 extended operation to establish a TLS session before
                 Binding to the provider. If the critical argument is
                 supplied, the session will be aborted if the StartTLS
                 request fails. Otherwise the syncrepl session continues
                 without TLS. The tls_reqcert setting defaults to "demand",
                 the tls_reqsan setting defaults to "allow", and the other
                 TLS settings default to the same as the main slapd TLS
                 settings.

                 The suffixmassage parameter allows the consumer to pull
                 entries from a remote directory whose DN suffix differs
                 from the local directory. The portion of the remote
                 entries' DNs that matches the searchbase will be replaced
                 with the suffixmassage DN.

                 Rather than replicating whole entries, the consumer can
                 query logs of data modifications. This mode of operation
                 is referred to as delta syncrepl. In addition to the above
                 parameters, the logbase and logfilter parameters must be
                 set appropriately for the log that will be used. The
                 syncdata parameter must be set to either "accesslog" if
                 the log conforms to the slapo-accesslog(5) log format, or
                 "changelog" if the log conforms to the obsolete changelog
                 format. If the syncdata parameter is omitted or set to
                 "default" then the log parameters are ignored.

                 The lazycommit parameter tells the underlying database
                 that it can store changes without performing a full flush
                 after each change. This may improve performance for the
                 consumer, while sacrificing safety or durability.

          updatedn <dn>
                 This option is only applicable in a replica database.  It
                 specifies the DN permitted to update (subject to access
                 controls) the replica.  It is only needed in certain push-
                 mode replication scenarios.  Generally, this DN should not
                 be the same as the rootdn used at the provider.

          updateref <url>
                 Specify the referral to pass back when slapd(8) is asked
                 to modify a replicated local database.  If specified
                 multiple times, each url is provided.


-------------------------------------------------------------------------------------------

::

          Each database may allow specific configuration options; they are
          documented separately in the backends' manual pages. See the
          slapd.backends(5) manual page for an overview of available
          backends.


---------------------------------------------------------

::

          Here is a short example of a configuration file:

                 include   SYSCONFDIR/schema/core.schema
                 pidfile   LOCALSTATEDIR/run/slapd.pid

                 # Subtypes of "name" (e.g. "cn" and "ou") with the
                 # option ";x-hidden" can be searched for/compared,
                 # but are not shown.  See slapd.access(5).
                 attributeoptions x-hidden lang-
                 access to attrs=name;x-hidden by * =cs

                 # Protect passwords.  See slapd.access(5).
                 access    to attrs=userPassword  by * auth
                 # Read access to other attributes and entries.
                 access    to *  by * read

                 database  mdb
                 suffix    "dc=our-domain,dc=com"
                 # The database directory MUST exist prior to
                 # running slapd AND should only be accessible
                 # by the slapd/tools. Mode 0700 recommended.
                 directory LOCALSTATEDIR/openldap-data
                 # Indices to maintain
                 index     objectClass  eq
                 index     cn,sn,mail   pres,eq,approx,sub

                 # We serve small clients that do not handle referrals,
                 # so handle remote lookups on their behalf.
                 database  ldap
                 suffix    ""
                 uri       ldap://ldap.some-server.com/
                 lastmod   off

          "OpenLDAP Administrator's Guide" contains a longer annotated
          example of a configuration file.  The original ETCDIR/slapd.conf
          is another example.


---------------------------------------------------

::

          ETCDIR/slapd.conf
                 default slapd configuration file


---------------------------------------------------------

::

          ldap(3), gnutls-cli(1), slapd-config(5), slapd.access(5),
          slapd.backends(5), slapd.overlays(5), slapd.plugin(5), slapd(8),
          slapacl(8), slapadd(8), slapauth(8), slapcat(8), slapdn(8),
          slapindex(8), slapmodify(8), slappasswd(8), slaptest(8).

          "OpenLDAP Administrator's Guide"
          (http://www.OpenLDAP.org/doc/admin/)


-------------------------------------------------------------------------

::

          OpenLDAP Software is developed and maintained by The OpenLDAP
          Project <http://www.openldap.org/>.  OpenLDAP Software is derived
          from the University of Michigan LDAP 3.3 Release.

COLOPHON
---------------------------------------------------------

::

          This page is part of the OpenLDAP (an open source implementation
          of the Lightweight Directory Access Protocol) project.
          Information about the project can be found at 
          ⟨http://www.openldap.org/⟩.  If you have a bug report for this
          manual page, see ⟨http://www.openldap.org/its/⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://git.openldap.org/openldap/openldap.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   OpenLDAP LDVERSION             RELEASEDATE                 SLAPD.CONF(5)

--------------

Pages that refer to this page:
`lloadd.conf(5) <../man5/lloadd.conf.5.html>`__, 
`slapd.access(5) <../man5/slapd.access.5.html>`__, 
`slapd-asyncmeta(5) <../man5/slapd-asyncmeta.5.html>`__, 
`slapd.backends(5) <../man5/slapd.backends.5.html>`__, 
`slapd-config(5) <../man5/slapd-config.5.html>`__, 
`slapd-dnssrv(5) <../man5/slapd-dnssrv.5.html>`__, 
`slapd-ldap(5) <../man5/slapd-ldap.5.html>`__, 
`slapd-ldif(5) <../man5/slapd-ldif.5.html>`__, 
`slapd-mdb(5) <../man5/slapd-mdb.5.html>`__, 
`slapd-meta(5) <../man5/slapd-meta.5.html>`__, 
`slapd-monitor(5) <../man5/slapd-monitor.5.html>`__, 
`slapd-null(5) <../man5/slapd-null.5.html>`__, 
`slapd.overlays(5) <../man5/slapd.overlays.5.html>`__, 
`slapd-passwd(5) <../man5/slapd-passwd.5.html>`__, 
`slapd-perl(5) <../man5/slapd-perl.5.html>`__, 
`slapd.plugin(5) <../man5/slapd.plugin.5.html>`__, 
`slapd-relay(5) <../man5/slapd-relay.5.html>`__, 
`slapd-sock(5) <../man5/slapd-sock.5.html>`__, 
`slapd-sql(5) <../man5/slapd-sql.5.html>`__, 
`slapd-wt(5) <../man5/slapd-wt.5.html>`__, 
`slapo-accesslog(5) <../man5/slapo-accesslog.5.html>`__, 
`slapo-auditlog(5) <../man5/slapo-auditlog.5.html>`__, 
`slapo-autoca(5) <../man5/slapo-autoca.5.html>`__, 
`slapo-chain(5) <../man5/slapo-chain.5.html>`__, 
`slapo-collect(5) <../man5/slapo-collect.5.html>`__, 
`slapo-constraint(5) <../man5/slapo-constraint.5.html>`__, 
`slapo-dds(5) <../man5/slapo-dds.5.html>`__, 
`slapo-deref(5) <../man5/slapo-deref.5.html>`__, 
`slapo-dyngroup(5) <../man5/slapo-dyngroup.5.html>`__, 
`slapo-dynlist(5) <../man5/slapo-dynlist.5.html>`__, 
`slapo-homedir(5) <../man5/slapo-homedir.5.html>`__, 
`slapo-memberof(5) <../man5/slapo-memberof.5.html>`__, 
`slapo-pbind(5) <../man5/slapo-pbind.5.html>`__, 
`slapo-pcache(5) <../man5/slapo-pcache.5.html>`__, 
`slapo-ppolicy(5) <../man5/slapo-ppolicy.5.html>`__, 
`slapo-refint(5) <../man5/slapo-refint.5.html>`__, 
`slapo-remoteauth(5) <../man5/slapo-remoteauth.5.html>`__, 
`slapo-retcode(5) <../man5/slapo-retcode.5.html>`__, 
`slapo-rwm(5) <../man5/slapo-rwm.5.html>`__, 
`slapo-sssvlv(5) <../man5/slapo-sssvlv.5.html>`__, 
`slapo-syncprov(5) <../man5/slapo-syncprov.5.html>`__, 
`slapo-translucent(5) <../man5/slapo-translucent.5.html>`__, 
`slapo-unique(5) <../man5/slapo-unique.5.html>`__, 
`slapo-valsort(5) <../man5/slapo-valsort.5.html>`__, 
`slappw-argon2(5) <../man5/slappw-argon2.5.html>`__, 
`slapacl(8) <../man8/slapacl.8.html>`__, 
`slapadd(8) <../man8/slapadd.8.html>`__, 
`slapauth(8) <../man8/slapauth.8.html>`__, 
`slapcat(8) <../man8/slapcat.8.html>`__, 
`slapd(8) <../man8/slapd.8.html>`__, 
`slapdn(8) <../man8/slapdn.8.html>`__, 
`slapindex(8) <../man8/slapindex.8.html>`__, 
`slapmodify(8) <../man8/slapmodify.8.html>`__, 
`slappasswd(8) <../man8/slappasswd.8.html>`__, 
`slapschema(8) <../man8/slapschema.8.html>`__, 
`slaptest(8) <../man8/slaptest.8.html>`__

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
