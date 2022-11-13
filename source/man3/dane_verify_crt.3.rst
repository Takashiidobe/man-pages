.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dane_verify_crt(3) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURNS <#RETURNS>`__ \|         |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `COPYRIGHT <#COPYRIGHT>`__ \|  |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   dane_verify_crt(3)               gnutls               dane_verify_crt(3)

NAME
-------------------------------------------------

::

          dane_verify_crt - API function


---------------------------------------------------------

::

          #include <gnutls/dane.h>

          int dane_verify_crt(dane_state_t s, const gnutls_datum_t * chain,
          unsigned chain_size, gnutls_certificate_type_t chain_type, const
          char * hostname, const char * proto, unsigned int port, unsigned
          int sflags, unsigned int vflags, unsigned int * verify);


-----------------------------------------------------------

::

          dane_state_t s
                      A DANE state structure (may be NULL)

          const gnutls_datum_t * chain
                      A certificate chain

          unsigned chain_size
                      The size of the chain

          gnutls_certificate_type_t chain_type
                      The type of the certificate chain

          const char * hostname
                      The hostname associated with the chain

          const char * proto
                      The protocol of the service connecting (e.g. tcp)

          unsigned int port
                      The port of the service connecting (e.g. 443)

          unsigned int sflags
                      Flags for the initialization of  s (if NULL)

          unsigned int vflags
                      Verification flags; an OR'ed list of
                      dane_verify_flags_t.

          unsigned int * verify
                      An OR'ed list of dane_verify_status_t.


---------------------------------------------------------------

::

          This function will verify the given certificate chain against the
          CA constrains and/or the certificate available via DANE.  If no
          information via DANE can be obtained the flag
          DANE_VERIFY_NO_DANE_INFO is set. If a DNSSEC signature is not
          available for the DANE record then the verify flag
          DANE_VERIFY_NO_DNSSEC_DATA is set.

          Due to the many possible options of DANE, there is no single
          threat model countered. When notifying the user about DANE
          verification results it may be better to mention: DANE
          verification did not reject the certificate, rather than
          mentioning a successful DANE verication.

          Note that this function is designed to be run in addition to PKIX
          - certificate chain - verification. To be run independently the
          DANE_VFLAG_ONLY_CHECK_EE_USAGE flag should be specified; then the
          function will check whether the key of the peer matches the key
          advertized in the DANE entry.


-------------------------------------------------------

::

          a negative error code on error and DANE_E_SUCCESS (0) when the
          DANE entries were successfully parsed, irrespective of whether
          they were verified (see  verify for that information). If no
          usable entries were encountered
          DANE_E_REQUESTED_DATA_NOT_AVAILABLE will be returned.


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

   gnutls                            3.7.2               dane_verify_crt(3)

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
