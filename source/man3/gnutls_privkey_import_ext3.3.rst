.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_privkey_import_ext3(3) — Linux manual page
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

   gnutls_privkey_import_ext3(3)    gnutls    gnutls_privkey_import_ext3(3)

NAME
-------------------------------------------------

::

          gnutls_privkey_import_ext3 - API function


---------------------------------------------------------

::

          #include <gnutls/abstract.h>

          int gnutls_privkey_import_ext3(gnutls_privkey_t pkey, void *
          userdata, gnutls_privkey_sign_func sign_fn,
          gnutls_privkey_decrypt_func decrypt_fn,
          gnutls_privkey_deinit_func deinit_fn, gnutls_privkey_info_func
          info_fn, unsigned int flags);


-----------------------------------------------------------

::

          gnutls_privkey_t pkey
                      The private key

          void * userdata
                      private data to be provided to the callbacks

          gnutls_privkey_sign_func sign_fn
                      callback for signature operations

          gnutls_privkey_decrypt_func decrypt_fn
                      callback for decryption operations

          gnutls_privkey_deinit_func deinit_fn
                      a deinitialization function

          gnutls_privkey_info_func info_fn
                      returns info about the public key algorithm (should
                      not be NULL)

          unsigned int flags
                      Flags for the import


---------------------------------------------------------------

::

          This function will associate the given callbacks with the
          gnutls_privkey_t type. At least one of the two callbacks must be
          non-null. If a deinitialization function is provided then flags
          is assumed to contain GNUTLS_PRIVKEY_IMPORT_AUTO_RELEASE.

          Note that the signing function is supposed to "raw" sign data,
          i.e., without any hashing or preprocessing. In case of RSA the
          DigestInfo will be provided, and the signing function is expected
          to do the PKCS 1 1.5 padding and the exponentiation.

          The  info_fn must provide information on the algorithms supported
          by this private key, and should support the flags
          GNUTLS_PRIVKEY_INFO_PK_ALGO and GNUTLS_PRIVKEY_INFO_SIGN_ALGO. It
          must return -1 on unknown flags.


-------------------------------------------------------

::

          On success, GNUTLS_E_SUCCESS (0) is returned, otherwise a
          negative error value.


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

   gnutls                            3.7.2    gnutls_privkey_import_ext3(3)

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
