.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_x509_trust_list_verify_crt2(3) — Linux manual page
=========================================================

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

   gnutls_x509_trust_list_verify_crt2(3)lsls_x509_trust_list_verify_crt2(3)

NAME
-------------------------------------------------

::

          gnutls_x509_trust_list_verify_crt2 - API function


---------------------------------------------------------

::

          #include <gnutls/x509.h>

          int gnutls_x509_trust_list_verify_crt2(gnutls_x509_trust_list_t
          list, gnutls_x509_crt_t * cert_list, unsigned int cert_list_size,
          gnutls_typed_vdata_st * data, unsigned int elements, unsigned int
          flags, unsigned int * voutput, gnutls_verify_output_function
          func);


-----------------------------------------------------------

::

          gnutls_x509_trust_list_t list
                      The list

          gnutls_x509_crt_t * cert_list
                      is the certificate list to be verified

          unsigned int cert_list_size
                      is the certificate list size

          gnutls_typed_vdata_st * data
                      an array of typed data

          unsigned int elements
                      the number of data elements

          unsigned int flags
                      Flags that may be used to change the verification
                      algorithm. Use OR of the
                      gnutls_certificate_verify_flags enumerations.

          unsigned int * voutput
                      will hold the certificate verification output.

          gnutls_verify_output_function func
                      If non-null will be called on each chain element
                      verification with the output.


---------------------------------------------------------------

::

          This function will attempt to verify the given certificate chain
          and return its status. The  voutput parameter will hold an OR'ed
          sequence of gnutls_certificate_status_t flags.

          When a certificate chain of  cert_list_size with more than one
          certificates is provided, the verification status will apply to
          the first certificate in the chain that failed verification. The
          verification process starts from the end of the chain (from CA to
          end certificate). The first certificate in the chain must be the
          end-certificate while the rest of the members may be sorted or
          not.

          Additionally a certificate verification profile can be specified
          from the ones in gnutls_certificate_verification_profiles_t by
          ORing the result of GNUTLS_PROFILE_TO_VFLAGS() to the
          verification flags.

          Additional verification parameters are possible via the  data
          types; the acceptable types are GNUTLS_DT_DNS_HOSTNAME,
          GNUTLS_DT_IP_ADDRESS and GNUTLS_DT_KEY_PURPOSE_OID.  The former
          accepts as data a null-terminated hostname, and the latter a
          null-terminated object identifier (e.g.,
          GNUTLS_KP_TLS_WWW_SERVER).  If a DNS hostname is provided then
          this function will compare the hostname in the end certificate
          against the given. If names do not match the
          GNUTLS_CERT_UNEXPECTED_OWNER status flag will be set. In addition
          it will consider certificates provided with
          gnutls_x509_trust_list_add_named_crt().

          If a key purpose OID is provided and the end-certificate contains
          the extended key usage PKIX extension, it will be required to
          match the provided OID or be marked for any purpose, otherwise
          verification will fail with GNUTLS_CERT_PURPOSE_MISMATCH status.


-------------------------------------------------------

::

          On success, GNUTLS_E_SUCCESS (0) is returned, otherwise a
          negative error value. Note that verification failure will not
          result to an error code, only  voutput will be updated.


---------------------------------------------------

::

          3.3.8


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

   gnutls                            3.g7n.u2tls_x509_trust_list_verify_crt2(3)

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
