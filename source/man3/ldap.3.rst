.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldap(3) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `LIBRARY <#LIBRARY>`__ \|         |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| LDAP versions <#LDAP_versions>`__ |                                   |
| \|                                |                                   |
| `INPUT and OUTPUT PARAMETERS      |                                   |
| <#INPUT_and_OUTPUT_PARAMETERS>`__ |                                   |
| \|                                |                                   |
| `DISPLAYING                       |                                   |
|  RESULTS <#DISPLAYING_RESULTS>`__ |                                   |
| \|                                |                                   |
| `UTILIT                           |                                   |
| Y ROUTINES <#UTILITY_ROUTINES>`__ |                                   |
| \|                                |                                   |
| `DEPRECATED INTER                 |                                   |
| FACES <#DEPRECATED_INTERFACES>`__ |                                   |
| \| `BER LIBRARY <#BER_LIBRARY>`__ |                                   |
| \| `INDEX <#INDEX>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LDAP(3)                 Library Functions Manual                 LDAP(3)

NAME
-------------------------------------------------

::

          ldap - OpenLDAP Lightweight Directory Access Protocol API


-------------------------------------------------------

::

          OpenLDAP LDAP (libldap, -lldap)


---------------------------------------------------------

::

          #include <ldap.h>


---------------------------------------------------------------

::

          The Lightweight Directory Access Protocol (LDAP) (RFC 4510)
          provides access to X.500 directory services.  These services may
          be stand-alone or part of a distributed directory service.  This
          client API supports LDAP over TCP (RFC 4511), LDAP over TLS/SSL,
          and LDAP over IPC (UNIX domain sockets).  This API supports SASL
          (RFC 4513) and Start TLS (RFC 4513) as well as a number of
          protocol extensions.  This API is loosely based upon IETF/LDAPEXT
          C LDAP API draft specification, a (orphaned) work in progress.

          The OpenLDAP Software package includes a stand-alone server in
          slapd(8), various LDAP clients, and an LDAP client library used
          to provide programmatic access to the LDAP protocol. This man
          page gives an overview of the LDAP library routines.

          Both synchronous and asynchronous APIs are provided.  Also
          included are various routines to parse the results returned from
          these routines.  These routines are found in the -lldap library.

          The basic interaction is as follows.  A session handle is created
          using ldap_initialize(3) and set the protocol version to 3 by
          calling ldap_set_option(3).  The underlying session is
          established first operation is issued.  This would generally be a
          Start TLS or Bind operation, or a Search operation to read
          attributes of the Root DSE.  A Start TLS operation is performed
          by calling ldap_start_tls_s(3).  A LDAP bind operation is
          performed by calling ldap_sasl_bind(3) or one of its friends.  A
          Search operation is performed by calling ldap_search_ext_s(3) or
          one of its friends.

          Subsequently, additional operations are performed by calling one
          of the synchronous or asynchronous routines (e.g.,
          ldap_compare_ext_s(3) or ldap_compare_ext(3) followed by
          ldap_result(3)).  Results returned from these routines are
          interpreted by calling the LDAP parsing routines such as
          ldap_parse_result(3).  The LDAP association and underlying
          connection is terminated by calling ldap_unbind_ext(3).  Errors
          can be interpreted by calling ldap_err2string(3).


-------------------------------------------------------------------

::

          This library supports version 3 of the Lightweight Directory
          Access Protocol (LDAPv3) as defined in RFC 4510.  It also
          supports a variant of version 2 of LDAP as defined by U-Mich LDAP
          and, to some degree, RFC 1777.  Version 2 (all variants) are
          considered obsolete.  Version 3 should be used instead.

          For backwards compatibility reasons, the library defaults to
          version 2.  Hence, all new applications (and all actively
          maintained applications) should use ldap_set_option(3) to select
          version 3.  The library manual pages assume version 3 has been
          selected.


-----------------------------------------------------------------------------------------------

::

          All character string input/output is expected to be/is UTF-8
          encoded Unicode (version 3.2).

          Distinguished names (DN) (and relative distinguished names (RDN)
          to be passed to the LDAP routines should conform to RFC 4514
          UTF-8 string representation.

          Search filters to be passed to the search routines are to be
          constructed by hand and should conform to RFC 4515 UTF-8 string
          representation.

          LDAP URLs to be passed to routines are expected to conform to RFC
          4516 format.  The ldap_url(3) routines can be used to work with
          LDAP URLs.

          LDAP controls to be passed to routines can be manipulated using
          the ldap_controls(3) routines.


-----------------------------------------------------------------------------

::

          Results obtained from the search routines can be output by hand,
          by calling ldap_first_entry(3) and ldap_next_entry(3) to step
          through the entries returned, ldap_first_attribute(3) and
          ldap_next_attribute(3) to step through an entry's attributes, and
          ldap_get_values(3) to retrieve a given attribute's values.
          Attribute values may or may not be displayable.


-------------------------------------------------------------------------

::

          Also provided are various utility routines.  The ldap_sort(3)
          routines are used to sort the entries and values returned via the
          ldap search routines.


-----------------------------------------------------------------------------------

::

          A number of interfaces are now considered deprecated.  For
          instance, ldap_add(3) is deprecated in favor of ldap_add_ext(3).
          Deprecated interfaces generally remain in the library.  The macro
          LDAP_DEPRECATED can be defined to a non-zero value (e.g.,
          -DLDAP_DEPRECATED=1) when compiling program designed to use
          deprecated interfaces.  It is recommended that developers writing
          new programs, or updating old programs, avoid use of deprecated
          interfaces.  Over time, it is expected that documentation (and,
          eventually, support) for deprecated interfaces to be eliminated.


---------------------------------------------------------------

::

          Also included in the distribution is a set of lightweight Basic
          Encoding Rules routines.  These routines are used by the LDAP
          library routines to encode and decode LDAP protocol elements
          using the (slightly simplified) Basic Encoding Rules defined by
          LDAP.  They are not normally used directly by an LDAP application
          program except in the handling of controls and extended
          operations.  The routines provide a printf and scanf-like
          interface, as well as lower-level access.  These routines are
          discussed in lber-decode(3), lber-encode(3), lber-memory(3), and
          lber-types(3).


---------------------------------------------------

::

          ldap_initialize(3)
                 initialize the LDAP library without opening a connection
                 to a server

          ldap_result(3)
                 wait for the result from an asynchronous operation

          ldap_abandon_ext(3)
                 abandon (abort) an asynchronous operation

          ldap_add_ext(3)
                 asynchronously add an entry

          ldap_add_ext_s(3)
                 synchronously add an entry

          ldap_sasl_bind(3)
                 asynchronously bind to the directory

          ldap_sasl_bind_s(3)
                 synchronously bind to the directory

          ldap_unbind_ext(3)
                 synchronously unbind from the LDAP server and close the
                 connection

          ldap_unbind(3) and ldap_unbind_s(3) are
                 equivalent to ldap_unbind_ext(3)

          ldap_memfree(3)
                 dispose of memory allocated by LDAP routines.

          ldap_compare_ext(3)
                 asynchronously compare to a directory entry

          ldap_compare_ext_s(3)
                 synchronously compare to a directory entry

          ldap_delete_ext(3)
                 asynchronously delete an entry

          ldap_delete_ext_s(3)
                 synchronously delete an entry

          ld_errno(3)
                 LDAP error indication

          ldap_errlist(3)
                 list of LDAP errors and their meanings

          ldap_err2string(3)
                 convert LDAP error indication to a string

          ldap_extended_operation(3)
                 asynchronously perform an arbitrary extended operation

          ldap_extended_operation_s(3)
                 synchronously perform an arbitrary extended operation

          ldap_first_attribute(3)
                 return first attribute name in an entry

          ldap_next_attribute(3)
                 return next attribute name in an entry

          ldap_first_entry(3)
                 return first entry in a chain of search results

          ldap_next_entry(3)
                 return next entry in a chain of search results

          ldap_count_entries(3)
                 return number of entries in a search result

          ldap_get_dn(3)
                 extract the DN from an entry

          ldap_get_values_len(3)
                 return an attribute's values with lengths

          ldap_value_free_len(3)
                 free memory allocated by ldap_get_values_len(3)

          ldap_count_values_len(3)
                 return number of values

          ldap_modify_ext(3)
                 asynchronously modify an entry

          ldap_modify_ext_s(3)
                 synchronously modify an entry

          ldap_mods_free(3)
                 free array of pointers to mod structures used by
                 ldap_modify_ext(3)

          ldap_rename(3)
                 asynchronously rename an entry

          ldap_rename_s(3)
                 synchronously rename an entry

          ldap_msgfree(3)
                 free results allocated by ldap_result(3)

          ldap_msgtype(3)
                 return the message type of a message from ldap_result(3)

          ldap_msgid(3)
                 return the message id of a message from ldap_result(3)

          ldap_search_ext(3)
                 asynchronously search the directory

          ldap_search_ext_s(3)
                 synchronously search the directory

          ldap_is_ldap_url(3)
                 check a URL string to see if it is an LDAP URL

          ldap_url_parse(3)
                 break up an LDAP URL string into its components

          ldap_sort_entries(3)
                 sort a list of search results

          ldap_sort_values(3)
                 sort a list of attribute values

          ldap_sort_strcasecmp(3)
                 case insensitive string comparison


---------------------------------------------------------

::

          ldap.conf(5), slapd(8), draft-ietf-ldapext-ldap-c-api-
          xx.txt <http://www.ietf.org>


-------------------------------------------------------------------------

::

          OpenLDAP Software is developed and maintained by The OpenLDAP
          Project <http://www.openldap.org/>.  OpenLDAP Software is derived
          from the University of Michigan LDAP 3.3 Release.

          These API manual pages are loosely based upon descriptions
          provided in the IETF/LDAPEXT C LDAP API Internet Draft, a
          (orphaned) work in progress.

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

   OpenLDAP LDVERSION             RELEASEDATE                       LDAP(3)

--------------

Pages that refer to this page:
`ldapcompare(1) <../man1/ldapcompare.1.html>`__, 
`ldapdelete(1) <../man1/ldapdelete.1.html>`__, 
`ldapmodify(1) <../man1/ldapmodify.1.html>`__, 
`ldapmodrdn(1) <../man1/ldapmodrdn.1.html>`__, 
`ldapsearch(1) <../man1/ldapsearch.1.html>`__, 
`ldapurl(1) <../man1/ldapurl.1.html>`__, 
`ldapvc(1) <../man1/ldapvc.1.html>`__, 
`ldapwhoami(1) <../man1/ldapwhoami.1.html>`__, 
`ldap_abandon(3) <../man3/ldap_abandon.3.html>`__, 
`ldap_add(3) <../man3/ldap_add.3.html>`__, 
`ldap_bind(3) <../man3/ldap_bind.3.html>`__, 
`ldap_compare(3) <../man3/ldap_compare.3.html>`__, 
`ldap_controls(3) <../man3/ldap_controls.3.html>`__, 
`ldap_delete(3) <../man3/ldap_delete.3.html>`__, 
`ldap_error(3) <../man3/ldap_error.3.html>`__, 
`ldap_first_attribute(3) <../man3/ldap_first_attribute.3.html>`__, 
`ldap_first_entry(3) <../man3/ldap_first_entry.3.html>`__, 
`ldap_first_message(3) <../man3/ldap_first_message.3.html>`__, 
`ldap_first_reference(3) <../man3/ldap_first_reference.3.html>`__, 
`ldap_get_dn(3) <../man3/ldap_get_dn.3.html>`__, 
`ldap_get_option(3) <../man3/ldap_get_option.3.html>`__, 
`ldap_get_values(3) <../man3/ldap_get_values.3.html>`__, 
`ldap_memory(3) <../man3/ldap_memory.3.html>`__, 
`ldap_modify(3) <../man3/ldap_modify.3.html>`__, 
`ldap_modrdn(3) <../man3/ldap_modrdn.3.html>`__, 
`ldap_open(3) <../man3/ldap_open.3.html>`__, 
`ldap_parse_reference(3) <../man3/ldap_parse_reference.3.html>`__, 
`ldap_parse_result(3) <../man3/ldap_parse_result.3.html>`__, 
`ldap_rename(3) <../man3/ldap_rename.3.html>`__, 
`ldap_result(3) <../man3/ldap_result.3.html>`__, 
`ldap_schema(3) <../man3/ldap_schema.3.html>`__, 
`ldap_search(3) <../man3/ldap_search.3.html>`__, 
`ldap_sort(3) <../man3/ldap_sort.3.html>`__, 
`ldap_sync(3) <../man3/ldap_sync.3.html>`__, 
`ldap_tls(3) <../man3/ldap_tls.3.html>`__, 
`ldap_url(3) <../man3/ldap_url.3.html>`__, 
`ldap.conf(5) <../man5/ldap.conf.5.html>`__, 
`ldif(5) <../man5/ldif.5.html>`__, 
`lloadd.conf(5) <../man5/lloadd.conf.5.html>`__, 
`slapd.backends(5) <../man5/slapd.backends.5.html>`__, 
`slapd.conf(5) <../man5/slapd.conf.5.html>`__, 
`slapd-config(5) <../man5/slapd-config.5.html>`__, 
`slapd-ldap(5) <../man5/slapd-ldap.5.html>`__, 
`slapd-monitor(5) <../man5/slapd-monitor.5.html>`__, 
`slapd.overlays(5) <../man5/slapd.overlays.5.html>`__, 
`slapo-ppolicy(5) <../man5/slapo-ppolicy.5.html>`__, 
`slappw-argon2(5) <../man5/slappw-argon2.5.html>`__, 
`lloadd(8) <../man8/lloadd.8.html>`__, 
`slapacl(8) <../man8/slapacl.8.html>`__, 
`slapadd(8) <../man8/slapadd.8.html>`__, 
`slapauth(8) <../man8/slapauth.8.html>`__, 
`slapcat(8) <../man8/slapcat.8.html>`__, 
`slapd(8) <../man8/slapd.8.html>`__, 
`slapdn(8) <../man8/slapdn.8.html>`__, 
`slapindex(8) <../man8/slapindex.8.html>`__, 
`slapmodify(8) <../man8/slapmodify.8.html>`__, 
`slapschema(8) <../man8/slapschema.8.html>`__, 
`slaptest(8) <../man8/slaptest.8.html>`__

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
