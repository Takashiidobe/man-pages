.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_pkcs11_obj_list_import_url4(3) — Linux manual page
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

   gnutls_pkcs11_obj_list_import_url4(3)lsls_pkcs11_obj_list_import_url4(3)

NAME
-------------------------------------------------

::

          gnutls_pkcs11_obj_list_import_url4 - API function


---------------------------------------------------------

::

          #include <gnutls/pkcs11.h>

          int gnutls_pkcs11_obj_list_import_url4(gnutls_pkcs11_obj_t **
          p_list, unsigned int * n_list, const char * url, unsigned int
          flags);


-----------------------------------------------------------

::

          gnutls_pkcs11_obj_t ** p_list
                      An uninitialized object list (may be NULL)

          unsigned int * n_list
                      It will contain the size of the list.

          const char * url
                      A PKCS 11 url identifying a set of objects

          unsigned int flags
                      Or sequence of GNUTLS_PKCS11_OBJ_* flags


---------------------------------------------------------------

::

          This function will enumerate all the objects specified by the
          PKCS11 URL provided. It will initialize and set values to the
          object pointer list ( p_list ) provided. To obtain a list of all
          available objects use a  url of 'pkcs11:'.

          All returned objects must be deinitialized using
          gnutls_pkcs11_obj_deinit(), and  p_list must be deinitialized
          using gnutls_free().

          The supported in this function  flags are
          GNUTLS_PKCS11_OBJ_FLAG_LOGIN, GNUTLS_PKCS11_OBJ_FLAG_LOGIN_SO,
          GNUTLS_PKCS11_OBJ_FLAG_PRESENT_IN_TRUSTED_MODULE,
          GNUTLS_PKCS11_OBJ_FLAG_CRT, GNUTLS_PKCS11_OBJ_FLAG_PUBKEY,
          GNUTLS_PKCS11_OBJ_FLAG_PRIVKEY,
          GNUTLS_PKCS11_OBJ_FLAG_WITH_PRIVKEY,
          GNUTLS_PKCS11_OBJ_FLAG_MARK_CA,
          GNUTLS_PKCS11_OBJ_FLAG_MARK_TRUSTED, and since 3.5.1 the
          GNUTLS_PKCS11_OBJ_FLAG_OVERWRITE_TRUSTMOD_EXT.

          On versions of GnuTLS prior to 3.4.0 the equivalent function was
          gnutls_pkcs11_obj_list_import_url2(). That is also available on
          this version as a macro which maps to this function.


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

   gnutls                            3.g7n.u2tls_pkcs11_obj_list_import_url4(3)

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
