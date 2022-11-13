.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_certificate_get_x509_crt(3) — Linux manual page
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

   gnutls_certificate_get_x509_crt(3)nutlsnutls_certificate_get_x509_crt(3)

NAME
-------------------------------------------------

::

          gnutls_certificate_get_x509_crt - API function


---------------------------------------------------------

::

          #include <gnutls/gnutls.h>

          int
          gnutls_certificate_get_x509_crt(gnutls_certificate_credentials_t
          res, unsigned index, gnutls_x509_crt_t ** crt_list, unsigned *
          crt_list_size);


-----------------------------------------------------------

::

          gnutls_certificate_credentials_t res
                      is a gnutls_certificate_credentials_t type.

          unsigned index
                      The index of the certificate list to obtain.

          gnutls_x509_crt_t ** crt_list
                      Where to store the certificate list.

          unsigned * crt_list_size
                      Will hold the number of certificates.


---------------------------------------------------------------

::

          Obtains a X.509 certificate list that has been stored in  res
          with one of gnutls_certificate_set_x509_key(),
          gnutls_certificate_set_key(),
          gnutls_certificate_set_x509_key_file(),
          gnutls_certificate_set_x509_key_file2(),
          gnutls_certificate_set_x509_key_mem(), or
          gnutls_certificate_set_x509_key_mem2(). Each certificate in the
          returned certificate list must be deallocated with
          gnutls_x509_crt_deinit(), and the list itself must be freed with
          gnutls_free().

          The  index matches the return value of
          gnutls_certificate_set_x509_key() and friends functions, when the
          GNUTLS_CERTIFICATE_API_V2 flag is set.

          If there is no certificate with the given index,
          GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE is returned. If the
          certificate with the given index is not a X.509 certificate,
          GNUTLS_E_INVALID_REQUEST is returned. The returned certificates
          must be deinitialized after use, and the  crt_list pointer must
          be freed using gnutls_free().


-------------------------------------------------------

::

          GNUTLS_E_SUCCESS (0) on success, or a negative error code.


---------------------------------------------------

::

          3.4.0


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

   gnutls                            3.7.2gnutls_certificate_get_x509_crt(3)

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
