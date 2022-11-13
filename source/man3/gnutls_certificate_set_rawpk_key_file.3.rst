.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_certificate_set_rawpk_key_file(3) — Linux manual page
============================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURNS <#RETURNS>`__ \|         |                                   |
| `SINCE <#SINCE>`__ \|             |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `COPYRIGHT <#COPYRIGHT>`__ \|  |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   gnutls_certificate_set_rawpk_key_file(3)ertificate_set_rawpk_key_file(3)

NAME
-------------------------------------------------

::

          gnutls_certificate_set_rawpk_key_file - API function


---------------------------------------------------------

::

          #include <gnutls/gnutls.h>

          int
          gnutls_certificate_set_rawpk_key_file(gnutls_certificate_credentials_t
          cred, const char* rawpkfile, const char* privkeyfile,
          gnutls_x509_crt_fmt_t format, const char * pass, unsigned int
          key_usage, const char ** names, unsigned int names_length,
          unsigned int privkey_flags, unsigned int pkcs11_flags);


-----------------------------------------------------------

::

          gnutls_certificate_credentials_t cred
                      is a gnutls_certificate_credentials_t type.

          const char* rawpkfile
                      contains a raw public key in
                      PKIX.SubjectPublicKeyInfo format.

          const char* privkeyfile
                      contains a file path to a private key.

          gnutls_x509_crt_fmt_t format
                      encoding of the keys. DER or PEM.

          const char * pass
                      an optional password to unlock the private key
                      privkeyfile.

          unsigned int key_usage
                      an ORed sequence of GNUTLS_KEY_* flags.

          const char ** names
                      is an array of DNS names belonging to the public-key
                      (NULL if none).

          unsigned int names_length
                      holds the length of the names list.

          unsigned int privkey_flags
                      an ORed sequence of gnutls_pkcs_encrypt_flags_t.
                      These apply to the private key pkey.

          unsigned int pkcs11_flags
                      one of gnutls_pkcs11_obj_flags. These apply to URLs.


---------------------------------------------------------------

::

          This function sets a public/private keypair read from file in the
          gnutls_certificate_credentials_t type to be used for
          authentication and/or encryption.  spki and  privkey should match
          otherwise set signatures cannot be validated. In case of no match
          this function returns GNUTLS_E_CERTIFICATE_KEY_MISMATCH. This
          function should be called once for the client because there is
          currently no mechanism to determine which raw public-key to
          select for the peer when there are multiple present. Multiple raw
          public keys for the server can be distinghuished by setting the
          names .

          Note here that  spki is a raw public-key as defined in RFC7250.
          It means that there is no surrounding certificate that holds the
          public key and that there is therefore no direct mechanism to
          prove the authenticity of this key. The keypair can be used
          during a TLS handshake but its authenticity should be established
          via a different mechanism (e.g. TOFU or known fingerprint).

          The supported formats are basic unencrypted key, PKCS8, PKCS12,
          and the openssl format and will be autodetected.

          If the raw public-key and the private key are given in PEM
          encoding then the strings that hold their values must be null
          terminated.

          Key usage (as defined by X.509 extension (2.5.29.15)) can be
          explicitly set because there is no certificate structure around
          the key to define this value. See for more info
          gnutls_x509_crt_get_key_usage().

          Note that, this function by default returns zero on success and a
          negative value on error. Since 3.5.6, when the flag
          GNUTLS_CERTIFICATE_API_V2 is set using
          gnutls_certificate_set_flags() it returns an index (greater or
          equal to zero). That index can be used in other functions to
          refer to the added key-pair.


-------------------------------------------------------

::

          On success, GNUTLS_E_SUCCESS (0) is returned, in case the key
          pair does not match GNUTLS_E_CERTIFICATE_KEY_MISMATCH is
          returned, in other erroneous cases a different negative error
          code is returned.


---------------------------------------------------

::

          3.6.6


---------------------------------------------------------------------

::

          Report bugs to <bugs@gnutls.org>.
          Home page: https://www.gnutls.org


-----------------------------------------------------------

::

          Copyright © 2001- Free Software Foundation, Inc., and others.
          Copying and distribution of this file, with or without
          modification, are permitted in any medium without royalty
          provided the copyright notice and this notice are preserved.


---------------------------------------------------------

::

          The full documentation for gnutls is maintained as a Texinfo
          manual.  If the /usr/share/doc/gnutls/ directory does not contain
          the HTML form visit

          https://www.gnutls.org/manual/ 

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

   gnutls                          gn3u.t7l.s2_certificate_set_rawpk_key_file(3)

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
