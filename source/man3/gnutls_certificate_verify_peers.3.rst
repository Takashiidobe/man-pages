.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_certificate_verify_peers(3) — Linux manual page
======================================================

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

   gnutls_certificate_verify_peers(3)nutlsnutls_certificate_verify_peers(3)

NAME
-------------------------------------------------

::

          gnutls_certificate_verify_peers - API function


---------------------------------------------------------

::

          #include <gnutls/gnutls.h>

          int gnutls_certificate_verify_peers(gnutls_session_t session,
          gnutls_typed_vdata_st * data, unsigned int elements, unsigned int
          * status);


-----------------------------------------------------------

::

          gnutls_session_t session
                      is a gnutls session

          gnutls_typed_vdata_st * data
                      an array of typed data

          unsigned int elements
                      the number of data elements

          unsigned int * status
                      is the output of the verification


---------------------------------------------------------------

::

          This function will verify the peer's certificate and store the
          the status in the  status variable as a bitwise OR of
          gnutls_certificate_status_t values or zero if the certificate is
          trusted. Note that value in  status is set only when the return
          value of this function is success (i.e, failure to trust a
          certificate does not imply a negative return value).  The default
          verification flags used by this function can be overridden using
          gnutls_certificate_set_verify_flags(). See the documentation of
          gnutls_certificate_verify_peers2() for details in the
          verification process.

          This function will take into account the stapled OCSP responses
          sent by the server, as well as the following X.509 certificate
          extensions: Name Constraints, Key Usage, and Basic Constraints
          (pathlen).

          The acceptable  data types are GNUTLS_DT_DNS_HOSTNAME,
          GNUTLS_DT_RFC822NAME and GNUTLS_DT_KEY_PURPOSE_OID.  The former
          two accept as data a null-terminated hostname or email address,
          and the latter a null-terminated object identifier (e.g.,
          GNUTLS_KP_TLS_WWW_SERVER).

          If a DNS hostname is provided then this function will compare the
          hostname in the certificate against the given. If names do not
          match the GNUTLS_CERT_UNEXPECTED_OWNER status flag will be set.
          If a key purpose OID is provided and the end-certificate contains
          the extended key usage PKIX extension, it will be required to be
          have the provided key purpose or be marked for any purpose,
          otherwise verification status will have the
          GNUTLS_CERT_SIGNER_CONSTRAINTS_FAILURE flag set.

          To avoid denial of service attacks some default upper limits
          regarding the certificate key size and chain size are set. To
          override them use gnutls_certificate_set_verify_limits().

          Note that when using raw public-keys verification will not work
          because there is no corresponding certificate body belonging to
          the raw key that can be verified. In that case this function will
          return GNUTLS_E_INVALID_REQUEST.


-------------------------------------------------------

::

          GNUTLS_E_SUCCESS (0) when the validation is performed, or a
          negative error code otherwise.  A successful error code means
          that the  status parameter must be checked to obtain the
          validation status.


---------------------------------------------------

::

          3.3.0


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

   gnutls                            3.7.2gnutls_certificate_verify_peers(3)

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
