.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_x509_crt_get_issuer_alt_name(3) — Linux manual page
==========================================================

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

   gnutls_x509_crt_get_issuer_alt_name(3)ss_x509_crt_get_issuer_alt_name(3)

NAME
-------------------------------------------------

::

          gnutls_x509_crt_get_issuer_alt_name - API function


---------------------------------------------------------

::

          #include <gnutls/x509.h>

          int gnutls_x509_crt_get_issuer_alt_name(gnutls_x509_crt_t cert,
          unsigned int seq, void * ian, size_t * ian_size, unsigned int *
          critical);


-----------------------------------------------------------

::

          gnutls_x509_crt_t cert
                      should contain a gnutls_x509_crt_t type

          unsigned int seq
                      specifies the sequence number of the alt name (0 for
                      the first one, 1 for the second etc.)

          void * ian  is the place where the alternative name will be
                      copied to

          size_t * ian_size
                      holds the size of ian.

          unsigned int * critical
                      will be non-zero if the extension is marked as
                      critical (may be null)


---------------------------------------------------------------

::

          This function retrieves the Issuer Alternative Name (2.5.29.18),
          contained in the given certificate in the X509v3 Certificate
          Extensions.

          When the SAN type is otherName, it will extract the data in the
          otherName's value field, and GNUTLS_SAN_OTHERNAME is returned.
          You may use gnutls_x509_crt_get_subject_alt_othername_oid() to
          get the corresponding OID and the "virtual" SAN types (e.g.,
          GNUTLS_SAN_OTHERNAME_XMPP).

          If an otherName OID is known, the data will be decoded.
          Otherwise the returned data will be DER encoded, and you will
          have to decode it yourself.  Currently, only the RFC 3920
          id-on-xmppAddr Issuer AltName is recognized.


-------------------------------------------------------

::

          the alternative issuer name type on success, one of the
          enumerated gnutls_x509_subject_alt_name_t.  It will return
          GNUTLS_E_SHORT_MEMORY_BUFFER if  ian_size is not large enough to
          hold the value.  In that case  ian_size will be updated with the
          required size.  If the certificate does not have an Alternative
          name with the specified sequence number then
          GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE is returned.


---------------------------------------------------

::

          2.10.0


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

   gnutls                            3g.n7u.t2ls_x509_crt_get_issuer_alt_name(3)

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
