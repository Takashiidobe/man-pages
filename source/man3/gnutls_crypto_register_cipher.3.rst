.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_crypto_register_cipher(3) — Linux manual page
====================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DEPRECATED <#DEPRECATED>`__ \|   |                                   |
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

   gnutls_crypto_register_cipher(3) gnutls gnutls_crypto_register_cipher(3)

NAME
-------------------------------------------------

::

          gnutls_crypto_register_cipher - API function


---------------------------------------------------------

::

          #include <gnutls/crypto.h>

          int gnutls_crypto_register_cipher(gnutls_cipher_algorithm_t
          algorithm, int priority, gnutls_cipher_init_func init,
          gnutls_cipher_setkey_func setkey, gnutls_cipher_setiv_func setiv,
          gnutls_cipher_encrypt_func encrypt, gnutls_cipher_decrypt_func
          decrypt, gnutls_cipher_deinit_func deinit);


-----------------------------------------------------------

::

          gnutls_cipher_algorithm_t algorithm
                      is the gnutls algorithm identifier

          int priority
                      is the priority of the algorithm

          gnutls_cipher_init_func init
                      A function which initializes the cipher

          gnutls_cipher_setkey_func setkey
                      A function which sets the key of the cipher

          gnutls_cipher_setiv_func setiv
                      A function which sets the nonce/IV of the cipher
                      (non-AEAD)

          gnutls_cipher_encrypt_func encrypt
                      A function which performs encryption (non-AEAD)

          gnutls_cipher_decrypt_func decrypt
                      A function which performs decryption (non-AEAD)

          gnutls_cipher_deinit_func deinit
                      A function which deinitializes the cipher


---------------------------------------------------------------

::

          This function will register a cipher algorithm to be used by
          gnutls.  Any algorithm registered will override the included
          algorithms and by convention kernel implemented algorithms have
          priority of 90 and CPU-assisted of 80.  The algorithm with the
          lowest priority will be used by gnutls.

          In the case the registered init or setkey functions return
          GNUTLS_E_NEED_FALLBACK, GnuTLS will attempt to use the next in
          priority registered cipher.

          The functions which are marked as non-AEAD they are not required
          when registering a cipher to be used with the new AEAD API
          introduced in GnuTLS 3.4.0. Internally GnuTLS uses the new AEAD
          API.


-------------------------------------------------------------

::

          since 3.7.0 it is no longer possible to override cipher
          implementation


-------------------------------------------------------

::

          GNUTLS_E_SUCCESS on success, otherwise a negative error code.


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

   gnutls                            3.7.2 gnutls_crypto_register_cipher(3)

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
