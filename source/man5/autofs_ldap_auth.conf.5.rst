.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

autofs_ldap_auth.conf(5) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   AUTOFS_LDAP_AUTH.CONF(5)   File Formats Manual  AUTOFS_LDAP_AUTH.CONF(5)

NAME
-------------------------------------------------

::

          autofs_ldap_auth.conf - autofs LDAP authentication configuration


---------------------------------------------------------------

::

          LDAP authenticated binds, TLS encrypted connections and
          certification may be used by setting appropriate values in the
          autofs authentication configuration file and configuring the LDAP
          client with appropriate settings.  The default location of this
          file is @mapdir@/autofs_ldap_auth.conf.  If this file exists it
          will be used to establish whether TLS or authentication should be
          used.

          An example of this file is:

            <?xml version="1.0" ?>
            <autofs_ldap_sasl_conf
                    usetls="yes"
                    tlsrequired="no"
                    authrequired="no"
                    authtype="DIGEST-MD5"
                    user="xyz"
                    secret="abc"
            />

          If TLS encryption is to be used the location of the Certificate
          Authority certificate must be set within the LDAP client
          configuration in order to validate the server certificate. If, in
          addition, a certified connection is to be used then the client
          certificate and private key file locations must also be
          configured within the LDAP client.


-------------------------------------------------------

::

          This files contains a single XML element, as shown in the example
          above, with several attributes.

          The possible attributes are:

          usetls="yes"|"no"
                 Determines whether an encrypted connection to the ldap
                 server should be attempted.

          tlsrequired="yes"|"no"
                 This flag tells whether the ldap connection must be
                 encrypted. If set to "yes", the automounter will fail to
                 start if an encrypted connection cannot be established.

          authrequired="yes"|"no"|"autodetect"|"simple"
                 This option tells whether an authenticated connection to
                 the ldap server is required in order to perform ldap
                 queries. If the flag is set to yes, only sasl
                 authenticated connections will be allowed. If it is set to
                 no then authentication is not needed for ldap server
                 connections. If it is set to autodetect then the ldap
                 server will be queried to establish a suitable sasl
                 authentication mechanism. If no suitable mechanism can be
                 found, connections to the ldap server are made without
                 authentication. Finally, if it is set to simple, then
                 simple authentication will be used instead of SASL.

          authtype="GSSAPI"|"LOGIN"|"PLAIN"|"ANONYMOUS"|"DIGEST-
          MD5|EXTERNAL"
                 This attribute can be used to specify a preferred
                 authentication mechanism.  In normal operations, the
                 automounter will attempt to authenticate to the ldap
                 server using the list of supportedSASLmechanisms obtained
                 from the directory server.  Explicitly setting the
                 authtype will bypass this selection and only try the
                 mechanism specified. The EXTERNAL mechanism may be used to
                 authenticate using a client certificate and requires that
                 authrequired set to "yes" if using SSL or usetls,
                 tlsrequired and authrequired all set to "yes" if using
                 TLS, in addition to authtype being set to EXTERNAL.

                 If using authtype EXTERNAL two additional configuration
                 entries are required:

                 external_cert="<client certificate path>"

                 This specifies the path of the file containing the client
                 certificate.

                 external_key="<client certificate key path>"

                 This specifies the path of the file containing the client
                 certificate key.

                 These two configuration entries are mandatory when using
                 the EXTERNAL method as the HOME environment variable
                 cannot be assumed to be set or, if it is, to be set to the
                 location we expect.

          user="<username>"
                 This attribute holds the authentication identity used by
                 authentication mechanisms that require it.  Legal values
                 for this attribute include any printable characters that
                 can be used by the selected authentication mechanism.

          secret="<password>"
                 This attribute holds the secret used by authentication
                 mechanisms that require it. Legal values for this
                 attribute include any printable characters that can be
                 used by the selected authentication mechanism.

          encoded_secret="<base64 encoded password>"
                 This attribute holds the base64 encoded secret used by
                 authentication mechanisms that require it. If this entry
                 is present as well as the secret entry this value will
                 take precedence.

          clientprinc="<GSSAPI client principal>"
                 When using GSSAPI authentication, this attribute is
                 consulted to determine the principal name to use when
                 authenticating to the directory server. By default, this
                 will be set to "autofsclient/<fqdn>@<REALM>.

          credentialcache="<external credential cache path>"
                 When using GSSAPI authentication, this attribute can be
                 used to specify an externally configured credential cache
                 that is used during authentication.  By default, autofs
                 will setup a memory based credential cache.


---------------------------------------------------------

::

          auto.master(5), autofs.conf(5).


-----------------------------------------------------

::

          This manual page was written by Ian Kent <raven@themaw.net>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the autofs (automount) project.  Information
          about the project can be found at ⟨http://www.autofs.org/⟩.  If
          you have a bug report for this manual page, send it to
          autofs@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-07-07.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                  19 Feb 2010      AUTOFS_LDAP_AUTH.CONF(5)

--------------

Pages that refer to this page: `autofs(5) <../man5/autofs.5.html>`__, 
`autofs.conf(5) <../man5/autofs.conf.5.html>`__, 
`auto.master(5) <../man5/auto.master.5.html>`__, 
`autofs(8) <../man8/autofs.8.html>`__, 
`automount(8) <../man8/automount.8.html>`__

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
