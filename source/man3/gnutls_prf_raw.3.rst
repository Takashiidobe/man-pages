.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_prf_raw(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTE <#NOTE>`__ \|               |                                   |
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

   gnutls_prf_raw(3)                gnutls                gnutls_prf_raw(3)

NAME
-------------------------------------------------

::

          gnutls_prf_raw - API function


---------------------------------------------------------

::

          #include <gnutls/gnutls.h>

          int gnutls_prf_raw(gnutls_session_t session, size_t label_size,
          const char * label, size_t seed_size, const char * seed, size_t
          outsize, char * out);


-----------------------------------------------------------

::

          gnutls_session_t session
                      is a gnutls_session_t type.

          size_t label_size
                      length of the  label variable.

          const char * label
                      label used in PRF computation, typically a short
                      string.

          size_t seed_size
                      length of the  seed variable.

          const char * seed
                      optional extra data to seed the PRF with.

          size_t outsize
                      size of pre-allocated output buffer to hold the
                      output.

          char * out  pre-allocated buffer to hold the generated data.


---------------------------------------------------------------

::

          Apply the TLS Pseudo-Random-Function (PRF) on the master secret
          and the provided data.

          The  label variable usually contains a string denoting the
          purpose for the generated data.  The  seed usually contains data
          such as the client and server random, perhaps together with some
          additional data that is added to guarantee uniqueness of the
          output for a particular purpose.

          Because the output is not guaranteed to be unique for a
          particular session unless  seed includes the client random and
          server random fields (the PRF would output the same data on
          another connection resumed from the first one), it is not
          recommended to use this function directly.  The gnutls_prf()
          function seeds the PRF with the client and server random fields
          directly, and is recommended if you want to generate pseudo
          random data unique for each session.


-------------------------------------------------

::

          This function will only operate under TLS versions prior to 1.3.
          In TLS1.3 the use of PRF is replaced with HKDF and the generic
          exporters like gnutls_prf_rfc5705() should be used instead. Under
          TLS1.3 this function returns GNUTLS_E_INVALID_REQUEST.


-------------------------------------------------------

::

          GNUTLS_E_SUCCESS on success, or an error code.


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

   gnutls                            3.7.2                gnutls_prf_raw(3)

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
