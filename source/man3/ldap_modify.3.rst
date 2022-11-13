.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap_modify(3) — Linux manual page
==================================

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

   LDAP_MODIFY(3)          Library Functions Manual          LDAP_MODIFY(3)

NAME
-------------------------------------------------

::

          ldap_modify_ext, ldap_modify_ext_s - Perform an LDAP modify
          operation


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <ldap.h>

          int ldap_modify_ext(
                 LDAP *ld,
                 char *dn,
                 LDAPMod *mods[],
                 LDAPControl **sctrls,
                 LDAPControl **cctrls,
                 int *msgidp );

          int ldap_modify_ext_s(
                 LDAP *ld,
                 char *dn,
                 LDAPMod *mods[],
                 LDAPControl **sctrls,
                 LDAPControl **cctrls );

          void ldap_mods_free(
                 LDAPMod **mods,
                 int freemods );


---------------------------------------------------------------

::

          The routine ldap_modify_ext_s() is used to perform an LDAP modify
          operation.  dn is the DN of the entry to modify, and mods is a
          null-terminated array of modifications to make to the entry.
          Each element of the mods array is a pointer to an LDAPMod
          structure, which is defined below.

               typedef struct ldapmod {
                   int mod_op;
                   char *mod_type;
                   union {
                       char **modv_strvals;
                       struct berval **modv_bvals;
                   } mod_vals;
               } LDAPMod;
               #define mod_values mod_vals.modv_strvals
               #define mod_bvalues mod_vals.modv_bvals

          The mod_op field is used to specify the type of modification to
          perform and should be one of LDAP_MOD_ADD, LDAP_MOD_DELETE, or
          LDAP_MOD_REPLACE.  The mod_type and mod_values fields specify the
          attribute type to modify and a null-terminated array of values to
          add, delete, or replace respectively.

          If you need to specify a non-string value (e.g., to add a photo
          or audio attribute value), you should set mod_op to the logical
          OR of the operation as above (e.g., LDAP_MOD_REPLACE) and the
          constant LDAP_MOD_BVALUES.  In this case, mod_bvalues should be
          used instead of mod_values, and it should point to a null-
          terminated array of struct bervals, as defined in <lber.h>.

          For LDAP_MOD_ADD modifications, the given values are added to the
          entry, creating the attribute if necessary.  For LDAP_MOD_DELETE
          modifications, the given values are deleted from the entry,
          removing the attribute if no values remain.  If the entire
          attribute is to be deleted, the mod_values field should be set to
          NULL.  For LDAP_MOD_REPLACE modifications, the attribute will
          have the listed values after the modification, having been
          created if necessary.  All modifications are performed in the
          order in which they are listed.

          ldap_mods_free() can be used to free each element of a NULL-
          terminated array of mod structures.  If freemods is non-zero, the
          mods pointer itself is freed as well.

          ldap_modify_ext_s() returns a code indicating success or, in the
          case of failure, indicating the nature of the failure.  See
          ldap_error(3) for details

          The ldap_modify_ext() operation works the same way as
          ldap_modify_ext_s(), except that it is asynchronous. The integer
          that msgidp points to is set to the message id of the modify
          request.  The result of the operation can be obtained by calling
          ldap_result(3).

          Both ldap_modify_ext() and ldap_modify_ext_s() allows server and
          client controls to be passed in via the sctrls and cctrls
          parameters, respectively.


-----------------------------------------------------------------------------------

::

          The ldap_modify() and ldap_modify_s() routines are deprecated in
          favor of the ldap_modify_ext() and ldap_modify_ext_s() routines,
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

          ldap(3), ldap_error(3),


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

   OpenLDAP LDVERSION             RELEASEDATE                LDAP_MODIFY(3)

--------------

Pages that refer to this page:
`ldapmodify(1) <../man1/ldapmodify.1.html>`__, 
`ldap_add(3) <../man3/ldap_add.3.html>`__, 
`ldap_get_option(3) <../man3/ldap_get_option.3.html>`__, 
`ldap_rename(3) <../man3/ldap_rename.3.html>`__, 
`ldap_result(3) <../man3/ldap_result.3.html>`__

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
