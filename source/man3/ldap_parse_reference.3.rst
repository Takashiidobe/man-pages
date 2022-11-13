.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap_parse_reference(3) — Linux manual page
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

   LDAP_PARSE_REFERENCE(3) Library Functions Manual LDAP_PARSE_REFERENCE(3)

NAME
-------------------------------------------------

::

          ldap_parse_reference - Extract referrals and controls from a
          reference message


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <ldap.h>

          int ldap_parse_reference( LDAP *ld, LDAPMessage *reference,
               char ***referralsp, LDAPControl ***serverctrlsp,
               int freeit )


---------------------------------------------------------------

::

          The ldap_parse_reference() routine is used to extract referrals
          and controls from a reference message.  The reference parameter
          is a reference message as returned by a call to
          ldap_first_reference(3), ldap_next_reference(3),
          ldap_first_message(3), ldap_next_message(3), or ldap_result(3).

          The referralsp parameter will be filled in with an allocated
          array of character strings. The strings are copies of the
          referrals contained in the parsed message. The array should be
          freed by calling ldap_value_free(3).  If referralsp is NULL, no
          referrals are returned.  If no referrals were returned,
          *referralsp is set to NULL.

          The serverctrlsp parameter will be filled in with an allocated
          array of controls copied from the parsed message. The array
          should be freed by calling ldap_controls_free(3).  If
          serverctrlsp is NULL, no controls are returned.  If no controls
          were returned, *serverctrlsp is set to NULL.

          The freeit parameter determines whether the parsed message is
          freed or not after the extraction. Any non-zero value will make
          it free the message. The ldap_msgfree(3) routine can also be used
          to free the message later.


-----------------------------------------------------

::

          Upon success LDAP_SUCCESS is returned. Otherwise the values of
          the referralsp and serverctrlsp parameters are undefined.


---------------------------------------------------------

::

          ldap(3), ldap_first_reference(3), ldap_first_message(3),
          ldap_result(3), ldap_get_values(3), ldap_controls_free(3)


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

   OpenLDAP LDVERSION             RELEASEDATE       LDAP_PARSE_REFERENCE(3)

--------------

Pages that refer to this page:
`ldap_first_reference(3) <../man3/ldap_first_reference.3.html>`__, 
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
