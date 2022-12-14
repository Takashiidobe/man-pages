.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

danetool(1) — Linux manual page
===============================

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

   danetool(1)                   User Commands                  danetool(1)

NAME
-------------------------------------------------

::

          danetool - GnuTLS DANE tool


---------------------------------------------------------

::

          danetool [-flags] [-flag [value]] [--option-name[[=| ]value]]

          All arguments must be options.


---------------------------------------------------------------

::

          Tool to generate and check DNS resource records for the DANE
          protocol.


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

          --infile=file
                 Input file.

          --outfile=string
                 Output file.

          --load-pubkey=string
                 Loads a public key file.

                 This can be either a file or a PKCS #11 URL

          --load-certificate=string
                 Loads a certificate file.

                 This can be either a file or a PKCS #11 URL

          --dlv=string
                 Sets a DLV file.

                 This sets a DLV file to be used for DNSSEC verification.

          --hash=string
                 Hash algorithm to use for signing.

                 Available hash functions are SHA1, RMD160, SHA256, SHA384,
                 SHA512.

          --check=string
                 Check a host's DANE TLSA entry.

                 Obtains the DANE TLSA entry from the given hostname and
                 prints information. Note that the actual certificate of
                 the host can be provided using --load-certificate,
                 otherwise danetool will connect to the server to obtain
                 it. The exit code on verification success will be zero.

          --check-ee
                 Check only the end-entity's certificate.

                 Checks the end-entity's certificate only. Trust anchors or
                 CAs are not considered.

          --check-ca
                 Check only the CA's certificate.

                 Checks the trust anchor's and CA's certificate only. End-
                 entities are not considered.

          --tlsa-rr
                 Print the DANE RR data on a certificate or public key.
                 This option must appear in combination with the following
                 options: host.

                 This command prints the DANE RR data needed to enable DANE
                 on a DNS server.

          --host=hostname
                 Specify the hostname to be used in the DANE RR.

                 This command sets the hostname for the DANE RR.

          --proto=protocol
                 The protocol set for DANE data (tcp, udp etc.).

                 This command specifies the protocol for the service set in
                 the DANE data.

          --port=string
                 The port or service to connect to, for DANE data.

          --app-proto
                 This is an alias for the --starttls-proto option.

          --starttls-proto=string
                 The application protocol to be used to obtain the server's
                 certificate (https, ftp, smtp, imap, ldap, xmpp, lmtp,
                 pop3, nntp, sieve, postgres).

                 When the server's certificate isn't provided danetool will
                 connect to the server to obtain the certificate. In that
                 case it is required to know the protocol to talk with the
                 server prior to initiating the TLS handshake.

          --ca   Whether the provided certificate or public key is a
                 Certificate Authority.

                 Marks the DANE RR as a CA certificate if specified.

          --x509 Use the hash of the X.509 certificate, rather than the
                 public key.

                 This option forces the generated record to contain the
                 hash of the full X.509 certificate. By default only the
                 hash of the public key is used.

          --local
                 This is an alias for the --domain option.

          --domain, --no-domain
                 The provided certificate or public key is issued by the
                 local domain.  The no-domain form will disable the option.
                 This option is enabled by default.

                 DANE distinguishes certificates and public keys offered
                 via the DNSSEC to trusted and local entities. This flag
                 indicates that this is a domain-issued certificate,
                 meaning that there could be no CA involved.

          --local-dns, --no-local-dns
                 Use the local DNS server for DNSSEC resolving.  The
                 no-local-dns form will disable the option.

                 This option will use the local DNS server for DNSSEC.
                 This is disabled by default due to many servers not
                 allowing DNSSEC.

          --insecure
                 Do not verify any DNSSEC signature.

                 Ignores any DNSSEC signature verification results.

          --inder, --no-inder
                 Use DER format for input certificates and private keys.
                 The no-inder form will disable the option.

                 The input files will be assumed to be in DER or RAW
                 format.  Unlike options that in PEM input would allow
                 multiple input data (e.g. multiple certificates), when
                 reading in DER format a single data structure is read.

          --inraw
                 This is an alias for the --inder option.

          --print-raw, --no-print-raw
                 Print the received DANE data in raw format.  The
                 no-print-raw form will disable the option.

                 This option will print the received DANE data.

          --quiet
                 Suppress several informational messages.

                 In that case on the exit code can be used as an indication
                 of verification success

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

          DANE TLSA RR generation

          To create a DANE TLSA resource record for a certificate (or
          public key) that was issued localy and may or may not be signed
          by a CA use the following command.
              $ danetool --tlsa-rr --host www.example.com --load-certificate cert.pem

          To create a DANE TLSA resource record for a CA signed
          certificate, which will be marked as such use the following
          command.
              $ danetool --tlsa-rr --host www.example.com --load-certificate cert.pem   --no-domain

          The former is useful to add in your DNS entry even if your
          certificate is signed by a CA. That way even users who do not
          trust your CA will be able to verify your certificate using DANE.

          In order to create a record for the CA signer of your certificate
          use the following.
              $ danetool --tlsa-rr --host www.example.com --load-certificate cert.pem   --ca --no-domain

          To read a server's DANE TLSA entry, use:
              $ danetool --check www.example.com --proto tcp --port 443

          To verify an HTTPS server's DANE TLSA entry, use:
              $ danetool --check www.example.com --proto tcp --port 443 --load-certificate chain.pem

          To verify an SMTP server's DANE TLSA entry, use:
              $ danetool --check www.example.com --proto tcp --starttls-proto=smtp --load-certificate chain.pem


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

              certtool (1)


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

          This manual page was AutoGen-erated from the danetool option
          definitions.

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

   3.7.2                          29 May 2021                   danetool(1)

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
