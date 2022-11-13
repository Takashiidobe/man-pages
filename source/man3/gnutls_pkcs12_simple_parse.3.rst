.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_pkcs12_simple_parse(3) — Linux manual page
=================================================

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

   gnutls_pkcs12_simple_parse(3)    gnutls    gnutls_pkcs12_simple_parse(3)

NAME
-------------------------------------------------

::

          gnutls_pkcs12_simple_parse - API function


---------------------------------------------------------

::

          #include <gnutls/pkcs12.h>

          int gnutls_pkcs12_simple_parse(gnutls_pkcs12_t p12, const char *
          password, gnutls_x509_privkey_t * key, gnutls_x509_crt_t **
          chain, unsigned int * chain_len, gnutls_x509_crt_t **
          extra_certs, unsigned int * extra_certs_len, gnutls_x509_crl_t *
          crl, unsigned int flags);


-----------------------------------------------------------

::

          gnutls_pkcs12_t p12
                      A pkcs12 type

          const char * password
                      optional password used to decrypt the structure, bags
                      and keys.

          gnutls_x509_privkey_t * key
                      a structure to store the parsed private key.

          gnutls_x509_crt_t ** chain
                      the corresponding to key certificate chain (may be
                      NULL)

          unsigned int * chain_len
                      will be updated with the number of additional (may be
                      NULL)

          gnutls_x509_crt_t ** extra_certs
                      optional pointer to receive an array of additional
                      certificates found in the PKCS12 structure (may be
                      NULL).

          unsigned int * extra_certs_len
                      will be updated with the number of additional certs
                      (may be NULL).

          gnutls_x509_crl_t * crl
                      an optional structure to store the parsed CRL (may be
                      NULL).

          unsigned int flags
                      should be zero or one of GNUTLS_PKCS12_SP_*


---------------------------------------------------------------

::

          This function parses a PKCS12 structure in  pkcs12 and extracts
          the private key, the corresponding certificate chain, any
          additional certificates and a CRL. The structures in  key ,
          chain  crl , and  extra_certs must not be initialized.

          The  extra_certs and  extra_certs_len parameters are optional and
          both may be set to NULL. If either is non-NULL, then both must be
          set. The value for  extra_certs is allocated using
          gnutls_malloc().

          Encrypted PKCS12 bags and PKCS8 private keys are supported, but
          only with password based security and the same password for all
          operations.

          Note that a PKCS12 structure may contain many keys and/or
          certificates, and there is no way to identify which
          key/certificate pair you want.  For this reason this function is
          useful for PKCS12 files that contain only one key/certificate
          pair and/or one CRL.

          If the provided structure has encrypted fields but no password is
          provided then this function returns GNUTLS_E_DECRYPTION_FAILED.

          Note that normally the chain constructed does not include self
          signed certificates, to comply with TLS' requirements. If,
          however, the flag GNUTLS_PKCS12_SP_INCLUDE_SELF_SIGNED is
          specified then self signed certificates will be included in the
          chain.

          Prior to using this function the PKCS 12 structure integrity must
          be verified using gnutls_pkcs12_verify_mac().


-------------------------------------------------------

::

          On success, GNUTLS_E_SUCCESS (0) is returned, otherwise a
          negative error value.


---------------------------------------------------

::

          3.1.0


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

   gnutls                            3.7.2    gnutls_pkcs12_simple_parse(3)

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
