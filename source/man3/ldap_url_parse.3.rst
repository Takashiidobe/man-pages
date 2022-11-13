.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap_url(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `LIBRARY <#LIBRARY>`__ \|         |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LDAP_URL(3)             Library Functions Manual             LDAP_URL(3)

NAME
-------------------------------------------------

::

          ldap_is_ldap_url, ldap_url_parse, ldap_free_urldesc - LDAP
          Uniform Resource Locator routines


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <ldap.h>

          int ldap_is_ldap_url( const char *url )

          int ldap_url_parse( const char *url, LDAPURLDesc **ludpp )

          typedef struct ldap_url_desc {
              char *      lud_scheme;     /* URI scheme */
              char *      lud_host;       /* LDAP host to contact */
              int         lud_port;       /* port on host */
              char *      lud_dn;         /* base for search */
              char **     lud_attrs;      /* list of attributes */
              int         lud_scope;      /* a LDAP_SCOPE_... value */
              char *      lud_filter;     /* LDAP search filter */
              char **     lud_exts;       /* LDAP extensions */
              int         lud_crit_exts;  /* true if any extension is critical */
              /* may contain additional fields for internal use */
          } LDAPURLDesc;

          void ldap_free_urldesc( LDAPURLDesc *ludp );


---------------------------------------------------------------

::

          These routines support the use of LDAP URLs (Uniform Resource
          Locators) as detailed in RFC 4516.  LDAP URLs look like this:

            ldap://hostport/dn[?attrs[?scope[?filter[?exts]]]]

          where:
            hostport is a host name with an optional ":portnumber"
            dn is the search base
            attrs is a comma separated list of attributes to request
            scope is one of these three strings:
              base one sub (default=base)
            filter is filter
            exts are recognized set of LDAP and/or API extensions.

          Example:
            ldap://ldap.example.net/dc=example,dc=net?cn,sn?sub?(cn=*)

          URLs that are wrapped in angle-brackets and/or preceded by "URL:"
          are also tolerated.  Alternative LDAP schemes such as ldaps://
          and ldapi:// may be parsed using the below routines as well.

          ldap_is_ldap_url() returns a non-zero value if url looks like an
          LDAP URL (as opposed to some other kind of URL).  It can be used
          as a quick check for an LDAP URL; the ldap_url_parse() routine
          should be used if a more thorough check is needed.

          ldap_url_parse() breaks down an LDAP URL passed in url into its
          component pieces.  If successful, zero is returned, an LDAP URL
          description is allocated, filled in, and ludpp is set to point to
          it.  If an error occurs, a non-zero URL error code is returned.

          ldap_free_urldesc() should be called to free an LDAP URL
          description that was obtained from a call to ldap_url_parse().


---------------------------------------------------------

::

          ldap(3)
          RFC 4516 <http://www.rfc-editor.org/rfc/rfc4516.txt>


-------------------------------------------------------------------------

::

          OpenLDAP Software is developed and maintained by The OpenLDAP
          Project <http://www.openldap.org/>.  OpenLDAP Software is derived
          from the University of Michigan LDAP 3.3 Release.

COLOPHON
---------------------------------------------------------

::

          This page is part of the OpenLDAP (an open source implementation
          of the Lightweight Directory Access Protocol) project.
          Information about the project can be found at 
          ⟨http://www.openldap.org/⟩.  If you have a bug report for this
          manual page, see ⟨http://www.openldap.org/its/⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://git.openldap.org/openldap/openldap.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   OpenLDAP LDVERSION             RELEASEDATE                   LDAP_URL(3)

--------------

Pages that refer to this page: `ldapurl(1) <../man1/ldapurl.1.html>`__, 
`ldap(3) <../man3/ldap.3.html>`__, 
`ldap_bind(3) <../man3/ldap_bind.3.html>`__

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
