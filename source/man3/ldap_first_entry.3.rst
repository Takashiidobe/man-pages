.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap_first_entry(3) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `LIBRARY <#LIBRARY>`__ \|         |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ERRORS <#ERRORS>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LDAP_FIRST_ENTRY(3)     Library Functions Manual     LDAP_FIRST_ENTRY(3)

NAME
-------------------------------------------------

::

          ldap_first_entry, ldap_next_entry, ldap_count_entries - LDAP
          result entry parsing and counting routines


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <ldap.h>

          int ldap_count_entries( LDAP *ld, LDAPMessage *result )

          LDAPMessage *ldap_first_entry( LDAP *ld, LDAPMessage *result )

          LDAPMessage *ldap_next_entry( LDAP *ld, LDAPMessage *entry )


---------------------------------------------------------------

::

          These routines are used to parse results received from
          ldap_result(3) or the synchronous LDAP search operation routines
          ldap_search_s(3) and ldap_search_st(3).

          The ldap_first_entry() routine is used to retrieve the first
          entry in a chain of search results.  It takes the result as
          returned by a call to ldap_result(3) or ldap_search_s(3) or
          ldap_search_st(3) and returns a pointer to the first entry in the
          result.

          This pointer should be supplied on a subsequent call to
          ldap_next_entry() to get the next entry, the result of which
          should be supplied to the next call to ldap_next_entry(), etc.
          ldap_next_entry() will return NULL when there are no more
          entries.  The entries returned from these calls are used in calls
          to the routines described in ldap_get_dn(3),
          ldap_first_attribute(3), ldap_get_values(3), etc.

          A count of the number of entries in the search result can be
          obtained by calling ldap_count_entries().


-----------------------------------------------------

::

          If an error occurs in ldap_first_entry() or ldap_next_entry(),
          NULL is returned and the ld_errno field in the ld parameter is
          set to indicate the error.  If an error occurs in
          ldap_count_entries(), -1 is returned, and ld_errno is set
          appropriately.  See ldap_error(3) for a description of possible
          error codes.


---------------------------------------------------------

::

          ldap(3), ldap_result(3), ldap_search(3), ldap_first_attribute(3),
          ldap_get_values(3), ldap_get_dn(3)


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

   OpenLDAP LDVERSION             RELEASEDATE           LDAP_FIRST_ENTRY(3)

--------------

Pages that refer to this page: `ldap(3) <../man3/ldap.3.html>`__, 
`ldap_first_attribute(3) <../man3/ldap_first_attribute.3.html>`__, 
`ldap_first_message(3) <../man3/ldap_first_message.3.html>`__, 
`ldap_get_dn(3) <../man3/ldap_get_dn.3.html>`__, 
`ldap_get_values(3) <../man3/ldap_get_values.3.html>`__

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
