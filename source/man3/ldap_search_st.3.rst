.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap_search(3) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `LIBRARY <#LIBRARY>`__ \|         |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
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

   LDAP_SEARCH(3)          Library Functions Manual          LDAP_SEARCH(3)

NAME
-------------------------------------------------

::

          ldap_search, ldap_search_s, ldap_search_st, ldap_search_ext,
          ldap_search_ext_s - Perform an LDAP search operation


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <sys/types.h>
          #include <ldap.h>

          int ldap_search_ext(
                 LDAP *ld,
                 char *base,
                 int scope,
                 char *filter,
                 char *attrs[],
                 int attrsonly,
                 LDAPControl **serverctrls,
                 LDAPControl **clientctrls,
                 struct timeval *timeout,
                 int sizelimit,
                 int *msgidp );

          int ldap_search_ext_s(
                 LDAP *ld,
                 char *base,
                 int scope,
                 char *filter,
                 char *attrs[],
                 int attrsonly,
                 LDAPControl **serverctrls,
                 LDAPControl **clientctrls,
                 struct timeval *timeout,
                 int sizelimit,
                 LDAPMessage **res );


---------------------------------------------------------------

::

          These routines are used to perform LDAP search operations.  The
          ldap_search_ext_s() routine does the search synchronously (i.e.,
          not returning until the operation completes), providing a pointer
          to the resulting LDAP messages at the location pointed to by the
          res parameter.

          The ldap_search_ext() routine is the asynchronous version,
          initiating the search and returning the message id of the
          operation it initiated in the integer pointed to by the msgidp
          parameter.

          The base parameter is the DN of the entry at which to start the
          search.

          The scope parameter is the scope of the search and should be one
          of LDAP_SCOPE_BASE, to search the object itself,
          LDAP_SCOPE_ONELEVEL, to search the object's immediate children,
          LDAP_SCOPE_SUBTREE, to search the object and all its descendants,
          or LDAP_SCOPE_CHILDREN, to search all of the descendants.   Note
          that the latter requires the server support the LDAP Subordinates
          Search Scope extension.

          The filter is a string representation of the filter to apply in
          the search.  The string should conform to the format specified in
          RFC 4515 as extended by RFC 4526.  For instance, "(cn=Jane Doe)".
          Note that use of the extension requires the server to support the
          LDAP Absolute True/False Filter extension.  NULL may be specified
          to indicate the library should send the filter (objectClass=*).

          The attrs parameter is a null-terminated array of attribute
          descriptions to return from matching entries.  If NULL is
          specified, the return of all user attributes is requested.  The
          description "*" (LDAP_ALL_USER_ATTRIBUTES) may be used to request
          all user attributes to be returned.  The description
          "+"(LDAP_ALL_OPERATIONAL_ATTRIBUTES) may be used to request all
          operational attributes to be returned.  Note that this requires
          the server to support the LDAP All Operational Attribute
          extension.  To request no attributes, the description "1.1"
          (LDAP_NO_ATTRS) should be listed by itself.

          The attrsonly parameter should be set to a non-zero value if only
          attribute descriptions are wanted.  It should be set to zero (0)
          if both attributes descriptions and attribute values are wanted.

          The serverctrls and clientctrls parameters may be used to specify
          server and client controls, respectively.

          The ldap_search_ext_s() routine is the synchronous version of
          ldap_search_ext().

          It also returns a code indicating success or, in the case of
          failure, indicating the nature of the failure of the operation.
          See ldap_error(3) for details.


---------------------------------------------------

::

          Note that both read and list functionality are subsumed by these
          routines, by using a filter like "(objectclass=*)" and a scope of
          LDAP_SCOPE_BASE (to emulate read) or LDAP_SCOPE_ONELEVEL (to
          emulate list).

          These routines may dynamically allocate memory. The caller is
          responsible for freeing such memory using supplied deallocation
          routines. Return values are contained in <ldap.h>.

          Note that res parameter of ldap_search_ext_s() and
          ldap_search_s() should be freed with ldap_msgfree() regardless of
          return value of these functions.


-----------------------------------------------------------------------------------

::

          The ldap_search() routine is deprecated in favor of the
          ldap_search_ext() routine.  The ldap_search_s() and
          ldap_search_st() routines are deprecated in favor of the
          ldap_search_ext_s() routine.

          Deprecated interfaces generally remain in the library.  The macro
          LDAP_DEPRECATED can be defined to a non-zero value (e.g.,
          -DLDAP_DEPRECATED=1) when compiling program designed to use
          deprecated interfaces.  It is recommended that developers writing
          new programs, or updating old programs, avoid use of deprecated
          interfaces.  Over time, it is expected that documentation (and,
          eventually, support) for deprecated interfaces to be eliminated.


---------------------------------------------------------

::

          ldap(3), ldap_result(3), ldap_error(3)


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

   OpenLDAP LDVERSION             RELEASEDATE                LDAP_SEARCH(3)

--------------

Pages that refer to this page:
`ldapsearch(1) <../man1/ldapsearch.1.html>`__, 
`ldap_abandon(3) <../man3/ldap_abandon.3.html>`__, 
`ldap_first_entry(3) <../man3/ldap_first_entry.3.html>`__, 
`ldap_first_message(3) <../man3/ldap_first_message.3.html>`__, 
`ldap_first_reference(3) <../man3/ldap_first_reference.3.html>`__, 
`ldap_get_option(3) <../man3/ldap_get_option.3.html>`__, 
`ldap_parse_result(3) <../man3/ldap_parse_result.3.html>`__, 
`ldap_parse_vlv_control(3) <../man3/ldap_parse_vlv_control.3.html>`__, 
`ldap_result(3) <../man3/ldap_result.3.html>`__, 
`ldap_sync(3) <../man3/ldap_sync.3.html>`__

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
