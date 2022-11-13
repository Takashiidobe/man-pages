.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gnutls_priority_init2(3) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
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

   gnutls_priority_init2(3)         gnutls         gnutls_priority_init2(3)

NAME
-------------------------------------------------

::

          gnutls_priority_init2 - API function


---------------------------------------------------------

::

          #include <gnutls/gnutls.h>

          int gnutls_priority_init2(gnutls_priority_t * priority_cache,
          const char * priorities, const char ** err_pos, unsigned flags);


-----------------------------------------------------------

::

          gnutls_priority_t * priority_cache
                      is a gnutls_priority_t type.

          const char * priorities
                      is a string describing priorities (may be NULL)

          const char ** err_pos
                      In case of an error this will have the position in
                      the string the error occurred

          unsigned flags
                      zero or GNUTLS_PRIORITY_INIT_DEF_APPEND


---------------------------------------------------------------

::

          Sets priorities for the ciphers, key exchange methods, and macs.
          The  priority_cache should be deinitialized using
          gnutls_priority_deinit().

          The priorities option allows you to specify a colon separated
          list of the cipher priorities to enable.  Some keywords are
          defined to provide quick access to common preferences.

          When  flags is set to GNUTLS_PRIORITY_INIT_DEF_APPEND then the
          priorities specified will be appended to the default options.

          Unless there is a special need, use the "NORMAL" keyword to apply
          a reasonable security level, or "NORMAL:%COMPAT" for
          compatibility.

          "PERFORMANCE" means all the "secure" ciphersuites are enabled,
          limited to 128 bit ciphers and sorted by terms of speed
          performance.

          "LEGACY" the NORMAL settings for GnuTLS 3.2.x or earlier. There
          is no verification profile set, and the allowed DH primes are
          considered weak today.

          "NORMAL" means all "secure" ciphersuites. The 256-bit ciphers are
          included as a fallback only.  The ciphers are sorted by security
          margin.

          "PFS" means all "secure" ciphersuites that support perfect
          forward secrecy.  The 256-bit ciphers are included as a fallback
          only.  The ciphers are sorted by security margin.

          "SECURE128" means all "secure" ciphersuites of security level
          128-bit or more.

          "SECURE192" means all "secure" ciphersuites of security level
          192-bit or more.

          "SUITEB128" means all the NSA SuiteB ciphersuites with security
          level of 128.

          "SUITEB192" means all the NSA SuiteB ciphersuites with security
          level of 192.

          "NONE" means nothing is enabled.  This disables everything,
          including protocols.

          "@KEYWORD1,KEYWORD2,..." The system administrator imposed
          settings.  The provided keyword(s) will be expanded from a
          configuration-time provided file - default is:
          /etc/gnutls/config.  Any attributes that follow it, will be
          appended to the expanded string. If multiple keywords are
          provided, separated by commas, then the first keyword that exists
          in the configuration file will be used. At least one of the
          keywords must exist, or this function will return an error.
          Typical usage would be to specify an application specified
          keyword first, followed by "SYSTEM" as a default fallback. e.g.,
          " LIBVIRT ,SYSTEM:!-VERS-SSL3.0" will first try to find a config
          file entry matching "LIBVIRT", but if that does not exist will
          use the entry for "SYSTEM". If "SYSTEM" does not exist either, an
          error will be returned. In all cases, the SSL3.0 protocol will be
          disabled. The system priority file entries should be formatted as
          "KEYWORD=VALUE", e.g., "SYSTEM=NORMAL:+ARCFOUR-128".

          Special keywords are "!", "-" and "+".  "!" or "-" appended with
          an algorithm will remove this algorithm.  "+" appended with an
          algorithm will add this algorithm.

          Check the GnuTLS manual section "Priority strings" for detailed
          information.


---------------------------------------------------------

::

          "NONE:+VERS-TLS-ALL:+MAC-ALL:+RSA:+AES-128-CBC:+SIGN-ALL:+COMP-NULL"

          "NORMAL:+ARCFOUR-128" means normal ciphers plus ARCFOUR-128.

          "SECURE128:-VERS-SSL3.0" means that only secure ciphers are and
          enabled, SSL3.0 is disabled.

          "NONE:+VERS-TLS-ALL:+AES-128-CBC:+RSA:+SHA1:+COMP-NULL:+SIGN-RSA-SHA1",

          "NONE:+VERS-TLS-ALL:+AES-128-CBC:+ECDHE-RSA:+SHA1:+COMP-NULL:+SIGN-RSA-SHA1:+CURVE-SECP256R1",

          "SECURE256:+SECURE128",

          Note that "NORMAL:%COMPAT" is the most compatible mode.

          A NULL  priorities string indicates the default priorities to be
          used (this is available since GnuTLS 3.3.0).


-------------------------------------------------------

::

          On syntax error GNUTLS_E_INVALID_REQUEST is returned,
          GNUTLS_E_SUCCESS on success, or an error code.


---------------------------------------------------

::

          3.6.3


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

   gnutls                            3.7.2         gnutls_priority_init2(3)

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
