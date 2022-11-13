.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

slapo-constraint(5) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SLAPO-CONSTRAINT(5)        File Formats Manual       SLAPO-CONSTRAINT(5)

NAME
-------------------------------------------------

::

          slapo-constraint - Attribute Constraint Overlay to slapd


---------------------------------------------------------

::

          ETCDIR/slapd.conf


---------------------------------------------------------------

::

          The constraint overlay is used to ensure that attribute values
          match some constraints beyond basic LDAP syntax.  Attributes can
          have multiple constraints placed upon them, and all must be
          satisfied when modifying an attribute value under constraint.

          This overlay is intended to be used to force syntactic regularity
          upon certain string represented data which have well known
          canonical forms, like telephone numbers, post codes, FQDNs, etc.

          It constrains only LDAP add, modify and rename commands and only
          seeks to control the add and replace values of modify and rename
          requests.

          No constraints are applied for operations performed with the
          relax control set.


-------------------------------------------------------------------

::

          This slapd.conf option applies to the constraint overlay.  It
          should appear after the overlay directive.

          constraint_attribute <attribute_name>[,...] <type> <value>
          [<extra> [...]]
                 Specifies the constraint which should apply to the comma-
                 separated attribute list named as the first parameter.
                 Six types of constraint are currently supported - regex,
                 negregex, size, count, uri, and set.

                 The parameter following the regex or negregex type is a
                 Unix style regular expression (See regex(7) ). The
                 parameter following the uri type is an LDAP URI. The URI
                 will be evaluated using an internal search.  It must not
                 include a hostname, and it must include a list of
                 attributes to evaluate.

                 The parameter following the set type is a string that is
                 interpreted according to the syntax in use for ACL sets.
                 This allows one to construct constraints based on the
                 contents of the entry.

                 The size type can be used to enforce a limit on an
                 attribute length, and the count type limits the number of
                 values of an attribute.

                 Extra parameters can occur in any order after those
                 described above.

                 <extra> : restrict=<uri>

                 This extra parameter allows one to restrict the
                 application of the corresponding constraint only to
                 entries that match the base, scope and filter portions of
                 the LDAP URI.  The base, if present, must be within the
                 naming context of the database.  The scope is only used
                 when the base is present; it defaults to base.  The other
                 parameters of the URI are not allowed.

          Any attempt to add or modify an attribute named as part of the
          constraint overlay specification which does not fit the
          constraint listed will fail with a LDAP_CONSTRAINT_VIOLATION
          error.


---------------------------------------------------------

::

                 overlay constraint
                 constraint_attribute jpegPhoto size 131072
                 constraint_attribute userPassword count 3
                 constraint_attribute mail regex ^[[:alnum:]]+@mydomain.com$
                 constraint_attribute mail negregex ^[[:alnum:]]+@notallowed.com$
                 constraint_attribute title uri
                   ldap:///dc=catalog,dc=example,dc=com?title?sub?(objectClass=titleCatalog)
                 constraint_attribute cn,sn,givenName set
                   "(this/givenName + [ ] + this/sn) & this/cn"
                   restrict="ldap:///ou=People,dc=example,dc=com??sub?(objectClass=inetOrgPerson)"

          A specification like the above would reject any mail attribute
          which did not look like <alphanumeric string>@mydomain.com or
          that looks like <alphanumeric string>@notallowed.com.  It would
          also reject any title attribute whose values were not listed in
          the title attribute of any titleCatalog entries in the given
          scope. (Note that the "dc=catalog,dc=example,dc=com" subtree
          ought to reside in a separate database, otherwise the initial set
          of titleCatalog entries could not be populated while the
          constraint is in effect.)  Finally, it requires the values of the
          attribute cn to be constructed by pairing values of the
          attributes sn and givenName, separated by a space, but only for
          entries derived from the objectClass inetOrgPerson.


---------------------------------------------------

::

          ETCDIR/slapd.conf
                 default slapd configuration file


---------------------------------------------------------

::

          slapd.conf(5), slapd-config(5),


-------------------------------------------------------------------------

::

          This module was written in 2005 by Neil Dunbar of Hewlett-Packard
          and subsequently extended by Howard Chu and Emmanuel Dreyfus.
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

   OpenLDAP LDVERSION             RELEASEDATE           SLAPO-CONSTRAINT(5)

--------------

Pages that refer to this page:
`slapd.overlays(5) <../man5/slapd.overlays.5.html>`__

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
