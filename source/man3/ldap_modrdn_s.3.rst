.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap_modrdn(3) — Linux manual page
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

   LDAP_MODRDN(3)          Library Functions Manual          LDAP_MODRDN(3)

NAME
-------------------------------------------------

::

          ldap_modrdn, ldap_modrdn_s, ldap_modrdn2, ldap_modrdn2_s -
          Perform an LDAP modify RDN operation


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <ldap.h>

          int ldap_modrdn(ld, dn, newrdn)
          LDAP ∗ld;
          char ∗dn, ∗newrdn;

          int ldap_modrdn_s(ld, dn, newrdn)
          LDAP ∗ld;
          char ∗dn, ∗newrdn;

          int ldap_modrdn2(ld, dn, newrdn, deleteoldrdn)
          LDAP ∗ld;
          char ∗dn, ∗newrdn;
          int deleteoldrdn;

          int ldap_modrdn2_s(ld, dn, newrdn, deleteoldrdn)
          LDAP ∗ld;
          char ∗dn, ∗newrdn;
          int deleteoldrdn;


---------------------------------------------------------------

::

          The ldap_modrdn() and ldap_modrdn_s() routines perform an LDAP
          modify RDN operation.  They both take dn, the DN of the entry
          whose RDN is to be changed, and newrdn, the new RDN to give the
          entry.  The old RDN of the entry is never kept as an attribute of
          the entry.  ldap_modrdn() is asynchronous, returning the message
          id of the operation it initiates.  ldap_modrdn_s() is
          synchronous, returning the LDAP error code indicating the success
          or failure of the operation.  Use of these routines is
          deprecated.  Use the versions described below instead.

          The ldap_modrdn2() and ldap_modrdn2_s() routines also perform an
          LDAP modify RDN operation, taking the same parameters as above.
          In addition, they both take the deleteoldrdn parameter which is
          used as a boolean value to indicate whether the old RDN values
          should be deleted from the entry or not.


-----------------------------------------------------

::

          The synchronous (_s) versions of these routines return an LDAP
          error code, either LDAP_SUCCESS or an error if there was trouble.
          The asynchronous versions return -1 in case of trouble, setting
          the ld_errno field of ld.  See ldap_error(3) for more details.


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

   OpenLDAP LDVERSION             RELEASEDATE                LDAP_MODRDN(3)

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
