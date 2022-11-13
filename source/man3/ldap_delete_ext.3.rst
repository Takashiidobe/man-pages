.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap_delete(3) — Linux manual page
==================================

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

   LDAP_DELETE(3)          Library Functions Manual          LDAP_DELETE(3)

NAME
-------------------------------------------------

::

          ldap_delete, ldap_delete_s, ldap_delete_ext, ldap_delete_ext_s -
          Perform an LDAP delete operation.


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <ldap.h>

          int ldap_delete_s(ld, dn)
          LDAP *ld;
          char *dn;

          int ldap_delete(ld, dn)
          LDAP *ld;
          char *dn;

          int ldap_delete_ext(ld, dn, serverctrls, clientctrls, msgidp)
          LDAP *ld;
          char *dn;
          LDAPControl **serverctrls, **clientctrls;
          int *msgidp;

          int ldap_delete_ext_s(ld, dn, serverctrls, clientctrls)
          LDAP *ld;
          char *dn;
          LDAPControl **serverctrls, **clientctrls;


---------------------------------------------------------------

::

          The ldap_delete_s() routine is used to perform an LDAP delete
          operation synchronously. It takes dn, the DN of the entry to be
          deleted.  It returns an LDAP error code, indicating the success
          or failure of the operation.

          The ldap_delete() routine is used to perform an LDAP delete
          operation asynchronously. It takes the same parameters as
          ldap_delete_s(), but returns the message id of the request it
          initiated. The result of the delete can be obtained by a
          subsequent call to ldap_result(3).

          The ldap_delete_ext() routine  allows  server  and client
          controls to be specified to extend the delete request. This
          routine is asynchronous like ldap_delete(), but its return value
          is an LDAP error code. It stores the message id of the request in
          the integer pointed to by msgidp.

          The ldap_delete_ext_s() routine is the synchronous version of
          ldap_delete_ext().  It also returns an LDAP error code indicating
          success or failure of the operation.


-----------------------------------------------------

::

          ldap_delete_s() returns an LDAP error code which can be
          interpreted by calling one of ldap_perror(3) and friends.
          ldap_delete() returns -1 if something went wrong initiating the
          request. It returns the non-negative message id of the request if
          things went ok.

          ldap_delete_ext() and ldap_delete_ext_s() return some Non-zero
          value if something  went wrong initiating the request, else
          return 0.


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

   OpenLDAP LDVERSION             RELEASEDATE                LDAP_DELETE(3)

--------------

Pages that refer to this page:
`ldapdelete(1) <../man1/ldapdelete.1.html>`__, 
`ldapmodify(1) <../man1/ldapmodify.1.html>`__

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
