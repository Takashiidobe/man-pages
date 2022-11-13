.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap_extended_operation(3) — Linux manual page
==============================================

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

   LDAP_EXTENDED_OPERATION(3)brary Functions ManualAP_EXTENDED_OPERATION(3)

NAME
-------------------------------------------------

::

          ldap_extended_operation, ldap_extended_operation_s - Extends the
          LDAP operations to the LDAP server.


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <ldap.h>

          int ldap_extended_operation(
                 LDAP *ld,
                 const char *requestoid,
                 const struct berval *requestdata,
                 LDAPControl **sctrls,
                 LDAPControl **cctrls,
                 int *msgidp );

          int ldap_extended_operation_s(
                 LDAP *ld,
                 const char *requestoid,
                 const struct berval *requestdata,
                 LDAPControl **sctrls,
                 LDAPControl **cctrls,
                 char **retoidp,
                 struct berval **retdatap );


---------------------------------------------------------------

::

          The ldap_extended_operation_s() routine is used to synchronously
          perform an LDAP extended operation.  It takes requestoid, which
          points to a dotted-decimal OID string identifying the extended
          operation to perform. requestdata is the data required for the
          request, sctrls is an array of LDAPControl structures to use with
          this extended operation, cctrls is an array of LDAPControl
          structures that list the client controls to use with this
          extended operation.

          The output parameter retoidp points to a dotted-decimal OID
          string returned by the LDAP server.  The memory used by the
          string should be freed with the ldap_memfree(3) function.  The
          output parameter retdatap points to a pointer to a berval
          structure that contains the returned data.  If no data is
          returned by the server, the pointer is set this to NULL.  The
          memory used by this structure should be freed with the
          ber_bvfree(3) function.

          The ldap_extended_operation() works just like
          ldap_extended_operation_s(), but the operation is asynchronous.
          It provides the message id of the request it initiated in the
          integer pointed to be msgidp.  The result of this operation can
          be obtained by calling ldap_result(3).


---------------------------------------------------------

::

          ber_bvfree(3), ldap_memfree(3), ldap_parse_extended_result(3),
          ldap_result(3)


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

   OpenLDAP LDVERSION             RELEASEDATE    LDAP_EXTENDED_OPERATION(3)

--------------

Pages that refer to this page:
`ldapexop(1) <../man1/ldapexop.1.html>`__, 
`ldappasswd(1) <../man1/ldappasswd.1.html>`__, 
`ldapvc(1) <../man1/ldapvc.1.html>`__, 
`ldapwhoami(1) <../man1/ldapwhoami.1.html>`__

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
