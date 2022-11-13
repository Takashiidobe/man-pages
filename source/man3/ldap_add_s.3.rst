.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap_add(3) — Linux manual page
===============================

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

   LDAP_ADD(3)             Library Functions Manual             LDAP_ADD(3)

NAME
-------------------------------------------------

::

          ldap_add_ext, ldap_add_ext_s - Perform an LDAP add operation


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <ldap.h>

          int ldap_add_ext(
                 LDAP *ld,
                 const char *dn,
                 LDAPMod **attrs,
                 LDAPControl **sctrls,
                 LDAPControl **cctrls,
                 int *msgidp );

          int ldap_add_ext_s(
                 LDAP *ld,
                 const char *dn,
                 LDAPMod **attrs,
                 LDAPControl *sctrls,
                 LDAPControl *cctrls );


---------------------------------------------------------------

::

          The ldap_add_ext_s() routine is used to perform an LDAP add
          operation.  It takes dn, the DN of the entry to add, and attrs, a
          null-terminated array of the entry's attributes.  The LDAPMod
          structure is used to represent attributes, with the mod_type and
          mod_values fields being used as described under
          ldap_modify_ext(3), and the ldap_op field being used only if you
          need to specify the LDAP_MOD_BVALUES option. Otherwise, it should
          be set to zero.

          Note that all entries except that specified by the last component
          in the given DN must already exist.  ldap_add_ext_s() returns an
          code indicating success or, in the case of failure, indicating
          the nature of failure of the operation.  See ldap_error(3) for
          more details.

          The ldap_add_ext() routine works just like ldap_add_ext_s(), but
          it is asynchronous.  It returns the message id of the request it
          initiated.  The result of this operation can be obtained by
          calling ldap_result(3).


-----------------------------------------------------------------------------------

::

          The ldap_add() and ldap_add_s() routines are deprecated in favor
          of the ldap_add_ext() and ldap_add_ext_s() routines,
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

          ldap(3), ldap_error(3), ldap_modify(3)


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

   OpenLDAP LDVERSION             RELEASEDATE                   LDAP_ADD(3)

--------------

Pages that refer to this page:
`ldapmodify(1) <../man1/ldapmodify.1.html>`__, 
`ldap_get_option(3) <../man3/ldap_get_option.3.html>`__

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
