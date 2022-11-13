.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_certificate_set_ocsp_status_request_function2(3) — Linux manual page
===========================================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTE <#NOTE>`__ \|               |                                   |
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

   gnutls_certificate_set_ocsp_status_request_function2(3)uest_function2(3)

NAME
-------------------------------------------------

::

          gnutls_certificate_set_ocsp_status_request_function2 - API
          function


---------------------------------------------------------

::

          #include <gnutls/gnutls.h>

          int
          gnutls_certificate_set_ocsp_status_request_function2(gnutls_certificate_credentials_t
          sc, unsigned idx, gnutls_status_request_ocsp_func ocsp_func, void
          * ptr);


-----------------------------------------------------------

::

          gnutls_certificate_credentials_t sc
                      is a gnutls_certificate_credentials_t type.

          unsigned idx
                      is a certificate index as returned by
                      gnutls_certificate_set_key() and friends

          gnutls_status_request_ocsp_func ocsp_func
                      function pointer to OCSP status request callback.

          void * ptr  opaque pointer passed to callback function


---------------------------------------------------------------

::

          This function is to be used by server to register a callback to
          provide OCSP status requests that correspond to the indexed
          certificate chain from the client.  The callback will be invoked
          if the client supplied a status-request OCSP extension.

          The callback function prototype is:

          typedef int (*gnutls_status_request_ocsp_func) (gnutls_session_t
          session, void *ptr, gnutls_datum_t *ocsp_response);

          The callback will be invoked if the client requests an OCSP
          certificate status.  The callback may return
          GNUTLS_E_NO_CERTIFICATE_STATUS, if there is no recent OCSP
          response. If the callback returns GNUTLS_E_SUCCESS, it is
          expected to have the  ocsp_response field set with a valid
          (DER-encoded) OCSP response. The response must be a value
          allocated using gnutls_malloc(), and will be deinitialized by the
          caller.


-------------------------------------------------

::

          the ability to set multiple OCSP responses per credential
          structure via the index  idx was added in version 3.5.6. To keep
          backwards compatibility, it requires using
          gnutls_certificate_set_flags() with the GNUTLS_CERTIFICATE_API_V2
          flag to make the set certificate functions return an index usable
          by this function.


-------------------------------------------------------

::

          On success, GNUTLS_E_SUCCESS (0) is returned, otherwise a
          negative error code is returned.


---------------------------------------------------

::

          3.5.5


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

   gnutls           gnutls_certificat3e._7s.e2t_ocsp_status_request_function2(3)

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
