.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls-cli-debug(1) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   gnutls-cli-debug(1)           User Commands          gnutls-cli-debug(1)

NAME
-------------------------------------------------

::

          gnutls-cli-debug - GnuTLS debug client


---------------------------------------------------------

::

          gnutls-cli-debug [-flags] [-flag [value]] [--option-name[[=|
          ]value]]

          Operands and options may be intermixed.  They will be reordered.


---------------------------------------------------------------

::

          TLS debug client. It sets up multiple TLS connections to a server
          and queries its capabilities. It was created to assist in
          debugging GnuTLS, but it might be useful to extract a TLS
          server's capabilities.  It connects to a TLS server, performs
          tests and print the server's capabilities. If called with the
          `-V' parameter more checks will be performed.  Can be used to
          check for servers with special needs or bugs.


-------------------------------------------------------

::

          -d number, --debug=number
                 Enable debugging.  This option takes an integer number as
                 its argument.  The value of number is constrained to
                 being:
                     in the range  0 through 9999

                 Specifies the debug level.

          -V, --verbose
                 More verbose output.  This option may appear an unlimited
                 number of times.

          -p number, --port=number
                 The port to connect to.  This option takes an integer
                 number as its argument.  The value of number is
                 constrained to being:
                     in the range  0 through 65536

          --app-proto
                 This is an alias for the --starttls-proto option.

          --starttls-proto=string
                 The application protocol to be used to obtain the server's
                 certificate (https, ftp, smtp, imap, ldap, xmpp, lmtp,
                 pop3, nntp, sieve, postgres).

                 Specify the application layer protocol for STARTTLS. If
                 the protocol is supported, gnutls-cli will proceed to the
                 TLS negotiation.

          -h, --help
                 Display usage information and exit.

          -!, --more-help
                 Pass the extended usage information through a pager.

          -v [{v|c|n --version [{v|c|n}]}]
                 Output version of program and exit.  The default mode is
                 `v', a simple version.  The `c' mode will print copyright
                 information and `n' will print the full copyright notice.


---------------------------------------------------------

::

              $ gnutls-cli-debug localhost
              GnuTLS debug client 3.5.0
              Checking localhost:443
                                           for SSL 3.0 (RFC6101) support... yes
                                      whether we need to disable TLS 1.2... no
                                      whether we need to disable TLS 1.1... no
                                      whether we need to disable TLS 1.0... no
                                      whether %NO_EXTENSIONS is required... no
                                             whether %COMPAT is required... no
                                           for TLS 1.0 (RFC2246) support... yes
                                           for TLS 1.1 (RFC4346) support... yes
                                           for TLS 1.2 (RFC5246) support... yes
                                                fallback from TLS 1.6 to... TLS1.2
                                      for RFC7507 inappropriate fallback... yes
                                                   for HTTPS server name... Local
                                             for certificate chain order... sorted
                                for safe renegotiation (RFC5746) support... yes
                                   for Safe renegotiation support (SCSV)... no
                                  for encrypt-then-MAC (RFC7366) support... no
                                 for ext master secret (RFC7627) support... no
                                         for heartbeat (RFC6520) support... no
                                     for version rollback bug in RSA PMS... dunno
                                for version rollback bug in Client Hello... no
                          whether the server ignores the RSA PMS version... yes
              whether small records (512 bytes) are tolerated on handshake... yes
                  whether cipher suites not in SSL 3.0 spec are accepted... yes
              whether a bogus TLS record version in the client hello is accepted... yes
                       whether the server understands TLS closure alerts... partially
                          whether the server supports session resumption... yes
                                    for anonymous authentication support... no
                                    for ephemeral Diffie-Hellman support... no
                                 for ephemeral EC Diffie-Hellman support... yes
                                  ephemeral EC Diffie-Hellman group info... SECP256R1
                                for AES-128-GCM cipher (RFC5288) support... yes
                                for AES-128-CCM cipher (RFC6655) support... no
                              for AES-128-CCM-8 cipher (RFC6655) support... no
                                for AES-128-CBC cipher (RFC3268) support... yes
                           for CAMELLIA-128-GCM cipher (RFC6367) support... no
                           for CAMELLIA-128-CBC cipher (RFC5932) support... no
                                   for 3DES-CBC cipher (RFC2246) support... yes
                                for ARCFOUR 128 cipher (RFC2246) support... yes
                                                     for MD5 MAC support... yes
                                                    for SHA1 MAC support... yes
                                                  for SHA256 MAC support... yes
                                            for ZLIB compression support... no
                                   for max record size (RFC6066) support... no
                              for OCSP status response (RFC6066) support... no
                            for OpenPGP authentication (RFC6091) support... no

          You could also use the client to debug services with starttls
          capability.
              $ gnutls-cli-debug --starttls-proto smtp --port 25 localhost


---------------------------------------------------------------

::

          One of the following exit values will be returned:

          0  (EXIT_SUCCESS)
                 Successful program execution.

          1  (EXIT_FAILURE)
                 The operation failed or the command syntax was not valid.

          70  (EX_SOFTWARE)
                 libopts had an internal operational error.  Please report
                 it to autogen-users@lists.sourceforge.net.  Thank you.


---------------------------------------------------------

::

          gnutls-cli(1), gnutls-serv(1)


-------------------------------------------------------

::

          Nikos Mavrogiannopoulos, Simon Josefsson and others; see
          /usr/share/doc/gnutls/AUTHORS for a complete list.


-----------------------------------------------------------

::

          Copyright (C) 2000-2020 Free Software Foundation, and others all
          rights reserved.  This program is released under the terms of the
          GNU General Public License, version 3 or later.


-------------------------------------------------

::

          Please send bug reports to: bugs@gnutls.org


---------------------------------------------------

::

          This manual page was AutoGen-erated from the gnutls-cli-debug
          option definitions.

COLOPHON
---------------------------------------------------------

::

          This page is part of the GnuTLS (GnuTLS Transport Layer Security
          Library) project.  Information about the project can be found at
          ⟨http://www.gnutls.org/⟩.  If you have a bug report for this
          manual page, send it to bugs@gnutls.org.  This page was obtained
          from the tarball gnutls-3.7.2.tar.xz fetched from
          ⟨http://www.gnutls.org/download.html⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   3.7.2                          29 May 2021           gnutls-cli-debug(1)

--------------

Pages that refer to this page:
`gnutls-cli(1) <../man1/gnutls-cli.1.html>`__, 
`gnutls-serv(1) <../man1/gnutls-serv.1.html>`__

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
