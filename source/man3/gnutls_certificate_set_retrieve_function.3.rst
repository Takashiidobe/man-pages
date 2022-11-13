.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_certificate_set_retrieve_function(3) — Linux manual page
===============================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
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

   gnutls_certificate_set_retrieve_function(3)cate_set_retrieve_function(3)

NAME
-------------------------------------------------

::

          gnutls_certificate_set_retrieve_function - API function


---------------------------------------------------------

::

          #include <gnutls/gnutls.h>

          void
          gnutls_certificate_set_retrieve_function(gnutls_certificate_credentials_t
          cred, gnutls_certificate_retrieve_function * func);


-----------------------------------------------------------

::

          gnutls_certificate_credentials_t cred
                      is a gnutls_certificate_credentials_t type.

          gnutls_certificate_retrieve_function * func
                      is the callback function


---------------------------------------------------------------

::

          This function sets a callback to be called in order to retrieve
          the certificate to be used in the handshake. The callback will
          take control only if a certificate is requested by the peer. You
          are advised to use gnutls_certificate_set_retrieve_function2()
          because it is much more efficient in the processing it requires
          from gnutls.

          The callback's function prototype is: int
          (*callback)(gnutls_session_t, const gnutls_datum_t* req_ca_dn,
          int nreqs, const gnutls_pk_algorithm_t* pk_algos, int
          pk_algos_length, gnutls_retr2_st* st);

           req_ca_dn is only used in X.509 certificates.  Contains a list
          with the CA names that the server considers trusted.  This is a
          hint and typically the client should send a certificate that is
          signed by one of these CAs. These names, when available, are DER
          encoded. To get a more meaningful value use the function
          gnutls_x509_rdn_get().

           pk_algos contains a list with server's acceptable public key
          algorithms.  The certificate returned should support the server's
          given algorithms.

           st should contain the certificates and private keys.

          If the callback function is provided then gnutls will call it, in
          the handshake, after the certificate request message has been
          received.

          In server side pk_algos and req_ca_dn are NULL.

          The callback function should set the certificate list to be sent,
          and return 0 on success. If no certificate was selected then the
          number of certificates should be set to zero. The value (-1)
          indicates error and the handshake will be terminated. If both
          certificates are set in the credentials and a callback is
          available, the callback takes predence.


---------------------------------------------------

::

          3.0


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

   gnutls                       gnutl3s._7c.e2rtificate_set_retrieve_function(3)

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
