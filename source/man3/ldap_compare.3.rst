.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap_compare(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `LIBRARY <#LIBRARY>`__ \|         |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DEPRECATED INTER                 |                                   |
| FACES <#DEPRECATED_INTERFACES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LDAP_COMPARE(3)         Library Functions Manual         LDAP_COMPARE(3)

NAME
-------------------------------------------------

::

          ldap_compare, ldap_compare_s, ldap_compare_ext,
          ldap_compare_ext_s - Perform an LDAP compare operation.


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <ldap.h>

          int ldap_compare_ext(
                 LDAP *ld,
                 char *dn,
                 char *attr,
                 const struct berval *bvalue,
                 LDAPControl **serverctrls,
                 LDAPControl **clientctrls,
                 int *msgidp );

          int ldap_compare_ext_s(
                 LDAP *ld,
                 char *dn,
                 char *attr,
                 const struct berval *bvalue,
                 LDAPControl **serverctrls,
                 LDAPControl **clientctrls );


---------------------------------------------------------------

::

          The ldap_compare_ext_s() routine is used to perform an LDAP
          compare operation synchronously.  It takes dn, the DN of the
          entry upon which to perform the compare, and attr and value, the
          attribute description and value to compare to those found in the
          entry.  It returns a code, which will be LDAP_COMPARE_TRUE if the
          entry contains the attribute value and LDAP_COMPARE_FALSE if it
          does not.  Otherwise, an error code is returned that indicates
          the nature of the problem.  See ldap(3) for details.

          The ldap_compare_ext() routine is used to perform an LDAP compare
          operation asynchronously.  It takes the same parameters as
          ldap_compare_ext_s(), but provides the message id of the request
          it initiated in the integer pointed to msgidp.  The result of the
          compare can be obtained by a subsequent call to ldap_result(3).

          Both routines allow server and client controls to be specified to
          extend the compare request.


-----------------------------------------------------------------------------------

::

          The routines ldap_compare() and ldap_compare_s() are deprecated
          in favor of ldap_compare_ext() and ldap_compare_ext_s(),
          respectively.

          Deprecated interfaces generally remain in the library.  The macro
          LDAP_DEPRECATED can be defined to a non-zero value (e.g.,
          -DLDAP_DEPRECATED=1) when compiling program designed to use
          deprecated interfaces.  It is recommended that developers writing
          new programs, or updating old programs, avoid use of deprecated
          interfaces.  Over time, it is expected that documentation (and,
          eventually, support) for deprecated interfaces to be eliminated.


---------------------------------------------------------

::

          ldap(3), ldap_error(3)


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

   OpenLDAP LDVERSION             RELEASEDATE               LDAP_COMPARE(3)

--------------

Pages that refer to this page:
`ldapcompare(1) <../man1/ldapcompare.1.html>`__, 
`ldap(3) <../man3/ldap.3.html>`__

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
