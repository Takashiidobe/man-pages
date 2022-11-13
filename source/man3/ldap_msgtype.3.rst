.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap_result(3) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `LIBRARY <#LIBRARY>`__ \|         |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LDAP_RESULT(3)          Library Functions Manual          LDAP_RESULT(3)

NAME
-------------------------------------------------

::

          ldap_result - Wait for the result of an LDAP operation


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <ldap.h>

          int ldap_result( LDAP *ld, int msgid, int all,
               struct timeval *timeout, LDAPMessage **result );

          int ldap_msgfree( LDAPMessage *msg );

          int ldap_msgtype( LDAPMessage *msg );

          int ldap_msgid( LDAPMessage *msg );


---------------------------------------------------------------

::

          The ldap_result() routine is used to wait for and return the
          result of an operation previously initiated by one of the LDAP
          asynchronous operation routines (e.g., ldap_search_ext(3),
          ldap_modify_ext(3), etc.).  Those routines all return -1 in case
          of error, and an invocation identifier upon successful initiation
          of the operation. The invocation identifier is picked by the
          library and is guaranteed to be unique across the LDAP session.
          It can be used to request the result of a specific operation from
          ldap_result() through the msgid parameter.

          The ldap_result() routine will block or not, depending upon the
          setting of the timeout parameter.  If timeout is not a NULL
          pointer,  it  specifies  a  maximum interval  to wait for the
          selection to complete.  If timeout is a NULL  pointer, the
          LDAP_OPT_TIMEOUT value set by ldap_set_option(3) is used. With
          the default setting, the  select  blocks  indefinitely.   To
          effect  a  poll,  the  timeout argument should be a non-NULL
          pointer, pointing to a zero-valued timeval structure.  To obtain
          the behavior of the default setting, bypassing any value set by
          ldap_set_option(3), set to -1 the tv_sec field of the timeout
          parameter.  See select(2) for further details.

          If the result of a specific operation is required, msgid should
          be set to the invocation identifier returned when the operation
          was initiated, otherwise LDAP_RES_ANY or LDAP_RES_UNSOLICITED
          should be supplied to wait for any or unsolicited response.

          The all parameter, if non-zero, causes ldap_result() to return
          all responses with msgid, otherwise only the next response is
          returned.  This is commonly used to obtain all the responses of a
          search operation.

          A search response is made up of zero or more search entries, zero
          or more search references, and zero or more extended partial
          responses followed by a search result.  If all is set to 0,
          search entries will be returned one at a time as they come in,
          via separate calls to ldap_result().  If it's set to 1, the
          search response will only be returned in its entirety, i.e.,
          after all entries, all references, all extended partial
          responses, and the final search result have been received.


-----------------------------------------------------------------

::

          Upon success, the type of the result received is returned and the
          result parameter will contain the result of the operation;
          otherwise, the result parameter is undefined.  This result should
          be passed to the LDAP parsing routines, ldap_first_message(3) and
          friends, for interpretation.

          The possible result types returned are:

               LDAP_RES_BIND (0x61)
               LDAP_RES_SEARCH_ENTRY (0x64)
               LDAP_RES_SEARCH_REFERENCE (0x73)
               LDAP_RES_SEARCH_RESULT (0x65)
               LDAP_RES_MODIFY (0x67)
               LDAP_RES_ADD (0x69)
               LDAP_RES_DELETE (0x6b)
               LDAP_RES_MODDN (0x6d)
               LDAP_RES_COMPARE (0x6f)
               LDAP_RES_EXTENDED (0x78)
               LDAP_RES_INTERMEDIATE (0x79)

          The ldap_msgfree() routine is used to free the memory allocated
          for result(s) by ldap_result() or ldap_search_ext_s(3) and
          friends.  It takes a pointer to the result or result chain to be
          freed and returns the type of the last message in the chain.  If
          the parameter is NULL, the function does nothing and returns
          zero.

          The ldap_msgtype() routine returns the type of a message.

          The ldap_msgid() routine returns the message id of a message.


-----------------------------------------------------

::

          ldap_result() returns -1 if something bad happens, and zero if
          the timeout specified was exceeded.  ldap_msgtype() and
          ldap_msgid() return -1 on error.


---------------------------------------------------------

::

          ldap(3), ldap_first_message(3), select(2)


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

   OpenLDAP LDVERSION             RELEASEDATE                LDAP_RESULT(3)

--------------

Pages that refer to this page: `ldap(3) <../man3/ldap.3.html>`__, 
`ldap_abandon(3) <../man3/ldap_abandon.3.html>`__, 
`ldap_add(3) <../man3/ldap_add.3.html>`__, 
`ldap_bind(3) <../man3/ldap_bind.3.html>`__, 
`ldap_compare(3) <../man3/ldap_compare.3.html>`__, 
`ldap_delete(3) <../man3/ldap_delete.3.html>`__, 
`ldap_extended_operation(3) <../man3/ldap_extended_operation.3.html>`__, 
`ldap_first_entry(3) <../man3/ldap_first_entry.3.html>`__, 
`ldap_first_message(3) <../man3/ldap_first_message.3.html>`__, 
`ldap_first_reference(3) <../man3/ldap_first_reference.3.html>`__, 
`ldap_get_option(3) <../man3/ldap_get_option.3.html>`__, 
`ldap_modify(3) <../man3/ldap_modify.3.html>`__, 
`ldap_parse_reference(3) <../man3/ldap_parse_reference.3.html>`__, 
`ldap_parse_result(3) <../man3/ldap_parse_result.3.html>`__, 
`ldap_parse_sort_control(3) <../man3/ldap_parse_sort_control.3.html>`__, 
`ldap_rename(3) <../man3/ldap_rename.3.html>`__, 
`ldap_search(3) <../man3/ldap_search.3.html>`__, 
`ldap_sync(3) <../man3/ldap_sync.3.html>`__, 
`ldap.conf(5) <../man5/ldap.conf.5.html>`__

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
