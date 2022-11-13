.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap_first_reference(3) — Linux manual page
===========================================

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

   LDAP_FIRST_REFERENCE(3) Library Functions Manual LDAP_FIRST_REFERENCE(3)

NAME
-------------------------------------------------

::

          ldap_first_reference, ldap_next_reference, ldap_count_references
          - Stepping through continuation references in a result chain


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <ldap.h>

          int ldap_count_references( LDAP *ld, LDAPMessage *result )

          LDAPMessage *ldap_first_reference( LDAP *ld, LDAPMessage *result )

          LDAPMessage *ldap_next_reference( LDAP *ld, LDAPMessage *reference )


---------------------------------------------------------------

::

          These routines are used to step through the continuation
          references in a result chain received from ldap_result(3) or the
          synchronous LDAP search operation routines.

          The ldap_first_reference() routine is used to retrieve the first
          reference message in a result chain.  It takes the result as
          returned by a call to ldap_result(3), ldap_search_s(3) or
          ldap_search_st(3) and returns a pointer to the first reference
          message in the result chain.

          This pointer should be supplied on a subsequent call to
          ldap_next_reference() to get the next reference message, the
          result of which should be supplied to the next call to
          ldap_next_reference(), etc.  ldap_next_reference() will return
          NULL when there are no more reference messages.  The reference
          messages returned from these calls are used by
          ldap_parse_reference(3) to extract referrals and controls.

          A count of the number of reference messages in the search result
          can be obtained by calling ldap_count_references().  It can also
          be used to count the number of reference messages remaining in a
          result chain.


-----------------------------------------------------

::

          If an error occurs in ldap_first_reference() or
          ldap_next_reference(), NULL is returned.  If an error occurs in
          ldap_count_references(), -1 is returned.


---------------------------------------------------------

::

          ldap(3), ldap_result(3), ldap_search(3), ldap_parse_reference(3)


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

   OpenLDAP LDVERSION             RELEASEDATE       LDAP_FIRST_REFERENCE(3)

--------------

Pages that refer to this page:
`ldap_first_message(3) <../man3/ldap_first_message.3.html>`__, 
`ldap_parse_reference(3) <../man3/ldap_parse_reference.3.html>`__

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
