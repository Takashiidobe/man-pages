.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_certificate_set_key(3) — Linux manual page
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

   gnutls_certificate_set_key(3)    gnutls    gnutls_certificate_set_key(3)

NAME
-------------------------------------------------

::

          gnutls_certificate_set_key - API function


---------------------------------------------------------

::

          #include <gnutls/abstract.h>

          int gnutls_certificate_set_key(gnutls_certificate_credentials_t
          res, const char ** names, int names_size, gnutls_pcert_st *
          pcert_list, int pcert_list_size, gnutls_privkey_t key);


-----------------------------------------------------------

::

          gnutls_certificate_credentials_t res
                      is a gnutls_certificate_credentials_t type.

          const char ** names
                      is an array of DNS names belonging to the public-key
                      (NULL if none)

          int names_size
                      holds the size of the names list

          gnutls_pcert_st * pcert_list
                      contains a certificate list (chain) or raw public-key

          int pcert_list_size
                      holds the size of the certificate list

          gnutls_privkey_t key
                      is a gnutls_privkey_t key corresponding to the first
                      public-key in pcert_list


---------------------------------------------------------------

::

          This function sets a public/private key pair in the
          gnutls_certificate_credentials_t type. The given public key may
          be encapsulated in a certificate or can be given as a raw key.
          This function may be called more than once, in case multiple key
          pairs exist for the server. For clients that want to send more
          than their own end- entity certificate (e.g., also an
          intermediate CA cert), the full certificate chain must be
          provided in  pcert_list .

          Note that the  key will become part of the credentials structure
          and must not be deallocated. It will be automatically deallocated
          when the  res structure is deinitialized.

          If this function fails, the  res structure is at an undefined
          state and it must not be reused to load other keys or
          certificates.

          Note that, this function by default returns zero on success and a
          negative value on error.  Since 3.5.6, when the flag
          GNUTLS_CERTIFICATE_API_V2 is set using
          gnutls_certificate_set_flags() it returns an index (greater or
          equal to zero). That index can be used for other functions to
          refer to the added key-pair.

          Since GnuTLS 3.6.6 this function also handles raw public keys.


-------------------------------------------------------

::

          On success this functions returns zero, and otherwise a negative
          value on error (see above for modifying that behavior).


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

   gnutls                            3.7.2    gnutls_certificate_set_key(3)

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
