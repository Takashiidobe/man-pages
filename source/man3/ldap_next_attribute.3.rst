.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap_first_attribute(3) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `LIBRARY <#LIBRARY>`__ \|         |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ERRORS <#ERRORS>`__ \|           |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LDAP_FIRST_ATTRIBUTE(3) Library Functions Manual LDAP_FIRST_ATTRIBUTE(3)

NAME
-------------------------------------------------

::

          ldap_first_attribute, ldap_next_attribute - step through LDAP
          entry attributes


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <ldap.h>

          char *ldap_first_attribute(
               LDAP *ld, LDAPMessage *entry, BerElement **berptr )

          char *ldap_next_attribute(
               LDAP *ld, LDAPMessage *entry, BerElement *ber )

          int ldap_get_attribute_ber(
               LDAP *ld, LDAPMessage *entry, BerElement *ber,
               BerValue *attr, BerVarray *vals )


---------------------------------------------------------------

::

          The ldap_first_attribute(), ldap_next_attribute() and
          ldap_get_attribute_ber() routines are used to step through the
          attributes in an LDAP entry.  ldap_first_attribute() takes an
          entry as returned by ldap_first_entry(3) or ldap_next_entry(3)
          and returns a pointer to character string containing the first
          attribute description in the entry.  ldap_next_attribute()
          returns the next attribute description in the entry.

          It also returns, in berptr, a pointer to a BerElement it has
          allocated to keep track of its current position.  This pointer
          should be passed to subsequent calls to ldap_next_attribute() and
          is used to effectively step through the entry's attributes.  The
          caller is solely responsible for freeing the BerElement pointed
          to by berptr when it is no longer needed by calling ber_free(3).
          When calling ber_free(3) in this instance, be sure the second
          argument is 0.

          The attribute names returned are suitable for inclusion in a call
          to ldap_get_values(3) to retrieve the attribute's values.

          The ldap_get_attribute_ber() routine allows one to iterate over
          all attributes in-place, without allocating memory to hold text
          for the attribute name or its values, if requested. The use case
          is similar to ldap_next_attribute() except that the attribute
          name is returned into attr and, if vals is non-NULL, the list of
          values is stored there. Both point into the LDAP message and
          remain valid only while the entry is valid.  The caller is still
          responsible for freeing vals with ldap_memfree(3), if used.


-----------------------------------------------------

::

          If an error occurs, NULL is returned and the ld_errno field in
          the ld parameter is set to indicate the error.  See ldap_error(3)
          for a description of possible error codes.


---------------------------------------------------

::

          The ldap_first_attribute() and ldap_next_attribute() return
          dynamically allocated memory that must be freed by the caller via
          ldap_memfree(3).  For ldap_get_attribute_ber(), only the actual
          vals pointer needs to be freed with ldap_memfree(3), other data
          is accounted for as part of ber.


---------------------------------------------------------

::

          ldap(3), ldap_first_entry(3), ldap_get_values(3), ldap_error(3)


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

   OpenLDAP LDVERSION             RELEASEDATE       LDAP_FIRST_ATTRIBUTE(3)

--------------

Pages that refer to this page: `ldap(3) <../man3/ldap.3.html>`__, 
`ldap_first_entry(3) <../man3/ldap_first_entry.3.html>`__, 
`ldap_get_values(3) <../man3/ldap_get_values.3.html>`__, 
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
