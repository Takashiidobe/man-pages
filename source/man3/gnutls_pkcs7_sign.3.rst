.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_pkcs7_sign(3) — Linux manual page
========================================

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

   gnutls_pkcs7_sign(3)             gnutls             gnutls_pkcs7_sign(3)

NAME
-------------------------------------------------

::

          gnutls_pkcs7_sign - API function


---------------------------------------------------------

::

          #include <gnutls/pkcs7.h>

          int gnutls_pkcs7_sign(gnutls_pkcs7_t pkcs7, gnutls_x509_crt_t
          signer, gnutls_privkey_t signer_key, const gnutls_datum_t * data,
          gnutls_pkcs7_attrs_t signed_attrs, gnutls_pkcs7_attrs_t
          unsigned_attrs, gnutls_digest_algorithm_t dig, unsigned flags);


-----------------------------------------------------------

::

          gnutls_pkcs7_t pkcs7
                      should contain a gnutls_pkcs7_t type

          gnutls_x509_crt_t signer
                      the certificate to sign the structure

          gnutls_privkey_t signer_key
                      the key to sign the structure

          const gnutls_datum_t * data
                      The data to be signed or NULL if the data are already
                      embedded

          gnutls_pkcs7_attrs_t signed_attrs
                      Any additional attributes to be included in the
                      signed ones (or NULL)

          gnutls_pkcs7_attrs_t unsigned_attrs
                      Any additional attributes to be included in the
                      unsigned ones (or NULL)

          gnutls_digest_algorithm_t dig
                      The digest algorithm to use for signing

          unsigned flags
                      Should be zero or one of GNUTLS_PKCS7 flags


---------------------------------------------------------------

::

          This function will add a signature in the provided PKCS 7
          structure for the provided data. Multiple signatures can be made
          with different signers.

          The available flags are: GNUTLS_PKCS7_EMBED_DATA,
          GNUTLS_PKCS7_INCLUDE_TIME, GNUTLS_PKCS7_INCLUDE_CERT, and
          GNUTLS_PKCS7_WRITE_SPKI. They are explained in the
          gnutls_pkcs7_sign_flags definition.


-------------------------------------------------------

::

          On success, GNUTLS_E_SUCCESS (0) is returned, otherwise a
          negative error value.


---------------------------------------------------

::

          3.4.2


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

   gnutls                            3.7.2             gnutls_pkcs7_sign(3)

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
