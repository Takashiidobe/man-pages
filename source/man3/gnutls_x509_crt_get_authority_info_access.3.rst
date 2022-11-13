.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_x509_crt_get_authority_info_access(3) — Linux manual page
================================================================

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

   gnutls_x509_crt_get_authority_info_access(3)get_authority_info_access(3)

NAME
-------------------------------------------------

::

          gnutls_x509_crt_get_authority_info_access - API function


---------------------------------------------------------

::

          #include <gnutls/x509.h>

          int gnutls_x509_crt_get_authority_info_access(gnutls_x509_crt_t
          crt, unsigned int seq, int what, gnutls_datum_t * data, unsigned
          int * critical);


-----------------------------------------------------------

::

          gnutls_x509_crt_t crt
                      Holds the certificate

          unsigned int seq
                      specifies the sequence number of the access
                      descriptor (0 for the first one, 1 for the second
                      etc.)

          int what    what data to get, a gnutls_info_access_what_t type.

          gnutls_datum_t * data
                      output data to be freed with gnutls_free().

          unsigned int * critical
                      pointer to output integer that is set to non-zero if
                      the extension is marked as critical (may be NULL)


---------------------------------------------------------------

::

          Note that a simpler API to access the authority info data is
          provided by gnutls_x509_aia_get() and
          gnutls_x509_ext_import_aia().

          This function extracts the Authority Information Access (AIA)
          extension, see RFC 5280 section 4.2.2.1 for more information.
          The AIA extension holds a sequence of AccessDescription (AD)
          data.

          The  seq input parameter is used to indicate which member of the
          sequence the caller is interested in.  The first member is 0, the
          second member 1 and so on.  When the  seq value is out of bounds,
          GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE is returned.

          The type of data returned in  data is specified via  what which
          should be gnutls_info_access_what_t values.

          If  what is GNUTLS_IA_ACCESSMETHOD_OID then  data will hold the
          accessMethod OID (e.g., "1.3.6.1.5.5.7.48.1").

          If  what is GNUTLS_IA_ACCESSLOCATION_GENERALNAME_TYPE,  data will
          hold the accessLocation GeneralName type (e.g.,
          "uniformResourceIdentifier").

          If  what is GNUTLS_IA_URI,  data will hold the accessLocation URI
          data.  Requesting this  what value leads to an error if the
          accessLocation is not of the "uniformResourceIdentifier" type.

          If  what is GNUTLS_IA_OCSP_URI,  data will hold the OCSP URI.
          Requesting this  what value leads to an error if the accessMethod
          is not 1.3.6.1.5.5.7.48.1 aka OCSP, or if accessLocation is not
          of the "uniformResourceIdentifier" type. In that case
          GNUTLS_E_UNKNOWN_ALGORITHM will be returned, and  seq should be
          increased and this function called again.

          If  what is GNUTLS_IA_CAISSUERS_URI,  data will hold the
          caIssuers URI.  Requesting this  what value leads to an error if
          the accessMethod is not 1.3.6.1.5.5.7.48.2 aka caIssuers, or if
          accessLocation is not of the "uniformResourceIdentifier" type.
          In that case handle as in GNUTLS_IA_OCSP_URI.

          More  what values may be allocated in the future as needed.

          If  data is NULL, the function does the same without storing the
          output data, that is, it will set  critical and do error checking
          as usual.

          The value of the critical flag is returned in * critical .
          Supply a NULL  critical if you want the function to make sure the
          extension is non-critical, as required by RFC 5280.


-------------------------------------------------------

::

          GNUTLS_E_SUCCESS on success, GNUTLS_E_INVALID_REQUEST on invalid
          crt , GNUTLS_E_CONSTRAINT_ERROR if the extension is incorrectly
          marked as critical (use a non-NULL  critical to override),
          GNUTLS_E_UNKNOWN_ALGORITHM if the requested OID does not match
          (e.g., when using GNUTLS_IA_OCSP_URI), otherwise a negative error
          code.


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

   gnutls                      gnutls3_.x75.029_crt_get_authority_info_access(3)

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
