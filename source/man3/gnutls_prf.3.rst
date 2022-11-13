.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_prf(3) — Linux manual page
=================================

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

   gnutls_prf(3)                    gnutls                    gnutls_prf(3)

NAME
-------------------------------------------------

::

          gnutls_prf - API function


---------------------------------------------------------

::

          #include <gnutls/gnutls.h>

          int gnutls_prf(gnutls_session_t session, size_t label_size, const
          char * label, int server_random_first, size_t extra_size, const
          char * extra, size_t outsize, char * out);


-----------------------------------------------------------

::

          gnutls_session_t session
                      is a gnutls_session_t type.

          size_t label_size
                      length of the  label variable.

          const char * label
                      label used in PRF computation, typically a short
                      string.

          int server_random_first
                      non-zero if server random field should be first in
                      seed

          size_t extra_size
                      length of the  extra variable.

          const char * extra
                      optional extra data to seed the PRF with.

          size_t outsize
                      size of pre-allocated output buffer to hold the
                      output.

          char * out  pre-allocated buffer to hold the generated data.


---------------------------------------------------------------

::

          Applies the TLS Pseudo-Random-Function (PRF) on the master secret
          and the provided data, seeded with the client and server random
          fields.  For the key expansion specified in RFC5705 see
          gnutls_prf_rfc5705().

          The  label variable usually contains a string denoting the
          purpose for the generated data.  The  server_random_first
          indicates whether the client random field or the server random
          field should be first in the seed.  Non-zero indicates that the
          server random field is first, 0 that the client random field is
          first.

          The  extra variable can be used to add more data to the seed,
          after the random variables.  It can be used to make sure the
          generated output is strongly connected to some additional data
          (e.g., a string used in user authentication).

          The output is placed in  out , which must be pre-allocated.


-------------------------------------------------

::

          This function produces identical output with gnutls_prf_rfc5705()
          when  server_random_first is set to 0 and  extra is NULL. Under
          TLS1.3 this function will only operate when these conditions are
          true, or otherwise return GNUTLS_E_INVALID_REQUEST.


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

   gnutls                            3.7.2                    gnutls_prf(3)

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
