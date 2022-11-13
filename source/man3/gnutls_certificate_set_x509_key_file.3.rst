.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_certificate_set_x509_key_file(3) — Linux manual page
===========================================================

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

   gnutls_certificate_set_x509_key_file(3)_certificate_set_x509_key_file(3)

NAME
-------------------------------------------------

::

          gnutls_certificate_set_x509_key_file - API function


---------------------------------------------------------

::

          #include <gnutls/gnutls.h>

          int
          gnutls_certificate_set_x509_key_file(gnutls_certificate_credentials_t
          res, const char * certfile, const char * keyfile,
          gnutls_x509_crt_fmt_t type);


-----------------------------------------------------------

::

          gnutls_certificate_credentials_t res
                      is a gnutls_certificate_credentials_t type.

          const char * certfile
                      is a file that containing the certificate list (path)
                      for the specified private key, in PKCS7 format, or a
                      list of certificates

          const char * keyfile
                      is a file that contains the private key

          gnutls_x509_crt_fmt_t type
                      is PEM or DER


---------------------------------------------------------------

::

          This function sets a certificate/private key pair in the
          gnutls_certificate_credentials_t type.  This function may be
          called more than once, in case multiple keys/certificates exist
          for the server.  For clients that need to send more than its own
          end entity certificate, e.g., also an intermediate CA cert, then
          the
           certfile must contain the ordered certificate chain.

          Note that the names in the certificate provided will be
          considered when selecting the appropriate certificate to use (in
          case of multiple certificate/key pairs).

          This function can also accept URLs at  keyfile and  certfile . In
          that case it will use the private key and certificate indicated
          by the URLs. Note that the supported URLs are the ones indicated
          by gnutls_url_is_supported().

          In case the  certfile is provided as a PKCS 11 URL, then the
          certificate, and its present issuers in the token are imported
          (i.e., forming the required trust chain).

          If that function fails to load the  res structure is at an
          undefined state, it must not be reused to load other keys or
          certificates.

          Note that, this function by default returns zero on success and a
          negative value on error.  Since 3.5.6, when the flag
          GNUTLS_CERTIFICATE_API_V2 is set using
          gnutls_certificate_set_flags() it returns an index (greater or
          equal to zero). That index can be used to other functions to
          refer to the added key-pair.


-------------------------------------------------------

::

          On success this functions returns zero, and otherwise a negative
          value on error (see above for modifying that behavior).


---------------------------------------------------

::

          3.1.11


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

   gnutls                           g3n.u7t.l2s_certificate_set_x509_key_file(3)

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
