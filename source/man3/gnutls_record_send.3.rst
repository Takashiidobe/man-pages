.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_record_send(3) — Linux manual page
=========================================

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

   gnutls_record_send(3)            gnutls            gnutls_record_send(3)

NAME
-------------------------------------------------

::

          gnutls_record_send - API function


---------------------------------------------------------

::

          #include <gnutls/gnutls.h>

          ssize_t gnutls_record_send(gnutls_session_t session, const void *
          data, size_t data_size);


-----------------------------------------------------------

::

          gnutls_session_t session
                      is a gnutls_session_t type.

          const void * data
                      contains the data to send

          size_t data_size
                      is the length of the data


---------------------------------------------------------------

::

          This function has the similar semantics with send().  The only
          difference is that it accepts a GnuTLS session, and uses
          different error codes.  Note that if the send buffer is full,
          send() will block this function.  See the send() documentation
          for more information.

          You can replace the default push function which is send(), by
          using gnutls_transport_set_push_function().

          If the EINTR is returned by the internal push function then
          GNUTLS_E_INTERRUPTED will be returned. If GNUTLS_E_INTERRUPTED or
          GNUTLS_E_AGAIN is returned, you must call this function again
          with the exact same parameters, or provide a NULL pointer for
          data and 0 for  data_size , in order to write the same data as
          before. If you wish to discard the previous data instead of
          retrying, you must call gnutls_record_discard_queued() before
          calling this function with different parameters. Note that the
          latter works only on special transports (e.g., UDP).  cf.
          gnutls_record_get_direction().

          Note that in DTLS this function will return the
          GNUTLS_E_LARGE_PACKET error code if the send data exceed the data
          MTU value - as returned by gnutls_dtls_get_data_mtu(). The errno
          value EMSGSIZE also maps to GNUTLS_E_LARGE_PACKET.  Note that
          since 3.2.13 this function can be called under cork in DTLS mode,
          and will refuse to send data over the MTU size by returning
          GNUTLS_E_LARGE_PACKET.


-------------------------------------------------------

::

          The number of bytes sent, or a negative error code.  The number
          of bytes sent might be less than  data_size .  The maximum number
          of bytes this function can send in a single call depends on the
          negotiated maximum record size.


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

   gnutls                            3.7.2            gnutls_record_send(3)

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
