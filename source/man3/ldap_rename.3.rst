.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap_rename(3) — Linux manual page
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

   LDAP_RENAME(3)          Library Functions Manual          LDAP_RENAME(3)

NAME
-------------------------------------------------

::

          ldap_rename, ldap_rename_s - Renames the specified entry.


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <ldap.h>

          int ldap_rename( ld, dn, newrdn, newparent, deleteoldrdn, sctrls[], cctrls[], msgidp );
          LDAP *ld;
          const char *dn, *newrdn, *newparent;
          int deleteoldrdn;
          LDAPControl *sctrls[], *cctrls[];
          int *msgidp);

          int ldap_rename_s( ld, dn, newrdn, newparent, deleteoldrdn, sctrls[], cctrls[] );
          LDAP *ld;
          const char *dn, *newrdn, *newparent;
          int deleteoldrdn;
          LDAPControl *sctrls[], *cctrls[];


---------------------------------------------------------------

::

          These routines are used to perform a LDAP rename operation.  The
          function changes the leaf component of an entry's distinguished
          name and  optionally moves the entry to a new parent container.
          The ldap_rename_s performs a rename operation synchronously.  The
          method takes dn, which points to the distinguished name of the
          entry whose attribute is being compared, newparent,the
          distinguished name of the entry's new parent. If this parameter
          is NULL, only the RDN is changed.  The root DN is specified by
          passing a zero length string, "".  deleteoldrdn specifies whether
          the old RDN should be retained or deleted.  Zero indicates that
          the old RDN should be retained. If you choose this option, the
          attribute will contain both names (the old and the new).  Non-
          zero indicates that the old RDN should be deleted.  serverctrls
          points to an array of LDAPControl structures that list the client
          controls to use with this extended operation. Use NULL to specify
          no client controls. clientctrls points to an array of LDAPControl
          structures that list the client controls to use with the search.

          ldap_rename works just like ldap_rename_s, but the operation is
          asynchronous. It returns the message id of the request it
          initiated. The result of this operation can be obtained by
          calling ldap_result(3).


-----------------------------------------------------

::

          ldap_rename() returns -1 in case of error initiating the request,
          and will set the ld_errno field in the ld parameter to indicate
          the error.  ldap_rename_s() returns the LDAP error code resulting
          from the rename operation.


---------------------------------------------------------

::

          ldap(3), ldap_modify(3)


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

   OpenLDAP LDVERSION             RELEASEDATE                LDAP_RENAME(3)

--------------

Pages that refer to this page:
`ldapmodify(1) <../man1/ldapmodify.1.html>`__, 
`ldapmodrdn(1) <../man1/ldapmodrdn.1.html>`__

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
