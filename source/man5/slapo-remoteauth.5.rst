.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapo-remoteauth(5) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `EXAMPLE <#EXAMPLE>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `Copyrights <#Copyrights>`__ \|   |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLAPO-REMOTEAUTH(5)        File Formats Manual       SLAPO-REMOTEAUTH(5)

NAME
-------------------------------------------------

::

          slapo-remoteauth - Delegate authentication requests to remote
          directories, e.g. Active Directory


---------------------------------------------------------

::

          ETCDIR/slapd.conf


---------------------------------------------------------------

::

          The remoteauth overlay to slapd(8) provides passthrough
          authentication to remote directory servers, e.g.  Active
          Directory, for LDAP simple bind operations. The local LDAP entry
          referenced in the bind operation is mapped to its counterpart in
          the remote directory. An LDAP bind operation is performed against
          the remote directory and results are returned based on those of
          the remote operation.

          A slapd server configured with the remoteauth overlay handles an
          authentication request based on the presence of userPassword in
          the local entry. If the userPassword is present, authentication
          is performed locally, otherwise the remoteauth overlay performs
          the authentication request to the configured remote directory
          server.


-------------------------------------------------------------------

::

          The following options can be applied to the remoteauth overlay
          within the slapd.conf file. All options should follow the overlay
          remoteauth directive.

          overlay remoteauth
                 This directive adds the remoteauth overlay to the current
                 database, see slapd.conf(5) for details.

          remoteauth_dn_attribute <dnattr>
                 Attribute in the local entry that is used to store the
                 bind DN to a remote directory server.

          remoteauth_mapping <domain> <hostname|LDAP
          URI|file:///path/to/list_of_hostnames>
                 For a non-Windows deployment, a domain can be considered
                 as a collection of one or more hosts to which slapd server
                 authentcates against on behalf of authenticating users.
                 For a given domain name, the mapping specifies the target
                 server(s), e.g., Active Directory domain controller(s), to
                 connect to via LDAP.  The second argument can be given
                 either as a hostname, an LDAP URI, or a file containing a
                 list of hostnames/URIs, one per line. The hostnames are
                 tried in sequence until the connection succeeds.

                 This option can be provided more than once to provide
                 mapping information for different domains. For example:

                     remoteauth_mapping americas file:///path/to/americas.domain.hosts
                     remoteauth_mapping asiapacific file:///path/to/asiapacific.domain.hosts
                     remoteauth_mapping emea emeadc1.emea.example.com

          remoteauth_domain_attribute <attr>
                 Attribute in the local entry that specifies the domain
                 name, any text after "\" or ":" is ignored.

          remoteauth_default_domain <default domain>
                 Default domain.

          remoteauth_default_realm <server>
                 Fallback server to connect to for domains not specified in
                 remoteauth_mapping.

          remoteauth_retry_count <num>
                 Number of connection retries attempted. Default is 3.

          remoteauth_store <on|off>
                 Whether to store the password in the local entry on
                 successful bind. Default is off.

          remoteauth_tls [starttls=yes] [tls_cert=<file>] [tls_key=<file>]
                 [tls_cacert=<file>] [tls_cacertdir=<path>]
                 [tls_reqcert=never|allow|try|demand]
                 [tls_reqsan=never|allow|try|demand]
                 [tls_cipher_suite=<ciphers>] [tls_ecname=<names>]
                 [tls_crlcheck=none|peer|all]
                 Remoteauth specific TLS configuration, see slapd.conf(5)
                 for more details on each of the parameters and defaults.

          remoteauth_tls_peerkey_hash <hostname> <hashname>:<base64 of
          public key hash>
                 Mapping between remote server hostnames and their public
                 key hashes. Only one mapping per hostname is supported and
                 if any pins are specified, all hosts need to be pinned. If
                 set, pinning is in effect regardless of whether or not
                 certificate name validation is enabled by tls_reqcert.


-------------------------------------------------------

::

          A typical example configuration of remoteauth overlay for AD is
          shown below (as a slapd.conf(5) snippet):

             database <database>
             #...

             overlay remoteauth
             remoteauth_dn_attribute seeAlso
             remoteauth_domain_attribute associatedDomain
             remoteauth_default_realm americas.example.com

             remoteauth_mapping americas file:///home/ldap/etc/remoteauth.americas
             remoteauth_mapping emea emeadc1.emea.example.com

             remoteauth_tls starttls=yes tls_reqcert=demand tls_cacert=/home/ldap/etc/example-ca.pem
             remoteauth_tls_peerkey_hash ldap.americas.tld sha256:Bxv3MkLoDm6gt/iDfeGNdNNqa5TTpPDdIwvZM/cIgeo=

          Where seeAlso contains the AD bind DN for the user,
          associatedDomain contains the Windows Domain Id in the form of
          <NT-domain-name>:<NT-username> in which anything following,
          including ":", is ignored.


---------------------------------------------------------

::

          slapd.conf(5), slapd(8).


-------------------------------------------------------------

::

          Copyright 2004-2021 The OpenLDAP Foundation.  Portions Copyright
          2004-2017 Howard Chu, Symas Corporation.  Portions Copyright
          2017-2021 Ondřej Kuzník, Symas Corporation.  Portions Copyright
          2004 Hewlett-Packard Company

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

   OpenLDAP LDVERSION             RELEASEDATE           SLAPO-REMOTEAUTH(5)

--------------

Pages that refer to this page:
`slapd.overlays(5) <../man5/slapd.overlays.5.html>`__

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
