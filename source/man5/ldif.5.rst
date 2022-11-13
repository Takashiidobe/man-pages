.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ldif(5) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| ENTRY RECORDS <#ENTRY_RECORDS>`__ |                                   |
| \|                                |                                   |
| `ENTRY RECORD E                   |                                   |
| XAMPLE <#ENTRY_RECORD_EXAMPLE>`__ |                                   |
| \|                                |                                   |
| `CH                               |                                   |
| ANGE RECORDS <#CHANGE_RECORDS>`__ |                                   |
| \|                                |                                   |
| `CHANGE RECORD EX                 |                                   |
| AMPLE <#CHANGE_RECORD_EXAMPLE>`__ |                                   |
| \|                                |                                   |
| `INCLUDE                          |                                   |
| STATEMENT <#INCLUDE_STATEMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LDIF(5)                    File Formats Manual                   LDIF(5)

NAME
-------------------------------------------------

::

          ldif - LDAP Data Interchange Format


---------------------------------------------------------------

::

          The LDAP Data Interchange Format (LDIF) is used to represent LDAP
          entries and change records in text form. LDAP tools, such as
          ldapadd(1) and ldapsearch(1), read and write LDIF entry records.
          ldapmodify(1) reads LDIF change records.

          This manual page provides a basic description of LDIF.  A formal
          specification of LDIF is published in RFC 2849.


-------------------------------------------------------------------

::

          LDIF entry records are used to represent directory entries.  The
          basic form of an entry record is:

               dn: <distinguished name>
               <attrdesc>: <attrvalue>
               <attrdesc>: <attrvalue>
               <attrdesc>:: <base64-encoded-value>
               <attrdesc>:< <URL>
               ...

          The value may be specified as UTF-8 text or as base64 encoded
          data, or a URI may be provided to the location of the attribute
          value.

          A line may be continued by starting the next line with a single
          space or tab, e.g.,

               dn: cn=Barbara J Jensen,dc=exam
                ple,dc=com

          Lines beginning with a sharp sign ('#') are ignored.

          Multiple attribute values are specified on separate lines, e.g.,

               cn: Barbara J Jensen
               cn: Babs Jensen

          If an value contains a non-printing character, or begins with a
          space or a colon ':', the <attrtype> is followed by a double
          colon and the value is encoded in base 64 notation. e.g., the
          value " begins with a space" would be encoded like this:

               cn:: IGJlZ2lucyB3aXRoIGEgc3BhY2U=

          If the attribute value is located in a file, the <attrtype> is
          followed by a ':<' and a file: URI.  e.g., the value contained in
          the file /tmp/value would be listed like this:

               cn:< file:///tmp/value
          Other URI schemes (ftp,http) may be supported as well.

          Multiple entries within the same LDIF file are separated by blank
          lines.


---------------------------------------------------------------------------------

::

          Here is an example of an LDIF file containing three entries.

               dn: cn=Barbara J Jensen,dc=example,dc=com
               cn: Barbara J Jensen
               cn: Babs Jensen
               objectclass: person
               description:< file:///tmp/babs
               sn: Jensen

               dn: cn=Bjorn J Jensen,dc=example,dc=com
               cn: Bjorn J Jensen
               cn: Bjorn Jensen
               objectclass: person
               sn: Jensen

               dn: cn=Jennifer J Jensen,dc=example,dc=com
               cn: Jennifer J Jensen
               cn: Jennifer Jensen
               objectclass: person
               sn: Jensen
               jpegPhoto:: /9j/4AAQSkZJRgABAAAAAQABAAD/2wBDABALD
                A4MChAODQ4SERATGCgaGBYWGDEjJR0oOjM9PDkzODdASFxOQ
                ERXRTc4UG1RV19iZ2hnPk1xeXBkeFxlZ2P/2wBDARESEhgVG
               ...

          Note that the description in Barbara Jensen's entry is read from
          file:///tmp/babs and the jpegPhoto in Jennifer Jensen's entry is
          encoded using base 64.


---------------------------------------------------------------------

::

          LDIF change records are used to represent directory change
          requests.  Each change record starts with line indicating the
          distinguished name of the entry being changed:

               dn: <distinguishedname>

               changetype: <[modify|add|delete|modrdn]>

          Finally, the change information itself is given, the format of
          which depends on what kind of change was specified above.  For a
          changetype of modify, the format is one or more of the following:

               add: <attributetype>
               <attrdesc>: <value1>
               <attrdesc>: <value2>
               ...
               -

          Or, for a replace modification:

               replace: <attributetype>
               <attrdesc>: <value1>
               <attrdesc>: <value2>
               ...
               -

          If no attributetype lines are given to replace, the entire
          attribute is to be deleted (if present).

          Or, for a delete modification:

               delete: <attributetype>
               <attrdesc>: <value1>
               <attrdesc>: <value2>
               ...
               -

          If no attributetype lines are given to delete, the entire
          attribute is to be deleted.

          For a changetype of add, the format is:

               <attrdesc1>: <value1>
               <attrdesc1>: <value2>
               ...
               <attrdescN>: <value1>
               <attrdescN>: <value2>

          For a changetype of modrdn or moddn, the format is:

               newrdn: <newrdn>
               deleteoldrdn: 0 | 1
               newsuperior: <DN>

          where a value of 1 for deleteoldrdn means to delete the values
          forming the old rdn from the entry, and a value of 0 means to
          leave the values as non-distinguished attributes in the entry.
          The newsuperior line is optional and, if present, specifies the
          new superior to move the entry to.

          For a changetype of delete, no additional information is needed
          in the record.

          Note that attribute values may be presented using base64 or in
          files as described for entry records.  Lines in change records
          may be continued in the manner described for entry records as
          well.


-----------------------------------------------------------------------------------

::

          The following sample LDIF file contains a change record of each
          type of change.

               dn: cn=Babs Jensen,dc=example,dc=com
               changetype: add
               objectclass: person
               objectclass: extensibleObject
               cn: babs
               cn: babs jensen
               sn: jensen

               dn: cn=Babs Jensen,dc=example,dc=com
               changetype: modify
               add: givenName
               givenName: Barbara
               givenName: babs
               -
               replace: description
               description: the fabulous babs
               -
               delete: sn
               sn: jensen
               -

               dn: cn=Babs Jensen,dc=example,dc=com
               changetype: modrdn
               newrdn: cn=Barbara J Jensen
               deleteoldrdn: 0
               newsuperior: ou=People,dc=example,dc=com

               dn: cn=Barbara J Jensen,ou=People,dc=example,dc=com
               changetype: delete


---------------------------------------------------------------------------

::

          The LDIF parser has been extended to support an include statement
          for referencing other LDIF files.  The include statement must be
          separated from other records by a blank line.  The referenced
          file is specified using a file: URI and all of its contents are
          incorporated as if they were part of the original LDIF file. As
          above, other URI schemes may be supported. For example:

               dn: dc=example,dc=com
               objectclass: domain
               dc: example

               include: file:///tmp/example.com.ldif

               dn: dc=example,dc=org
               objectclass: domain
               dc: example
          This feature is not part of the LDIF specification in RFC 2849
          but is expected to appear in a future revision of this spec. It
          is supported by the ldapadd(1), ldapmodify(1), and slapadd(8)
          commands.


---------------------------------------------------------

::

          ldap(3), ldapsearch(1), ldapadd(1), ldapmodify(1), slapadd(8),
          slapcat(8), slapd-ldif(5).

          "LDAP Data Interchange Format," Good, G., RFC 2849.


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

   OpenLDAP LDVERSION             RELEASEDATE                       LDIF(5)

--------------

Pages that refer to this page:
`ldapcompare(1) <../man1/ldapcompare.1.html>`__, 
`ldapmodify(1) <../man1/ldapmodify.1.html>`__, 
`ldapsearch(1) <../man1/ldapsearch.1.html>`__, 
`slapd-config(5) <../man5/slapd-config.5.html>`__, 
`slapd-ldif(5) <../man5/slapd-ldif.5.html>`__, 
`slapd-sql(5) <../man5/slapd-sql.5.html>`__, 
`slapadd(8) <../man8/slapadd.8.html>`__, 
`slapcat(8) <../man8/slapcat.8.html>`__, 
`slapindex(8) <../man8/slapindex.8.html>`__, 
`slapmodify(8) <../man8/slapmodify.8.html>`__, 
`slapschema(8) <../man8/slapschema.8.html>`__

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
