.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap_get_values(3) — Linux manual page
======================================

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

   LDAP_GET_VALUES(3)      Library Functions Manual      LDAP_GET_VALUES(3)

NAME
-------------------------------------------------

::

          ldap_get_values, ldap_get_values_len, ldap_count_values - LDAP
          attribute value handling routines


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <ldap.h>

          char **ldap_get_values(ld, entry, attr)
          LDAP *ld;
          LDAPMessage *entry;
          char *attr;

          struct berval **ldap_get_values_len(ld, entry, attr)
          LDAP *ld;
          LDAPMessage *entry;
          char *attr;

          int ldap_count_values(vals)
          char **vals;

          int ldap_count_values_len(vals)
          struct berval **vals;

          void ldap_value_free(vals)
          char **vals;

          void ldap_value_free_len(vals)
          struct berval **vals;


---------------------------------------------------------------

::

          These routines are used to retrieve and manipulate attribute
          values from an LDAP entry as returned by ldap_first_entry(3) or
          ldap_next_entry(3).  ldap_get_values() takes the entry and the
          attribute attr whose values are desired and returns a NULL-
          terminated array of the attribute's values.  attr may be an
          attribute type as returned from ldap_first_attribute(3) or
          ldap_next_attribute(3), or if the attribute type is known it can
          simply be given.

          The number of values in the array can be counted by calling
          ldap_count_values().  The array of values returned can be freed
          by calling ldap_value_free().

          If the attribute values are binary in nature, and thus not
          suitable to be returned as an array of char *'s, the
          ldap_get_values_len() routine can be used instead.  It takes the
          same parameters as ldap_get_values(), but returns a NULL-
          terminated array of pointers to berval structures, each
          containing the length of and a pointer to a value.

          The number of values in the array can be counted by calling
          ldap_count_values_len().  The array of values returned can be
          freed by calling ldap_value_free_len().


-----------------------------------------------------

::

          If an error occurs in ldap_get_values() or ldap_get_values_len(),
          NULL is returned and the ld_errno field in the ld parameter is
          set to indicate the error.  See ldap_error(3) for a description
          of possible error codes.


---------------------------------------------------

::

          These routines dynamically allocate memory which the caller must
          free using the supplied routines.


---------------------------------------------------------

::

          ldap(3), ldap_first_entry(3), ldap_first_attribute(3),
          ldap_error(3)


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

   OpenLDAP LDVERSION             RELEASEDATE            LDAP_GET_VALUES(3)

--------------

Pages that refer to this page: `ldap(3) <../man3/ldap.3.html>`__, 
`ldap_first_attribute(3) <../man3/ldap_first_attribute.3.html>`__, 
`ldap_first_entry(3) <../man3/ldap_first_entry.3.html>`__, 
`ldap_get_dn(3) <../man3/ldap_get_dn.3.html>`__, 
`ldap_parse_reference(3) <../man3/ldap_parse_reference.3.html>`__, 
`ldap_parse_result(3) <../man3/ldap_parse_result.3.html>`__

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
