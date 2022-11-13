.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_verify_stored_pubkey(3) — Linux manual page
==================================================

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

   gnutls_verify_stored_pubkey(3)   gnutls   gnutls_verify_stored_pubkey(3)

NAME
-------------------------------------------------

::

          gnutls_verify_stored_pubkey - API function


---------------------------------------------------------

::

          #include <gnutls/gnutls.h>

          int gnutls_verify_stored_pubkey(const char * db_name,
          gnutls_tdb_t tdb, const char * host, const char * service,
          gnutls_certificate_type_t cert_type, const gnutls_datum_t * cert,
          unsigned int flags);


-----------------------------------------------------------

::

          const char * db_name
                      A file specifying the stored keys (use NULL for the
                      default)

          gnutls_tdb_t tdb
                      A storage structure or NULL to use the default

          const char * host
                      The peer's name

          const char * service
                      non-NULL if this key is specific to a service (e.g.
                      http)

          gnutls_certificate_type_t cert_type
                      The type of the certificate

          const gnutls_datum_t * cert
                      The raw (der) data of the certificate

          unsigned int flags
                      should be 0.


---------------------------------------------------------------

::

          This function will try to verify a raw public-key or a public-key
          provided via a raw (DER-encoded) certificate using a list of
          stored public keys.  The  service field if non-NULL should be a
          port number.

          The  db_name variable if non-null specifies a custom backend for
          the retrieval of entries. If it is NULL then the default file
          backend will be used. In POSIX-like systems the file backend uses
          the $HOME/.gnutls/known_hosts file.

          Note that if the custom storage backend is provided the retrieval
          function should return GNUTLS_E_CERTIFICATE_KEY_MISMATCH if the
          host/service pair is found but key doesn't match,
          GNUTLS_E_NO_CERTIFICATE_FOUND if no such host/service with the
          given key is found, and 0 if it was found. The storage function
          should return 0 on success.

          As of GnuTLS 3.6.6 this function also verifies raw public keys.


-------------------------------------------------------

::

          If no associated public key is found then
          GNUTLS_E_NO_CERTIFICATE_FOUND will be returned. If a key is found
          but does not match GNUTLS_E_CERTIFICATE_KEY_MISMATCH is returned.
          On success, GNUTLS_E_SUCCESS (0) is returned, or a negative error
          value on other errors.


---------------------------------------------------

::

          3.0.13


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

   gnutls                            3.7.2   gnutls_verify_stored_pubkey(3)

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
