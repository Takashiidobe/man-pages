.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap_parse_result(3) — Linux manual page
========================================

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

   LDAP_PARSE_RESULT(3)    Library Functions Manual    LDAP_PARSE_RESULT(3)

NAME
-------------------------------------------------

::

          ldap_parse_result - Parsing results


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <ldap.h>

          int ldap_parse_result( LDAP *ld, LDAPMessage *result,
               int *errcodep, char **matcheddnp, char **errmsgp,
               char ***referralsp, LDAPControl ***serverctrlsp,
               int freeit )

          int ldap_parse_sasl_bind_result( LDAP *ld, LDAPMessage *result,
               struct berval **servercredp, int freeit )

          int ldap_parse_extended_result( LDAP *ld, LDAPMessage *result,
               char **retoidp, struct berval **retdatap, int freeit )

          int ldap_parse_intermediate( LDAP *ld, LDAPMessage *result,
               char **retoidp, struct berval **retdatap,
               LDAPControl ***serverctrlsp, int freeit )


---------------------------------------------------------------

::

          These routines are used to extract information from a result
          message.  They will operate on the first result message in a
          chain of search results (skipping past other message types). They
          take the result as returned by a call to ldap_result(3),
          ldap_search_s(3) or ldap_search_st(3).  In addition to
          ldap_parse_result(), the routines ldap_parse_sasl_bind_result()
          and ldap_parse_extended_result() are used to get all the result
          information from SASL bind and extended operations. To extract
          information from intermediate responses,
          ldap_parse_intermediate() can be used.

          The errcodep parameter will be filled in with the result code
          from the result message.

          The server might supply a matched DN string in the message
          indicating how much of a name in a request was recognized. The
          matcheddnp parameter will be filled in with this string if
          supplied, else it will be NULL. If a string is returned, it
          should be freed using ldap_memfree(3).

          The errmsgp parameter will be filled in with the error message
          field from the parsed message. This string should be freed using
          ldap_memfree(3).

          The referralsp parameter will be filled in with an allocated
          array of referral strings from the parsed message. This array
          should be freed using ldap_memvfree(3).  If no referrals were
          returned, *referralsp is set to NULL.

          The serverctrlsp parameter will be filled in with an allocated
          array of controls copied from the parsed message. The array
          should be freed using ldap_controls_free(3).  If no controls were
          returned, *serverctrlsp is set to NULL.

          The freeit parameter determines whether the parsed message is
          freed or not after the extraction. Any non-zero value will make
          it free the message. The ldap_msgfree(3) routine can also be used
          to free the message later.

          For SASL bind results, the servercredp parameter will be filled
          in with an allocated berval structure containing the credentials
          from the server if present. The structure should be freed using
          ber_bvfree(3).

          For extended results and intermediate responses, the retoidp
          parameter will be filled in with the dotted-OID text
          representation of the name of the extended operation response.
          The string should be freed using ldap_memfree(3).  If no OID was
          returned, *retoidp is set to NULL.

          For extended results and intermediate responses, the retdatap
          parameter will be filled in with a pointer to a berval structure
          containing the data from the extended operation response. The
          structure should be freed using ber_bvfree(3).  If no data were
          returned, *retdatap is set to NULL.

          For all the above result parameters, NULL values can be used in
          calls in order to ignore certain fields.


-----------------------------------------------------

::

          Upon success LDAP_SUCCESS is returned. Otherwise the values of
          the result parameters are undefined.


---------------------------------------------------------

::

          ldap(3), ldap_result(3), ldap_search(3), ldap_memfree(3),
          ldap_memvfree(3), ldap_get_values(3), ldap_controls_free(3),
          lber-types(3)


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

   OpenLDAP LDVERSION             RELEASEDATE          LDAP_PARSE_RESULT(3)

--------------

Pages that refer to this page: `ldap(3) <../man3/ldap.3.html>`__, 
`ldap_extended_operation(3) <../man3/ldap_extended_operation.3.html>`__, 
`ldap_first_message(3) <../man3/ldap_first_message.3.html>`__, 
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
